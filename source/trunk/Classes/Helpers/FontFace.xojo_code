#tag Class
Protected Class FontFace
	#tag Method, Flags = &h0
		Function Clone() As FontFace
		  Dim f As New FontFace
		  f.Bold = Bold
		  f.ForeColor = ForeColor
		  f.Italic = Italic
		  f.Name = Name
		  f.Size = Size
		  f.Underline = Underline
		  f.Shadow = Shadow
		  f.ShadowColor = ShadowColor
		  f.Border = Border
		  f.BorderColor = BorderColor
		  f.Fill = Fill
		  f.FillColor = FillColor
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Name = "System"
		  Size = 0
		  ForeColor = &c000000
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsFontAvailable(fontname As String) As Boolean
		  LoadAvailableFonts
		  If AvailableFontNames.IndexOf(fontname) >= 0 Then
		    Return True
		  End If
		  //++
		  // Check for two "pseudo" fonts: System and SmallSystem
		  // These are defined within Xojo as platform-specific GUI fonts
		  //--
		  If fontname = "System" Or fontname = "SmallSystem" Then
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub LoadAvailableFonts(Force As Boolean = False)
		  If Force Or System.FontCount <> AvailableFontNames.Count Then
		    //++
		    // Load local cache of font names
		    // Keep a local cache to save overhead of enumerating fonts
		    // from the system every time a font name is set
		    //--
		    Dim fc As Integer
		    fc = FontCount
		    fc = fc - 1
		    Redim AvailableFontNames(fc)
		    For i As Integer = 0 To fc
		      AvailableFontNames.Append Font(i)
		    Next
		  End If
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OntoGraphics(g As Graphics, zoom As Double = 1.0)
		  g.ForeColor = ForeColor
		  g.TextFont = TrueName
		  g.FontSize = Size * zoom
		  If g.FontSize < 0 Then g.FontSize = 0
		  #if RBVersion < 2019.02 
		    ' according to docu, this is not needed anymore (Xojo 2019r2: "If you enter zero as the TextSize, your app will use the font size that works best for the platform on which it is running.")
		    If g.FontSize = 0 And Not (g.FontName = "System" Or g.FontName = "SmallSystem") Then
		      g.FontSize = 10
		      app.DebugWriter.Write CurrentMethodName + ": Attempted to set a zero FontSize for font '" + Name + "'"
		    End If
		  #endif
		  g.FontUnit = FontUnits.Point
		  g.Bold = Bold
		  g.Italic = Italic
		  g.Underline = Underline
		  g.CharacterSpacing = (2 * CType(Border, Integer)) + CType(Shadow, Integer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OntoStringShape(byRef s As StringShape, Zoom As Double = 1.0)
		  //++
		  // updates the properties of a StringShape to reflect the FontFace
		  //
		  // Ed Palmer, 12/05
		  //--
		  
		  s.TextFont = TrueName
		  s.TextSize = Size * Zoom
		  If s.TextSize < 0 Then s.TextSize = 0
		  #if RBVersion < 2019.02
		    ' according to docu, this is not needed anymore (Xojo 2019r2: "If you enter zero as the FontSize, your app will use the font size that works best for the platform on which it is running."
		    If s.TextSize = 0 And Not (Name = "System" Or Name = "SmallSystem") Then
		      s.TextSize = 10
		      app.DebugWriter.Write CurrentMethodName + ": Attempted to set a zero TextSize for font '" + Name + "'"
		    End If
		  #endif
		  s.TextUnit = FontUnits.Point
		  s.Bold = Bold
		  s.FillColor = ForeColor
		  s.Italic = Italic
		  s.Underline = Underline
		  
		  if Border Then
		    s.Border = 100
		    s.BorderWidth = Max(0.5, s.TextSize * ThicknessFactor / 40)
		    s.BorderColor = BorderColor
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToCSS() As String
		  //++
		  // Convert the FontFace to its CSS equivalent declarations
		  //
		  // Fill, Border, and Shadow properties, along with their colors, are not exposed in PrintSettings window
		  // and thus not handled here either
		  //--
		  
		  Dim s As String = ""
		  Dim tab As String = "    "
		  Dim fontFamily, fontSize As String
		  
		  // Check for System and SmallSystem and convert to generic sans-serif, else return the font name
		  If TrueName = "System" Or TrueName = "SmallSystem" Then fontFamily = "sans-serif" Else fontFamily = TrueName
		  If Size = 0 Then fontSize = "10pt;" Else fontSize = CStr(Size) + "pt;"
		  s = s + tab + "font-family: """ + fontFamily + """;" + EndOfLine
		  s = s + tab + "color: " + ColorToCSS(ForeColor) + ";" + EndOfLine
		  s = s + tab + "font-size: " + fontSize + EndOfLine
		  
		  If Italic Then
		    s = s + tab + "font-style: italic;" + EndOfLine
		  End If
		  
		  If Bold Then
		    s = s + tab + "font-weight: bold;" + EndOfLine
		  End If
		  
		  If Underline Then
		    s = s + tab + "text-decoration: underline;" + EndOfLine
		  End If
		  
		  Return s
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Shared AvailableFontNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Bold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Border As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		Fill As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FillColor As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared FontSubstitutions As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		ForeColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		Italic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSize As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTrueName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mName = value
			  If FontSubstitutions = Nil Then
			    FontSubstitutions = New Dictionary
			  End If
			  
			  //++
			  // Verify the font exists in the system
			  // Set to "System" (default font for platform) if it does not
			  //--
			  If IsFontAvailable(value) Then
			    mTrueName = value
			  ElseIf FontSubstitutions.HasKey(value) Then
			    mTrueName = FontSubstitutions.Value(value)
			  Else
			    #If TargetLinux
			      If mName = "Courier New" Or mName = "Courier" Then
			        mTrueName = "Monospace"  // not really a TrueName, but GTK translates this to the system's standard monospace font
			      ElseIf IsFontAvailable("Noto Sans") Then
			        mTrueName = "Noto Sans"
			      ElseIf IsFontAvailable("Ubuntu") Then
			        mTrueName = "Ubuntu"
			      ElseIf IsFontAvailable("Sans") Then
			        mTrueName = "Sans"
			      Else
			        mTrueName = "System"
			      End If
			    #Else
			      If mName = "Courier New" And IsFontAvailable("Courier") Then
			        mTrueName = "Courier"
			      ElseIf mName = "Courier" And IsFontAvailable("Courier New") Then
			        mTrueName = "Courier New"
			      ElseIf IsFontAvailable("Arial") Then
			        mTrueName = "Arial"
			      ElseIf IsFontAvailable("Times New Roman") Then
			        mTrueName = "Times New Roman"
			      Else
			        mTrueName = "System"
			      End If
			    #EndIf
			    If Not FontSubstitutions.HasKey(mName) Then
			      FontSubstitutions.Value(mName) = mTrueName
			      App.DebugWriter.Write CurrentMethodName + ": Font " + value + " is not available. Replaced with " + mTrueName
			    End If
			  End If
			  
			End Set
		#tag EndSetter
		Name As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shadow As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ShadowColor As Color
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value < 0 Then
			    Dim ipe As InvalidParameterException
			    ipe.Message = CurrentMethodName + ": Cannot set font size to negative number: " + CStr(Value)
			  End If
			  mSize = value
			End Set
		#tag EndSetter
		Size As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTrueName
			End Get
		#tag EndGetter
		TrueName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Underline As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Bold"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fill"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FillColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ForeColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
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
			Name="Italic"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
			Name="Shadow"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShadowColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Size"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Single"
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
			Name="Underline"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TrueName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
