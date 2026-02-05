#tag Module
Protected Module WinAPI
	#tag Method, Flags = &h1
		Protected Function CloseHandle(h As Integer) As Boolean
		  // https://docs.microsoft.com/en-us/windows/win32/api/handleapi/nf-handleapi-closehandle
		  
		  // BOOL CloseHandle(
		  // HANDLE hObject
		  // );
		  #If TargetWin32
		    Declare Function _CloseHandle Lib "Kernel32" Alias "CloseHandle" (hObject As Integer) As Boolean
		    
		    Return _CloseHandle(h)
		  #Else
		    Return True
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndTask(hWnd As Integer, fForce As Boolean) As Boolean
		  // https://docs.microsoft.com/de-de/windows/win32/api/winuser/nf-winuser-endtask?redirectedfrom=MSDN
		  
		  // BOOL EndTask(
		  //   HWND hWnd,
		  //   BOOL fShutDown,
		  //   BOOL fForce
		  // );
		  
		  #If TargetWin32
		    Soft Declare Function _EndTask Lib "User32.dll" Alias "EndTask" (hWnd As Integer, fShutDown As Boolean, fForce As Boolean) As Boolean
		    
		    Return _EndTask(hWnd, False, fForce)
		  #Else
		    Return False
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnumWindows(lpEnumFunc As EnumWindowsProc, lParam As Integer) As Boolean
		  
		  // https://docs.microsoft.com/de-de/windows/win32/api/winuser/nf-winuser-enumwindows?redirectedfrom=MSDN
		  
		  // BOOL EnumWindows(
		  //   WNDENUMPROC lpEnumFunc,
		  //   LPARAM      lParam
		  // );
		  
		  #If TargetWin32
		    Declare Function _EnumWindows Lib "User32" Alias "EnumWindows" (lpEnumFunc As Ptr, LParam As Integer) As Boolean
		    
		    Return _EnumWindows(lpEnumFunc, lParam)
		  #Else
		    Return False
		  #Endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Function EnumWindowsProc(hWnd As Integer, LParam As Integer) As Boolean
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Function ErrorRTE(ErrorNumber As Integer) As RuntimeException
		  If ErrorNumber = 0 Then Return Nil
		  
		  Dim rte As New RuntimeException
		  rte.ErrorNumber = ErrorNumber
		  rte.Message = TranslateErrorCode(ErrorNumber)
		  Return rte
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetLastError() As Uint32
		  #If TargetWin32
		    // _Post_equals_last_error_ DWORD GetLastError();
		    Declare Function _GetLastError Lib "Kernel32" Alias "GetLastError" () As UInt32
		    
		    Return _GetLastError
		  #Else
		    Return 0
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetWindowThreadProcessId(hWnd As Integer, lpdwProcessID As Ptr) As UInt32
		  // https://docs.microsoft.com/de-de/windows/win32/api/winuser/nf-winuser-getwindowthreadprocessid?redirectedfrom=MSDN
		  
		  // DWORD GetWindowThreadProcessId(
		  //   HWND    hWnd,
		  //   LPDWORD lpdwProcessId
		  // );
		  
		  Declare Function _GetWindowThreadProcessId Lib "User32" Alias "GetWindowThreadProcessId" (hWnd As Integer, lpdwProcessId As Ptr) As UInt32
		  
		  Return _GetWindowThreadProcessId(hWnd, lpdwProcessID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectIsSignaled(hHandle As Integer) As Boolean
		  #If TargetWin32
		    Dim result As UInt32
		    
		    // https://docs.microsoft.com/en-us/windows/win32/api/synchapi/nf-synchapi-waitforsingleobjectex
		    
		    // DWORD WaitForSingleObjectEx(
		    // HANDLE hHandle,
		    // DWORD  dwMilliseconds,
		    // BOOL   bAlertable
		    // );
		    
		    Declare Function WaitForSingleObjectEx Lib "Kernel32" (hHandle As Integer, dwMilliseconds As UInt32, bAlertable As Boolean) As UInt32
		    
		    result = WaitForSingleObjectEx(hHandle, 0, False)
		    
		    If result = WAIT_FAILED Then
		      Dim rte As RuntimeException = ErrorRTE(GetLastError)
		      If rte <> Nil Then Raise rte
		    End If
		    
		    Return result = WAIT_OBJECT_0
		  #Else
		    Return True
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RegisterWaitForSingleObject(ByRef phNewWaitObject As Integer, hObject As Integer, Callback As WaitForTimerCallback, Context As Ptr, dwMilliseconds As UInt64, dwFlags As UInt64) As Boolean
		  #If TargetWin32
		    
		    // https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-registerwaitforsingleobject
		    
		    // BOOL RegisterWaitForSingleObject(
		    // PHANDLE             phNewWaitObject,
		    // HANDLE              hObject,
		    // WAITORTIMERCALLBACK Callback,
		    // PVOID               Context,
		    // ULONG               dwMilliseconds,
		    // ULONG               dwFlags
		    // );
		    
		    Declare Function _RegisterWaitForSingleObject Lib "Kernel32" Alias "RegisterWaitForSingleObject" ( _
		    ByRef phNewWaitObject As Integer, _
		    hObject As Integer, _
		    Callback As Ptr, _
		    Context As Ptr, _
		    dwMilliseconds As UInt64, _
		    dwFlags As UInt64 _
		    ) As Boolean
		    
		    Return _RegisterWaitForSingleObject( _
		    phNewWaitObject, _ // PHANDLE
		    hObject, _ //HANDLE
		    Callback, _ // WAITORTIMERCALLBACK
		    Context, _ // PVOID
		    dwMilliseconds, _ // ULONG
		    dwFlags)  // ULONG
		  #Else
		    Return False
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLastError(dwErrCode As UInt32)
		  // https://docs.microsoft.com/en-us/windows/win32/api/errhandlingapi/nf-errhandlingapi-setlasterror
		  
		  // void SetLastError(
		  //   DWORD dwErrCode
		  // );
		  
		  #If TargetWin32
		    Declare Sub _SetLastError Lib "Kernel32" Alias "SetLastError" (dwErrCode As UInt32)
		    
		    _SetLastError(dwErrCode)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SystemParametersInfo(action as Integer, param1 as Integer, param2 as MemoryBlock = Nil, iniChange as Integer = SPIF_SENDCHANGE) As Boolean
		  Dim result as Boolean = False
		  
		  #if TargetWin32
		    Soft Declare Function SystemParametersInfoA Lib "User32" ( _
		    action as Integer, param1 as Integer, param2 as Ptr, change as Integer ) as Boolean
		    Soft Declare Function SystemParametersInfoW Lib "User32" ( _
		    action as Integer, param1 as Integer, param2 as Ptr, change as Integer ) as Boolean
		    
		    if System.IsFunctionAvailable( "SystemParametersInfoW", "User32" ) then
		      If IsNull(param2) Then
		        result = SystemParametersInfoW( action, param1, Nil, iniChange )
		      Else
		        result = SystemParametersInfoW( action, param1, param2, iniChange )
		      End If
		    else
		      If IsNull(param2) Then
		        result = SystemParametersInfoA( action, param1, Nil, iniChange )
		      Else
		        result = SystemParametersInfoA( action, param1, param2, iniChange )
		      End If
		    end if
		    
		  #endif
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TranslateErrorCode(ErrNo As Integer) As String
		  #If TargetWin32
		    Dim flags As Integer
		    Dim size As Integer
		    Dim msgBuffer As New MemoryBlock(2048)
		    
		    Const FORMAT_MESSAGE_FROM_SYSTEM = &h00001000
		    Const FORMAT_MESSAGE_IGNORE_INSERTS = &h00000200
		    
		    // https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-formatmessage
		    
		    // DWORD FormatMessage(
		    // DWORD   dwFlags,
		    // LPCVOID lpSource,
		    // DWORD   dwMessageId,
		    // DWORD   dwLanguageId,
		    // LPTSTR  lpBuffer,
		    // DWORD   nSize,
		    // va_list *Arguments
		    // );
		    
		    
		    Declare Function FormatMessage Lib "Kernel32" Alias "FormatMessageW" (_
		    dwFlags As UInt32, _
		    lpSource As Ptr, _
		    dwMessageId As UInt32, _
		    dwLanguageId As UInt32, _
		    lpBuffer As Ptr, _
		    nSize As UInt32, _
		    va_list As Ptr _
		    ) As UInt32
		    
		    flags = FORMAT_MESSAGE_IGNORE_INSERTS + FORMAT_MESSAGE_FROM_SYSTEM
		    size = FormatMessage(flags, Nil, ErrNo, 0, msgBuffer, msgBuffer.Size, Nil)
		    
		    Return msgBuffer.WString(0).Left(size).ConvertEncoding(Encodings.UTF8)
		    
		  #Else
		    Return "Function " + CurrentMethodName + " not supported on this platform"
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UnregisterWait(WaitHandle As Integer) As Boolean
		  #If TargetWin32
		    // https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-unregisterwait
		    
		    // BOOL UnregisterWait(
		    // HANDLE WaitHandle
		    // );
		    
		    Declare Function _UnregisterWait Lib "Kernel32" Alias "UnregisterWait" (WaitHandle As Integer) As Boolean
		    
		    Return _UnregisterWait(WaitHandle)
		  #Else
		    Return True
		  #Endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub WaitForTimerCallback(lpParameter As Ptr, TimerOrWaitFired As Boolean)
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim Enabled As Boolean = False
			  Dim AnimationInfo As MemoryBlock = New MemoryBlock(8)
			  
			  'Try
			  'Dim keyVisualFX As New RegistryItem("HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics", False)
			  'useAnimations = keyVisualFX.Value("MinAnimate")
			  'Catch
			  'End Try
			  
			  AnimationInfo.Long(0) = 8
			  If SystemParametersInfo(SPI_GETANIMATION, AnimationInfo.Size, AnimationInfo) Then
			    Enabled = AnimationInfo.Long(4) > 0
			  End If
			  
			  Return Enabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim success As Boolean
			  Dim AnimationInfo As MemoryBlock = New MemoryBlock(8)
			  
			  'Try
			  'Dim keyVisualFX As New RegistryItem("HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics", False)
			  'If value > 0 Then
			  'keyVisualFX.Value("MinAnimate") = 1
			  'Else
			  'keyVisualFX.Value("MinAnimate") = 0
			  'End If
			  'Catch
			  'End Try
			  
			  AnimationInfo.Long(0) = 8
			  If value Then
			    AnimationInfo.Long(4) = 1
			  Else
			    AnimationInfo.Long(4) = 0
			  End If
			  
			  success = SystemParametersInfo(SPI_SETANIMATION, AnimationInfo.Size, AnimationInfo)
			End Set
		#tag EndSetter
		Animation As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = DM_SPECVERSION, Type = Double, Dynamic = False, Default = \"&h0401", Scope = Public
	#tag EndConstant

	#tag Constant, Name = INFINITE, Type = Double, Dynamic = False, Default = \"-1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SPIF_SENDCHANGE, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SPI_GETANIMATION, Type = Double, Dynamic = False, Default = \"&H0048", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SPI_GETSCREENSAVEACTIVE, Type = Double, Dynamic = False, Default = \"&H0010", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SPI_SETANIMATION, Type = Double, Dynamic = False, Default = \"&H0049", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SPI_SETSCREENSAVEACTIVE, Type = Double, Dynamic = False, Default = \"&H0011", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WAIT_FAILED, Type = Double, Dynamic = False, Default = \"&hFFFFFFFF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WAIT_OBJECT_0, Type = Double, Dynamic = False, Default = \"&h00000000", Scope = Public
	#tag EndConstant


	#tag Structure, Name = DEVMODE_A, Flags = &h0
		dmDeviceName As String * 32
		  dmSpecVersion As UInt16
		  dmDriverVersion As UInt16
		  dmSize As UInt16
		  dmDriverExtra As UInt16
		  dmFields As UInt32
		  dmOrientation As Int16
		  dmPaperSize As Int16
		  dmPaperLength As Int16
		  dmPaperWidth As Int16
		  dmScale As Int16
		  dmCopies As Int16
		  dmDefaultSource As Int16
		  dmPrintQuality As Int16
		  dmColor As Int16
		  dmDuplex As Int16
		  dmYResolution As Int16
		  dmTTOption As Int16
		  dmCollate As Int16
		  dmFormName As String * 32
		  dmLogPixels As UInt16
		  dmBitsPerPel As UInt32
		  dmPelsWidth As UInt32
		  dmPelsHeight As UInt32
		  dmNup As UInt32
		  dmDisplayFrequency As UInt32
		  dmICMMethod As UInt32
		  dmICMIntent As UInt32
		  dmMediaType As UInt32
		  dmDitherType As UInt32
		  dmReserved1 As UInt32
		  dmReserved2 As UInt32
		  dmPanningWidth As UInt32
		dmPanningHeight As UInt32
	#tag EndStructure

	#tag Structure, Name = DEVMODE_W, Flags = &h0
		dmDeviceName As String * 64
		  dmSpecVersion As UInt16
		  dmDriverVersion As UInt16
		  dmSize As UInt16
		  dmDriverExtra As UInt16
		  dmFields As UInt32
		  dmOrientation As Int16
		  dmPaperSize As Int16
		  dmPaperLength As Int16
		  dmPaperWidth As Int16
		  dmScale As Int16
		  dmCopies As Int16
		  dmDefaultSource As Int16
		  dmPrintQuality As Int16
		  dmColor As Int16
		  dmDuplex As Int16
		  dmYResolution As Int16
		  dmTTOption As Int16
		  dmCollate As Int16
		  dmFormName As String * 64
		  dmLogPixels As UInt16
		  dmBitsPerPel As UInt32
		  dmPelsWidth As UInt32
		  dmPelsHeight As UInt32
		  dmNup As UInt32
		  dmDisplayFrequency As UInt32
		  dmICMMethod As UInt32
		  dmICMIntent As UInt32
		  dmMediaType As UInt32
		  dmDitherType As UInt32
		  dmReserved1 As UInt32
		  dmReserved2 As UInt32
		  dmPanningWidth As UInt32
		dmPanningHeight As UInt32
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Animation"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
