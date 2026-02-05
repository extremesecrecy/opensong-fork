#tag Class
Protected Class VideolanController
Inherits Timer
	#tag Event
		Sub Action()
		  If m_running Then
		    If Not m_telnet.IsConnected() Then
		      
		      If Not m_vlcShell.IsRunning Then
		        m_RCconnected = False
		        
		        'We were disconnected; VLC stopped, advance to next sheet if presentation is waiting for end of playback
		        If m_waitForPlayback Then
		          NotifyPlaybackEnd()
		        End If
		        Enabled = False
		        m_playing = False
		        
		      Else
		        'Retry, VLC needs to init before accepting connections
		        m_telnet.Connect()
		      End If
		    Else
		      If Not m_RCconnected Then
		        m_RCconnected = True
		        
		        'Send the password specified in VLC_INIT
		        'This initialises the connection - it is kept open until VLC closes
		        'VLCCommand "OpenSong" 'Does not apply for RC, only for VLM
		        
		        VLCCommand "" 'Send empty string to initialise control
		      Else
		        If m_telnet.BytesAvailable > 0 Then
		          Dim response As String = m_telnet.ReadAll()
		          
		          If response.Right(1) = "0" Then
		            'The playback stopped, notify PresentWindow
		            If m_waitForPlayback Then
		              NotifyPlaybackEnd()
		            End If
		            m_playing = False
		          ElseIf response.Right(1) = "1" Then
		            m_playing = True
		            'Go on
		          Else
		            'This was not a response to is_playing
		          End If
		        End If
		        
		        'Read status of VLC to see if playback ended
		        VLCCommand "is_playing"
		        
		      End If
		    End If
		    
		  Else
		    Enabled = False
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  m_vlcShell = New Shell()
		  
		  'Setup TCP connection for status info
		  m_telnet = New TCPSocket()
		  m_telnet.Address = "localhost"
		  m_telnet.Port = 11777 'The default VLC telnet port for RC
		  
		  m_RCconnected = False
		  
		  'Setting internal timer values for connection maintenance and status updating
		  Enabled = False
		  Period = 500 'Set the poll time to 500ms, 2 times per second
		  Mode =  Timer.ModeMultiple
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPlaying() As Boolean
		  Return m_playing
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NotifyPlaybackEnd()
		  'Send next-slide command to PresentWindow
		  
		  If Not PresentWindow.IsClosingExternal() Then
		    Call PresentWindow.KeyDownX( Chr(31) ) 'ASC_KEY_DOWN
		  End If
		  
		  m_waitForPlayback = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Start(mediaFilename as String, parameters As String, screen As Integer, waitForPlayback As Boolean = False, fullScreen As Boolean = True) As Boolean
		  Dim videolanLocation As FolderItem = App.MainPreferences.GetValueFI(Prefs.kVideolanLocation, Nil, False)
		  Dim mediaFile As FolderItem = PathToFolderItem(mediaFilename)
		  Dim VLCparams As String = VLC_INIT
		  
		  If m_running Then
		    Stop()
		    m_running = False
		    If m_vlcShell.IsRunning Then
		      m_vlcShell.Close
		    End If
		  End If
		  
		  If Not IsNull(videolanLocation) And videolanLocation.Exists() Then
		    If screen < 0 Or screen > OSScreenCount() - 1 Then screen = 0
		    
		    If fullScreen Then
		      VLCparams = VLCparams + " --fullscreen"
		    Else
		      VLCparams = VLCparams + " --no-fullscreen"
		    End If
		    
		    parameters = VLCparams + " " + parameters
		    parameters  = ReplaceAllB(parameters, "%d", Str(screen))
		    parameters  = ReplaceAllB(parameters, "%x", Str(OSScreen(screen).Left+1))
		    parameters  = ReplaceAllB(parameters, "%y", Str(OSScreen(screen).Top+1))
		    
		    #if TargetWin32
		      Soft Declare Function EnumDisplayDevicesW Lib "User32" ( lpDevice As Ptr, iDevNum As UInt32, lpDisplayDevice As Ptr, dwFlags As UInt32 ) As Boolean
		      Dim Display_Device As MemoryBlock
		      Dim DisplayDevice As String
		      Display_Device = New MemoryBlock(840)
		      Display_Device.UInt32Value(0) = 840 // cb
		      If EnumDisplayDevicesW( Nil, screen, Display_Device, 0 ) Then
		        // I actually have a CString with a maximum of 32 characters. I don't know if it was able to handle UCS2. MemoryBlock.CString has no maximum length anyway, so we need to improvise
		        DisplayDevice = Display_Device.StringValue(4,64)
		        DisplayDevice = DisplayDevice.defineEncoding(Encodings.UTF16)
		        DisplayDevice = ConvertEncoding(DisplayDevice,parameters.Encoding) // with UTF16, the following NthField cuts the last character mid through (RB 2011.43)
		        DisplayDevice = NthField(DisplayDevice, &u0, 1)
		        App.DebugWriter.Write("Device for screen " + Str(screen) + " is " + DisplayDevice, 7)
		        parameters  = ReplaceAllB(parameters, "%D", DisplayDevice)
		      Else
		        App.DebugWriter.Write("Could not determine Device for screen " + Str(screen), 7)
		      End If
		    #endif
		    
		    mediaFilename = Trim(mediaFilename)
		    If mediaFilename <> "" Then
		      #if TargetWin32
		        If Not IsNull(mediaFile) Then
		          mediaFilename = mediaFile.URLPath()
		        End If
		        ' quote for the command line
		        mediaFilename = ReplaceAll(mediaFilename, "^", "^^")
		        mediaFilename = ReplaceAll(mediaFilename, ">", "^>")
		        mediaFilename = ReplaceAll(mediaFilename, "<", "^<")
		        mediaFilename = ReplaceAll(mediaFilename, "%", "^%")
		        mediaFilename = ReplaceAll(mediaFilename, """", "^""")
		        mediaFilename = ReplaceAll(mediaFilename, "&", "^&")
		        mediaFilename = ReplaceAll(mediaFilename, "|", "^|")
		        mediaFilename = ReplaceAll(mediaFilename, "\", "\\")
		        
		      #else
		        If Not IsNull(mediaFile) Then
		          mediaFilename = mediaFile.ShellPath()
		        Else
		          ' quote for the command line
		          mediaFilename = ReplaceAll(mediaFilename, "\", "\\")
		          mediaFilename = ReplaceAll(mediaFilename, "$", "\$")
		          mediaFilename = ReplaceAll(mediaFilename, "`", "\`")
		          mediaFilename = ReplaceAll(mediaFilename, """", "\""")
		        End If
		      #endif
		    End If
		    If InStrB(parameters, "%s") = 0 Then
		      parameters = parameters + " " + mediaFilename
		    Else
		      parameters = ReplaceAllB(parameters, """%s""", "$s")
		      parameters = ReplaceAllB(parameters, "%s", mediaFilename)
		    End If
		    Dim cmd As String = """" + VideolanLocation.ShellPath() + """  " + parameters + " vlc://quit"
		    
		    m_vlcShell.Mode = 1 'Asynchronous
		    m_vlcShell.Execute( cmd )
		    
		    m_waitForPlayback = waitForPlayback
		    App.DebugWriter.Write("VLC started und is running = "+Str(m_vlcShell.IsRunning))
		    m_running = True
		    m_RCconnected = False
		    
		    'Start internal timer for status updates
		    Enabled = True
		  Else
		    MsgBox(App.T.Translate("errors/videolan_app_missing"))
		  End If
		  
		  Return m_running
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  Dim t As Integer
		  If m_running Then
		    m_playing = False
		    m_running = False
		    Enabled = False 'Stop internal updates timer
		    
		    If m_telnet.IsConnected() Then
		      
		      'Shutdown is not supported by all versions of VideoLan
		      'So send the next command to skip to vlc://quit
		      VLCCommand "next"
		      'Send the stop command in case next failed
		      'VLCCommand "stop"
		      'Finally send shutdown anyway in case it is supported
		      'VLCCommand "shutdown"
		      
		      'm_telnet.Close()
		      
		      // VLC should quit and disconnect
		      t = Ticks + 10 * 60
		      While m_telnet.IsConnected
		        If Ticks > t Then Exit
		        App.DoEvents
		      Wend
		    End If
		    
		    // wait for VLC to completely quit. Kill it, if it does not
		    // on Windows, an attempt to kill VLC will fail because Shell with Mode=Asynchronous is broken, but we don't have a handle or PID to kill it
		    t = Ticks + 5 * 60
		    While m_vlcShell.IsRunning
		      If Ticks > t Then
		        'Close any running external application instance.
		        m_vlcShell.Close()
		      Else
		        App.DoEvents
		      End If
		    Wend
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub VLCCommand(data As String)
		  If m_telnet.IsConnected() Then
		    m_telnet.Write data + EndOfLine
		    'Do
		    'm_telnet.Poll
		    'Loop Until m_telnet.BytesLeftToSend=0 Or m_telnet.LastErrorCode<>0 Or m_telnet.IsConnected() = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WaitForPlayback() As Boolean
		  Return m_waitForPlayback And m_running
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		m_playing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_RCconnected As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_running As boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_telnet As TCPSocket = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_vlcShell As Shell = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_waitForPlayback As Boolean = False
	#tag EndProperty


	#tag Constant, Name = VLC_INIT, Type = String, Dynamic = False, Default = \"-I rc --rc-host\x3Dlocalhost:11777 --rc-quiet --quiet --global-key-quit\x3DCtrl-Alt-Shift-q --no-media-library --video-x\x3D%x --video-y\x3D%y", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
			Name="Mode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Timer"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
			Type="Integer"
			InheritedFrom="Timer"
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
End Class
#tag EndClass
