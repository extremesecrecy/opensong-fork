#tag Class
Protected Class NDI
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  App.DebugWriter.Write CurrentMethodName + ": Create NDI instance"
		  NDICriticalSection.Enter
		  FrameHeight = kDefaultFrameHeight
		  FrameWidth = kDefaultFrameWidth
		  SetFrameRateMS kDefaultFrameRateMS
		  WorkerThread = New NDISenderThread
		  NDICriticalSection.Leave
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destroy()
		  NDICriticalSection.Enter
		  
		  If WorkerThread <> Nil Then
		    WorkerThread.Stop
		  End If
		  WorkerThread = Nil
		  NDICriticalSection.Leave
		  
		  If mSingleton = Nil And mndi_send_instance = Nil Then
		    Return
		  End If
		  
		  If mndi_send_instance <> Nil Then
		    NDIlib_send_destroy(mndi_send_instance)
		  End If
		  mndi_send_instance = Nil
		  
		  NDIlib_destroy
		  
		  mSingleton = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub FinishSending()
		  // Shutdown the sender and send a final, transparent frame.
		  If (FrameHeight = 0) Or (FrameWidth = 0) Then Return
		  App.DebugWriter.Write CurrentMethodName + ": Shut down NDI"
		  Dim img As New Picture(FrameHeight, FrameWidth)
		  Dim rb As RawBitmap
		  
		  If WorkerThread <> Nil Then
		    WorkerThread.Stop
		    WorkerThread = Nil
		  End If
		  
		  Frames.RemoveAllRows
		  
		  img.Graphics.ForeColor = &cffffffff
		  img.Graphics.FillRect 0, 0, img.Width, img.Height
		  rb = PictureToRawBitmapRGBA(img)
		  If rb <> Nil Then 
		    SendBitmap(rb)
		    App.SleepCurrentThread(FrameRateMS * 2)
		    SendBitmap(rb)
		  End If
		  
		  Return
		  Catch ex As RuntimeException
		    Dim t As Introspection.TypeInfo = Introspection.GetType(ex)
		    App.DebugWriter.Write CurrentMethodName + ": " + t.Name + " Exception closing sender", 1
		    Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NDI() As NDI
		  If mSingleton = Nil And Not mInitializeFailed Then
		    If System.IsFunctionAvailable("NDIlib_initialize", NDILIB) Then
		      If NDIlib_initialize Then
		        mSingleton = New NDI
		      End If
		    Else
		      mInitializeFailed = True
		      App.DebugWriter.Write CurrentMethodName + ": Cannot find library " + NDILIB, 3
		    End If
		  End If
		  
		  Return mSingleton
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub NDIlib_destroy Lib NDILIB ()
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function NDIlib_initialize Lib NDILIB () As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function NDIlib_recv_capture_v2 Lib NDILIB (p_instance As Ptr, ByRef p_video_data As NDIlib_video_frame_v2_t, p_audio_data_v2 As Ptr, p_metadata As Ptr, timeout_in_ms As UInt32) As NDIlib_frame_type_e
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub NDIlib_recv_connect Lib NDILIB (recv_inst As Ptr, ByRef source As NDIlib_source_t)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function NDIlib_recv_create_v3 Lib NDILIB (ByRef p_create_settings As NDIlib_recv_create_v3_t) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub NDIlib_recv_destroy Lib NDILIB (p_instance As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function NDIlib_send_create Lib NDILIB (ByRef ndi_create_settings As NDIlib_send_create_t) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub NDIlib_send_destroy Lib NDILIB (send_instance As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub NDIlib_send_send_video_v2 Lib NDILIB (instance as Ptr, ByRef frame as NDIlib_video_frame_v2_t)
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Private Function ndi_send_instance() As Ptr
		  If NDI = Nil Then Return Nil
		  If mndi_send_instance = Nil Then
		    Dim senderName As New MemoryBlock(9)
		    senderName.CString(0) = "OpenSong"
		    Dim createArgs As NDIlib_send_create_t
		    createArgs.p_ndi_name = senderName
		    createArgs.clock_video = True
		    mndi_send_instance = NDIlib_send_create(createArgs)
		  End If
		  Return mndi_send_instance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PictureToRawBitmapRGBA(pic As Picture) As RawBitmap
		  Dim rb As RawBitmap
		  Dim rgba As RawBitmap
		  rb = RawBitmapConverter.FromPicture(pic)
		  If rb.ImageFormat <> RawBitmap.RawBitmapFormat.RGBA Then
		    rgba = New RawBitmap(Nil, rb.Width, rb.Height, 0, RawBitmap.RawBitmapFormat.RGBA)
		    rgba.DrawBitmap rb, 0, 0
		  Else
		    rgba = rb
		  End If
		  
		  Return rgba
		  
		  Exception ex As NilObjectException
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RawBitmapToPicture(rb As RawBitmap) As Picture
		  Dim p As Picture
		  p = RawBitmapConverter.ToPicture(rb)
		  Return p
		  
		  Exception ex As NilObjectException
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SendBitmap(rb As RawBitmap)
		  If NDI = Nil Then Return
		  //
		  // Make sure that the bitmap is in RGBA format
		  //
		  Dim buffer As RawBitmap
		  buffer = rb
		  If rb.ImageFormat <> RawBitmap.RawBitmapFormat.RGBA Then
		    buffer = New RawBitmap(Nil, rb.Width, rb.Height, 0, RawBitmap.RawBitmapFormat.RGBA)
		    buffer.DrawBitmap(rb, 0, 0)
		  End If
		  
		  Dim videoframe As NDIlib_video_frame_v2_t
		  
		  videoframe.xRes = buffer.Width
		  videoframe.yRes = buffer.Height
		  videoframe.FourCC = "RGBA"
		  videoframe.Videodata = buffer.MemoryBlock
		  videoframe.LineStride = videoframe.xRes * 4
		  
		  NDIlib_send_send_video_v2(NDI.ndi_send_instance, videoframe)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SendImage(img As Picture)
		  If NDI = Nil Then Return
		  If img = Nil Then Return
		  If Frames.Count > Floor(FrameRateFPS / 2) Then
		    App.DebugWriter.Write CurrentMethodName + ": Queue is too long; dropping frame"
		    Return
		  End If
		  
		  Dim p As New Picture(img.Width, img.Height)
		  If p = Nil Then
		    App.DebugWriter.Write CurrentMethodName + ": p is NIL"
		    Return
		  End If
		  p.Graphics.DrawPicture img, 0, 0
		  
		  NDICriticalSection.Enter
		  Frames.AddRow(p)
		  NDICriticalSection.Leave
		  NDI.NDI.StartSenderThread
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SetFrameRateFPS(fps As Single = kDefaultFrameRateFPS)
		  If fps < 0 Then
		    Dim oob As New OutOfBoundsException
		    oob.Message = "Frames per second must be greater than 0. Requested value is " + Format(fps, "####.##")
		    Raise oob
		  End If
		  
		  mFrameRateMS = CType(Floor(1000 / fps), Integer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SetFrameRateMS(rate As UInteger = kDefaultFrameRateMS)
		  mFrameRateMS = rate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SetFrameSize(width As UInteger, height As UInteger)
		  NDICriticalSection.Enter
		  mFrameWidth = width
		  mFrameHeight = height
		  NDICriticalSection.Leave
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartSenderThread()
		  #if DebugBuild then
		    App.DebugWriter.Write CurrentMethodName + ": Entering", 10
		  #endif
		  
		  If WorkerThread = Nil Then
		    WorkerThread = New NDISenderThread
		  End If
		  
		  Select Case WorkerThread.ThreadState
		  Case Thread.ThreadStates.NotRunning
		    WorkerThread.Start
		    #if DebugBuild then
		      App.DebugWriter.Write CurrentMethodName + ": Start", 10
		    #endif
		    
		  Case Thread.ThreadStates.Paused, Thread.ThreadStates.Sleeping
		    WorkerThread.Resume
		    #if DebugBuild then
		      App.DebugWriter.Write CurrentMethodName + ": Resume", 10
		    #endif
		    
		  End Select
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCurrentSource
			End Get
		#tag EndGetter
		Shared CurrentSource As NDIlib_source_t
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFrameHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFrameHeight = value
			End Set
		#tag EndSetter
		Shared FrameHeight As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return 1.0 / mFrameRateMS
			End Get
		#tag EndGetter
		Shared FrameRateFPS As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFrameRateMS
			End Get
		#tag EndGetter
		Shared FrameRateMS As UInteger
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shared Frames() As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFrameWidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFrameWidth = value
			End Set
		#tag EndSetter
		Shared FrameWidth As UInteger
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mCurrentSource As NDIlib_source_t
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mFrameHeight As UInteger
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mFrameRateMS As UInteger
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mFrameWidth As UInteger
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mInitializeFailed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mNDICriticalSection As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mndi_send_instance As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mSingleton As NDI
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mSources() As NDIlib_source_t
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mNDICriticalSection = Nil Then
			    mNDICriticalSection = New CriticalSection
			  End If
			  Return mNDICriticalSection
			End Get
		#tag EndGetter
		Shared NDICriticalSection As CriticalSection
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared ndi_recv_instance As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared SenderName As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared WorkerThread As NDISenderThread
	#tag EndProperty


	#tag Constant, Name = kDebugFrameRateMS, Type = Double, Dynamic = False, Default = \"500", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDefaultFrameHeight, Type = Double, Dynamic = False, Default = \"1080", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDefaultFrameRateFPS, Type = Double, Dynamic = False, Default = \"29.97", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDefaultFrameRateMS, Type = Double, Dynamic = False, Default = \"33", Scope = Private, Description = 333320697320746865206E65617265737420696E746567657220746F2033332E3337206D696C6C697365636F6E64732C20776869636820776F756C642062652032392E3937206670732E0A0A4E444920646566696E65732032392E393720617320313030312F333030203D20332E3333372068756E64726564746873206F662061207365636F6E642E
	#tag EndConstant

	#tag Constant, Name = kDefaultFrameWidth, Type = Double, Dynamic = False, Default = \"1920", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NDILIB, Type = String, Dynamic = False, Default = \"", Scope = Private, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Processing.NDI.Lib.x86.dll"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/../Frameworks/libndi.dylib"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libndi.so"
	#tag EndConstant

	#tag Constant, Name = NDIlib_recv_bandwidth_audio_only, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NDIlib_recv_bandwidth_highest, Type = Double, Dynamic = False, Default = \"100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NDIlib_recv_bandwidth_lowest, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NDIlib_recv_bandwidth_metadata_only, Type = Double, Dynamic = False, Default = \"-10", Scope = Public
	#tag EndConstant


	#tag Structure, Name = NDIlib_audio_frame_v2_t, Flags = &h0, Attributes = \"StructureAlignment \x3D 8"
		sample_rate As UInt32
		  no_channels As UInt32
		  no_samples As UInt32
		  timecode As UInt64
		  p_data As Ptr
		  channel_stride_in_bytes As UInt32
		  p_metadata As Ptr
		timestamp As UInt64
	#tag EndStructure

	#tag Structure, Name = NDIlib_find_create_t, Flags = &h21, Attributes = \"StructureAlignment \x3D 8"
		show_local_sources As UInt32
		  p_groups_ As Ptr
		p_extra_ips_ As Ptr
	#tag EndStructure

	#tag Structure, Name = NDIlib_recv_create_v3_t, Flags = &h21, Attributes = \"StructureAlignment \x3D 8"
		source_to_connect_to As NDILib_source_t
		  color_format As NDIlib_recv_color_format_e
		  bandwidth As NDIlib_recv_bandwidth_e
		  allow_video_fields As UInt8
		p_ndi_recv_name As CString
	#tag EndStructure

	#tag Structure, Name = NDIlib_send_create_t, Flags = &h21
		p_ndi_name As Ptr
		  p_groups As Ptr
		  clock_video As Boolean
		  clock_audio As Boolean
		alignment_member As String * 6
	#tag EndStructure

	#tag Structure, Name = NDIlib_source_t, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target64Bit)) or  (TargetWeb and (Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit)), Attributes = \"StructureAlignment \x3D 0"
		p_ndi_name As CString
		p_ndi_url As CString
	#tag EndStructure

	#tag Structure, Name = NDIlib_video_frame_v2_t, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit)), Attributes = \"StructureAlignment \x3D 8"
		xRes As UInt32
		  yRes As UInt32
		  FourCC As String * 4
		  FrameRateN As UInt32
		  FrameRateD As UInt32
		  Picture_Aspect_Ratio As Single
		  Frame_Format_Type As UInt32
		  Timecode As Int64
		  Videodata As Ptr
		  LineStride As Integer
		  Metadata As Ptr
		Timestamp As Int64
	#tag EndStructure


	#tag Enum, Name = NDIlib_frame_type_e, Type = UInt32, Flags = &h0
		NDIlib_frame_type_none = 0
		  NDIlib_frame_type_video = 1
		  NDIlib_frame_type_audio = 2
		  NDIlib_frame_type_metadata = 3
		  NDIlib_frame_type_error = 4
		NDIlib_frame_type_status_change = 100
	#tag EndEnum

	#tag Enum, Name = NDIlib_recv_bandwidth_e, Type = Int32, Flags = &h21
		NDIlib_recv_bandwidth_metadata_only = -10
		  NDIlib_recv_bandwidth_audio_only = 10
		  NDIlib_recv_bandwidth_lowest = 0
		  NDIlib_recv_bandwidth_highest = 100
		NDIlib_recv_bandwidth_max = &h7fffffff
	#tag EndEnum

	#tag Enum, Name = NDIlib_recv_color_format_e, Type = Int32, Flags = &h0
		NDIlib_recv_color_format_BGRX_BGRA = 0
		  NDIlib_recv_color_format_UYVY_BGRA = 1
		  NDIlib_recv_color_format_RGBX_RGBA = 2
		  NDIlib_recv_color_format_UYVY_RGBA = 3
		  NDIlib_recv_color_format_fastest = 100
		NDIlib_recv_color_format_best = 101
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
