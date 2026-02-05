#tag Class
Protected Class Win32Process
	#tag Method, Flags = &h0
		Sub ClearObject()
		  #If TargetWin32
		    If HasData Then
		      StopWaiting
		      Call WinAPI.CloseHandle(ProcessInfo.hThread)
		      Call WinAPI.CloseHandle(ProcessInfo.hProcess)
		      ProcessInfo.StringValue(True) = ""
		    End If
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateProcess(Cmd As String, Params As String, Callback As WaitForTimerCallback = Nil) As Boolean
		  #If TargetWin32
		    Dim result As Boolean
		    
		    ClearObject // make sure we don't leak any handles
		    
		    // https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessw
		    
		    // BOOL CreateProcessW(
		    // LPCWSTR               lpApplicationName,
		    // LPWSTR                lpCommandLine,
		    // LPSECURITY_ATTRIBUTES lpProcessAttributes,
		    // LPSECURITY_ATTRIBUTES lpThreadAttributes,
		    // BOOL                  bInheritHandles,
		    // DWORD                 dwCreationFlags,
		    // LPVOID                lpEnvironment,
		    // LPCWSTR               lpCurrentDirectory,
		    // LPSTARTUPINFOW        lpStartupInfo,
		    // LPPROCESS_INFORMATION lpProcessInformation
		    // );
		    
		    Declare Function CreateProcessW Lib "Kernel32.dll" ( _
		    lpApplicationName As Ptr, _  // LPCWSTR
		    lpCommandLine As Ptr, _ // LPWSTR
		    lpProcessAttributes As Ptr, _ // LPSECURITY_ATTRIBUTES
		    lpThreadAttributes As Ptr, _ // LPSECURITY_ATTRIBUTES
		    bInheritHandles As Boolean, _
		    dwCreationFlags As UInt32, _
		    lpEnvironment As Ptr, _ // LPVOID
		    lpCurrentDirectory As Ptr, _ // LPCWSTR
		    ByRef lpStartupInfo As STARTUPINFOW, _ // LPSTARTUPINFOW
		    ByRef lpProcessInformation As PROCESS_INFORMATION _
		    ) As Boolean
		    
		    If Cmd.Trim <> "" Then Params = Cmd + " " + Params  // CreateProcessW passes Params on as is; Programs expect "argv[0] to be the executable"
		    
		    Dim cmdBuf, paramBuf As MemoryBlock
		    Dim cmdPtr,paramPtr As Ptr
		    If cmd.Trim <> "" Then
		      cmdBuf = New MemoryBlock((Cmd.Len + 1) * 2)
		      cmdBuf.WString(0) = Cmd
		      cmdptr = cmdBuf
		    End If
		    If Params <> "" Then
		      paramBuf = New MemoryBlock((Params.Len + 1) * 2)
		      paramBuf.WString(0) = Params
		      paramPtr = paramBuf
		    End If
		    
		    Dim startUpInfo As STARTUPINFOW
		    startUpInfo.cb = startUpInfo.Size
		    Dim ProcessCreationFlags As Uint32
		    ProcessCreationFlags = CREATE_DEFAULT_ERROR_MODE
		    
		    result = CreateProcessW(cmdPtr, paramPtr, Nil, Nil, False, ProcessCreationFlags, Nil, Nil, startUpInfo, ProcessInfo)
		    If Not result Then
		      DebugWriteWin32Error(CurrentMethodName + " failed with", 5)
		      App.DebugWriter.Write CurrentMethodName + " cmd=»" + Cmd + "«, params=»" + Params + "«", 5
		    End If
		    
		    HasData = result
		    
		    If Callback <> Nil Then
		      result = WinAPI.RegisterWaitForSingleObject(NotificationHandle,ProcessInfo.hProcess,Callback,Nil,WinAPI.INFINITE,WT_EXECUTEONLYONCE)
		      If Not result Then
		        DebugWriteWin32Error(CurrentMethodName + ".RegisterWaitForSingleObject failed.")
		      End If
		    End If
		    
		    Return result
		  #Else
		    Return False
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DebugWriteWin32Error(Tag As String, Level As Integer = 5)
		  #If TargetWin32
		    Dim errNo As Integer = WinAPI.GetLastError
		    App.DebugWriter.Write(Tag + " Windows error code " + CStr(ErrNo) + " : " + WinAPI.TranslateErrorCode(errNo), Level)
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #If TargetWin32
		    ClearObject
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsRunning() As Boolean
		  #If TargetWin32
		    Dim result As Boolean
		    Dim exitCode As UInt32
		    
		    If ProcessInfo.hProcess = 0 Then
		      Return False
		    End If
		    
		    // https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess
		    
		    // BOOL GetExitCodeProcess(
		    // HANDLE  hProcess,
		    // LPDWORD lpExitCode
		    // );
		    Declare Function GetExitCodeProcess Lib "Kernel32.dll" (hProcess As Integer, ByRef ExitCode As UInt32) As Boolean
		    
		    result = GetExitCodeProcess(ProcessInfo.hProcess, exitCode)
		    If Not result Then
		      Dim rte As RuntimeException = WinAPI.ErrorRTE(WinAPI.GetLastError)
		      If rte <> Nil Then Raise rte
		    End If
		    Return exitCode = STILL_ACTIVE
		  #Else
		    Return False
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PID() As Integer
		  #If TargetWin32
		    Return ProcessInfo.dwProcessId
		  #Else
		    Return -1
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QuitProcess()
		  #If TargetWin32
		    // try to end it gracefully
		    If Not WinAPI.EnumWindows(AddressOf QuitProcessCallback,ProcessInfo.dwProcessId) Then
		      Dim rte As RuntimeException = WinAPI.ErrorRTE(WinAPI.GetLastError)
		      If rte <> Nil Then Raise rte
		    End If
		    
		    If IsRunning Then
		      If NotificationHandle <> 0 Then
		        Call WinAPI.UnregisterWait(NotificationHandle)
		        NotificationHandle = 0
		      End If
		      // wait for the process to terminate in the background. If it does not, it is killed on timeout
		      Call WinAPI.RegisterWaitForSingleObject(NotificationHandle, ProcessInfo.hProcess, AddressOf PresentWindowLaunchAppExitCallback, Nil, 10000, WT_EXECUTEONLYONCE)
		    End If
		    ClearObject
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopWaiting()
		  #If TargetWin32
		    If NotificationHandle <> 0 Then
		      Call WinAPI.UnregisterWait(NotificationHandle)
		      NotificationHandle = 0
		    End If
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TerminateProcess(uExitCode As Integer) As Boolean
		  #If TargetWin32
		    Dim result As Boolean
		    
		    // https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-terminateprocess
		    
		    // BOOL TerminateProcess(
		    // HANDLE hProcess,
		    // UINT   uExitCode
		    // );
		    
		    // TerminateProcess is asynchronous, the process might even not get killed at all, if for example the access rights are insifficient
		    
		    Declare Function _TerminateProcess Lib "Kernel32.dll" Alias "TerminateProcess" (hProcess As Integer, uExitCode As Integer) As Boolean
		    
		    result = _TerminateProcess(ProcessInfo.hProcess, uExitCode)
		    If Not result Then
		      DebugWriteWin32Error(CurrentMethodName, 5)
		    End If
		    ClearObject
		    
		    Return result
		  #Else
		    Return False
		  #EndIf
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected HasData As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NotificationHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ProcessInfo As PROCESS_INFORMATION
	#tag EndProperty


	#tag Constant, Name = CREATE_DEFAULT_ERROR_MODE, Type = Double, Dynamic = False, Default = \"&h04000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EXTENDED_STARTUPINFO_PRESENT, Type = Double, Dynamic = False, Default = \"&h00080000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STILL_ACTIVE, Type = Double, Dynamic = False, Default = \"259", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WT_EXECUTEONLYONCE, Type = Double, Dynamic = False, Default = \"&h00000008", Scope = Public
	#tag EndConstant


	#tag Structure, Name = PROCESS_INFORMATION, Flags = &h0
		hProcess As Integer
		  hThread As Integer
		  dwProcessId AS UInt32
		dwThreadId As Uint32
	#tag EndStructure

	#tag Structure, Name = SECURITY_ATTRIBUTES, Flags = &h0
		nLength As UInt32
		  lpSecurityDescriptor As Ptr
		bInheritHandle As Boolean
	#tag EndStructure

	#tag Structure, Name = STARTUPINFOW, Flags = &h0
		cb As Uint32
		  lpReserved As Ptr
		  lpDesktop As Ptr
		  lpTitle As Ptr
		  dwX As UInt32
		  dwY As Uint32
		  dwXSize As UInt32
		  dwYSize As UInt32
		  dwXCountChars As UInt32
		  dwYCountChars As UInt32
		  dwFillAttribute As UInt32
		  dwFlags As UInt32
		  wShowWindow As UInt16
		  cbReserved2 As UInt16
		  lpReserved2 As Ptr
		  hStdInput As Integer
		  hStdOutput As Integer
		hStdError As Integer
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
