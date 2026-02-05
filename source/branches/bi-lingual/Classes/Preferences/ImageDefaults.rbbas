#tag Module
Protected Module ImageDefaults
	#tag ComputedProperty, Flags = &h0
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
		ExcludeBackgroundsImages As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
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
			    SmartML.SetValueN(App.MyMainSettings.DocumentElement, "image_quality/@compression", Int32(value))
			  End If
			End Set
		#tag EndSetter
		ImageQuality As ImageQualityEnum
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
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
		KeepAspectRatio As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
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
		ResizeToBodyArea As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
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
		ResizeToScreenArea As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
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
		UseBackgroundsAsText As Boolean
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
			Name="ExcludeBackgroundsImages"
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
			Name="KeepAspectRatio"
			Group="Behavior"
			Type="Boolean"
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
			Name="ResizeToBodyArea"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ResizeToScreenArea"
			Group="Behavior"
			Type="Boolean"
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
		#tag ViewProperty
			Name="UseBackgroundsAsText"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
