#tag Module
Protected Module Globals
	#tag Method, Flags = &h1
		Protected Function GetFilterString(Index As integer) As string
		  Dim i As Integer
		  Dim CurrIndex As integer
		  Dim Ext As Boolean
		  Dim s As string
		  Dim Pos As integer
		  
		  If Globals.Filters = Nil Or Globals.Filters.Byte(0) = 0 Then
		    Return s
		  End If
		  Ext = False
		  Pos = 0
		  CurrIndex = 0
		  While i < Globals.Filters.Size
		    If Globals.Filters.Byte(i) = 0 Then
		      If Ext = True Then
		        Ext = False
		        Pos = i + 1
		      Else
		        CurrIndex = CurrIndex + 1
		        If CurrIndex = Index Then
		          s = Globals.Filters.CString(Pos)
		          Return s
		        End If
		        Ext = True
		      End If
		    End If
		    i = i + 1
		  Wend
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MakeFilterArray()
		  Dim CurrPos As Integer
		  Dim c As integer
		  Dim s As string
		  Dim r As integer
		  Dim Ext As Boolean
		  Dim Pos As integer
		  Dim A(-1) As string
		  Dim i As integer
		  
		  CurrPos = 0
		  Pos = 0
		  Ext = false
		  Globals.Filters = New MemoryBlock(5000)
		  c = InStr(CurrPos, Globals.AudioPluginFormats, "|")
		  
		  While c <> 0
		    r = c - CurrPos
		    s = Mid(Globals.AudioPluginFormats, CurrPos, r)
		    
		    If Ext = True Then 'extention
		      Ext = False
		      Globals.Filters.CString(Pos) = " ("
		      Pos = Pos + 2
		      
		      If InStr(s, ";") <> 0 Then
		        A = Split(s, ";")
		        For i = 0 To UBound(A)
		          Globals.Filters.CString(Pos) = "*." + A(i)
		          Pos = Pos + A(i).Len + 2
		          
		          If i = UBound(A) Then
		            
		          Else
		            Globals.Filters.CString(Pos) = ";"
		            Pos = Pos + 1
		          End If
		          
		        Next
		      Else
		        Globals.Filters.CString(Pos) = "*." + s
		        Pos = Pos + s.Len + 2
		      End If
		      
		      Globals.Filters.CString(Pos) = ")"
		      Pos = Pos + 1
		      Globals.Filters.Byte(Pos) = 0
		      Pos = Pos + 1
		      
		      If InStr(s, ";") <> 0 Then
		        For i = 0 To UBound(A)
		          Globals.Filters.CString(Pos) = "*." + A(i)
		          Pos = Pos + A(i).Len + 2
		          
		          If i = UBound(A) Then
		            
		          Else
		            Globals.Filters.CString(Pos) = ";"
		            Pos = Pos + 1
		          End If
		          
		        Next
		      Else
		        Globals.Filters.CString(Pos) = "*." + s
		        Pos = Pos + s.Len + 2
		      End If
		      
		      Globals.Filters.Byte(Pos) = 0
		      Pos = Pos + 1
		    Else
		      Ext = True
		      Globals.Filters.CString(Pos) = s
		      Pos = Pos + s.Len
		    End If
		    
		    CurrPos = CurrPos + r + 1
		    c = InStr(CurrPos, Globals.AudioPluginFormats, "|")
		    
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentWindowLaunchAppExitCallback(lpParameter As Ptr, TimerOrWaitFired As Boolean)
		  #pragma X86CallingConvention StdCall
		  
		  #pragma Unused lpParameter
		  #pragma Unused TimerOrWaitFired
		  
		  // note: If invoked as a callback from windows, breakpoints are ignored
		  // this needs to be global or else the app will crash
		  
		  App.DebugWriter.Write CurrentMethodName + " Start Timeout="+ CStr(TimerOrWaitFired)
		  PresentWindow.ExternalSlideTerminatedW32(lpParameter, TimerOrWaitFired)
		  App.DebugWriter.Write CurrentMethodName + " End"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuitProcessCallback(hWnd As Integer, LParam As Integer) As Boolean
		  #If TargetWin32
		    #Pragma X86CallingConvention StdCall
		    
		    Dim TID, PID As UInt32
		    Dim mb As New MemoryBlock(4)
		    
		    TID = WinAPI.GetWindowThreadProcessId(hWnd, mb)
		    PID = mb.UInt32Value(0)
		    If PID <> lParam Then Return True  // this window does not belong to the process to be killed. Search for more windows
		    
		    'If System.IsFunctionAvailable("EndTask", "User32") Then
		    'If WinAPI.EndTask(hWnd, True) Then
		    'WinAPI.SetLastError(0)
		    'Return False // no more Windows
		    'End If
		    'End If
		    
		    Const WM_CLOSE = &h0010
		    
		    Declare Function SendMessageW Lib "user32" (hwnd As Integer, msg As Integer, wParam As Ptr, lParam As Ptr) As Integer
		    
		    Call SendMessageW(hWnd, WM_CLOSE, Nil, Nil)
		    
		    Return True // find more windows
		  #Else
		    Return False
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends value As Boolean) As String
		  If value Then
		    Return "True"
		  Else
		    Return "False"
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends i As Integer, stringFormat As String = "") As String
		  If stringFormat.len = 0 Then Return CStr(i)
		  
		  Return format(i, stringFormat)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends p As REALbasic.Point) As String
		  Return "(" + CStr(p.x) + ", " + CStr(p.y) + ")"
		End Function
	#tag EndMethod


	#tag Note, Name = Audio!
		A property deleted from this module
		was "SXMSAudio As SXMS"
		
		This was taken out to allow for a mainstream
		cross-platform version until other audio options
		(or an #ifdef) can be utilized
		
		EMP, 17 Feb 2006
	#tag EndNote


	#tag Property, Flags = &h0
		ActLog(0) As LogEntry
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected AddToLog As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected AudioPluginFormats As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentSongFolder As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentSongPickerFolder As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Filters As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastSongFolder As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldFolderSel As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldSongFileName As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldSongSel As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SongActivityLog As ActivityLog
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_InputBoxOpen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_Presentation As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_ScripturePickerOpen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_SongPickerOpen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_SongsFolderUpdating As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		UseSheetDialogs As Boolean
	#tag EndProperty


	#tag Constant, Name = CTRL_V, Type = Integer, Dynamic = False, Default = \"22", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ENTER, Type = Integer, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant


	#tag Structure, Name = StyleMarginType, Flags = &h0
		Left as Integer
		  Right as Integer
		  Top as Integer
		Bottom as Integer
	#tag EndStructure

	#tag Structure, Name = StyleTabsType, Flags = &h0
		Position As Integer
		  Align As StyleHAlignEnum
		alignChar As String * 1
	#tag EndStructure


	#tag Enum, Name = SlideTransitionEnum, Flags = &h0
		ApplicationDefault
		  UseTransition
		NoTransition
	#tag EndEnum

	#tag Enum, Name = StyleHAlignEnum, Flags = &h0
		Left
		  Middle
		  Right
		Char
	#tag EndEnum

	#tag Enum, Name = StyleSectionEnum, Flags = &h0
		Title
		  Subtitle
		Body
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="CurrentSongPickerFolder"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
		#tag ViewProperty
			Name="UseSheetDialogs"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
