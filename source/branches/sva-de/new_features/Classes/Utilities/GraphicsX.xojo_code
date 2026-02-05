#tag Module
Protected Module GraphicsX
	#tag Method, Flags = &h21
		Private Function ApplyTab(g As Graphics, f As FontFace, xx As Integer, width As Integer, leftMargin As Integer, ByRef RestOfLine As String, tabs() As StyleTabsType, ByRef tabIndex As Integer, ByRef lineFragment As String, ByRef lineFragmentX As Integer) As Integer
		  // performs the analysis for handling the tab at just before RestOfLine
		  //
		  // parameters IN
		  // xx             the end position of the previous text
		  // width          the total with for the line
		  // RestOfLine     text to be written at the tab stop and beyond, not including the tab character that caused the call
		  // tabIndex       the tab to consider next
		  // OUT:
		  // lineFragment   the text to be written at LineFragmentX
		  // RestOfLine     what's left without the line Fragment (including the next <tab> or <lf>)
		  // LineFragmentX  the x position at which to write the lineFragment
		  // tabIndex       the index of the next tab to consider, tabs.Count if there are no more to consider
		  
		  // Make sure the fontface is applied to the graphics object first
		  
		  Dim fragEndPos, pos As Integer
		  Dim x As Integer
		  Dim fragWidth As Double
		  Dim leftWidth As Integer
		  Dim spaceWidth As Double = g.TextWidth(" ")
		  Dim myTab As StyleTabsType
		  
		  If tabIndex >= 0 Then
		    x = xx + Round(spaceWidth)  // make sure there is space to text before
		  Else
		    x = xx
		  End If
		  
		  If RestOfLine.IsEmpty Then
		    lineFragment = ""
		    Return 0
		  End If
		  If x > leftMargin + width Then
		    // that is not supposed to happen
		    lineFragment = ""
		    RestOfLine = Chr(10) + RestOfLine
		    lineFragmentX = leftMargin
		    tabIndex = -1
		    Return 0
		  End If
		  
		  fragEndPos = InStrB(1, RestOfLine, Chr(9))
		  pos = InStrB(1, RestOfLine, Chr(10))
		  If pos > 0 And (fragEndPos = 0 Or pos < fragEndPos) Then
		    fragEndPos = pos
		  End If
		  pos = InStrB(1, RestOfLine, Chr(13))
		  If pos > 0 And (fragEndPos = 0 Or pos < fragEndPos) Then
		    fragEndPos = pos
		  End If
		  If fragEndPos = 0 Then fragEndPos = Len(RestOfLine) + 1
		  
		  lineFragment = Left(RestOfLine, fragEndPos - 1)
		  fragWidth = FontFaceWidth(g, lineFragment, f)
		  leftWidth = 0
		  
		  // find the tab position that applies
		  While tabIndex <= tabs.UBound
		    If tabIndex = -1 Then
		      myTab.Position = xx
		      myTab.Align = StyleHAlignEnum.Left
		      Exit
		    Else
		      myTab = tabs(tabIndex)
		      myTab.Position = myTab.Position + leftMargin
		      If myTab.Position >= x Then
		        If myTab.Align = StyleHAlignEnum.Char Then
		          pos = InStr(1, lineFragment, myTab.alignChar)
		          If pos = 0 Then Exit
		          leftWidth = Round(FontFaceWidth(g, Left(lineFragment, pos - 1), f) + 0.5)
		          If x + leftWidth <= myTab.Position Then Exit
		        ElseIf myTab.Align = StyleHAlignEnum.Right Then
		          If x + fragWidth <= myTab.Position Then Exit
		        ElseIf myTab.Align = StyleHAlignEnum.Middle Then
		          If x + fragWidth / 2 <= myTab.Position And x + fragWidth <= width Then Exit
		        Else
		          Exit
		        End If
		      End If
		      tabIndex = tabIndex + 1
		    End If
		  Wend
		  If tabs.UBound < tabIndex Then
		    myTab.Position = x
		    myTab.Align = StyleHAlignEnum.Left
		  Else
		    tabIndex = tabIndex + 1
		  End If
		  
		  // at this point, what is supposed to be placed left of the tab position fits.
		  // on the right we might have to wrap the line
		  // there is only StyleHAlignEnum.Left and StyleHAlignEnum.Char where this can happen
		  Dim wrapWidth As Double = 0.0
		  If myTab.Align = StyleHAlignEnum.Left Then
		    If myTab.Position - leftWidth + fragWidth > leftMargin + width Then
		      wrapWidth = leftMargin + width - myTab.Position
		    End If
		  ElseIf myTab.Align = StyleHAlignEnum.Char Then
		    If myTab.Position + fragWidth - leftWidth > leftMargin + width Then
		      wrapWidth = leftMargin + width - myTab.Position + leftWidth
		    End If
		  End If
		  
		  If wrapWidth > 0 Then
		    // WrapText(lineFragment, wrapWidth, g, f)
		    Dim r As New RegEx
		    Dim m As RegExMatch
		    Dim l, t As String  // line so far, new fragment/token
		    Dim w As Double   // width of the line so far
		    Dim b As Integer  // byte width
		    r.SearchPattern = "(\s*)([^\s-]+)"
		    m = r.Search(lineFragment)
		    fragWidth = 0
		    l = ""
		    b = 0
		    Do Until m = Nil
		      If m.SubExpressionStartB(0) = b Then
		        t = m.SubExpressionString(0)
		      Else
		        t = MidB(lineFragment, b + 1, m.SubExpressionStartB(0) - b)
		      End If
		      w = FontFaceWidth(g, l + t, f)
		      If w < wrapWidth Then
		        b = b + LenB(t)
		        fragWidth = w
		        l = l + t
		      Else
		        Exit
		      End If
		      m = r.Search()
		    Loop
		    If b = 0 Then
		      // we need to split within a word
		      // assume we can split after every character and perform a binary search
		      Dim len, d As Integer
		      Dim wMax As Double = 0
		      Dim lenWMax As Integer = 0
		      len = Len(lineFragment)
		      d = 2
		      while d < len
		        d = d * 2
		      Wend
		      d = d \ 2
		      len = d
		      Do
		        d = d \ 2
		        w = FontFaceWidth(g, Left(lineFragment, len), f)
		        If w <= wrapWidth Then
		          If w > wMax Or len > lenWMax Then
		            wMax = w
		            lenWMax = len
		          End If
		          len = len + d
		        Else
		          len = len - d
		        End If
		      Loop Until d = 0
		      lineFragment = Left(lineFragment, lenWMax)
		      fragWidth = WMax
		    Else
		      lineFragment = l
		    End If
		    RestOfLine = Chr(10) + LTrim(MidB(RestOfLine, LenB(lineFragment) + 1))
		    If Len(RestOfLine) = 1 Then RestOfLine = ""  // if there is no rest, forget about the line break
		  Else
		    RestOfLine = Mid(RestOfLine, fragEndPos + 1)
		  End If
		  
		  // position the tabbed fragment
		  Select Case myTab.Align
		  Case StyleHAlignEnum.Left
		    lineFragmentX = myTab.Position
		  Case StyleHAlignEnum.Right
		    lineFragmentX = myTab.Position - Round(fragWidth + 0.5)
		  Case StyleHAlignEnum.Middle
		    lineFragmentX = myTab.Position - Round((fragWidth / 2) + 0.5)
		  Case StyleHAlignEnum.Char
		    lineFragmentX = myTab.Position - leftWidth
		  End Select
		  
		  Return lineFragmentX + Round(fragWidth) - xx  // width of fragment measured from xx
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function BilinearInterpolation(OriginalPicture As Picture, newWidth As Integer, newHeight As Integer, constrainProportion As Boolean) As Picture
		  //++
		  // Perform a bilinear interpolation of a picture
		  //
		  // Code sample from Beatrix Willius on forum.xojo.com
		  //--
		  Dim w As Integer = OriginalPicture.Width
		  Dim h As Integer = OriginalPicture.Height
		  Dim x_ratio As Double = (w - 1) / newWidth
		  Dim y_ratio As Double = (h - 1) / newHeight
		  If constrainProportion Then
		    If x_ratio >= y_ratio Then
		      newHeight = h / x_ratio
		    Else
		      newWidth = w / y_ratio
		    End If
		    x_ratio = max(x_ratio, y_ratio)
		    y_ratio = max(x_ratio, y_ratio)
		  End If
		  
		  Dim oldSurf As RGBSurface = OriginalPicture.RGBSurface
		  Dim hasAlpha As Boolean = OriginalPicture.HasAlphaChannel
		  Dim oldMask As Picture
		  Dim oldMaskSurf As RGBSurface
		  Dim InterpolatedPicture As Picture
		  Dim InterpolatedMaskSurf As RGBSurface
		  
		  If hasAlpha Then
		    InterpolatedPicture = New Picture(newWidth, newHeight)
		    hasAlpha = hasAlpha AND InterpolatedPicture.HasAlphaChannel
		  End If
		  If Not hasAlpha Then
		    InterpolatedPicture = New Picture(newWidth, newHeight, 32)
		    oldMask = OriginalPicture.CopyMask
		    If oldMask <> Nil Then oldMaskSurf = oldMask.RGBSurface
		    InterpolatedMaskSurf = InterpolatedPicture.Mask.RGBSurface
		  End If
		  Dim InterpolatedSurf As RGBSurface = InterpolatedPicture.RGBSurface
		  
		  Dim x, y As Integer
		  Dim x_diff, y_diff, blue, red, green, gray, alpha As Double
		  Dim a, b, c, d As Color
		  
		  For i As Integer = 0 To (newHeight - 1)
		    For j As Integer = 0 To (newWidth - 1)
		      x = x_ratio * j
		      y = y_ratio * i
		      x_diff = (x_ratio * j) - x
		      y_diff = (y_ratio * i) - y
		      
		      'calculations for red, green and blue
		      a = oldSurf.Pixel(x, y)
		      b = oldSurf.Pixel(x + 1, y)
		      c = oldSurf.Pixel(x, y + 1)
		      d = oldSurf.Pixel(x + 1, y + 1)
		      
		      blue = (a.Blue * (1 - x_diff) * (1 - y_diff)) + (b.Blue * x_diff * (1 - y_diff)) + (c.Blue * y_diff * (1 - x_diff)) + (d.Blue * x_diff * y_diff)
		      green = (a.green * (1 - x_diff) * (1 - y_diff)) + (b.green * x_diff * (1 - y_diff)) + (c.green * y_diff * (1 - x_diff)) + (d.green * x_diff * y_diff)
		      red = (a.red * (1 - x_diff) * (1 - y_diff)) + (b.red * x_diff * (1 - y_diff)) + (c.red * y_diff * (1 - x_diff)) + (d.red * x_diff * y_diff)
		      
		      If hasAlpha Then
		        alpha = (a.Alpha * (1 - x_diff) * (1 - y_diff)) + (b.Alpha * x_diff * (1 - y_diff)) + (c.Alpha * y_diff * (1 - x_diff)) + (d.Alpha * x_diff * y_diff)
		        
		        InterpolatedSurf.Pixel(j, i) = RGB(red, green, blue, alpha)
		      Else
		        InterpolatedSurf.Pixel(j, i) = RGB(red, green, blue)
		      End If
		      
		      If oldMaskSurf <> Nil Then
		        'now the mask
		        a = oldMaskSurf.Pixel(x, y)
		        b = oldMaskSurf.Pixel(x + 1, y)
		        c = oldMaskSurf.Pixel(x, y + 1)
		        d = oldMaskSurf.Pixel(x + 1, y + 1)
		        
		        gray = (a.Blue * (1 - x_diff) * (1 - y_diff)) + (b.Blue * x_diff * (1 - y_diff)) + (c.Blue * y_diff * (1 - x_diff)) + (d.Blue * x_diff * y_diff)
		        
		        InterpolatedMaskSurf.Pixel(j, i) = RGB(gray, gray, gray)
		      End If
		    Next
		    
		  Next
		  
		  Return InterpolatedPicture
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcBorderSize(g As Graphics) As Integer
		  ' Make sure the fontface is applied to the graphics object first
		  Return Max(Round(g.TextHeight * ThicknessFactor / 40), 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcShadowSize(g As Graphics) As Integer
		  ' Make sure the fontface is applied to the graphics object first
		  Return Max(Round(g.TextHeight * ThicknessFactor / 50), 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CurveShapeToPdf(c As CurveShape, pdfDoc As PDFDocument, offsetX As Double, offsetY As Double)
		  If c = Nil Then Return
		  If pdfDoc = Nil Then Return
		  Dim g As Graphics = pdfDoc.Graphics
		  
		  Dim thePath As New GraphicsPath
		  
		  thePath.MoveToPoint(c.X + offsetX, c.Y + offsetY)
		  
		  Select Case c.Order
		  Case 0 // Straight line
		    thePath.AddLineToPoint(c.X2 + offsetX, c.Y2 + offsetY)
		  Case 1 // Single control point
		    thePath.AddQuadraticCurveToPoint(c.ControlX(0) + offsetX, c.ControlY(0) + offsetY, c.X2 + offsetX, c.Y2 + offsetY)
		  Case 2 // Two control points
		    thePath.AddCurveToPoint(c.ControlX(0) + offsetX, c.ControlY(0) + offsetY, _
		    c.ControlX(1) + offsetX, c.ControlY(1) + offsetY, c.X2 + offsetX, c.Y2 + offsetY)
		  End Select
		  
		  g.DrawingColor = c.BorderColor
		  g.PenSize = c.BorderWidth
		  
		  g.DrawPath(thePath)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DarkerColor(oldColor As Color) As Color
		  Return RGB(oldColor.Red/2, oldColor.Green/2, oldColor.Blue/2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine(g As Graphics, thisLine As String, xx As Integer, yy As Integer, font As FontFace)
		  Profiler.BeginProfilerEntry(CurrentMethodName + " '" + thisline + "'" + If(font.Border, " Border", "") + If(font.Shadow, " Shadow", "") + If(font.Fill, " Fill", ""))
		  
		  #If TargetLinux
		    DrawFontSingleLine_pic(g, thisLine, xx, yy, font)
		  #Else
		    If font <> Nil And (font.BorderColor.Alpha <> 0 Or font.ShadowColor.Alpha <> 0) Then
		      DrawFontSingleLine_pic(g, thisLine, xx, yy, font)
		    Else
		      DrawFontSingleLine_draw(g, thisLine, xx, yy, font)
		    End If
		  #EndIf
		  
		  Profiler.EndProfilerEntry
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine_draw(g As Graphics, thisLine As String, xx As Integer, yy As Integer, font As FontFace, drawAsShadow As Boolean = False)
		  Dim dx, dy As Integer
		  Dim b2 As Integer
		  Dim shadowSize, borderSize As Integer = 0
		  Dim borderWidth As Integer  // the same as borderSize but unconditional
		  Dim f As FontFace
		  
		  // drawAsShadow is intended to be set only from within this Sub for drawing shadow to a text with border
		  // it is needed to keep the correct position and CharacterSpacing
		  
		  ' --- Draw decoration ---
		  
		  If font <> Nil Then
		    f = font.Clone
		    
		    f.OntoGraphics g
		    
		    borderWidth = CalcBorderSize(g) 
		    If f.Border Then
		      borderSize = borderWidth
		      xx = xx + borderSize
		    End If
		    
		    If drawAsShadow Then
		      f.ForeColor = f.ShadowColor
		      f.BorderColor = f.ShadowColor
		      f.Fill = False
		      f.Shadow = False
		    End If
		    
		    If f.Fill Then
		      g.ForeColor = f.FillColor
		      g.FillRect xx - borderWidth, yy - FontFaceAscent(g, f), FontFaceWidth(g, thisLine, f) + 2 * borderWidth, FontFaceHeight(g, f)
		    End If
		    
		    If f.Shadow Then
		      shadowSize = CalcShadowSize(g)
		      If f.Border Then
		        Call DrawFontSingleLine_draw(g, thisLine, xx - borderSize + shadowSize, yy + shadowSize, f, True)
		      Else
		        g.ForeColor = f.ShadowColor
		        g.DrawString thisLine, xx + shadowSize, yy + shadowSize
		      End If
		    End If
		    
		    If f.Border Then
		      g.ForeColor = f.BorderColor
		      
		      dy = -borderSize
		      b2 = borderSize \ 2
		      'Sides
		      For dx = -b2 To b2
		        g.DrawString thisLine, xx+dx, yy-borderSize ' Top
		        g.DrawString thisLine, xx+dx, yy+borderSize ' Bottom
		        g.DrawString thisLine, xx-borderSize, yy+dx ' Left
		        g.DrawString thisLine, xx+borderSize, yy+dx ' Right
		      Next
		      'Corners
		      dy = -borderSize+1
		      For dx = b2+1 To borderSize-1
		        g.DrawString thisLine, xx+dx, yy+dy ' Top-Left
		        g.DrawString thisLine, xx+dx, yy-dy ' Bottom-Left
		        g.DrawString thisLine, xx-dx, yy+dy ' Top-Right
		        g.DrawString thisLine, xx-dx, yy-dy ' Bottom-Right
		        dy = dy + 1
		      Next
		    End If
		  End If
		  
		  '--- Draw string ---
		  If f <> Nil Then g.ForeColor = f.ForeColor
		  g.DrawString thisLine, xx, yy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine_pic(g As Graphics, thisLine As String, xx As Integer, yy As Integer, f As FontFace)
		  // alternative Blit version
		  //
		  // create a transparent pic and draw the text in border color onto it
		  // create a second transparent pic and draw the first pic multiple times onto it to form the shape of the text with border
		  // draw the text in foreground color onto this pic
		  // if shadow
		  //   create a third transparent picture and fill it with the shadow color
		  //   create a mask from the alpha channel of the 2nd pic and apply this mask to the alpha channel of the 3rd one (cutting out of the plane the shape of the shadow)
		  //   draw the 3rd pic onto the window moved to where the shadow should be
		  // draw the 2nd pic onto the window
		  // if transparency is involved, more work is to be done in order to get border and shadow each with the specified transparency
		  
		  Dim dx, dy As Integer
		  Dim shadowSize, borderSize As Integer = 0
		  Dim textAscent, textWidth, textHeight As Integer
		  Dim lineHeight As Integer  // always based on g, not the Graphics of any pic. Ensures Fill does not overlap, which matters if it is transparent
		  Dim borderWidth As Integer  // the same as borderSize but unconditional
		  
		  // --- Draw decoration ---
		  
		  If f <> Nil Then
		    f.OntoGraphics g
		    
		    borderWidth = CalcBorderSize(g)
		    If f.Border Then borderSize = borderWidth
		    If f.Shadow Then shadowSize = CalcShadowSize(g)
		    textAscent = FontFaceAscent(g, f)
		    textWidth = FontFaceWidth(g, thisLine, f)
		    textHeight = FontFaceHeight(g, f)
		    lineHeight = textHeight
		    
		    If f.Border Then
		      Dim textPic, borderPic, shadowPic As Picture
		      Dim gg As Graphics
		      Dim x, y, picWidth, picHeight As Integer
		      
		      // choose a size to accomodate the text. It might not be confined to FontfaceHeight and FontFaceWidth, so add some margin
		      picWidth = textWidth + 4 * textHeight
		      picHeight = 2 * textHeight
		      
		      // render the text as a template
		      // if the text font has transparency, that transparency is ignored here
		      // also the border is first drawn fully opaque. Transparency is added later, so it is uniform.
		      // otherwise it would be not as expected, as we draw multiple times over the same spot
		      textPic = New Picture(picWidth, picHeight)
		      gg = textPic.Graphics
		      f.OntoGraphics gg
		      
		      // these values may vary depending on g - therefore they are called here again with the picture's Graphics
		      If f.Shadow Then shadowSize = CalcShadowSize(gg)
		      If f.Border Then borderSize = CalcBorderSize(gg)
		      textAscent = FontFaceAscent(gg, f)
		      textWidth = FontFaceWidth(gg, thisLine, f)
		      textHeight = FontFaceHeight(gg, f)
		      xx = xx + borderSize
		      
		      picWidth = textWidth + 4 * textHeight
		      picHeight = 2 * textHeight
		      x = 2 * textHeight
		      y = 2 * textAscent
		      
		      If picWidth <> textPic.Width Or picHeight <> textPic.Height Then
		        // allocate a new one
		        textPic = New Picture(picWidth, picHeight)
		        gg = textPic.Graphics
		        f.OntoGraphics gg
		      End If
		      
		      If f.Fill Then
		        g.ForeColor = f.FillColor
		        g.FillRect xx - borderWidth, yy - textAscent, textWidth + 2 * borderWidth, lineHeight
		      End If
		      
		      gg.ForeColor = RGB(f.BorderColor.Red, f.BorderColor.Green, f.BorderColor.Blue)
		      gg.DrawString thisLine, x, y
		      
		      // create a mask for the border
		      borderPic = New Picture(picWidth, picHeight)
		      gg = borderPic.Graphics
		      
		      Dim b2 As Integer = borderSize \ 2
		      // sides
		      For dx = -b2 To b2
		        gg.DrawPicture textPic,  dx, -borderSize  // Top
		        gg.DrawPicture textPic,  dx,  borderSize  // Bottom
		        gg.DrawPicture textPic, -borderSize,  dx  // Left
		        gg.DrawPicture textPic,  borderSize,  dx  // Right
		      Next
		      // corners (bevel)
		      dy = -borderSize+1
		      For dx = b2+1 To borderSize-1
		        gg.DrawPicture textPic,  dx,  dy  // Top-Left
		        gg.DrawPicture textPic,  dx, -dy  // Bottom-Left
		        gg.DrawPicture textPic, -dx,  dy  // Top-Right
		        gg.DrawPicture textPic, -dx, -dy  // Bottom-Right
		        dy = dy + 1
		      Next
		      
		      Dim borderMask As Picture
		      Dim debuggerMask As Picture
		      If f.BorderColor.Alpha <> 0 Or f.Shadow Then
		        borderMask = borderPic.CopyMask
		        If f.BorderColor.Alpha <> 0 Then
		          borderMask = New Picture(picWidth, picHeight, 8)
		          gg = borderMask.Graphics
		          gg.ForeColor = HSV(0, 0, f.BorderColor.Alpha / 255)
		          gg.FillRectangle(0, 0, picWidth, picHeight)
		          debuggerMask = borderPic.CopyMask
		          borderMask.ApplyMask(borderPic.CopyMask)
		        End If
		      End If
		      
		      If f.Shadow Then
		        // shadow is just the border moved and in ShadowColor
		        // i.e. the shadow covers the full area of each glyph, not just it's outside
		        // the shadow is not affected by any transparency in border or text
		        shadowPic = New Picture(picWidth, picHeight, 8)
		        Dim shadowMask As Picture = borderPic.CopyMask
		        If f.ShadowColor.Alpha <> 0 Then
		          gg = shadowMask.Graphics
		          gg.ForeColor = HSV(0, 0, f.ShadowColor.Alpha / 255)
		          gg.FillRectangle(0, 0, picWidth, picHeight)
		          debuggerMask = borderPic.CopyMask
		          shadowMask.ApplyMask(borderPic.CopyMask)
		        End If
		        gg = shadowPic.Graphics
		        gg.ForeColor = f.ShadowColor
		        gg.FillRect(0, 0, picWidth, picHeight)
		        shadowPic.ApplyMask(shadowMask)
		        debuggerMask = shadowPic.CopyMask
		        
		        g.DrawPicture shadowPic, xx-x+shadowSize, yy-y+shadowSize  // shadow
		      End If
		      
		      // make the border transparent if needed
		      If f.BorderColor.Alpha <> 0 Then
		        'borderPic.ApplyMask(borderMask)  // this does not work 
		        gg = debuggerMask.Graphics
		        gg.DrawPicture(borderPic, 0, 0)
		        debuggerMask.ApplyMask(borderMask)
		        'borderPic = debuggerMask
		        gg = borderPic.Graphics
		        gg.ClearRect(0, 0, picWidth, picHeight)
		        gg.DrawPicture(debuggerMask, 0, 0)
		        
		        // the text needs to be drawn with the same graphics context as above
		        // otherwise it might be drawn differently
		        // text with transparency
		        gg = textPic.Graphics
		        gg.ClearRect(0, 0, picWidth, picHeight)
		        f.OntoGraphics(gg)
		        gg.ForeColor = f.ForeColor
		        gg.DrawString(thisLine, x, y)
		        debuggerMask = textPic.CopyMask
		        
		        gg = borderPic.Graphics
		        gg.DrawPicture(textPic, 0, 0)
		        debuggerMask = borderPic.CopyMask
		      Else
		        gg = borderPic.Graphics
		        f.OntoGraphics(gg)
		        gg.ForeColor = f.ForeColor
		        gg.DrawString(thisLine, x, y)
		      End If
		      
		      g.DrawPicture borderPic, xx-x, yy-y  // border
		      
		    Else
		      xx = xx + borderSize
		      
		      If f.Fill Then
		        g.ForeColor = f.FillColor
		        g.FillRect xx - borderWidth, yy - textAscent, textWidth + 2 * borderWidth, lineHeight
		      End If
		      
		      If f.Shadow Then
		        // the shadow is not affected by any transparency in the text
		        g.ForeColor = f.ShadowColor
		        g.DrawString thisLine, xx + shadowSize, yy + shadowSize
		      End If
		    End If
		    
		  End
		  
		  // --- Draw string ---
		  If f <> Nil Then g.ForeColor = f.ForeColor
		  If Not f.Border Then g.DrawString thisLine, xx, yy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawFontString(g As Graphics, str As String, x As Integer, y As Integer, f As FontFace, width As Integer = 0, align As String = "left", height As Integer = 0, valign As String = "top", tabs() As StyleTabsType = Nil, insertAfterBreak As string = "") As Integer
		  Profiler.BeginProfilerEntry "DrawFontString (" + str + ")"
		  Dim xx, yy, i As Integer
		  Dim lineCount, lineHeight, lineAscent, thisWidth As Integer
		  Dim thisLine, thisChar As String
		  Dim hasTabs As Boolean
		  Dim tabCount As Integer
		  
		  If ThicknessFactor <= 0 Then ThicknessFactor = 1
		  If align <> "left" Then insertAfterBreak = insertAfterBreak.LTrim
		  
		  If f <> Nil Then
		    f.OntoGraphics g
		  End If
		  
		  lineHeight = FontFaceHeight(g, f)
		  lineAscent = FontFaceAscent(g, f)
		  
		  hasTabs = False
		  If Not IsNull(tabs) then
		    If UBound(tabs) > -1 Then
		      If InStr(str, Chr(9)) > 0 Then
		        hasTabs = True
		      End If
		    End If
		  End If
		  
		  str = str.ReplaceLineEndings(EndOfLine.LF)
		  
		  If width > 0 Then
		    // wrap
		    If hasTabs And align = "left" Then
		      // using tabs
		      Dim restOfLine, lineFragment As String
		      Dim sol, eol As Integer
		      Dim TabIndex As Integer
		      Dim linePartX As Integer
		      
		      sol = 1
		      Do
		        eol = InStr(sol, str, Chr(10))
		        If eol = 0 Then
		          restOfLine = Mid(Str, sol)
		        Else
		          restOfLine = Mid(Str, sol, eol - sol)
		        End If
		        xx = x
		        i = sol
		        TabIndex = -1
		        While Not restOfLine.IsEmpty
		          thisWidth = ApplyTab(g, f, xx, width, x, restOfLine, tabs(), TabIndex, lineFragment, linePartX)
		          xx = xx + thisWidth
		          i = i + Len(lineFragment)
		          If restOfLine.Left(1) = Chr(10) Then
		            // insert the LF into str
		            i = InStr(i, str, Mid(restOfLine, 2))
		            If i = 0 Then Break
		            If eol <> 0 Then
		              restOfLine = restOfLine + Mid(str, eol)
		            End If
		            str = RTrim(Left(str, i-1))
		            sol = Len(str) + 1
		            eol = sol
		            str = str + restOfLine
		            Exit
		          Else
		            i = InStr(i, str, restOfLine)
		            If i = 0 Then Break
		          End If
		        Wend
		        sol = eol + 1
		      Loop Until eol = 0
		    Else
		      // wrap disregarding tabs (there are no default tab positions and tabs are applied only with align "left")
		      str = str.ReplaceAllBytes(&u9, " ")  // with align "left" but no tabs() StringWidth might do something unexpected with tab characters
		      xx = 1
		      yy = 1
		      thisWidth = 0
		      If InStr(str, Chr(10)) > 0 Or g.StringWidth(str) > width then
		        While yy <= Len(str)  // loop through the string
		          thisChar = Mid(str, yy, 1)
		          thisWidth = g.StringWidth(Mid(str, xx, yy-xx+1))
		          If thisChar = Chr(10) Then
		            xx = yy + 1
		            yy = yy + 1
		            thisWidth = 0
		          ElseIf thisWidth > width Then  // if we get longer than the width ...
		            i = yy  // remember yy in case we can't find a space
		            While yy > xx And thisChar <> " "  // we need to backup to a space
		              yy = yy - 1
		              thisChar = Mid(str, yy, 1)
		            Wend
		            If yy <= xx Then yy = i  // we didn't find a space; go back where we were and split there; ugly, but we have to.
		            xx = str.Left(yy-1).RTrim.Len
		            str = str.Left(xx) + Chr(10) + insertAfterBreak + str.Mid(yy).LTrim
		            xx = xx + 1
		            yy = xx
		            thisWidth = 0
		          End If
		          yy = yy + 1
		        Wend
		      End If
		    End If
		  End If
		  
		  lineCount = CountFields(str, Chr(10))
		  For i = 1 To lineCount
		    thisLine = NthField(str, Chr(10), i)
		    
		    If valign = "bottom" Then
		      yy = y + height - lineHeight*(lineCount-(i-1)) + lineAscent
		    ElseIf valign = "middle" Then
		      yy = y + ((height - (lineHeight*lineCount)) \ 2) + lineHeight * (i-1) + lineAscent
		    Else  // top?
		      yy = y + lineAscent + lineHeight * (i-1)
		    End If
		    
		    tabCount = CountFields(thisLine, Chr(9)) - 1
		    If tabCount > 0 And hasTabs And align = "left" Then
		      
		      Dim lineFragment, restOfLine As String
		      Dim lastTabIdx As Integer
		      Dim linePartX As Integer
		      Dim endOfTextX As Integer
		      
		      restOfLine = thisLine
		      xx = x
		      lastTabIdx = -1
		      endOfTextX = -1
		      
		      While restOfLine <> ""
		        
		        thisWidth = ApplyTab(g, f, xx, width, x, restOfLine, tabs, lastTabIdx, lineFragment, linePartX)
		        
		        If lineFragment <> "" Then
		          If f.Fill And linePartX > endOfTextX And endOfTextX >= 0 Then
		            // fill the gap
		            g.ForeColor = f.FillColor
		            g.FillRect endOfTextX, yy-FontFaceAscent(g, f),  linePartX - endOfTextX, FontFaceHeight(g, f)
		          End If
		          endOfTextX = xx + thisWidth
		          
		          DrawFontSingleLine(g, lineFragment, linePartX, yy, f)
		        End If
		        xx = xx + thisWidth
		        
		      Wend
		      
		    Else
		      If tabCount > 0 Then
		        thisLine = ReplaceAll(thisLine, Chr(9), " ")
		      End If
		      
		      // --- Setup horizontal position ---
		      If align = "center" Then
		        thisWidth = FontFaceWidth(g, thisLine, f)
		        xx = x + (width - thisWidth) \ 2
		      ElseIf align = "right" Then
		        thisWidth = FontFaceWidth(g, thisLine, f)
		        xx = x + width - thisWidth
		      Else  // left?
		        xx = x
		      End If
		      
		      DrawFontSingleLine(g, thisLine, xx, yy, f)
		    End If
		    
		  Next i
		  Profiler.EndProfilerEntry
		  
		  If lineCount = 0 Then lineCount = 1
		  If valign = "middle" Then
		    Return height
		  Else
		    Return lineHeight * lineCount
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawFontString(g As Graphics, str As String, x As Integer, y As Integer, f As FontFace, borderSize As Integer, headerSize As Integer, footerSize As Integer, margins As StyleMarginType, width As Integer, align As String, height As Integer, valign As String, tabs() As StyleTabsType = Nil, insertAfterBreak As string = "") As Integer
		  Dim drawHeight As Integer
		  
		  If x < margins.Left Then
		    x = margins.Left
		  End If
		  If y < margins.Top Then
		    y = margins.Top
		  End If
		  If width > g.Width - x - margins.Right Then
		    width = g.Width - x - margins.Right
		  End If
		  If height > g.Height - y - margins.Bottom Then
		    height = g.Height - y - margins.Bottom
		  End If
		  
		  drawHeight = DrawFontString(g, _
		  str, _
		  x + borderSize, _
		  y + borderSize + headerSize, _
		  f, _
		  width - (borderSize * 2), _
		  align, _
		  height - (borderSize * 2) - headerSize - footerSize, _
		  valign, _
		  tabs, insertAfterBreak)
		  
		  If valign = "top" Then
		    drawHeight = drawHeight
		  ElseIf valign = "bottom" Then
		    drawHeight = drawHeight
		  End If
		  
		  Return DrawHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawFontStringV(g As Graphics, str As String, x As Double, y As Double, f As FontFace, width As Double = 0, zoom As Double = 1, ByRef Page As Group2D, align As String = "left", height As Double = 0, valign As String = "top", insertAfterBreak As String = "") As Double
		  // Vector graphics version
		  // x, y is top left of bounding box if valign = "top"
		  // x, y is left center of bounding box (half the text is above, half below) if valign = "middle"
		  // x, y is bottom left of bounding box if valign = "bottom"
		  
		  Profiler.BeginProfilerEntry "DrawFontString (" + str + ")"
		  Dim dx, dy, xx, yy, i As Double
		  Dim lineCount As Integer
		  Dim lineHeight, lineAscent, thisWidth As Double
		  Dim thisLine, thisChar As String
		  Dim shadowFace As FontFace
		  Dim shadowSize, borderSize As Double
		  Dim Strings As New Group2D
		  Dim r As RectShape
		  Dim tempFont As FontFace
		  Dim h As Double
		  
		  If ThicknessFactor <= 0 Then ThicknessFactor = 1
		  If align <> "left" Then insertAfterBreak = insertAfterBreak.LTrim
		  Const amp = 20  // amplification factor
		  
		  If f = Nil Then App.DebugWriter.Write CurrentMethodName + " called with Nil FontFace"
		  If f = Nil And g.TextFont <> "" Then
		    App.DebugWriter.Write CurrentMethodName + ": a basic font has been constructed fom Graphics" 
		    f = New FontFace
		    f.Name = g.TextFont
		    f.Size = g.TextSize
		    f.ForeColor = g.ForeColor
		  End If
		  If f <> Nil Then
		    f.OntoGraphics g, zoom * amp
		    If f.Shadow Then shadowSize = CalcShadowSize(g) / amp
		    If f.Border Then borderSize = CalcBorderSize(g) / amp
		    lineHeight = FontFaceHeight(g, f) / amp
		    lineAscent = FontFaceAscent(g, f) / amp
		    g.TextSize = f.Size * zoom  // undo the amplification
		    If f.Border And f.Shadow Then
		      shadowFace = f.Clone
		      shadowFace.ForeColor = shadowFace.ShadowColor
		      shadowFace.BorderColor = shadowFace.ShadowColor
		      shadowFace.Fill = False
		      shadowFace.Shadow = False
		    End If
		  Else
		    lineHeight = FontFaceHeight(g, f)
		    lineAscent = FontFaceAscent(g, f)
		  End If
		  
		  If width > 0 Then
		    ' wrap
		    xx = 1
		    yy = 1
		    thisWidth = 0
		    While yy <= Len(str) ' loop through the string
		      thisChar = Mid(str, yy, 1)
		      thisWidth = FontFaceWidth(g, Mid(str, xx, yy - xx + 1), f, amp)
		      If thisChar = Chr(10) Or thisChar = Chr(13) Then // New line, reset width and move on
		        xx = yy + 1
		        yy = yy + 1
		        thisWidth = 0
		      ElseIf thisWidth > width Then ' if we get longer than the width...
		        i = yy ' remember yy in case we can't find a space
		        While yy > xx And thisChar <> " " ' we need to backup to a space
		          yy = yy - 1
		          thisChar = Mid(str, yy, 1)
		        Wend
		        If yy <= xx Then yy = i ' we didn't find a space; go back where we were and split there; ugly, but we have to.
		        xx = str.Left(yy-1).RTrim.Len
		        str = str.Left(xx) + Chr(10) + insertAfterBreak + str.Mid(yy).LTrim
		        xx = xx + 1
		        yy = xx
		        thisWidth = 0
		      End If
		      yy = yy + 1
		    Wend
		  End If
		  
		  lineCount = CountFields(str, Chr(10))
		  
		  // in placement consider border, but not shadow
		  Dim hTextAlign, vTextAlign As StringShape.Alignment
		  Select Case align
		  Case "left"
		    hTextAlign = StringShape.Alignment.Left
		    xx = x + borderSize
		  Case "center"
		    hTextAlign = StringShape.Alignment.Center
		    xx = x + width / 2
		  Case "right"
		    hTextAlign = StringShape.Alignment.Right
		    xx = x + width - borderSize
		  End Select
		  Select Case valign
		  Case "top"
		    vTextAlign = StringShape.Alignment.Top
		    yy = y + borderSize
		  Case "middle"
		    vTextAlign = StringShape.Alignment.Top
		    yy = y + height / 2 - lineCount / 2 * lineHeight
		  Case "bottom"
		    vTextAlign = StringShape.Alignment.Bottom
		    yy = y + height - (lineCount - 1) * lineHeight - borderSize
		  End Select
		  
		  For i = 1 To lineCount
		    thisLine = NthField(str, Chr(10), i)
		    
		    ' --- Draw decoration ---
		    
		    If f <> Nil Then
		      
		      If f.Fill Then
		        r = New RectShape
		        r.FillColor = f.FillColor
		        r.Fill = 100
		        r.Height = lineHeight
		        r.Width = FontFaceWidth(g, thisline, f)
		        Select Case align
		        Case "left"
		          r.X = xx + r.Width / 2
		        Case "center"
		          r.X = xx + shadowSize / 2
		        Case "right"
		          r.X = xx - r.Width / 2 - shadowSize / 2
		        End Select
		        Select Case valign
		        Case "top"
		          r.Y = yy + r.Height / 2
		        Case "middle"
		          r.Y = yy + r.Height / 2
		        Case "bottom"
		          r.Y = yy - r.Height / 2
		        End Select
		        strings.Append r
		      End If
		      
		      If f.Shadow Then
		        If f.Border Then
		          Call DrawFontStringV g, thisLine, xx + shadowSize, yy + shadowSize, shadowFace, width, zoom, Strings, align, height, valign
		        Else
		          tempFont = f.Clone
		          tempFont.ForeColor = f.ShadowColor
		          strings.Append DrawStringShapeV(thisLine, xx + shadowSize, yy + shadowSize, tempFont, zoom, hTextAlign, vTextAlign)
		        End If
		      End If
		      
		      If f.Border Then
		        tempFont = f.Clone
		        tempFont.ForeColor = f.BorderColor
		        Dim borderSizeInt, b2 As Integer
		        borderSizeInt = Max(borderSize, 1)
		        dy = -borderSizeInt
		        b2 = borderSizeInt \ 2
		        'Sides
		        For dx = -b2 To b2
		          Strings.Append DrawStringShapeV(thisLine, xx+dx, yy-borderSize, tempFont, zoom, hTextAlign, vTextAlign) ' Top
		          Strings.Append DrawStringShapeV(thisLine, xx+dx, yy+borderSize, tempFont, zoom, hTextAlign, vTextAlign) ' Bottom
		          Strings.Append DrawStringShapeV(thisLine, xx-borderSize, yy+dx, tempFont, zoom, hTextAlign, vTextAlign) ' Left
		          Strings.Append DrawStringShapeV(thisLine, xx+borderSize, yy+dx, tempFont, zoom, hTextAlign, vTextAlign) 'Right
		        Next
		        'Corners
		        dy = -borderSizeInt + 1
		        For dx = b2+1 To borderSizeInt-1
		          Strings.Append DrawStringShapeV(thisLine, xx+dx, yy+dy, tempFont, zoom, hTextAlign, vTextAlign) 'Top-Left
		          Strings.Append DrawStringShapeV(thisLine, xx+dx, yy-dy, tempFont, zoom, hTextAlign, vTextAlign) 'Bottom-Left
		          Strings.Append DrawStringShapeV(thisLine, xx-dx, yy+dy, tempFont, zoom, hTextAlign, vTextAlign) 'Top-Right
		          Strings.Append DrawStringShapeV(thisLine, xx-dx, yy-dy, tempFont, zoom, hTextAlign, vTextAlign) 'Bottom-Right
		          dy = dy + 1
		        Next
		      End If
		    End If
		    
		    '--- Draw string ---
		    
		    If f <> Nil Then
		      Strings.Append DrawStringShapeV(thisLine, xx, yy, f, zoom, hTextAlign, vTextAlign)
		      yy = yy + lineHeight
		    End If
		  Next i
		  Profiler.EndProfilerEntry
		  
		  If lineCount = 0 Then lineCount = 1
		  Page.Append Strings
		  h = lineHeight * lineCount
		  If valign = "middle" Then
		    h = Max(height, (h + height) / 2)  // that's how far down we came (height/ until y, h/2 from there 
		  End If
		  'App.DebugWriter.Write "GraphicsX.DrawFontString: Returning height " + str(h)
		  Return h
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DrawLineV(x As Double, y As Double, x2 As Double, y2 As Double, c As color, width As Double) As CurveShape
		  Dim line As New CurveShape
		  line.x = x
		  line.y = y
		  line.x2 = x2
		  line.y2 = y2
		  line.BorderColor = c
		  line.BorderWidth = width
		  Return line
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DrawRectV(x As Double, y As Double, width As Double, Height As Double, c As Color, borderwidth As Double) As RectShape
		  Dim rect As New RectShape
		  rect.x = x
		  rect.y = y
		  rect.Width = width
		  rect.Height = Height
		  rect.BorderColor = c
		  rect.Border = 100
		  rect.Fill = 0
		  rect.BorderWidth = borderwidth
		  Return rect
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DrawStringShapeV(text As String, X As Double, Y As Double, f As Fontface, zoom As Double, hAlign As StringShape.Alignment = StringShape.Alignment.Center, vAlign As StringShape.Alignment = StringShape.Alignment.BaseLine) As StringShape
		  //
		  // Just to save some typing along the way with all the StringShapes being done in DrawFontString
		  //
		  
		  Dim s As New StringShape
		  
		  f.OntoStringShape s, zoom
		  s.x = X
		  s.y = Y
		  s.Text = text
		  s.HorizontalAlignment = hAlign
		  s.VerticalAlignment = vAlign
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DumpCurveShape(c As CurveShape)
		  Dim s As String = CurrentMethodName + ": Curve Shape with " + EndOfLine
		  s = s + " FillColor " + c.FillColor.ToString + " and (X, Y) + (X2, Y2) = (" + c.x.ToString + ", " + c.y.ToString + "), ("
		  s = s + c.x2.ToString + ", " + c.y2.ToString + ") and Scale " + c.Scale.ToString
		  
		  Select Case c.Order
		  Case 0
		    //Nothing to do, straight line
		  Case 1
		    s = s + EndOfLine + "Control Point: (" + c.Controlx(0).ToString + ", " + c.ControlY(0).ToString + ")"
		  Case 2
		    s = s + EndOfLine + "Control Points: (" + c.ControlX(0).ToString + ", " +c.ControlY(0).ToString + "), ("
		    s = s + c.ControlX(1).ToString + ", " + c.ControlY(1).ToString + ")"
		  End Select
		  
		  App.DebugWriter.Write s, 10
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DumpGroup2D(o As Group2D)
		  //++
		  // Debugging helper. An Object2D is opaque in the debugger, so this will
		  // dump the structure to the debug log
		  //--
		  
		  If o = Nil Then Return
		  
		  Dim s As String = "+++Group2D: Object Count " + o.Count.ToString + ", Scale = " + o.Scale.ToString + ", Position = " + o.X.ToString + ", " + o.Y.toString
		  App.DebugWriter.Write s, 10
		  
		  For i As Integer = 0 To o.Count - 1
		    DumpObject2D(o.Item(i))
		  Next i
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DumpObject2D(o As Object2D)
		  If o = Nil Then Return
		  
		  Select Case o
		    
		  Case IsA CurveShape
		    DumpCurveShape(CurveShape(o))
		    
		  Case IsA RectShape
		    DumpRectShape(RectShape(o))
		    
		  Case IsA RoundRectShape
		    DumpRoundRectShape(RoundRectShape(o))
		    
		  Case IsA StringShape
		    DumpStringShape(StringShape(o))
		    
		  Case IsA TextShape
		    DumpTextShape(TextShape(o))
		    
		  Case IsA Group2D
		    DumpGroup2D(Group2D(o))
		    
		  Case Else
		    App.DebugWriter.Write CurrentMethodName + ": I'm baffled by this Object2D " + Introspection.GetType(o).Name
		    
		  End Select
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DumpRectShape(r As RectShape)
		  If r IsA RoundRectShape Then
		    DumpRoundRectShape(RoundRectShape(r))
		  Else
		    Dim s As String = CurrentMethodName + ": FillColor " + r.FillColor.ToString + ", BorderColor " + r.BorderColor.ToString
		    s = s + "  BorderWidth = " + r.BorderWidth.ToString + EndOfLine
		    s = s + "  Dimensions (x, y, w, h) = " + r.X.ToString + ", " + r.y.ToString + ", " + r.Width.ToString + ", " + r.Height.ToString + EndOfLine
		    s = s + "  Scale = " + r.Scale.ToString
		    
		    App.DebugWriter.Write s, 10
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DumpRoundRectShape(r As RoundRectShape)
		  Dim s As String = CurrentMethodName + ": FillColor " + r.FillColor.ToString + ", BorderColor " + r.BorderColor.ToString
		  s = s + "  BorderWidth = " + r.BorderWidth.ToString + ", CornerWidth, CornerHeight " + r.CornerWidth.ToString + ", " + r.CornerHeight.ToString + EndOfLine
		  s = s + "  Dimensions (x, y, w, h) = " + r.X.ToString + ", " + r.y.ToString + ", " + r.Width.ToString + ", " + r.Height.ToString + EndOfLine
		  s = s + "  Scale = " + r.Scale.ToString
		  
		  App.DebugWriter.Write s, 10
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DumpStringShape(s As StringShape)
		  Dim d As String = CurrentMethodName + ": "
		  d = d + "X, Y, Scale = " + s.x.ToString + ", " + s.y.ToString + ", " + s.Scale.ToString
		  d = d + " FillColor " + s.FillColor.ToString + EndOfLine
		  d = d + "TextFont " + s.TextFont + " Size " + s.TextSize.ToString + " Alignment " 
		  
		  Select Case s.HorizontalAlignment
		  Case StringShape.Alignment.Left
		    d = d + "Left, "
		  Case StringShape.Alignment.Right
		    d  = d + "Right, "
		  Case StringShape.Alignment.Center
		    d = d + "Center, "
		  End Select
		  
		  Select Case s.VerticalAlignment
		  Case StringShape.Alignment.Top
		    d = d + "Top"
		  Case StringShape.Alignment.BaseLine
		    d = d + "BaseLine"
		  Case StringShape.Alignment.Bottom
		    d = d + "Bottom"
		  End Select
		  
		  d = d + EndOfLine  + "Text: '" + s.Text + "'"
		  
		  App.DebugWriter.Write d, 10
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DumpTextShape(s As TextShape)
		  Dim d As String = CurrentMethodName + ": "
		  d = d + "X, Y, Scale = " + s.x.ToString + ", " + s.y.ToString + ", " + s.Scale.ToString
		  d = d + " FillColor " + s.FillColor.ToString + EndOfLine
		  d = d + "FontName " + s.FontName + " Size " + s.FontSize.ToString + " Alignment " 
		  
		  Select Case s.HorizontalAlignment
		  Case TextShape.Alignment.Left
		    d = d + "Left, "
		  Case TextShape.Alignment.Right
		    d = d + "Right, "
		  Case TextShape.Alignment.Center
		    d = d + "Center, "
		  End Select
		  
		  Select Case s.VerticalAlignment
		  Case TextShape.Alignment.Top
		    d = d + "Top"
		  Case TextShape.Alignment.BaseLine
		    d = d + "BaseLine"
		  Case TextShape.Alignment.Bottom
		    d = d + "Bottom"
		  End Select
		  
		  d = d + EndOfLine + "Text: '" + s.Text + "'"
		  
		  App.DebugWriter.Write d, 10
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontFaceAscent(g As Graphics, f As FontFace) As Double
		  ' Make sure the fontface is applied to the graphics object first
		  Dim height As Integer = g.TextAscent
		  If f = Nil Then Return height
		  If f.Border Then height = height + CalcBorderSize(g)
		  Return height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontFaceHeight(g As Graphics, f As FontFace) As Double
		  ' Make sure the fontface is applied to the graphics object first
		  Dim height As Integer = g.TextHeight
		  If f = Nil Then Return height
		  If f.Border Then height = height + 2 * CalcBorderSize(g)
		  If f.Shadow Then height = height + CalcShadowSize(g)
		  Return height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontFaceLineWidth(g As Graphics, thisLine As String, f As FontFace, tabs() As StyleTabsType, Amp As Double = 1) As Double
		  ' Make sure the fontface is applied to the graphics object first
		  If tabs = Nil Or tabs.UBound = -1 Then
		    thisLine = thisLine.ReplaceAll(&u9, " ")
		    Return FontFaceWidth(g, thisLine, f, Amp)
		    
		  Else
		    Dim lineWidth As Double = 0
		    Dim thisWidth As Double
		    Dim remainingLine As String = thisLine
		    Dim linePart As String
		    Dim tabIndex As Integer = -1
		    Dim x As Integer
		    
		    While remainingLine <> "" And remainingLine.Left(1) <> Chr(10)
		      thisWidth = ApplyTab(g, f, lineWidth, 32000, 0, remainingLine, tabs, tabIndex, linePart, x)
		      lineWidth = lineWidth + thisWidth
		    Wend
		    
		    If f.Italic Then
		      // only the width of the baseline is calculated. Add room for slanted character on the right
		      lineWidth = lineWidth + Round(FontFaceAscent(g, f) / 4)
		    End If
		    Return lineWidth
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontFaceWidth(g As Graphics, str As String, f As FontFace, Amp As Double  = 1) As Double
		  ' Make sure the fontface is applied to the graphics object first
		  Dim g2 As Graphics
		  Dim width As Double
		  
		  g2 = g.Clip(0, 0, g.Width, g.Height)
		  g2.TextSize = g2.TextSize * Amp
		  width = g2.StringWidth(str)
		  if width = 0 then return 0
		  If f <> Nil Then
		    If f.Border Then width = width + 2 * CalcBorderSize(g2)
		    If f.Shadow Then width = width + CalcShadowSize(g2)
		    If f.Italic Then
		      // only the width of the baseline is calculated. Add room for slanted character on the right
		      width = width + Round(FontFaceAscent(g, f) / 4)
		    End If
		  End If
		  Return width / Amp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Group2dToPdf(group As Group2D, pdfDoc As PDFDocument, offsetX As Double, offsetY As Double)
		  For i As Integer = 0 To group.Count - 1
		    Object2dToPdf(group.Item(i), pdfDoc, offsetX + group.X, offsetY + group.Y)
		  Next i
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LighterColor(oldColor As Color) As Color
		  Return RGB(_
		  (3*oldColor.Red+255)/2, _
		  (3*oldColor.Green+255)/2, _
		  (3*oldColor.Blue+255)/2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Object2dToPdf(obj As Object2D, pdfDoc As PDFDocument, offsetX As Double, offsetY As Double)
		  If obj = Nil Then Return
		  
		  #If RBVersion < 2022.01
		    
		    Select Case obj 
		      
		    Case IsA Group2D
		      Group2dToPdf(Group2D(obj), pdfDoc, offsetX, offsetY)
		      
		    Case IsA StringShape
		      StringShapeToPdf(StringShape(obj), pdfDoc, offsetX, offsetY)
		      
		    Case IsA RectShape
		      RectShapeToPdf(RectShape(obj), pdfDoc, offsetX, offsetY)
		      
		    Case IsA CurveShape
		      CurveShapeToPdf(CurveShape(obj), pdfDoc, offsetX, offsetY)
		      
		    Case Else
		      App.DebugWriter.Write CurrentMethodName + ": Unknown Object2D of type " + Introspection.GetType(obj).Name + " encountered"
		      
		    End Select
		    
		  #Else
		    
		    Select Case obj
		      
		    Case IsA Group2D
		      Group2dToPdf(Group2D(obj), pdfDoc, offsetX, offsetY)
		      
		    Case IsA CurveShape
		      Dim c As CurveShape = CurveShape(obj)
		      #If RBVersion < 2022.03
		        // In 2022 r2, CurveShapes of Order = 0 do not render correctly in the Xojo PDF support for objects
		        // See https://tracker.xojo.com/xojoinc/xojo/-/issues/69592
		        // Closed and marked as planned for release with 2022r3
		        If c.Order = 0 Then
		          c.Order = 1
		          c.ControlX(0) = c.X
		          c.ControlY(0) = c.Y
		        End If
		      #EndIf
		      
		      pdfdoc.Graphics.DrawObject(c, offsetX, offsetY)
		      
		    Case Else
		      pdfDoc.Graphics.DrawObject(obj, offsetX, offsetY)
		      
		    End Select
		    
		  #EndIf
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RandomMidColor() As Color
		  Dim r as New Random
		  Return RGB(r.InRange(64,192), r.InRange(64,192), r.InRange(64,192))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RectShapeToPdf(r As RectShape, pdfDoc As PDFDocument, offsetX As Double, offsetY As Double)
		  If r IsA RoundRectShape Then
		    RoundRectShapeToPdf(RoundRectShape(r), pdfDoc, offsetX, offsetY)
		    Return
		  End If
		  
		  If r = Nil Then Return
		  If pdfDoc = Nil Then Return
		  
		  Dim g As Graphics = pdfDoc.Graphics
		  Dim c As Color
		  
		  Dim path As New GraphicsPath
		  
		  path.AddRectangle(r.x + offsetX - r.Width / 2, r.Y + offsetY - r.Height / 2, r.Width, r.Height)
		  
		  If r.FillOpacity <> 0 And r.FillColor <> &cFFFFFF Then
		    c = r.FillColor
		    c = RGB(c.Red, c.Green, c.Blue, 255 - (255 * r.FillOpacity))
		    g.DrawingColor = c
		    g.FillPath(path)
		  End If
		  
		  c = r.BorderColor
		  c = RGB(c.Red, c.Green, c.Blue, 255 - (255 * r.BorderOpacity))
		  g.DrawingColor = c
		  g.PenSize = r.BorderWidth
		  g.DrawPath(path)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RoundRectShapeToPdf(r As RoundRectShape, pdfDoc As PDFDocument, offsetX As Double, offsetY As Double)
		  If r = Nil Then Return
		  If pdfDoc = Nil Then Return
		  
		  Dim g As Graphics = pdfDoc.Graphics
		  Dim c As Color
		  
		  Dim path As New GraphicsPath
		  
		  // Make sure that the corners are less than half the width/height. 
		  // Imperfect floating point representation can cause this case to not be true when it should be.
		  // Try to correct this by limiting the number of digits used.
		  
		  Dim cornerWidthInteger As Integer
		  Dim cornerHeightInteger As Integer
		  Dim widthInteger As Integer
		  Dim heightInteger As Integer
		  
		  cornerWidthInteger = (r.CornerWidth * 100) - 1
		  cornerHeightInteger = (r.CornerHeight * 100) - 1
		  widthInteger = r.Width * 100
		  heightInteger = r.Height * 100
		  cornerWidthInteger = Min(cornerWidthInteger, widthInteger / 2)
		  cornerHeightInteger = Min(cornerHeightInteger, heightInteger / 2)
		  
		  r.CornerWidth = cornerWidthInteger / 100
		  r.CornerHeight = cornerHeightInteger / 100
		  
		  path.AddRoundRectangle(r.x + offsetX - r.Width / 2, r.Y + offsetY - r.Height / 2, r.Width, r.Height, r.CornerWidth, r.CornerHeight)
		  
		  If r.FillOpacity <> 0 And r.FillColor <> &cFFFFFF Then
		    c = r.FillColor
		    c = RGB(c.Red, c.Green, c.Blue, 255 - (255 * r.FillOpacity))
		    g.DrawingColor = c
		    g.FillPath(path)
		  End If
		  
		  c = r.BorderColor
		  c = RGB(c.Red, c.Green, c.Blue, 255 - (255 * r.BorderOpacity))
		  g.DrawingColor = c
		  g.PenSize = r.BorderWidth
		  g.DrawPath(path)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StringShapeToPdf(s As StringShape, pdfDoc As PDFDocument, offsetX As Double, offsetY As Double)
		  If s = Nil Then Return
		  If pdfDoc = Nil Then Return
		  Dim outputString As String
		  //++
		  // As of Xojo 2021r2.1, PDFDocument does not support decomposed UTF strings.
		  // Since macOS stores filenames in decomposed format, these will print out as separate code points
		  // if passed to PDFGraphics.DrawText
		  //--
		  #If XojoVersion > 2021.021
		    #Pragma Warning "Verify if PDFGraphics.DrawText still does not support decomposed characters"
		  #EndIf
		  outputString = s.Text.NormalizeStringEncoding(StringUtils.NormalizationForms.NFC)
		  
		  Dim g As Graphics = pdfDoc.Graphics
		  
		  g.DrawingColor = s.FillColor
		  g.FontName = s.TextFont
		  
		  #Pragma Warning "TODO: Revisit on Xojo upgrades"
		  //++
		  // N.B., as of Xojo 2021r3.1, PDFDocument only supports the basic 14 fonts
		  // https://web.archive.org/web/20160614134144/http://desktoppub.about.com/od/glossary/g/base14fonts.htm
		  // It will substitute fonts if the font selected is not loaded or part of the 14.
		  // Also, the font substitution built into the class does not seem to work properly for Times New Roman
		  // and variants of Courier. Special case these until this is corrected or font loading is added to OpenSong's PDF handling.
		  //--
		  If s.TextFont = "Times New Roman" Then
		    g.FontName = PDFDocument.StandardFontNames.Times
		  ElseIf Instr(s.TextFont, "Courier") > 0 Then
		    g.FontName = PDFDocument.StandardFontNames.Courier
		  End If
		  
		  g.FontSize = s.TextSize
		  g.Bold = s.Bold
		  g.Italic = s.Italic
		  g.Underline = s.Underline
		  
		  Dim textWidth As Double = g.TextWidth(s.Text)
		  Dim textX As Double = s.X + offsetX
		  Dim textY As Double = s.Y + offsetY
		  
		  Select Case s.HorizontalAlignment
		  Case StringShape.Alignment.Left
		    textX = textX
		  Case StringShape.Alignment.Right
		    textX = textX - textWidth
		  Case StringShape.Alignment.Center
		    textX = textX - (textWidth / 2)
		  End Select
		  
		  Select Case s.VerticalAlignment
		  Case StringShape.Alignment.Top
		    textY = textY + g.FontAscent
		  Case StringShape.Alignment.BaseLine
		    textY = textY
		  Case StringShape.Alignment.Bottom
		    textY = textY - (g.TextHeight - g.FontAscent)
		  End Select
		  
		  App.DebugWriter.Write StringUtils.Sprintf("%s: Writing %s at %d, %d", CurrentMethodName, outputString, textX, textY), 10
		  
		  g.DrawText(outputString, textX, textY)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VectorToPdf(pages As Group2D, offsetX As Double, offsetY As Double, pageWidthInPoints As Double, pageHeightInPoints As Double, PDFoutputFolderItem As FolderItem = Nil, defaultFilename As String = "OpenSong.pdf") As FolderItem
		  //++
		  // Convert a set of pages expressed as a Group2D collection into a PDF file.
		  //--
		  
		  If pages = Nil Then Return Nil
		  
		  If pageWidthInPoints = 0.0 And pageHeightInPoints = 0.0 Then
		    // try to get page dimensions from the default printer
		    Try
		      Dim ps As New PrinterSetup
		      Dim res As Integer
		      If ps.HorizontalResolution > 0 Then
		        res = ps.HorizontalResolution
		        pageWidthInPoints = InchesToPoints(ps.PageWidth / res)
		        If ps.VerticalResolution > 0 Then
		          res = ps.VerticalResolution
		        End If
		        pageHeightInPoints = InchesToPoints(ps.PageHeight / res)
		        If pageHeightInPoints = 0 Then
		          pageWidthInPoints = 0
		        ElseIf pageWidthInPoints = 0 Then
		          pageHeightInPoints = 0
		        End If
		      End If
		    Catch
		      
		    End Try
		  End If
		  
		  Const toleranceInPoint As Double = 4
		  If pageWidthInPoints = 0.0 And pageHeightInPoints = 0.0 Then
		    Return VectorToPdf(pages, offsetX, offsetY, PDFDocument.PageSizes.Letter, PDFoutputFolderItem, defaultFilename)
		  ElseIf Abs(pageWidthInPoints - CMtoPoints(21)) <= toleranceInPoint Then
		    If Abs(pageHeightInPoints - CMtoPoints(29.7)) <= toleranceInPoint Then
		      Return VectorToPdf(pages, offsetX, offsetY, PDFDocument.PageSizes.A4, PDFoutputFolderItem, defaultFilename)
		    End If
		  ElseIf Abs(pageWidthInPoints - CMtoPoints(29.7)) <= toleranceInPoint Then
		    If Abs(pageHeightInPoints - CMtoPoints(42)) <= toleranceInPoint Then
		      Return VectorToPdf(pages, offsetX, offsetY, PDFDocument.PageSizes.A3, PDFoutputFolderItem, defaultFilename)
		    End If
		  ElseIf Abs(pageWidthInPoints - InchesToPoints(8.5)) <= toleranceInPoint Then
		    If Abs(pageHeightInPoints - InchesToPoints(11)) <= toleranceInPoint Then
		      Return VectorToPdf(pages, offsetX, offsetY, PDFDocument.PageSizes.Letter, PDFoutputFolderItem, defaultFilename)
		    ElseIf Abs(pageHeightInPoints - InchesToPoints(14)) <= toleranceInPoint Then
		      Return VectorToPdf(pages, offsetX, offsetY, PDFDocument.PageSizes.Legal, PDFoutputFolderItem, defaultFilename)
		    End If
		  ElseIf Abs(pageWidthInPoints - InchesToPoints(11)) <= toleranceInPoint Then
		    If Abs(pageHeightInPoints - InchesToPoints(17)) <= toleranceInPoint Then
		      Return VectorToPdf(pages, offsetX, offsetY, PDFDocument.PageSizes.Tabloid, PDFoutputFolderItem, defaultFilename)
		    End If
		  End If
		  
		  Dim pdfDoc As New PDFDocument(pageWidthInPoints, pageHeightInPoints)
		  
		  Return VectorToPdfDoc(pages, offsetX, offsetY, pdfDoc, PDFoutputFolderItem, defaultFilename)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VectorToPdf(pages As Group2D, offsetX As Double, offsetY As Double, pageSize As PDFDocument.PageSizes = PDFDocument.PageSizes.Letter, PDFoutputFolderItem As FolderItem = Nil, defaultFilename As String = "OpenSong.pdf") As FolderItem
		  //++
		  // Convert a set of pages expressed as a Group2D collection into a PDF file.
		  //--
		  
		  If pages = Nil Then Return Nil
		  
		  Dim pdfDoc As New PDFDocument(pageSize)
		  
		  Return VectorToPdfDoc(pages, offsetX, offsetY, pdfDoc, PDFoutputFolderItem, defaultFilename)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VectorToPdfDoc(pages As Group2D, offsetX As Double, offsetY As Double, pdfDoc As PDFDocument, PDFoutputFolderItem As FolderItem = Nil, defaultFilename As String = "OpenSong.pdf") As FolderItem
		  //++
		  // Convert a set of pages expressed as a Group2D collection into a PDF file.
		  //--
		  
		  If pages = Nil Then Return Nil
		  If pdfDoc = Nil Then Return Nil
		  
		  For i As Integer = 0 To pages.Count - 1
		    Object2dToPdf(pages.Item(i), pdfDoc, offsetX, offsetY)
		    If i < pages.Count - 1 Then
		      pdfDoc.Graphics.NextPage
		    End If
		  Next i
		  
		  If PDFoutputFolderItem = Nil Then
		    PDFoutputFolderItem = FolderItem.ShowSaveFileDialog(FileTypes.PDFFiles + FileTypes.AllFiles, defaultFilename)
		  End If
		  
		  If PDFoutputFolderItem = Nil Then Return Nil
		  
		  pdfDoc.Save(PDFoutputFolderItem)
		  
		  Return PDFoutputFolderItem
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ThicknessFactor As Integer
	#tag EndProperty


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
			Name="ThicknessFactor"
			Visible=false
			Group="Behavior"
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
End Module
#tag EndModule
