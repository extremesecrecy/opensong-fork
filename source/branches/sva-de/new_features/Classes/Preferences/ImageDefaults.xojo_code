#tag Module
Protected Module ImageDefaults
	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim f As FolderItem = App.DocsFolder
			  If f = Nil Then Return Nil
			  If Not f.Exists Then
			    If Not FileUtils.CreateFolder(f) Then Return Nil
			  End If
			  If Not f.IsFolder Then Return Nil
			  
			  f = f.Child(App.STR_BACKGROUNDS)
			  If f = Nil Then Return Nil
			  If Not f.Exists Then
			    If Not FileUtils.CreateFolder(f) Then Return Nil
			  End If
			  If Not f.IsFolder Then Return Nil
			  
			  Return f
			End Get
		#tag EndGetter
		Protected BackgroundsFolder As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim f As FolderItem
			  Dim path As String
			  
			  f = BackgroundsFolder
			  If f <> Nil Then
			    path = f.NativePath
			    If Not path.EndsWith(FileUtils.NativePathSeparator) Then
			      path = path + FileUtils.NativePathSeparator
			    End If
			  End If
			  Return path
			End Get
		#tag EndGetter
		Protected BackgroundsPath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim QualitySetting As ImageQualityEnum = ImageQualityEnum.UninitialisedCompression
			  
			  If Not IsNull(App.MyMainSettings) Then
			    Dim QualityValue As Integer =  SmartML.GetValueN(App.MyMainSettings.DocumentElement, "image_quality/@compression", False)
			    QualitySetting = ImageQualityEnum(QualityValue)
			  End If
			  
			  If QualitySetting = ImageQualityEnum.UninitialisedCompression Then
			    QualitySetting = ImageQualityEnum.MediumCompression
			  End If
			  
			  Return QualitySetting
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not IsNull(App.MyMainSettings) Then
			    SmartML.SetValueN(App.MyMainSettings.DocumentElement, "image_quality/@compression", Integer(value))
			  End If
			End Set
		#tag EndSetter
		Protected ImageQuality As ImageQualityEnum
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim result As Boolean = False
			  
			  If Not IsNull(App.MyMainSettings) Then
			    result = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "image_quality/@keepaspect", False, result)
			  End If
			  
			  Return result
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not IsNull(App.MyMainSettings) Then
			    SmartML.SetValueB(App.MyMainSettings.DocumentElement, "image_quality/@keepaspect", value)
			  End If
			End Set
		#tag EndSetter
		Protected KeepAspectRatio As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Note
			This is the Option "Do not embed images from Backgrounds, use a link"
		#tag EndNote
		#tag Getter
			Get
			  Dim result As Boolean = False
			  
			  If Not IsNull(App.MyMainSettings) Then
			    result = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "image_quality/@exclude_backgrounds", False, result)
			  End If
			  
			  Return result
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not IsNull(App.MyMainSettings) Then
			    SmartML.SetValueB(App.MyMainSettings.DocumentElement, "image_quality/@exclude_backgrounds", value)
			  End If
			End Set
		#tag EndSetter
		Protected LinkToBackgroundsFolder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim result As Boolean = False
			  
			  If Not IsNull(App.MyMainSettings) Then
			    result = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "image_quality/@fit_to_body", False, result)
			  End If
			  
			  Return result
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not IsNull(App.MyMainSettings) Then
			    SmartML.SetValueB(App.MyMainSettings.DocumentElement, "image_quality/@fit_to_body", value)
			  End If
			End Set
		#tag EndSetter
		Protected ResizeToBodyArea As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim result As Boolean = True
			  
			  If Not IsNull(App.MyMainSettings) Then
			    result = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "image_quality/@fit_to_screen", False, result)
			  End If
			  
			  Return result
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not IsNull(App.MyMainSettings) Then
			    SmartML.SetValueB(App.MyMainSettings.DocumentElement, "image_quality/@fit_to_screen", value)
			  End If
			End Set
		#tag EndSetter
		Protected ResizeToScreenArea As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim result As Boolean = False
			  
			  If Not IsNull(App.MyMainSettings) Then
			    result = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "image_quality/@background_as_text", False, result)
			  End If
			  
			  Return result
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not IsNull(App.MyMainSettings) Then
			    SmartML.SetValueB(App.MyMainSettings.DocumentElement, "image_quality/@background_as_text", value)
			  End If
			End Set
		#tag EndSetter
		Protected UseBackgroundsAsText As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = ImageQualityEnum, Flags = &h0
		UninitialisedCompression=0
		  FullCompression=1
		  HighCompression=2
		  MediumCompression=3
		  LittleCompression=4
		  LowCompression=5
		NoCompression=6
	#tag EndEnum


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
End Module
#tag EndModule
