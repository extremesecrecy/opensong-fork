#tag Module
Protected Module GraphicsX
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

	#tag Method, Flags = &h0
		Function DarkerColor(oldColor As Color) As Color
		  Return RGB(oldColor.Red/2, oldColor.Green/2, oldColor.Blue/2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine(g As Graphics, thisLine As String, xx As Integer, yy As Integer, f As FontFace)
		  Dim dx, dy As Integer
		  Dim b2 As Integer
		  Dim shadowSize, borderSize As Integer = 0
		  
		  ' --- Draw decoration ---
		  
		  If f <> Nil Then
		    f.OntoGraphics g
		    
		    If f.Border Then
		      borderSize = CalcBorderSize(g)
		      xx = xx + borderSize
		    End If
		    
		    If f.Fill Then
		      g.ForeColor = f.FillColor
		      g.FillRect xx-borderSize, yy-FontFaceAscent(g, f), FontFaceWidth(g, thisLine, f), FontFaceHeight(g, f)
		    End If
		    
		    If f.Shadow Then
		      shadowSize = CalcShadowSize(g)
		      If f.Border Then
		        Dim shadowFace As FontFace = f.Clone
		        shadowFace.ForeColor = shadowFace.ShadowColor
		        shadowFace.BorderColor = shadowFace.ShadowColor
		        shadowFace.Fill = False
		        shadowFace.Shadow = False
		        
		        Call DrawFontSingleLine(g, thisLine, xx + shadowSize, yy + shadowSize, shadowFace)
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
		Function DrawFontString(g As Graphics, str As String, x As Integer, y As Integer, f As FontFace, width As Integer = 0, align As String = "left", height As Integer = 0, valign As String = "top", tabs() As StyleTabsType = Nil, InsertAfterBreak as string = "") As Integer
		  Profiler.BeginProfilerEntry "DrawFontString (" + str + ")"
		  Dim xx, yy, i, j As Integer
		  Dim lineCount, lineHeight, lineAscent, thisWidth As Integer
		  Dim thisLine, thisChar As String
		  Dim hasTabs As Boolean
		  Dim tabCount as Integer
		  
		  If ThicknessFactor <= 0 Then ThicknessFactor = 1
		  
		  If f <> Nil Then
		    f.OntoGraphics g
		  End If
		  
		  lineHeight = FontFaceHeight(g, f) 'g.TextHeight
		  lineAscent = FontFaceAscent(g, f) 'g.TextAscent
		  
		  hasTabs = False
		  If Not IsNull(tabs) then
		    If UBound(tabs) > -1 Then
		      If InStr(str, Chr(9)) > 0 Or _
		        ((tabs(0).Align = StyleHAlignEnum.Char) And (InStr(str, tabs(0).AlignChar) > 0)) Then
		        hasTabs = True
		      End If
		    End If
		  End If
		  
		  If width > 0 Then
		    ' wrap
		    xx = 1
		    yy = 1
		    thisWidth = 0
		    While yy <= Len(str) ' loop through the string
		      thisChar = Mid(str, yy, 1)
		      thisWidth = g.StringWidth(Mid(str, xx, yy-xx+1))
		      If thisChar = Chr(10) Or thisChar = Chr(13) Then
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
		        str = str.Left(xx) + Chr(10) + InsertAfterBreak + str.Mid(yy).LTrim
		        xx = xx + 1
		        yy = xx
		        thisWidth = 0
		      End If
		      yy = yy + 1
		    Wend
		  End If
		  
		  lineCount = CountFields(str, Chr(10))
		  For i = 1 To lineCount
		    thisLine = NthField(str, Chr(10), i)
		    
		    If valign = "bottom" Then
		      yy = y + height - lineHeight*(lineCount-i)
		    ElseIf valign = "middle" Then
		      yy = y + ((height - (lineHeight*lineCount)) \ 2) + lineHeight * (i-1) + lineAscent
		    Else ' top?
		      yy = y + lineAscent + lineHeight * (i-1)
		    End If
		    
		    tabCount = CountFields(thisLine, Chr(9)) - 1
		    If tabCount > 0 And hasTabs And align = "left" Then
		      
		      Dim k, l As Integer
		      Dim tab As StyleTabsType
		      Dim linePart, leftPart As String
		      Dim spaceWidth As Integer
		      Dim lastTabIdx As Integer
		      
		      spaceWidth = g.StringWidth(" ")
		      lastTabIdx = -1
		      
		      For j = 1 to tabCount + 1
		        
		        linePart = NthField(thisLine, Chr(9), j)
		        
		        If j = 1 Then
		          tab = tabs(0)
		          xx = x
		        End If
		        
		        If j > 1 Or _
		          (j = 1 And tab.Align = StyleHAlignEnum.Char And InStr(linePart, tab.AlignChar) > 0) Then
		          
		          For k = lastTabIdx + 1 to UBound(tabs)
		            tab = tabs(k)
		            
		            If tab.Align = StyleHAlignEnum.Left Then
		              If (x + tab.Position) > xx Then
		                xx = x + tab.Position
		                
		                lastTabIdx = k
		                Exit
		              End If
		            ElseIf tab.Align = StyleHAlignEnum.Middle Then
		              l = FontFaceWidth(g, linePart, f)
		              If (x + tab.Position - (l / 2)) > xx Then
		                xx = x + tab.Position - (l / 2)
		                
		                lastTabIdx = k
		                Exit
		              ElseIf ((x + tab.Position) > (xx - spaceWidth)) And ((x + tab.Position) <= (xx + l)) Then
		                'The position of the tab overlaps with the space taken by linePart,
		                'but the linePart is too wide to be centered at the tab position,
		                'so just leave the linePart position (xx) as is
		                
		                lastTabIdx = k
		                Exit
		              End If
		            ElseIf tab.Align = StyleHAlignEnum.Right Or _
		              (tab.Align = StyleHAlignEnum.Char And (InStr(linePart, tab.AlignChar) = 0)) Then
		              l = FontFaceWidth(g, linePart, f)
		              If (x + tab.Position - l) > xx Then
		                xx = x + tab.Position - l
		                
		                lastTabIdx = k
		                Exit
		              ElseIf ((x + tab.Position) > (xx - spaceWidth)) And ((x + tab.Position) <= xx + l) Then
		                'The position of the tab overlaps with the space taken by linePart,
		                'but the linePart is too wide to be aligned right at the tab position,
		                'so just leave the linePart position (xx) as is
		                
		                lastTabIdx = k
		                Exit
		              End If
		            ElseIf (tab.Align = StyleHAlignEnum.Char) And (InStr(linePart, tab.AlignChar) > 0) Then
		              leftPart = Left(linePart, InStr(linePart, tab.AlignChar)-1)
		              l = FontFaceWidth(g, leftPart, f)
		              If (x + tab.Position - l) > xx Then
		                xx = x + tab.Position - l
		                
		                lastTabIdx = k
		                Exit
		              ElseIf ((x + tab.Position) > (xx - spaceWidth)) And ((x + tab.Position) <= xx + l) Then
		                'The position of the tab overlaps with the space taken by leftPart,
		                'but the part left of the separator is too wide to be set at the tab position,
		                'so just leave the linePart position (xx) as is
		                
		                lastTabIdx = k
		                Exit
		              End If
		            End If
		          Next k
		          
		        End If
		        
		        DrawFontSingleLine(g, linePart, xx, yy, f)
		        
		        For k = 1 to Len(linePart)
		          xx = xx + g.StringWidth(Mid(linePart, k, 1))
		        Next k
		        xx = xx + spaceWidth
		        
		      Next j
		    Else
		      If tabCount > 0 Then
		        thisLine = ReplaceAll(thisLine, Chr(9), " ")
		      End If
		      
		      ' --- Setup position ---
		      If align = "center" Then
		        thisWidth = FontFaceWidth(g, thisLine, f)
		        xx = x + (width - thisWidth) \ 2
		      ElseIf align = "right" Then
		        thisWidth = FontFaceWidth(g, thisLine, f)
		        xx = x + width - thisWidth
		      Else ' left?
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
		    Return FontFaceHeight(g, f) * lineCount
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawFontString(g As Graphics, str As String, x As Integer, y As Integer, f As FontFace, borderSize as Integer, headerSize as Integer, footerSize as Integer, margins as StyleMarginType, width As Integer, align As String, height As Integer, valign As String, tabs() As StyleTabsType = Nil, InsertAfterBreak as string = "") As Integer
		  Dim drawHeight as Integer
		  
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
		  tabs, InsertAfterBreak)
		  
		  If valign = "top" Then
		    drawHeight = drawHeight
		  ElseIf valign = "bottom" Then
		    drawHeight = drawHeight
		  End If
		  
		  Return DrawHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawFontStringV(g As Graphics, str As String, x As Double, y As Double, f As FontFace, width As Double = 0, zoom As Double = 1, ByRef Page As Group2D, align As String = "left", height As Double = 0, valign As String = "top", InsertAfterBreak As String = "") As Double
		  // Vector graphics version
		  // x, y is top left of bounding box if valign = "top"
		  // x, y is left center of bounding box (half the text is above, half below) if valign = "middle"
		  // x, y is bottom left of bounding box if valign = "bottom"
		  
		  Profiler.BeginProfilerEntry "DrawFontString (" + str + ")"
		  Dim dx, dy, xx, yy, i As Double
		  Dim lineCount As Integer
		  Dim lineHeight, lineAscent, thisWidth As Double
		  Dim thisLine, thisChar, tempstring As String
		  Dim shadowFace As FontFace
		  Dim shadowSize, borderSize As Double
		  Dim Strings As New Group2D
		  Dim r As RectShape
		  Dim tempFont As FontFace
		  Dim h As Double
		  Dim HalfWidth As Double
		  
		  If ThicknessFactor <= 0 Then ThicknessFactor = 1
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
		        str = str.Left(xx) + Chr(10) + InsertAfterBreak + str.Mid(yy).LTrim
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
		Protected Function DrawLineV(x As Integer, y As integer, x2 As integer, y2 As Integer, c As color, width As Integer) As CurveShape
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
		Protected Function DrawRectV(x As Integer, y As integer, width As Integer, Height As Integer, c As Color, borderwidth As Integer) As RectShape
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
		Function FontFaceWidth(g As Graphics, str As String, f As FontFace, Amp As Double  = 1) As Double
		  ' Make sure the fontface is applied to the graphics object first
		  Dim g2 As Graphics
		  Dim width As Integer
		  
		  g2 = g.Clip(0, 0, g.Width, g.Height)
		  g2.TextSize = g2.TextSize * Amp
		  width = g2.StringWidth(str)
		  If f <> Nil Then
		    If f.Border Then width = width + 2 * CalcBorderSize(g2)
		    If f.Shadow Then width = width + CalcShadowSize(g2)
		  End If
		  Return width / Amp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LighterColor(oldColor As Color) As Color
		  Return RGB(_
		  (3*oldColor.Red+255)/2, _
		  (3*oldColor.Green+255)/2, _
		  (3*oldColor.Blue+255)/2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RandomMidColor() As Color
		  Dim r as New Random
		  Return RGB(r.InRange(64,192), r.InRange(64,192), r.InRange(64,192))
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
