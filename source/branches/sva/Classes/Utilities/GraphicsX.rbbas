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
		  Dim oldMask As Picture = OriginalPicture.CopyMask
		  Dim oldMaskSurf As RGBSurface
		  If oldMask <> Nil Then oldMaskSurf = OriginalPicture.CopyMask.RGBSurface
		  Dim InterpolatedPicture As New Picture(newWidth, newHeight, 32)
		  Dim InterpolatedSurf As RGBSurface = InterpolatedPicture.RGBSurface
		  Dim InterpolatedMaskSurf As RGBSurface = InterpolatedPicture.mask.RGBSurface
		  
		  Dim x, y, alphaValue As Integer
		  Dim x_diff, y_diff, blue, red, green, gray As Double
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
		      
		      InterpolatedSurf.Pixel(j, i) = RGB(red, green, blue)
		      
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
		  Dim b As Integer
		  b = Round(g.TextHeight * ThicknessFactor / 40)
		  If b < 1 Then b = 1
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcShadowSize(g As Graphics) As Integer
		  ' Make sure the fontface is applied to the graphics object first
		  Dim b As Integer
		  b = Round(g.TextHeight * ThicknessFactor / 50)
		  If b < 1 Then b = 1
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DarkerColor(oldColor As Color) As Color
		  Return RGB(oldColor.Red/2, oldColor.Green/2, oldColor.Blue/2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine(g As Graphics, thisLine As String, xx As Integer, yy As Integer, f As FontFace)
		  ' selects the used version of the text drawing algorithm
		  Dim selectedVersion As String
		  
		  selectedVersion = "directDraw"
		  'selectedVersion = "blit3"
		  
		  Select Case selectedVersion
		  Case "vector"
		    #If TargetWin32
		      app.UseGDIPlus = True
		    #EndIf
		    
		    g.DrawObject(DrawFontSingleLineV(thisLine,xx,yy,f))
		    
		    #If TargetWin32
		      app.UseGDIPlus = False
		    #EndIf
		  Case "directDraw"
		    DrawFontSingleLine0(g,thisLine,xx,yy,f)
		  Case "mask"
		    DrawFontSingleLine1(g,thisLine,xx,yy,f)
		  Case "blit"
		    DrawFontSingleLine2(g,thisLine,xx,yy,f)
		  Case "blit2"
		    DrawFontSingleLine3(g,thisLine,xx,yy,f)
		  Case "blit3"
		    DrawFontSingleLine4(g,thisLine,xx,yy,f)
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine0(g As Graphics, thisLine As String, xx As Integer, yy As Integer, f As FontFace)
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
		Sub DrawFontSingleLine1(g As Graphics, thisLine As String, xx As Integer, yy As Integer, f As FontFace)
		  ' Mask version
		  ' Pseudocode in case border is needed:
		  ' Create a new picture with a fully transparent mask and draw the text once onto the mask, fully opaque (black)
		  ' Fill the foreground with black
		  ' Create a new picture with a fully transparent mask and draw the first picture onto the mask several times
		  '   to create a mask for the shadow or text with border respectively
		  ' if shadow is needed fill the foreground with the shadow color and draw that picture onto the window graphics
		  ' fill the foreground with the border color
		  ' draw the text onto the picture (in foreground color)
		  ' draw that picture (bordered text with transparent background) onto the window graphics (over the shadow)
		  
		  
		  Dim dx, dy As Integer
		  Dim shadowSize, borderSize As Integer = 0
		  Dim textAscent, textWidth, textHeight As Integer
		  
		  ' --- Draw decoration ---
		  
		  If f <> Nil Then
		    f.OntoGraphics g
		    
		    If f.Shadow Then shadowSize = CalcShadowSize(g)
		    If f.Border Then borderSize = CalcBorderSize(g)
		    textAscent = FontFaceAscent(g, f)
		    textWidth = FontFaceWidth(g, thisLine, f)
		    textHeight = FontFaceHeight(g, f)
		    xx = xx + borderSize
		    
		    If f.Fill Then
		      g.ForeColor = f.FillColor
		      g.FillRect xx-borderSize, yy-textAscent, textWidth, textHeight
		    End If
		    
		    If f.Border Then
		      Dim textPic, shadowMask, decoratedTextPic As Picture
		      Dim gg As Graphics
		      Dim x, y, picWidth, picHeight As Integer
		      
		      ' choose a size to accomodate the text. It might not be confined to FontfaceHeight and FontFaceWidth, so add some margin
		      picWidth = textWidth + 4 * textHeight
		      picHeight = 2 * textHeight
		      x = 2 * textHeight
		      y = 2 * textAscent
		      
		      textPic = New Picture(picWidth, picHeight, 32)
		      textPic.ApplyMask(textPic) ' make the whole picture transparent
		      gg = textPic.Mask.Graphics
		      f.OntoGraphics gg
		      gg.ForeColor = &c000000
		      gg.DrawString thisLine, x, y
		      
		      gg = textPic.Graphics
		      gg.ForeColor = &c000000
		      gg.FillRect 0, 0, picWidth, picHeight
		      
		      shadowMask = New Picture(picWidth, picHeight, 32)
		      shadowMask.ApplyMask(shadowMask)
		      gg = shadowMask.Mask.Graphics
		      Dim b2 As Integer = borderSize \ 2
		      'Sides
		      For dx = -b2 To b2
		        gg.DrawPicture textPic,  dx, -borderSize ' Top
		        gg.DrawPicture textPic,  dx,  borderSize ' Bottom
		        gg.DrawPicture textPic, -borderSize,  dx ' Left
		        gg.DrawPicture textPic,  borderSize,  dx ' Right
		      Next
		      'Corners (bevel)
		      dy = -borderSize+1
		      For dx = b2+1 To borderSize-1
		        gg.DrawPicture textPic,  dx,  dy ' Top-Left
		        gg.DrawPicture textPic,  dx, -dy ' Bottom-Left
		        gg.DrawPicture textPic, -dx,  dy ' Top-Right
		        gg.DrawPicture textPic, -dx, -dy ' Bottom-Right
		        dy = dy + 1
		      Next
		      
		      gg = shadowMask.Graphics
		      
		      If f.Shadow Then
		        gg.ForeColor = f.ShadowColor
		        gg.FillRect 0, 0, gg.Width, gg.Height
		        
		        g.DrawPicture shadowMask, xx-x+shadowSize, yy-y+shadowSize, gg.Width, gg.Height
		      End If
		      
		      gg.ForeColor = f.BorderColor
		      gg.FillRect 0, 0, gg.Width, gg.Height
		      
		      f.OntoGraphics gg
		      gg.DrawString  thisLine, x, y
		      g.DrawPicture shadowMask, xx-x, yy-y, gg.Width, gg.Height
		    ElseIf f.Shadow Then
		      g.ForeColor = f.ShadowColor
		      g.DrawString thisLine, xx + shadowSize, yy + shadowSize
		    End If
		  End If
		  
		  '--- Draw string ---
		  If f <> Nil Then g.ForeColor = f.ForeColor
		  If Not f.Border Then g.DrawString thisLine, xx, yy
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine2(g As Graphics, thisLine As String, xx As Integer, yy As Integer, f As FontFace)
		  ' Blit version (using GDI+)
		  ' create a transparent pic and draw the text onto it (in forground color, but only the alpha channel is used later)
		  ' create a second transparent pic and draw the first pic multiple times onto it to form the shape of the shadow or text with border
		  ' create a picture with a mask and copy the alpha channel of the shadow shape into it's mask
		  ' if shadow fill the forground of the masked picture with the shadow color and draw it onto the window
		  ' fill the forground of the masked picture with the border color, draw the text in foreground color onto it and draw that pic onto the window
		  
		  Dim dx, dy As Integer
		  Dim shadowSize, borderSize As Integer = 0
		  Dim textAscent, textWidth, textHeight As Integer
		  
		  ' --- Draw decoration ---
		  
		  If f <> Nil Then
		    f.OntoGraphics g
		    
		    If f.Shadow Then shadowSize = CalcShadowSize(g)
		    If f.Border Then borderSize = CalcBorderSize(g)
		    textAscent = FontFaceAscent(g, f)
		    textWidth = FontFaceWidth(g, thisLine, f)
		    textHeight = FontFaceHeight(g, f)
		    xx = xx + borderSize
		    
		    If f.Fill Then
		      g.ForeColor = f.FillColor
		      g.FillRect xx-borderSize, yy-textAscent, textWidth, textHeight
		    End If
		    
		    If f.Border Then
		      Dim textPic, shadowMask, decoratedTextPic As Picture
		      Dim gg As Graphics
		      Dim x, y, picWidth, picHeight As Integer
		      
		      ' choose a size to accomodate the text. It might not be confined to FontfaceHeight and FontFaceWidth, so add some margin
		      picWidth = textWidth + 4 * textHeight
		      picHeight = 2 * textHeight
		      x = 2 * textHeight
		      y = 2 * textAscent
		      
		      #If TargetWin32
		        app.UseGDIPlus = True
		      #EndIf
		      
		      textPic = New Picture(picWidth, picHeight)
		      gg = textPic.Graphics
		      f.OntoGraphics gg
		      gg.DrawString thisLine, x, y
		      
		      shadowMask = New Picture(picWidth, picHeight)
		      gg = shadowMask.Graphics
		      Dim b2 As Integer = borderSize \ 2
		      'Sides
		      For dx = -b2 To b2
		        gg.DrawPicture textPic,  dx, -borderSize ' Top
		        gg.DrawPicture textPic,  dx,  borderSize ' Bottom
		        gg.DrawPicture textPic, -borderSize,  dx ' Left
		        gg.DrawPicture textPic,  borderSize,  dx ' Right
		      Next
		      'Corners (bevel)
		      dy = -borderSize+1
		      For dx = b2+1 To borderSize-1
		        gg.DrawPicture textPic,  dx,  dy ' Top-Left
		        gg.DrawPicture textPic,  dx, -dy ' Bottom-Left
		        gg.DrawPicture textPic, -dx,  dy ' Top-Right
		        gg.DrawPicture textPic, -dx, -dy ' Bottom-Right
		        dy = dy + 1
		      Next
		      
		      decoratedTextPic = New Picture(picWidth, picHeight, 32)
		      decoratedTextPic.ApplyMask(shadowMask.CopyMask)
		      gg = decoratedTextPic.Graphics
		      
		      If f.Shadow Then
		        gg.ForeColor = f.ShadowColor
		        gg.FillRect 0, 0, picWidth, picHeight
		        
		        g.DrawPicture decoratedTextPic, xx-x+shadowSize, yy-y+shadowSize, picWidth, picHeight
		      End If
		      
		      gg.ForeColor = f.BorderColor
		      gg.FillRect 0, 0, picWidth, picHeight
		      
		      gg.DrawPicture textPic, 0, 0, picWidth, picHeight
		      g.DrawPicture decoratedTextPic, xx-x, yy-y, picWidth, picHeight
		      
		      #If TargetWin32
		        app.UseGDIPlus = False
		      #EndIf
		    ElseIf f.Shadow Then
		      g.ForeColor = f.ShadowColor
		      g.DrawString thisLine, xx + shadowSize, yy + shadowSize
		    End If
		  End If
		  
		  '--- Draw string ---
		  If f <> Nil Then g.ForeColor = f.ForeColor
		  If Not f.Border Then g.DrawString thisLine, xx, yy
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine3(g As Graphics, thisLine As String, xx As Integer, yy As Integer, f As FontFace)
		  ' alternative Blit version (using GDI+)
		  ' create a transparent pic and draw the text in black onto it
		  ' create a second transparent pic and draw the first pic multiple times onto it to form the shape of the shadow or text with border
		  ' create a third (transparent) pic, fill it with the border color
		  ' create a mask from the alpha channel of the second pic and apply this mask to the alpha channel of the third (cutting out of the plane the shape of the shadow)
		  ' now draw the text in foreground color onto this pic
		  ' if border
		  '   create a fourth transparent picture and draw the second one onto it, moved to where the shadow needs to be
		  '   recycle the first picture and fill it with the shadow color
		  '   create a mask from the alpha channel of the fourth pic and apply this mask to the alpha channel of the recicled one (cutting out of the plane the shape of the shadow)
		  '   draw the recicled pic onto the window
		  ' draw the third pic onto the window
		  
		  Dim dx, dy As Integer
		  Dim shadowSize, borderSize As Integer = 0
		  Dim textAscent, textWidth, textHeight As Integer
		  
		  ' --- Draw decoration ---
		  
		  If f <> Nil Then
		    f.OntoGraphics g
		    
		    If f.Shadow Then shadowSize = CalcShadowSize(g)
		    If f.Border Then borderSize = CalcBorderSize(g)
		    textAscent = FontFaceAscent(g, f)
		    textWidth = FontFaceWidth(g, thisLine, f)
		    textHeight = FontFaceHeight(g, f)
		    xx = xx + borderSize
		    
		    If f.Fill Then
		      g.ForeColor = f.FillColor
		      g.FillRect xx-borderSize, yy-textAscent, textWidth, textHeight
		    End If
		    
		    If f.Border Then
		      Dim textPic, borderMask, shadowMask, decoratedTextPic As Picture
		      Dim gg As Graphics
		      Dim x, y, picWidth, picHeight As Integer
		      
		      ' choose a size to accomodate the text. It might not be confined to FontfaceHeight and FontFaceWidth, so add some margin
		      picWidth = textWidth + 4 * textHeight
		      picHeight = 2 * textHeight
		      x = 2 * textHeight
		      y = 2 * textAscent
		      
		      #If TargetWin32
		        app.UseGDIPlus = True
		      #EndIf
		      
		      ' render the text as a template
		      textPic = New Picture(picWidth, picHeight)
		      gg = textPic.Graphics
		      f.OntoGraphics gg
		      ' gg.ForeColor = &cffffffff // fully transparent white in the hope to see something in the debugger
		      ' gg.FillRect(0,0,picWidth,picHeight)
		      gg.ForeColor = &c000000
		      gg.DrawString thisLine, x, y
		      
		      ' create a mask for the border
		      borderMask = New Picture(picWidth, picHeight)
		      gg = borderMask.Graphics
		      
		      Dim b2 As Integer = borderSize \ 2
		      'Sides
		      For dx = -b2 To b2
		        gg.DrawPicture textPic,  dx, -borderSize ' Top
		        gg.DrawPicture textPic,  dx,  borderSize ' Bottom
		        gg.DrawPicture textPic, -borderSize,  dx ' Left
		        gg.DrawPicture textPic,  borderSize,  dx ' Right
		      Next
		      'Corners (bevel)
		      dy = -borderSize+1
		      For dx = b2+1 To borderSize-1
		        gg.DrawPicture textPic,  dx,  dy ' Top-Left
		        gg.DrawPicture textPic,  dx, -dy ' Bottom-Left
		        gg.DrawPicture textPic, -dx,  dy ' Top-Right
		        gg.DrawPicture textPic, -dx, -dy ' Bottom-Right
		        dy = dy + 1
		      Next
		      
		      ' cut out the border from a plane using the mask
		      decoratedTextPic = New Picture(picWidth, picHeight)
		      gg = decoratedTextPic.Graphics
		      gg.ForeColor = f.BorderColor
		      gg.FillRect(0,0,picWidth,picHeight)
		      decoratedTextPic.ApplyMask(borderMask.CopyMask)
		      
		      f.OntoGraphics gg
		      gg.DrawString thisLine, x, y
		      
		      If f.Shadow Then
		        ' shadow is just the border moved and in ShadowColor
		        shadowMask = New Picture(picWidth, picHeight)
		        gg = shadowMask.Graphics
		        gg.DrawPicture borderMask, shadowSize, shadowSize
		        
		        gg = textPic.Graphics
		        gg.ForeColor = f.ShadowColor
		        gg.FillRect(0,0,picWidth,picHeight)
		        textPic.ApplyMask(ShadowMask.CopyMask)
		        
		        g.DrawPicture textPic, xx-x, yy-y ' shadow
		      End If
		      g.DrawPicture decoratedTextPic, xx-x, yy-y ' border
		      
		      #If TargetWin32
		        app.UseGDIPlus = False
		      #EndIf
		    ElseIf f.Shadow Then
		      g.ForeColor = f.ShadowColor
		      g.DrawString thisLine, xx + shadowSize, yy + shadowSize
		    End If
		  End If
		  
		  '--- Draw string ---
		  If f <> Nil Then g.ForeColor = f.ForeColor
		  If Not f.Border Then g.DrawString thisLine, xx, yy
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFontSingleLine4(g As Graphics, thisLine As String, xx As Integer, yy As Integer, f As FontFace)
		  ' alternative Blit version (using GDI+) (draw border directly)
		  ' create a transparent pic and draw the text in border color onto it
		  ' create a second transparent pic and draw the first pic multiple times onto it to form the shape of the text with border
		  ' draw the text in foreground color onto this pic
		  ' if border
		  '   create a third transparent picture and fill it with the shadow color
		  '   create a mask from the alpha channel of the 2nd pic and apply this mask to the alpha channel of the 3rd one (cutting out of the plane the shape of the shadow)
		  '   draw the 3rd pic onto the window moved to where the shadow should be
		  ' draw the 2nd pic onto the window
		  
		  Dim dx, dy As Integer
		  Dim shadowSize, borderSize As Integer = 0
		  Dim textAscent, textWidth, textHeight As Integer
		  
		  ' --- Draw decoration ---
		  
		  If f <> Nil Then
		    f.OntoGraphics g
		    
		    If f.Shadow Then shadowSize = CalcShadowSize(g)
		    If f.Border Then borderSize = CalcBorderSize(g)
		    textAscent = FontFaceAscent(g, f)
		    textWidth = FontFaceWidth(g, thisLine, f)
		    textHeight = FontFaceHeight(g, f)
		    xx = xx + borderSize
		    
		    If f.Fill Then
		      g.ForeColor = f.FillColor
		      g.FillRect xx-borderSize, yy-textAscent, textWidth, textHeight
		    End If
		    
		    If f.Border Then
		      Dim textPic, borderPic, shadowPic As Picture
		      Dim gg As Graphics
		      Dim x, y, picWidth, picHeight As Integer
		      
		      ' choose a size to accomodate the text. It might not be confined to FontfaceHeight and FontFaceWidth, so add some margin
		      picWidth = textWidth + 4 * textHeight
		      picHeight = 2 * textHeight
		      x = 2 * textHeight
		      y = 2 * textAscent
		      
		      #If TargetWin32
		        app.UseGDIPlus = True
		      #EndIf
		      
		      ' render the text as a template
		      textPic = New Picture(picWidth, picHeight)
		      gg = textPic.Graphics
		      f.OntoGraphics gg
		      gg.ForeColor = f.BorderColor
		      gg.DrawString thisLine, x, y
		      
		      ' create a mask for the border
		      borderPic = New Picture(picWidth, picHeight)
		      gg = borderPic.Graphics
		      
		      Dim b2 As Integer = borderSize \ 2
		      'Sides
		      For dx = -b2 To b2
		        gg.DrawPicture textPic,  dx, -borderSize ' Top
		        gg.DrawPicture textPic,  dx,  borderSize ' Bottom
		        gg.DrawPicture textPic, -borderSize,  dx ' Left
		        gg.DrawPicture textPic,  borderSize,  dx ' Right
		      Next
		      'Corners (bevel)
		      dy = -borderSize+1
		      For dx = b2+1 To borderSize-1
		        gg.DrawPicture textPic,  dx,  dy ' Top-Left
		        gg.DrawPicture textPic,  dx, -dy ' Bottom-Left
		        gg.DrawPicture textPic, -dx,  dy ' Top-Right
		        gg.DrawPicture textPic, -dx, -dy ' Bottom-Right
		        dy = dy + 1
		      Next
		      
		      f.OntoGraphics gg
		      gg.DrawString thisLine, x, y
		      
		      If f.Shadow Then
		        ' shadow is just the border moved and in ShadowColor
		        shadowPic = New Picture(picWidth, picHeight)
		        gg = shadowPic.Graphics
		        gg.ForeColor = f.ShadowColor
		        gg.FillRect(0,0,picWidth,picHeight)
		        shadowPic.ApplyMask(borderPic.CopyMask)
		        
		        g.DrawPicture shadowPic, xx-x+shadowSize, yy-y+shadowSize ' shadow
		      End If
		      g.DrawPicture borderPic, xx-x, yy-y ' border
		      
		      #If TargetWin32
		        app.UseGDIPlus = False
		      #EndIf
		    ElseIf f.Shadow Then
		      g.ForeColor = f.ShadowColor
		      g.DrawString thisLine, xx + shadowSize, yy + shadowSize
		    End If
		  End If
		  
		  '--- Draw string ---
		  If f <> Nil Then g.ForeColor = f.ForeColor
		  If Not f.Border Then g.DrawString thisLine, xx, yy
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawFontSingleLineV(thisLine As String, xx As Integer, yy As Integer, f As FontFace) As Group2D
		  Dim FontLine As New Group2D
		  Dim ss As StringShape
		  Dim shadowSize As Integer
		  
		  If f.Shadow Then
		    ss = New StringShape
		    f.OntoStringShape ss
		    ss.BorderColor = f.ShadowColor
		    ss.FillColor = f.ShadowColor
		    shadowSize = ss.BorderWidth * 40 / 50
		    ss.X = xx + shadowSize
		    ss.Y = yy + shadowSize
		    ss.Text = thisLine
		    ss.HorizontalAlignment = StringShape.Alignment.Left
		    ss.VerticalAlignment = StringShape.Alignment.BaseLine
		    FontLine.Append ss
		  End If
		  
		  ss = New StringShape
		  f.OntoStringShape ss
		  ss.X = xx
		  ss.Y = yy
		  ss.Text = thisLine
		  ss.HorizontalAlignment = StringShape.Alignment.Left
		  ss.VerticalAlignment = StringShape.Alignment.BaseLine
		  ss.Fill = 100
		  FontLine.Append ss
		  
		  Return FontLine
		  
		End Function
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
		        While yy > 1 And thisChar <> " " ' we need to backup to a space
		          yy = yy - 1
		          thisChar = Mid(str, yy, 1)
		        Wend
		        If yy <= 1 Then yy = i ' we didn't find a space; go back where we were and split there; ugly, but we have to.
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
		Function DrawFontStringV(g As Graphics, str As String, x As Double, y As Double, f As FontFace, width As Double = 0, zoom As Double = 1, ByRef Page As Group2D, align As String = "left", height As Double = 0, valign As String = "top") As Double
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
		  Dim shadowSize, borderSize As Integer
		  Dim Strings As New Group2D
		  Dim r As RectShape
		  Dim tempFont As FontFace
		  Dim h As Double
		  Dim HalfWidth As Double
		  
		  If ThicknessFactor <= 0 Then ThicknessFactor = 1
		  
		  If f <> Nil Then
		    f.OntoGraphics g, zoom
		    shadowSize = CalcShadowSize(g)
		    borderSize = CalcBorderSize(g)
		    If f.Border And f.Shadow Then
		      shadowFace = f.Clone
		      shadowFace.ForeColor = shadowFace.ShadowColor
		      shadowFace.BorderColor = shadowFace.ShadowColor
		      shadowFace.Fill = False
		      shadowFace.Shadow = False
		    End If
		  End If
		  
		  lineHeight = FontFaceHeight(g, f)
		  lineAscent = FontFaceAscent(g, f)
		  
		  If width > 0 Then
		    ' wrap
		    xx = 1
		    yy = 1
		    thisWidth = 0
		    While yy <= Len(str) ' loop through the string
		      thisChar = Mid(str, yy, 1)
		      thisWidth = g.StringWidth(Mid(str, xx, yy - xx + 1))
		      If thisChar = Chr(10) Or thisChar = Chr(13) Then // New line, reset width and move on
		        xx = yy + 1
		        yy = yy + 1
		        thisWidth = 0
		      ElseIf thisWidth > width Then ' if we get longer than the width...
		        i = yy ' remember yy in case we can't find a space
		        While yy > 1 And thiswidth > width  ' we need to backup
		          thisChar = Mid(str, yy, 1)
		          tempstring = Mid(str, xx, yy - xx + 1)
		          thisWidth = g.StringWidth(tempstring)
		          yy = yy - 1
		        Wend
		        While yy > 1 And thisChar <> " " // Get back to a space now
		          yy = yy - 1
		          thisChar = Mid(str, yy, 1)
		        Wend
		        If yy <= 1 Then yy = i ' we didn't find a space; go back where we were and split there; ugly, but we have to.
		        str = RTrim(Left(str, yy)) + Chr(10) + Mid(str, yy+1)
		        App.DebugWriter.Write "GraphicsX.DrawFontString: Line after split = '" + Mid(str, xx, yy - xx) + "'"
		        xx = yy + 1
		        yy = yy + 1
		        thisWidth = 0
		      End If
		      yy = yy + 1
		    Wend
		  End If
		  
		  lineCount = CountFields(str, Chr(10))
		  For i = 1 To lineCount
		    thisLine = NthField(str, Chr(10), i)
		    ' --- Setup position ---
		    // To this point in the routine, nothing is really any different than what is in the bitmap version of this method (and therefore should be subroutined, but that's a TODO)
		    // Changes here to accomodate differing origins in the vector coordinate system
		    //
		    HalfWidth = FontFaceWidth(g, thisLine, f) / 2
		    If align = "center" Then
		      xx = x + (width / 2)
		    ElseIf align = "right" Then
		      xx = x + width - HalfWidth
		      If xx + HalfWidth > x + width Then // Stretched too far right
		        xx = xx - ((xx + HalfWidth) - (x + width)) //Keep from going over margin
		      End If
		    Else ' left?
		      xx = x + (FontFaceWidth(g, thisline, f) / 2)
		      'App.DebugWriter.Write "GraphicsX.DrawFontString: Left Aligned to " + Str(xx)
		      If xx - HalfWidth < x Then
		        xx = xx + (x - (xx - HalfWidth))
		        'App.DebugWriter.Write "GraphicsX.DrawFontString: Corrected to " + Str(xx)
		      End If
		      If FontFaceWidth(g, Left(thisline, 1), f) > FontFaceWidth(g, "N", f) Then // Nudge to avoid it getting cut off
		        xx = xx + (FontFaceWidth(g, "N", f) / 10)
		        'App.DebugWriter.Write "GraphicsX.DrawFontString: Nudge to " + Str(xx)
		      End If
		    End If
		    
		    // This is changed because of my interpretation of how to count lines is different than Sean's.
		    // Sean uses what's best called a "pre-increment" treatment of the y position (add the line height before writing)
		    // I'm doing post-increment: adding the line height afterward, but recognizing that I have to offset by lineAscent (the height of characters above the baseline)
		    // since the y for a StringShape is based on the baseline.
		    // EMP, 12/05
		    
		    If valign = "bottom" Then
		      yy = y  - lineHeight*(lineCount - (i - 1)) + lineAscent
		    ElseIf valign = "middle" Then
		      yy = y + Round((height - (lineHeight*lineCount))/2) + lineHeight*(i) + lineAscent
		    Else ' top?
		      yy = y + lineAscent + lineHeight * (i-1)
		    End If
		    
		    ' --- Draw decoration ---
		    
		    If f <> Nil Then
		      
		      If f.Fill Then
		        g.ForeColor = f.FillColor
		        r = New RectShape
		        r.FillColor = f.FillColor
		        r.Fill = 100
		        r.x = xx + (GraphicsX.FontFaceWidth(g, thisline, f) / 2) - (borderSize / 2)
		        r.y = yy + (g.TextHeight / 2)
		        r.Height = g.TextHeight
		        r.Width = GraphicsX.FontFaceWidth(g, thisline, f) + (borderSize * 2)
		        strings.Append r
		      End If
		      
		      If f.Shadow Then
		        If f.Border Then
		          Call DrawFontStringV g, thisLine, xx + shadowSize, yy + shadowSize, shadowFace, width, zoom, Strings
		        Else
		          tempFont = f.Clone
		          tempFont.ForeColor = f.ShadowColor
		          strings.Append DrawStringShapeV(thisLine, xx + shadowSize, yy + shadowSize, tempFont, zoom)
		        End If
		      End If
		      
		      If f.Border Then
		        tempFont = f.Clone
		        tempFont.ForeColor = f.BorderColor
		        dy = -borderSize
		        'Sides
		        For dx = -borderSize/2 To borderSize/2
		          Strings.Append DrawStringShapeV(thisLine, xx+Round(dx), yy-borderSize, tempFont, zoom) ' Top
		          Strings.Append DrawStringShapeV(thisLine, xx+Round(dx), yy+borderSize, tempFont, zoom) ' Bottom
		          Strings.Append DrawStringShapeV(thisLine, xx-borderSize, yy+Round(dx), tempFont, zoom) ' Left
		          Strings.Append DrawStringShapeV(thisLine, xx+borderSize, yy+Round(dx), tempFont, zoom) 'Right
		        Next
		        'Corners
		        dy = -borderSize
		        For dx = borderSize/2 To borderSize
		          Strings.Append DrawStringShapeV(thisLine, xx+Round(dx), yy+dy, tempFont, zoom) 'Top-Left
		          Strings.Append DrawStringShapeV(thisLine, xx+Round(dx), yy-dy, tempFont, zoom) 'Bottom-Left
		          Strings.Append DrawStringShapeV(thisLine, xx-Round(dx), yy+dy, tempFont, zoom) 'Top-Right
		          Strings.Append DrawStringShapeV(thisLine, xx-Round(dx), yy-dy, tempFont, zoom) 'Bottom-Right
		          dy = dy + 1
		        Next
		      End If
		    End If
		    
		    '--- Draw string ---
		    If f <> Nil Then
		      f.OntoGraphics g, zoom
		      Strings.Append DrawStringShapeV(thisLine, xx, yy, f, zoom)
		    End If
		  Next i
		  Profiler.EndProfilerEntry
		  
		  If lineCount = 0 Then lineCount = 1
		  Page.Append Strings
		  h = FontFaceHeight(g, f) * lineCount
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
		Protected Function DrawStringShapeV(text As String, centerX As Double, baselineY As Double, f As Fontface, zoom As Double) As StringShape
		  //
		  // Just to save some typing along the way with all the StringShapes being done in DrawFontString
		  //
		  // Note that the x and y are in vector format (x is center, y is baseline)
		  //
		  // Ed Palmer, 12/05
		  //
		  
		  Dim s As New StringShape
		  
		  f.OntoStringShape s, zoom
		  s.x = centerX
		  s.y = baselineY
		  s.Text = text
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontFaceAscent(g As Graphics, f As FontFace) As Integer
		  ' Make sure the fontface is applied to the graphics object first
		  Dim height As Integer = g.TextAscent
		  If f = Nil Then Return height
		  If f.Border Then height = height + CalcBorderSize(g)
		  Return height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontFaceHeight(g As Graphics, f As FontFace) As Integer
		  ' Make sure the fontface is applied to the graphics object first
		  Dim height As Integer = g.TextHeight
		  If f = Nil Then Return height
		  If f.Border Then height = height + 2 * CalcBorderSize(g)
		  If f.Shadow Then height = height + CalcShadowSize(g)
		  Return height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontFaceWidth(g As Graphics, str As String, f As FontFace) As Integer
		  ' Make sure the fontface is applied to the graphics object first
		  Dim width As Integer = g.StringWidth(str)
		  If f = Nil Then Return width
		  If f.Border Then width = width + 2 * CalcBorderSize(g)
		  If f.Shadow Then width = width + CalcShadowSize(g)
		  Return width
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
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThicknessFactor"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
