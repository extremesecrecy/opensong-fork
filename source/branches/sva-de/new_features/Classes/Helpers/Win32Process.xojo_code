#tag Class
Protected Class Win32Process
	#tag Method, Flags = &h21
		Private Sub ClearObject()
		  #If TargetWin32
		    StopWaiting
		    If hThread <> 0 Then
		      Call WinAPI.CloseHandle(hThread)
		      hThread = 0
		    End If
		    If hProcess <> 0 Then
		      Call WinAPI.CloseHandle(hProcess)
		      hProcess = 0
		    End If
		    ProcessID = -1
		    HasData = False
		  #Else
		    HasData = False
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateProcess(Cmd As String, Params As String, Callback As WaitForTimerCallback = Nil) As Boolean
		  #If TargetWin32
		    Dim result As Boolean
		    
		    ClearObject // make sure we don't leak any handles
		    
		    Dim cmdFilename As String
		    cmdFilename = cmd.Trim
		    If cmdFilename.StartsWith("""") And cmdFilename.IndexOf(1, """") = cmd.Length - 1 Then // starts and ends with " but does not contain " within
		      cmdFilename = cmd.Middle(1, cmd.Length - 2)
		    End If
		    If Not (cmdFilename.EndsWith(".exe") Or cmdFilename.EndsWith(".com")) Then
		      Return ShellExecute(cmd, params, callback)
		    End If
		    
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
		    If cmdFilename = "" Then
		      cmdBuf = New MemoryBlock((cmdFilename.Length + 1) * 2)
		      cmdBuf.WString(0) = cmdFilename
		      cmdptr = cmdBuf
		    End If
		    If Params <> "" Then
		      paramBuf = New MemoryBlock((Params.Length + 1) * 2)
		      paramBuf.WString(0) = Params
		      paramPtr = paramBuf
		    End If
		    
		    Dim startUpInfo As STARTUPINFOW
		    Dim ProcessInfo As PROCESS_INFORMATION
		    startUpInfo.cb = startUpInfo.Size
		    Dim ProcessCreationFlags As Uint32
		    ProcessCreationFlags = CREATE_DEFAULT_ERROR_MODE
		    
		    result = CreateProcessW(cmdPtr, paramPtr, Nil, Nil, False, ProcessCreationFlags, Nil, Nil, startUpInfo, ProcessInfo)
		    If Not result Then
		      DebugWriteWin32Error(CurrentMethodName + " failed with", 5)
		      App.DebugWriter.Write CurrentMethodName + " cmd=»" + Cmd + "«, params=»" + Params + "«", 5
		    End If
		    
		    HasData = result
		    hProcess = ProcessInfo.hProcess
		    hThread = ProcessInfo.hThread
		    ProcessID = ProcessInfo.dwProcessId
		    
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

	#tag Method, Flags = &h21
		Private Sub DebugWriteWin32Error(Tag As String, Level As Integer = 5)
		  #If TargetWin32
		    Dim errNo As Integer = WinAPI.GetLastError
		    App.DebugWriter.Write(Tag + " Windows error code " + CStr(ErrNo) + " : " + WinAPI.TranslateErrorCode(errNo), Level)
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
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
		    
		    If hProcess = 0 Then
		      Return False
		    End If
		    
		    // https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess
		    
		    // BOOL GetExitCodeProcess(
		    // HANDLE  hProcess,
		    // LPDWORD lpExitCode
		    // );
		    Declare Function GetExitCodeProcess Lib "Kernel32.dll" (hProcess As Integer, ByRef ExitCode As UInt32) As Boolean
		    
		    result = GetExitCodeProcess(hProcess, exitCode)
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
		    Return ProcessID
		  #Else
		    Return -1
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QuitProcess()
		  #If TargetWin32
		    If Not IsRunning Then
		      App.DebugWriter.Write(CurrentMethodName + ": process is not running", 7)
		      Return
		    End If
		    
		    App.DebugWriter.Write(CurrentMethodName + ": begin", 7)
		    
		    Const kTimeOut = 5000
		    
		    StopWaiting // on NotificationHandle
		    
		    If IsRunning Then
		      Call WinAPI.RegisterWaitForSingleObject(NotificationHandle, hProcess, AddressOf PresentWindowLaunchAppExitCallback, Nil, kTimeout, WT_EXECUTEONLYONCE)
		      
		      // try to end it gracefully
		      If Not WinAPI.EnumWindows(AddressOf QuitProcessCallback,ProcessID) Then
		        Dim rte As RuntimeException = WinAPI.ErrorRTE(WinAPI.GetLastError)
		        App.DebugWriter.Write(CurrentMethodName + ": raising exception", 3)
		        If rte <> Nil Then App.DebugWriter.Write("     " + rte.ToString, 3)
		        If rte <> Nil Then Raise rte
		      End If
		      App.DebugWriter.Write(CurrentMethodName + ": done sending messages to windows", 7)
		      
		      Dim cnt As Integer = 0
		      While IsRunning And cnt <= 20
		        // wait for the process to terminate in the background. If it does not, it is killed on timeout
		        Thread.SleepCurrent(kTimeOut / 20)
		        cnt = cnt + 1
		        App.DebugWriter.Write(CurrentMethodName + ": slept " + Str(cnt) + " times " + Str(kTimeOut / 20) + "ms", 7)
		      Wend
		      
		      If IsRunning Then
		        App.DebugWriter.Write(CurrentMethodName + ": still running - give up and clean up", 7)
		        PresentWindow.ExternalSlideTerminatedW32(Nil,True)
		      End If
		      ClearObject
		    End If
		    App.DebugWriter.Write(CurrentMethodName + ": end", 7)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ShellExecute(filename As String, parameters As String, callback As WaitForTimerCallback = Nil) As Boolean
		  // https://docs.microsoft.com/en-us/windows/win32/api/shellapi/nf-shellapi-shellexecuteexw
		  
		  // BOOL ShellExecuteExW(
		  // SHELLEXECUTEINFOW * pExecInfo
		  // );
		  
		  // https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessid
		  
		  // DWORD GetProcessId(
		  // HANDLE Process
		  // );
		  
		  //++
		  // Note: Although the Xojo docs state that the compiler will handle conversions to/from WString,
		  // it was not working for direct assignment of a String to a WString member of a Structure.
		  // For that reason, intermediate variables are used to transfer the function arguments to the Structure.
		  //--
		  #If TargetWindows
		    Soft Declare Function ShellExecuteEx Lib "shell32.dll" Alias "ShellExecuteExW" (ByRef pExecInfo As SHELLEXECUTEINFOW) As Boolean
		    Soft Declare Function GetProcessId Lib "kernel32.dll" (proc As Integer) As UInt32
		    
		    Dim execInfo As SHELLEXECUTEINFOW
		    Dim result As Boolean
		    
		    Dim wVerb As WString = "open"
		    Dim wFilename As WString = filename
		    Dim wParameters As WString = parameters
		    Dim wPath As WString = SpecialFolder.Documents.NativePath
		    
		    execInfo.cbSize = execInfo.Size
		    execInfo.lpVerb = wVerb
		    execInfo.nShow = SW_SHOWNORMAL
		    execInfo.lpFile = wFilename
		    execInfo.lpParameters = wParameters
		    execInfo.lpDirectory = wPath
		    execInfo.fMask = SEE_MASK_NOASYNC + SEE_MASK_NOCLOSEPROCESS + SEE_MASK_UNICODE
		    
		    result = ShellExecuteEx(execInfo) 
		    If Not result Then
		      DebugWriteWin32Error(CurrentMethodName + " failed with", 5)
		      App.DebugWriter.Write CurrentMethodName + " filename=»" + filename + "«, params=»" + parameters + "«", 5
		    End If
		    
		    If execInfo.hInstApp < 32 Then // Failed per the docs
		      result = False
		      DebugWriteWin32Error(CurrentMethodName + " failed with", 5)
		      App.DebugWriter.Write CurrentMethodName + " filename=»" + filename + "«, params=»" + parameters + "«", 5
		    End If
		    
		    //++
		    // result can be True without hProcess being set if the shell opens the file by reusing a program already open.
		    // (example: web browser running and opening an HTML file)
		    // In this type of case, there is no way to register the callback.
		    //--
		    
		    HasData = result And execInfo.hProcess <> 0
		    hProcess = execInfo.hProcess
		    ProcessID = GetProcessId(execInfo.hProcess)
		    hThread = 0
		    
		    If Callback <> Nil And HasData Then
		      result = WinAPI.RegisterWaitForSingleObject(NotificationHandle, hProcess, Callback, Nil, WinAPI.INFINITE, WT_EXECUTEONLYONCE)
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
		    
		    If Not HasData Then Return False
		    
		    result = _TerminateProcess(hProcess, uExitCode)
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
		Private hProcess As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hThread As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NotificationHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ProcessID As Uint32
	#tag EndProperty


	#tag Constant, Name = CREATE_DEFAULT_ERROR_MODE, Type = Double, Dynamic = False, Default = \"&h04000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EXTENDED_STARTUPINFO_PRESENT, Type = Double, Dynamic = False, Default = \"&h00080000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SEE_MASK_DOENVSUBST, Type = Double, Dynamic = False, Default = \"&H00000200", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SEE_MASK_FLAG_NO_UI, Type = Double, Dynamic = False, Default = \"&H00000400", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SEE_MASK_HMONITOR, Type = Double, Dynamic = False, Default = \"&H00200000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SEE_MASK_NOASYNC, Type = Double, Dynamic = False, Default = \"&H00000100", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SEE_MASK_NOCLOSEPROCESS, Type = Double, Dynamic = False, Default = \"&H00000040", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SEE_MASK_UNICODE, Type = Double, Dynamic = False, Default = \"&H00004000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = STILL_ACTIVE, Type = Double, Dynamic = False, Default = \"259", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_SHOWNORMAL, Type = Double, Dynamic = False, Default = \"1", Scope = Private
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

	#tag Structure, Name = SHELLEXECUTEINFOW, Flags = &h0, Description = 68747470733A2F2F646F63732E6D6963726F736F66742E636F6D2F656E2D75732F77696E646F77732F77696E33322F6170692F7368656C6C6170692F6E732D7368656C6C6170692D7368656C6C65786563757465696E666F770D0A0D0A7479706564656620737472756374205F5348454C4C45584543555445494E464F57207B0D0A202044574F52442020202020636253697A653B0D0A2020554C4F4E472020202020664D61736B3B0D0A202048574E4420202020202068776E643B0D0A20204C5043575354522020206C70566572623B0D0A20204C5043575354522020206C7046696C653B0D0A20204C5043575354522020206C70506172616D65746572733B0D0A20204C5043575354522020206C704469726563746F72793B0D0A2020696E74202020202020206E53686F773B0D0A202048494E5354414E43452068496E73744170703B0D0A2020766F69642020202020202A6C7049444C6973743B0D0A20204C5043575354522020206C70436C6173733B0D0A2020484B4559202020202020686B6579436C6173733B0D0A202044574F524420202020206477486F744B65793B0D0A2020756E696F6E207B0D0A2020202048414E444C45206849636F6E3B0D0A2020202048414E444C4520684D6F6E69746F723B0D0A20207D2044554D4D59554E494F4E4E414D453B0D0A202048414E444C45202020206850726F636573733B0D0A7D205348454C4C45584543555445494E464F572C202A4C505348454C4C45584543555445494E464F573B
		cbSize As UInt32
		  fMask As UInt32
		  hwnd As Integer
		  lpVerb As WString
		  lpFile As WString
		  lpParameters As WString
		  lpDirectory As WString
		  nShow As Int32
		  hInstApp As Integer
		  lpIDList As Ptr
		  lpClass As WString
		  hkeyClass As Integer
		  dwHotKey as UInt32
		  handle As Integer
		hProcess As Integer
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
