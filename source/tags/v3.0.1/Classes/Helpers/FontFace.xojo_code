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
		  Dim fc As Integer
		  fc = FontCount-1
		  If fc <> UBound(AvailableFontNames) Then
		    LoadAvailableFonts
		  End If
		  fc = UBound(AvailableFontNames) - 1
		  For i As Integer = 0 To fc
		    If Font(i) = FontName Then
		      Return True
		    End If
		  Next
		  //++
		  // Check for two "pseudo" fonts: System and SmallSystem
		  // These are defined within Xojo as platform-specific GUI fonts
		  //--
		  If fontname = "System" Or fontname = "SmallSystem" Then
		    Return True
		  End If
		  App.DebugWriter.Write "FontFace.IsFontAvailable: Cannot find font named '" + fontname + "'", 3
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub LoadAvailableFonts()
		  //++
		  // Load local cache of font names
		  // Keep a local cache to save overhead of enumerating fonts
		  // from the system every time a font name is set
		  //--
		  Dim fc As Integer
		  fc = FontCount
		  Redim AvailableFontNames(-1)
		  fc = fc - 1
		  For i As Integer = 0 To fc
		    AvailableFontNames.Append Font(i)
		  Next
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OntoGraphics(g As Graphics, zoom As Double = 1.0)
		  g.ForeColor = ForeColor
		  g.TextFont = Name
		  If Not IsFontAvailable(Name) Then
		    g.TextFont = "System"
		  End If
		  'g.TextSize = Round(Size * zoom)
		  g.FontSize = Size * zoom
		  If g.TextSize < 0 Then g.TextSize = 0
		  If g.TextSize = 0 and Not (g.TextFont = "System" or g.TextFont = "SmallSystem") Then
		    g.TextSize = 10
		    app.DebugWriter.Write CurrentMethodName + ": Attempted to set a zero TextSize for font '" + Name + "'"
		  End If
		  g.TextUnit = FontUnits.Pixel
		  g.Bold = Bold
		  g.Italic = Italic
		  g.Underline = Underline
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OntoStringShape(byRef s As StringShape, Zoom As Double = 1.0)
		  //++
		  // updates the properties of a StringShape to reflect the FontFace
		  //
		  // Ed Palmer, 12/05
		  //--
		  
		  s.TextFont = Name
		  s.TextSize = Size * Zoom
		  If s.TextSize < 0 Then s.TextSize = 0
		  If s.TextSize = 0 And Not (Name = "System" Or Name = "SmallSystem") Then
		    s.TextSize = 10
		    app.DebugWriter.Write CurrentMethodName + ": Attempted to set a zero TextSize for font '" + Name + "'"
		  End If
		  s.TextUnit = FontUnits.Pixel
		  s.Bold = Bold
		  s.FillColor = ForeColor
		  s.Italic = Italic
		  s.Underline = Underline
		  
		  if Border Then
		    s.Border = 0
		    s.BorderWidth = 1
		    s.BorderColor = BorderColor
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToCSS(borderWidth As Int8 = 1) As String
		  //++
		  // Convert the FontFace to its CSS equivalent declarations
		  //
		  // Since Border is an attribute of FontFace, but the width of the border is set in the PrintPreferences,
		  // pass this in as an optional parameter
		  //
		  // For the moment, ignores the FillColor attribute.  TODO: Investigate where this is used and if it needs
		  // to be incorporated in this method
		  //
		  // Shadow and ShadowColor are likewise ignored.
		  //--
		  
		  Dim s As String = ""
		  Dim tab As String = "    "
		  Dim fontFamily, fontSize As String
		  
		  // Check for System and SmallSystem and convert to generic sans-serif, else return the font name
		  If Name = "System" Or Name = "SmallSystem" Then fontFamily = "sans-serif" Else fontFamily = Name
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
		  
		  If Border Then
		    s = s + tab + "border: " + CStr(borderWidth) + "px solid " + ColorToCSS(BorderColor) + ";" + EndOfLine
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
		Private mSize As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //++
			  // Verify the font exists in the system
			  // Set to "System" (default font for platform) if it does not
			  //--
			  If Not IsFontAvailable(value) Then
			    mName = "System"
			  Else
			    mName = value
			  End If
			  
			  If mName = "System" Or mName = "SmallSystem" Then
			    If mSize <> 0 Then mSize = 0
			  Else
			    If mSize = 0 Then mSize = 10
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
			  return mSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value < 0 Then
			    Dim ipe As InvalidParameterException
			    ipe.Message = CurrentMethodName + ": Cannot set font size to negative number: " + CStr(Value)
			  End If
			  If mName = "System" Or mName = "SmallSystem" Then
			    If value <> 0 Then value = 0
			  End If
			  mSize = value
			End Set
		#tag EndSetter
		Size As Integer
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
			Name="Size"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
