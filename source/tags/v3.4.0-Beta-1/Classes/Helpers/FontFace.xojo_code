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
		  If g.TextSize = 0 And Not (g.TextFont = "System" Or g.TextFont = "SmallSystem") Then
		    g.TextSize = 10
		    app.DebugWriter.Write CurrentMethodName + ": Attempted to set a zero TextSize for font '" + Name + "'"
		  End If
		  g.FontUnit = FontUnits.Point
		  g.Bold = Bold
		  g.Italic = Italic
		  g.Underline = Underline
		  g.CharacterSpacing = (2 * CType(Border, Integer)) + CType(Shadow, Integer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OntoPDF(pdfDoc As EinhugurPDFWriter.PDFDocument, pdfPage As EinhugurPDFWriter.Page, zoom As Double = 1.0) As EinhugurPDFWriter.Font
		  Dim pdfFontName As String = Me.Name
		  Dim pdfFontExtension As String
		  If Me.Bold Then
		    pdfFontExtension = "Bold"
		  End If
		  If Me.Italic Then
		    If Me.Name = "Times" Then
		      pdfFontExtension = pdfFontExtension + "Italic"
		    Else
		      pdfFontExtension = pdfFontExtension + "Oblique"
		    End If
		  End If
		  If Me.Name = "Times" And pdfFontExtension.Len = 0 Then
		    pdfFontExtension = "Roman"
		  End If
		  If pdfFontExtension.Len > 0 Then
		    pdfFontName = pdfFontName + "-" + pdfFontExtension
		  End If
		  
		  Dim pdfFont As EinhugurPDFWriter.Font = pdfDoc.GetFont(pdfFontName, EinhugurPDFWriter.Font.FontEncodingEnum.Automatic)
		  
		  pdfPage.SetFont(pdfFont, Me.Size * Zoom)
		  pdfPage.TextLeading = pdfPage.SuggestedTextLeading
		  pdfPage.TextRenderingMode = EinhugurPDFWriter.Page.TextRenderingModeEnum.FILL
		  pdfPage.FillColor = Me.FillColor
		  
		  If Me.Border Then
		    pdfPage.TextRenderingMode = EinhugurPDFWriter.Page.TextRenderingModeEnum.FILL_THEN_STROKE
		    pdfPage.StrokeColor = Me.BorderColor
		    pdfPage.LineWidth = Zoom
		  End If
		  
		  Return pdfFont
		End Function
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
		Private mSize As Single
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
			    #If TargetLinux
			      If IsFontAvailable("Noto Sans") Then
			        mName = "Noto Sans"
			      ElseIf IsFontAvailable("Ubuntu") Then
			        mName = "Ubuntu"
			      Else
			        mName = "Sans"
			      End If
			    #Else
			      If IsFontAvailable("Arial") Then
			        mName = "Arial"
			      Else
			        mName = "Times New Roman"
			      End If
			    #EndIf
			  Else
			    mName = value
			  End If
			  
			  'If mName = "System" Or mName = "SmallSystem" Then
			  'If mSize <> 0 Then mSize = 0
			  'Else
			  'If mSize = 0 Then mSize = 10
			  'End If
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
			  If mName = "System" Or mName = "SmallSystem" Then Return 0
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
			Type="Single"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
