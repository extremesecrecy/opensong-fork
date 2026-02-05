#tag Module
Protected Module SetML
	#tag Method, Flags = &h1
		Protected Function AddNodeToStyleDict(StyleDict As Dictionary, StyleNode As XmlNode, Key As String = "") As String
		  Dim tempSlideStyle As SlideStyle
		  
		  If StyleNode = Nil Then Return ""
		  
		  tempSlideStyle = New SlideStyle(StyleNode)
		  If Key = "" Then
		    // We'll just use the dictionary index as the key; this makes it unique if unimaginative
		    Key = str(StyleDict.Count)
		  End If
		  StyleDict.Value(Key) = tempSlideStyle
		  Return Key
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddSongSubtitles(Set As XmlDocument, StyleDict As Dictionary)
		  ' Now that we know the song's style, we can compose the subtitle's text
		  ' We do it here in advance because of REST and the external renderer
		  
		  Dim slide_groups As XmlNode
		  Dim slide_group As XmlNode
		  Dim xSlide As XmlNode
		  Dim style As SlideStyle
		  Dim subtitle As String
		  
		  slide_groups = SmartML.GetNode(Set.DocumentElement, "slide_groups")
		  If slide_groups <> Nil Then
		    slide_group = slide_groups.FirstChild
		  Else
		    Return
		  End If
		  
		  While slide_group <> Nil
		    If SmartML.GetValue(slide_group, "@type") = "song" Then
		      xSlide = SmartML.GetNode(slide_group, "slides/slide", False)
		      If xSlide Is Nil Then
		        style = GetStyle(StyleDict, SmartML.GetValue(slide_group, "style/@index"))
		      Else
		        style = SetML.GetSlideStyle(xSlide, StyleDict)
		      End If
		      subtitle = SongML.BuildSubtitle(slide_group, style)
		      SmartML.SetValue(slide_group, "subtitle", subtitle)
		      If Not (style Is Nil) Then
		        SmartML.SetValue(slide_group, "subtitle/@subtitle_list", style.SubtitleList)
		      End If
		    End If
		    
		    slide_group = slide_group.NextSibling
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildStyleDictFromDeck(xDoc As XmlDocument) As Dictionary
		  Dim xl As XmlNodeList
		  Dim styleNode As XmlNode
		  Dim key As String
		  Dim styleDict As New Dictionary
		  Dim style As SlideStyle
		  Dim presentationSettings As XmlNode
		  
		  // first handle the default styles
		  If App.MyPresentSettings <> Nil Then
		    presentationSettings = App.MyPresentSettings.DocumentElement
		    If PresentSettingsWindow <> Nil Then
		      styleNode = SmartML.GetNode(presentationSettings, "default_style", False)
		      If styleNode <> Nil Then
		        style = New SlideStyle(styleNode)
		        If style <> Nil Then
		          styleDict.Value("default_style") = style
		        End If
		      End If
		      styleNode = SmartML.GetNode(presentationSettings, "scripture_style", False)
		      If styleNode <> Nil Then
		        style = New SlideStyle(styleNode)
		        If style <> Nil Then
		          styleDict.Value("scripture_style") = style
		        End If
		      End If
		    End If
		  End If
		  
		  If xDoc <> Nil And xDoc.DocumentElement <> Nil And xDoc.DocumentElement.Name = "set" Then
		    xl = xDoc.DocumentElement.Xql("set/slide_groups/slide_group/song_style")
		    If xl <> Nil Then
		      For i As Integer = 0 To xl.Length - 1
		        styleNode = xl.Item(i)
		        key = SmartML.GetValue(styleNode, "@index", false)
		        If key <> "" Then
		          If Not styleDict.HasKey(key) Then
		            style = New SlideStyle(styleNode)
		            If style <> Nil Then
		              styleDict.Value(key) = style
		            End If
		          End If
		        End If
		      Next i
		    End If
		    
		    xl = xDoc.DocumentElement.Xql("set/slide_groups/slide_group/style[body]")
		    If xl <> Nil Then
		      For i As Integer = 0 To xl.Length - 1
		        styleNode = xl.Item(i)
		        key = SmartML.GetValue(styleNode, "@index", false)
		        If key <> "" Then
		          If Not styleDict.HasKey(key) Then
		            style = New SlideStyle(styleNode)
		            If style <> Nil Then
		              styleDict.Value(key) = style
		            End If
		          End If
		        End If
		      Next i
		    End If
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawSlide(g As Graphics, xslide As XmlNode, Style As SlideStyle)
		  //++EMP
		  // September 2005
		  // Copy of the original DrawSlide method, but with the style argument
		  // changed from a XmlNode to a SlideStyle
		  //
		  // Lots of changes here to support the separation of the slide style from the XML
		  // to speed up slide changes.
		  //
		  // width measurements are taken as Double for precision, and to avoid conversion
		  // height measurements are taken as Integer because coordinates for drawing are integers
		  
		  Profiler.BeginProfilerEntry CurrentMethodName ' --------------------------------------------------
		  Profiler.BeginProfilerEntry "DrawSlide>Declare 1" ' --------------------------------------------------
		  
		  Dim zoom, bodyZoom As Double
		  Dim background As Picture
		  Dim bodyFont, secondLanguageFont, titleFont, subtitleFont As FontFace
		  Dim gWidth As Double
		  Dim gHeight As  Integer
		  Dim MainHeight As Integer
		  Dim scale As Double
		  Dim Top, Left As Integer
		  Dim Subtitles() As String
		  Dim i As Integer
		  Dim titleMargins, subtitleMargins, bodyMargins As StyleMarginType
		  Dim bodyTabs() As StyleTabsType
		  Dim slideGroup As XmlNode
		  Dim slideType As String
		  
		  #if DebugBuild then
		    If xslide <> Nil Then
		      App.DebugWriter.Write(CurrentMethodName + " ItemNumber=" + Str(SmartML.GetValueN(xslide, "../../@ItemNumber", False)) + " type=" + SmartML.GetValue(xslide, "../../@type", False) + " name=" + SmartML.GetValue(xslide, "../../@name", False) + " section=" + SmartML.GetValue(xslide, "@id", False) + " idx=" + Str(SmartML.GetValueN(xslide, "@PresentationIndex", False)), 8)
		    End If
		  #endif
		  
		  // Second language feature -> show second language (every second line) in different style
		  Dim section As SectionMode = SectionMode.Normal
		  Dim separationMark As String
		  If SmartML.GetValueB(xslide, "@bilingual", False, False) Then
		    section = SectionMode.Bilingual
		    separationMark = SeparationMarkBilingual
		  Else
		    separationMark = ""
		  End If
		  
		  If xslide <> Nil Then
		    slideType = SmartML.GetValue(xslide.Parent.Parent, "@type")
		    
		    If slideType = "external" Then
		      // this is the preview, else we would not be here
		      // don't use the regular background, just use black with no image and no text
		      Style = New SlideStyle
		      Style.BGColor = RGB(0,0,0)
		      Style.BodyEnable = False
		      Style.TitleEnable = False
		      Style.SubtitleEnable = False
		      Style.BodyFont = New FontFace  // Nil FontFaces may throw exceptions ...
		      Style.TitleFont = New FontFace
		      Style.SubtitleFont = New FontFace
		      SmartML.SetValue(xslide.Parent.Parent, "@resize", "screen")
		      SmartML.SetValueB(xslide.Parent.Parent, "@keep_aspect", True)
		    End If
		  End If
		  
		  If Style <> Nil Then 'TODO: What if it's NIL?  Ain't gonna be pretty...
		    bodyFont = Style.BodyFont
		    secondLanguageFont = Style.SecondLanguageFont
		    titleFont = Style.TitleFont
		    subtitleFont = Style.SubtitleFont
		    
		    titleMargins = Style.TitleMargins
		    subtitleMargins = Style.SubtitleMargins
		    bodyMargins = Style.BodyMargins
		    bodyTabs = Style.BodyTabItems()
		  End If
		  
		  gWidth = g.Width
		  gHeight = g.Height
		  
		  zoom = gWidth / 640.0
		  titleFont.Size = titleFont.Size * zoom
		  subtitleFont.Size = subtitleFont.Size * zoom
		  ZoomMargins(titleMargins, zoom)
		  ZoomMargins(subtitleMargins, zoom)
		  ZoomMargins(bodyMargins, zoom)
		  
		  Profiler.EndProfilerEntry
		  Profiler.BeginProfilerEntry "DrawSlide>Background" ' --------------------------------------------------
		  
		  If Style <> Nil Then background = Style.Background().GetImage()
		  
		  // Paint the background color first.  That way the borders from any trimming will
		  // end up in that color.
		  g.ForeColor = Style.BGColor
		  g.FillRectangle(0, 0, gWidth, gHeight)
		  
		  If background <> Nil Then
		    Style.Background().Draw(g)
		  End If
		  
		  If xslide = Nil Then Return
		  
		  Dim pic As Picture = Nil
		  Dim resize As String
		  Dim keepaspect As Boolean
		  
		  slideGroup = xslide.Parent.Parent
		  slideType = SmartML.GetValue(slideGroup, "@type")
		  
		  Dim hasImage As Boolean = (slideType = "image") Or _
		  (slideType = "song" And SmartML.GetValue(slideGroup, "@subtype", False) = "image") Or _
		  (slideType = "external" And SmartML.GetValue(xslide,"preview") <> "")
		  
		  If hasImage Then
		    Profiler.BeginProfilerEntry "DrawSlide>ImageSlide-Fullscreen" ' --------------------------------------------------
		    Dim img As StyleImage
		    
		    img = New StyleImage()
		    If slideType = "external" Then
		      Call img.SetImageFromString(SmartML.GetValue(xslide,"preview"))
		    Else
		      Dim imagestring As String = SmartML.GetValue(xslide, "image")
		      If imagestring <> "" Then
		        Call img.SetImageFromString(imagestring)
		      Else
		        Dim imgFolderItem As FolderItem = SmartML.GetValueFI(xslide, "filename")
		        If imgFolderItem <> Nil Then
		          Call img.SetImageFromFile(imgFolderItem)
		        Else
		          Dim sImageFile As String = SmartML.GetValue(xslide, "filename")
		          Call img.SetImageFromFileName(sImageFile)
		        End If
		      End If
		    End If
		    
		    pic = img.GetImage()
		    If pic IsA Picture Then
		      resize = SmartML.GetValue(slideGroup, "@resize", False, "default")
		      If resize = "default" Then
		        If ImageDefaults.ResizeToScreenArea Then
		          resize = "screen"
		        ElseIf ImageDefaults.ResizeToBodyArea Then
		          resize = "body"
		        End If
		      End If
		      If SmartML.GetValue(slideGroup, "@keep_aspect", False, "default") <> "default" Then
		        keepaspect = SmartML.GetValueB(slideGroup, "@keep_aspect", False)
		      Else
		        keepaspect = ImageDefaults.KeepAspectRatio
		      End If
		      
		      If resize = "screen" Then
		        If keepaspect Then
		          If pic.Width / g.Width > pic.Height / g.Height Then
		            scale = g.Width / pic.Width
		          Else
		            scale = g.Height / pic.Height
		          End If
		          
		          g.DrawPicture( pic, (g.Width - (pic.Width * scale)) / 2, (g.Height - (pic.Height * scale)) / 2, pic.Width * scale, pic.Height * scale, 0, 0, pic.Width, pic.Height )
		        Else
		          g.DrawPicture( pic, 0, 0, g.Width, g.Height, 0, 0, pic.Width, pic.Height )
		        End If
		      ElseIf resize = "body" Then
		        // body is drawn after the (sub)titles
		      Else
		        // no resize - center
		        g.DrawPicture( pic, (g.Width / 2) - (pic.Width / 2), (g.Height / 2) - (pic.Height / 2), pic.Width, pic.Height, 0, 0, pic.Width, pic.Height )
		      End If
		    End If
		    Profiler.EndProfilerEntry
		  End If
		  
		  Profiler.EndProfilerEntry
		  
		  Profiler.BeginProfilerEntry "DrawSlide>Declare 2" ' --------------------------------------------------
		  Dim RealBorder, HeaderSize, FooterSize As Integer
		  Dim UsableWidth As Integer  // Max body width after margins are taken out (EMP 09/05)
		  
		  RealBorder = g.Width / 50
		  HeaderSize = 0
		  FooterSize = 0
		  
		  Profiler.EndProfilerEntry
		  Profiler.BeginProfilerEntry "DrawSlide>Title/Subtitle" ' --------------------------------------------------
		  
		  Dim subtitle As String
		  If Style.SubtitleEnable Then
		    If slideType = "song" Then
		      If SmartML.GetValue(slideGroup, "subtitle/@subtitle_list", False, "missing") = style.SubtitleList Then
		        subtitle = SmartML.GetValue(slideGroup, "subtitle")
		      Else
		        subtitle = SongML.BuildSubtitle(slideGroup, Style)
		        SmartML.SetValue(slideGroup, "subtitle", subtitle)
		        SmartML.SetValue(slideGroup, "subtitle/@subtitle_list", Style.SubtitleList)
		      End If
		    Else
		      subtitle = SmartML.GetValue(slideGroup, "subtitle")
		    End If
		    
		    If slideType = "image" Then
		      If SmartML.GetValueB(slideGroup, "@descriptions_in_subtitle", False) = True And SmartML.GetValue(xslide, "description", False) <> "" Then
		        If subtitle <> "" Then
		          subtitle = subtitle + Chr(10)
		        End If
		        subtitle = subtitle + SmartML.GetValue(xslide, "description", False)
		      End If
		    End If
		  End If
		  
		  // Subtitles can now be over one line long.  Split the subtitle string on newlines and iterate
		  Subtitles = Split(subtitle, Chr(10))
		  
		  // keep track of additional space used by drawing Title / Subtitle
		  Dim HeaderTextSize, FooterTextSize, TextSize As Integer
		  HeaderTextSize = 0
		  FooterTextSize = 0
		  If Style.TitleVAlign = "top" And Style.TitleEnable Then
		    TextSize = DrawSlideTitle(g, xslide, Style, 0, 0, titleFont, RealBorder, HeaderTextSize, FooterTextSize, titleMargins)
		    HeaderTextSize = HeaderTextSize + TextSize
		    If HeaderSize = 0 Then HeaderSize = titleMargins.Top + RealBorder
		    HeaderSize = HeaderSize + TextSize
		  End If
		  
		  // Draw subtitles
		  For i = 0 to UBound(Subtitles)
		    If Style.SubtitleVAlign = "top" Then
		      If Style.TitleEnable And Style.TitleVAlign = "top" Then
		        // the text is placed at subtitileMargins.Top + RealBorder + HeaderTextSize
		        // make sure this clears the title which comes down to titleMargins.Top + RealBorder + HeaderTextSize
		        If subtitleMargins.Top < titleMargins.Top Then
		          subtitleMargins.Top = titleMargins.Top
		        else
		          HeaderSize = HeaderSize + subtitleMargins.Top - titleMargins.Top
		        End If
		      End If
		      TextSize = DrawFontString(g, subtitles(i), _
		      0, 0, subtitleFont, RealBorder, HeaderTextSize, FooterTextSize, subtitleMargins, g.Width, Style.SubtitleAlign, g.Height, Style.SubtitleVAlign)
		      HeaderTextSize = HeaderTextSize + TextSize
		      If HeaderSize = 0 Then HeaderSize = subtitleMargins.Top + RealBorder
		      HeaderSize = HeaderSize + TextSize
		    Else
		      TextSize = DrawFontString(g, subtitles(Ubound(Subtitles) - i), _
		      0, 0, subtitleFont, RealBorder, HeaderTextSize, FooterTextSize, subtitleMargins, g.Width, Style.SubtitleAlign, g.Height, Style.SubtitleVAlign)
		      FooterTextSize = FooterTextSize + TextSize
		      If FooterSize = 0 Then FooterSize = subtitleMargins.Bottom + RealBorder
		      FooterSize = FooterSize + TextSize
		    End If
		  Next
		  If Style.TitleVAlign <> "top" And Style.TitleEnable Then
		    If Style.SubtitleEnable And Style.SubtitleVAlign <> "top" Then
		      // the title text is placed from the bottom up to titleMargins.Bottom + RealBorder + FooterTextSize
		      // make sure the title clears the subtitle which comes up to subtitleMargins.Bottom + RealBorder + FooterTextSize
		      If titleMargins.Bottom < subtitleMargins.Bottom Then
		        titleMargins.Bottom = subtitleMargins.Bottom
		      Else
		        FooterSize = FooterSize + titleMargins.Top - subtitleMargins.Top
		      End If
		    End If
		    TextSize = DrawSlideTitle(g, xslide, Style, 0, 0, titleFont, RealBorder, HeaderTextSize, FooterTextSize, titleMargins)
		    FooterTextSize = FooterTextSize + TextSize
		    If FooterSize = 0 Then FooterSize = titleMargins.Bottom + RealBorder
		    FooterSize = FooterSize + TextSize
		  End If
		  
		  Profiler.EndProfilerEntry
		  Profiler.BeginProfilerEntry "DrawSlide>Declare 3" ' --------------------------------------------------
		  
		  // adjust for picture resize="body" (Rect(Left,Top,Width,Height) = (bodyMargins.Left,HeadeSize,UsableWidth,MainHeight))
		  If HeaderSize < bodyMargins.Top Then
		    HeaderSize = bodyMargins.Top
		  End If
		  If FooterSize < bodyMargins.Bottom Then
		    FooterSize = bodyMargins.Bottom
		  End If
		  
		  MainHeight = gHeight - HeaderSize - FooterSize
		  UsableWidth = gWidth - bodyMargins.Left - bodyMargins.Right  // This just comes up again and again in the calcs & won't change
		  
		  Profiler.EndProfilerEntry
		  
		  If hasImage And MainHeight > 0 And UsableWidth > 0 Then
		    // The image was already prepared in the preparation before drawing (sub)title
		    If pic IsA Picture Then
		      If resize = "screen" Then
		        // Image was drawn before the (sub)titles
		      ElseIf resize = "body" Then
		        
		        Profiler.BeginProfilerEntry "DrawSlide>Background picture (not full screen)" ' --------------------------------------------------
		        
		        If keepaspect Then
		          UsableWidth =  UsableWidth + (2 * RealBorder)
		          
		          If pic.Width / UsableWidth > pic.Height / MainHeight Then
		            scale = UsableWidth / pic.Width
		          Else
		            scale = MainHeight / pic.Height
		          End If
		          
		          Select Case Style.BodyAlign
		          Case "right"
		            Left = bodyMargins.Left + UsableWidth - (pic.Width * scale)
		          Case "center"
		            Left = bodyMargins.Left + ((UsableWidth - (pic.Width * scale)) / 2)
		          Case Else
		            Left = bodyMargins.Left
		          End Select
		          
		          Select Case Style.BodyVAlign
		          Case "bottom"
		            Top = HeaderSize + MainHeight - pic.Height * scale
		          Case "middle"
		            Top = HeaderSize + ((MainHeight - (pic.Height * scale)) / 2)
		          Case Else
		            Top = HeaderSize
		          End Select
		          
		          g.DrawPicture( pic, Left, Top, pic.Width * scale, pic.Height * scale, 0, 0, pic.Width, pic.Height )
		        Else
		          g.DrawPicture( pic, bodyMargins.Left, HeaderSize, UsableWidth, MainHeight, 0, 0, pic.Width, pic.Height )
		        End If
		        
		        Profiler.EndProfilerEntry
		        
		      End If
		    End If
		  End If
		  
		  Profiler.BeginProfilerEntry "DrawSlide -> Draw body content"
		  
		  // check for body  ---------------------------------------------------------------------------------
		  Dim drawBody As Boolean = Style.BodyEnable
		  If slideType = "image" Or slideType = "blank" Then drawBody = False
		  If slideType = "song" And _
		    SmartML.GetValueB(slideGroup, "@background_as_text", False, False) And _
		    pic IsA Picture Then
		    drawBody = False
		  End If
		  
		  If drawBody Then
		    
		    // determine body area for drawing text
		    If hasImage And MainHeight > 0 And UsableWidth > 0 And resize = "body" Then  // the conditions from drawing the image with resize="body" above
		      // add a RealBorder all around
		      MainHeight = MainHeight - (2 * RealBorder)
		      UsableWidth = UsableWidth - (2 * RealBorder)
		      Left = bodyMargins.Left + RealBorder
		      Top = HeaderSize + RealBorder
		    Else
		      Left = bodyMargins.Left + RealBorder
		      UsableWidth = gWidth - bodyMargins.Left - bodyMargins.Right - 2 * RealBorder
		      Top = Max(bodyMargins.Top, HeaderSize) + RealBorder
		      MainHeight = gHeight - Top - (Max(bodyMargins.Bottom, FooterSize) + RealBorder)
		    End If
		    
		    Profiler.BeginProfilerEntry "DrawSlide -> prepare body text"  '-------------------------------------
		    
		    Dim lines(0) As String
		    Dim lineCountPerLanguage(2) As Integer  // Index 0 counts switches from 2nd to 1st (for gaps), 1 counts first language lines, 2 counts 2nd language lines
		    Dim lineHeightPerLanguage(2) As Integer
		    Dim bodyTextHeight As Integer
		    Dim splitLinePrefix As String = InsertAfterBreak(slideType)
		    
		    If SmartML.GetValueB(xslide, "@emphasize", False) And Style.HighlightChorus Then
		      bodyFont.Italic = Not bodyFont.Italic
		    End If
		    
		    lines = PrepareBodyText(SmartML.GetValue(xslide, "body", True), section, slideType, style, zoom, bodyFont, secondLanguageFont, UsableWidth, MainHeight, g, bodyTabs, splitLinePrefix, separationMark, lineCountPerLanguage, lineHeightPerLanguage, bodyZoom)
		    App.DebugWriter.Write CurrentMethodName + " bodyZoom = " + Str(bodyZoom), 6
		    
		    bodyTextHeight = lineCountPerLanguage(0) * lineHeightPerLanguage(0)
		    bodyTextHeight = bodyTextHeight + lineCountPerLanguage(1) * lineHeightPerLanguage(1)
		    bodyTextHeight = bodyTextHeight + lineCountPerLanguage(2) * lineHeightPerLanguage(2)
		    
		    Profiler.EndProfilerEntry
		    
		    // Post-shrink
		    
		    Profiler.BeginProfilerEntry "DrawSlide>Draw body text" ' --------------------------------------------------
		    
		    Dim secondLanguage As Boolean
		    Dim line As String
		    Dim f As FontFace
		    Dim x, y As Integer
		    
		    bodyFont.Size = bodyFont.Size * zoom * bodyZoom
		    secondLanguageFont.Size = secondLanguageFont.Size * zoom * bodyZoom
		    ZoomTabs(bodyTabs, zoom * bodyZoom)
		    
		    x = Left
		    y = Top
		    If section = SectionMode.Bilingual Then
		      If bodyTextHeight > MainHeight Then bodyTextHeight = MainHeight  // confine the drawn text to the body area
		      If Style.BodyVAlign = "middle" Then
		        y = y + (MainHeight - bodyTextHeight) / 2
		      ElseIf Style.BodyVAlign = "bottom" Then
		        y = y + MainHeight - bodyTextHeight
		      End If
		      lineHeightPerLanguage(0) = Ceil(Style.BiLanguageInterline(g, zoom * bodyZoom))
		      
		      secondLanguage = True
		      For i = 0 To UBound(lines)
		        line = lines(i)
		        
		        If Not line.StartsWith(separationMark) Then
		          secondLanguage = Not secondLanguage
		          If secondLanguage Then
		            f = secondLanguageFont
		          Else
		            f = bodyFont
		            If i > 0 Then
		              y = y + lineHeightPerLanguage(0)
		            End If
		          End If
		        Else
		          line = Mid(line, separationMark.Len + 1)
		        End If
		        If Style.BodyAlign = "center" Then line = line.Trim()
		        y = y + DrawFontString(g, line, x, y, f, UsableWidth, Style.BodyAlign, MainHeight - y + RealBorder, "top", bodyTabs, splitLinePrefix)
		        
		        If y >= gHeight - FooterSize Then Exit  // don't draw another line if in footer area
		      Next
		    Else
		      line = Join(Lines, Chr(10))
		      Call DrawFontString(g, line, x, y, bodyFont, UsableWidth, Style.BodyAlign, MainHeight, Style.BodyVAlign, bodyTabs, splitLinePrefix)
		    End If
		    
		    Profiler.EndProfilerEntry
		    
		    #if DebugBuild
		      If app.DebugWriter.Level >= 10 Then
		        'draw a rectangle indicating the margin area
		        g.ForeColor = RGB(255, 0, 255) 'Magenta - a color that is not likely to be used in a background...
		        g.DrawRect(Left, Top, UsableWidth, MainHeight)
		        
		        'draw a rectangle indicating the actual writing area
		        g.ForeColor = RGB(0, 255, 0) 'Bright Green - a color that is not likely to be used in a background...
		        g.DrawRect(Left - RealBorder, Top - RealBorder, UsableWidth + 2 * RealBorder, MainHeight + 2 * RealBorder)
		      End If
		    #endif
		  End If
		  
		  Profiler.EndProfilerEntry  // Draw body content
		  Profiler.EndProfilerEntry  // DrawSlide
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DrawSlideTitle(g As Graphics, xslide As XmlNode, Style as SlideStyle, x As Integer, y As Integer, f As FontFace, RealBorder as Integer, HeaderSize as Integer, FooterSize as Integer, titleMargins as StyleMarginType) As Integer
		  Dim presentation, slideId, currentVerse, verse as String
		  Dim parts() As String
		  Dim title As String
		  Dim titleHeight, drawHeight As Integer
		  Dim p As Integer
		  Dim main, curr, rest As String
		  Dim fontHeight, titleWidth, mainWidth, currWidth, restWidth As Integer
		  Dim fVerse, fCurrVerse As FontFace
		  Dim align As String
		  Dim currPart, section As String
		  Dim ChorusNr, PresentationIndex, currChorusNr As Integer
		  
		  titleHeight = 0
		  title = SmartML.GetValue(xslide.Parent.Parent, "title")
		  title = ReplaceAll(title, "|", Chr(10))
		  
		  If Style.TitleIncludeVerse Then
		    presentation = SmartML.GetValue(xslide.Parent.Parent, "presentation")
		    slideId = Trim(SmartML.GetValue(xslide, "@id"))
		    ChorusNr = (SmartML.GetValueN (xslide, "@ChorusNr"))
		    PresentationIndex = (SmartML.GetValueN (xslide, "@PresentationIndex"))
		    
		    If presentation <> "" And slideId <> "" Then
		      If Left(slideId, 1) = "V" Then
		        currentVerse = Trim(Mid(slideId, 2))
		      End If
		      
		      parts = presentation.split(" ")
		      currChorusNr = 0
		      For p = 0 To UBound(parts)
		        currPart = parts(p)
		        section = Left(currPart, 1)
		        If Len(currPart) > 1 Then
		          verse = Trim(Mid(currPart, 2))
		        Else
		          verse = ""
		        End If
		        
		        If section = "V" Then
		          If p + 1 = PresentationIndex Then
		            If main <> "" And curr = "" Then main = main + ", "
		            curr = currentVerse
		          Else
		            If verse <> "" Then
		              If curr = "" Then
		                If main <> "" Then
		                  main = main + ", "
		                End If
		                main = main + verse
		              Else
		                rest = rest + ", " + verse
		              End If
		            End If
		          End If
		        ElseIf section = "P" Then
		          If currPart = slideId Then
		            If main <> "" And curr = "" Then main = main + ", "
		            curr = App.T.Translate("songml/prechorus_abbreviation/@caption")
		          End If
		        ElseIf section = "C" Then
		          currChorusNr = currChorusNr + 1
		          If currPart = slideId Then
		            If ChorusNr = Val(verse) And currChorusNr < ChorusNr Then
		              'Fix verse display for presentation order C1 V1 C2 V2 C2 V3 C2
		              currChorusNr = ChorusNr
		            End If
		            If ChorusNr = currChorusNr Then
		              If main <> "" And curr = "" Then main = main + ", "
		              curr = App.T.Translate("songml/chorus_abbreviation/@caption")
		            End If
		          End If
		        ElseIf section = "B" Then
		          If currPart = slideId Then
		            If main <> "" And curr = "" Then main = main + ", "
		            curr = App.T.Translate("songml/bridge_abbreviation/@caption")
		          End If
		        ElseIf section = "T" Then
		          If currPart = slideId Then
		            If main <> "" And curr = "" Then main = main + ", "
		            curr = App.T.Translate("songml/tag_abbreviation/@caption")
		          End If
		        End If
		        
		      Next
		      If curr = "" And currChorusNr > 0 Then
		        'probaly never true, for emergency only, add to the end
		        If main <> "" And curr = "" Then main = main + ", "
		        curr = App.T.Translate("songml/chorus_abbreviation/@caption")
		      End If
		      
		      fVerse = f.Clone()
		      fVerse.Bold = False
		      fCurrVerse = f.Clone()
		      If main <> "" Or rest <> "" Then
		        fCurrVerse.Bold = True
		      End If
		      
		      If main <> "" Or curr <> "" Or rest <> "" Then
		        main = ": " + main
		      End If
		      title = Trim(title)
		      
		      f.OntoGraphics(g)
		      fontHeight = FontFaceHeight(g, f) + FontFaceAscent(g, f)
		      titleHeight = CountFields(title, Chr(10)) * fontHeight
		      titleWidth = FontFaceWidth(g, title, f)
		      fVerse.OntoGraphics(g)
		      If rest <> "" Then restWidth = FontFaceWidth(g, rest, fVerse)
		      If main <> "" Then mainWidth = FontFaceWidth(g, main, fVerse)
		      fCurrVerse.OntoGraphics(g)
		      If curr <> "" Then currWidth = FontFaceWidth(g, curr, fCurrVerse)
		      
		      align = Style.TitleAlign
		      If align = "center" Then
		        x = x + (g.Width / 2) - ((titleWidth + mainWidth + currWidth + restWidth) / 2)
		        align = "left"
		      End If
		      
		      If align = "left" Then
		        drawHeight = DrawFontString(g, title, _
		        x, y, f, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width, align, g.Height, Style.TitleVAlign)
		        If drawHeight > titleHeight Then titleHeight = drawHeight
		        titleMargins.Left = titleMargins.Left + titleWidth
		        
		        'Adjust the starting y position to make sure the verses have the same vertical alignment as a multiline title
		        If Style.TitleVAlign = "top" Then
		          y = y + (titleHeight - fontHeight)
		        End If
		        
		        If main <> "" Then
		          drawHeight = DrawFontString(g, main, _
		          x+titleWidth, y, fVerse, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width, align, g.Height, Style.TitleVAlign)
		          If drawHeight > titleHeight Then titleHeight = drawHeight
		          titleMargins.Left = titleMargins.Left + mainWidth
		        End If
		        If curr <> "" Then
		          drawHeight = DrawFontString(g, curr, _
		          x+titleWidth+mainWidth, y, fCurrVerse, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width, align, g.Height, Style.TitleVAlign)
		          If drawHeight > titleHeight Then titleHeight = drawHeight
		          titleMargins.Left = titleMargins.Left + currWidth
		        End If
		        If rest <> "" Then
		          drawHeight = DrawFontString(g, rest, _
		          x+titleWidth+mainWidth+currWidth, y, fVerse, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width, align, g.Height, Style.TitleVAlign)
		          If drawHeight > titleHeight Then titleHeight = drawHeight
		        End If
		        
		      ElseIf align = "right" Then
		        'Adjust the value for calculating the starting y position to make sure the verses have the same vertical alignment as a multiline title
		        If Style.TitleVAlign = "bottom" Then
		          fontHeight = titleHeight
		        End If
		        
		        If rest <> "" Then
		          drawHeight = DrawFontString(g, rest, _
		          x, y + (titleHeight - fontHeight), fVerse, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width, align, g.Height, Style.TitleVAlign)
		          If drawHeight > titleHeight Then titleHeight = drawHeight
		          titleMargins.Right = titleMargins.Right+restWidth
		        End If
		        If curr <> "" Then
		          drawHeight = DrawFontString(g, curr, _
		          x, y + (titleHeight - fontHeight), fCurrVerse, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width-restWidth, align, g.Height, Style.TitleVAlign)
		          If drawHeight > titleHeight Then titleHeight = drawHeight
		          titleMargins.Right = titleMargins.Right+currWidth
		        End If
		        If main <> "" Then
		          drawHeight = DrawFontString(g, main, _
		          x, y + (titleHeight - fontHeight), fVerse, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width-restWidth-currWidth, align, g.Height, Style.TitleVAlign)
		          If drawHeight > titleHeight Then titleHeight = drawHeight
		          titleMargins.Right = titleMargins.Right+mainWidth
		        End If
		        drawHeight = DrawFontString(g, title, _
		        x, y + (titleHeight - fontHeight), f, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width-restWidth-currWidth-mainWidth, align, g.Height, Style.TitleVAlign)
		        If drawHeight > titleHeight Then titleHeight = drawHeight
		      End If
		      
		    Else
		      titleHeight = DrawFontString(g, title, _
		      x, y, f, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width, Style.TitleAlign, g.Height, Style.TitleVAlign)
		    End If
		    
		  Else
		    titleHeight = DrawFontString(g, title, _
		    x, y, f, RealBorder, HeaderSize, FooterSize, titleMargins, g.Width, Style.TitleAlign, g.Height, Style.TitleVAlign)
		  End If
		  
		  Return titleHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DrawTitle(g As Graphics, xslide As XmlNode, xstyle As XmlNode, x As Integer, y As Integer, width As Integer, align As String, valign As String) As Integer
		  Dim i, oldY, newX As Integer
		  Dim zoom As Double
		  Dim title, subtitle As String
		  Dim titleStyle, subtitleStyle As FontFace
		  
		  titleStyle = SmartML.GetValueF(xstyle, "title")
		  subtitleStyle = SmartML.GetValueF(xstyle, "subtitle")
		  
		  oldY = y
		  zoom = g.Width / 640
		  
		  title = SmartML.GetValue(xslide.Parent.Parent, "title")
		  subtitle = SmartML.GetValue(xslide.Parent.Parent, "subtitle")
		  
		  For i = 1 To 2
		    ' ----- SUBTITLE -----
		    If (i = 1 And valign = "bottom") Or (i = 2 And valign = "top") Then
		      subtitleStyle.Size = subtitleStyle.Size * zoom
		      subtitleStyle.OntoGraphics g
		      
		      If align = "right" Then
		        newX = x + width - FontFaceWidth(g, subtitle, subtitleStyle)
		      ElseIf align = "center" Then
		        newX = x + (width - FontFaceWidth(g, subtitle, subtitleStyle)) / 2
		      Else
		        newX = x
		      End If
		      If valign = "top" Then y = y + FontFaceHeight(g, subtitleStyle)
		      
		      Call DrawFontString(g, subtitle, newX, y, subtitleStyle, 0, "left", 0, "bottom")
		      
		      If valign = "bottom" Then y = y - FontFaceHeight(g, subtitleStyle)
		      If valign = "top" Then Return y - oldY
		    End If
		    
		    ' ----- TITLE -----
		    If (i = 1 And valign = "top") Or (i = 2 And valign = "bottom") Then
		      titleStyle.Size = titleStyle.Size * zoom
		      titleStyle.OntoGraphics g
		      
		      If valign = "top" Then y = y + FontFaceAscent(g, titleStyle)
		      
		      If align = "right" Then
		        newX = x + width - FontFaceWidth(g, title, titleStyle)
		      ElseIf align = "center" Then
		        newX = x + (width - FontFaceWidth(g, title, titleStyle)) / 2
		      Else
		        newX = x
		      End If
		      
		      Call DrawFontString(g, title, newX, y, titleStyle, 0, "left", 0, "bottom")
		      
		      If valign = "bottom" Then
		        y = y - FontFaceAscent(g, titleStyle)
		        Return oldY - y
		      End If
		    End If
		    
		  Next i
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindVerticalZoomFactor(g As Graphics, Style As SlideStyle, zoom As Double, bodyZoom As Double, lineCountPerLanguage() As Integer, lineHeightPerLanguage() As Integer, MainHeight As Integer, ByRef minimumReached As Boolean) As Double
		  // return bodyZoom scaled such that vertical space is well used but not overused
		  // non-linear scaling of border and shadow and gc.TextHeight messes things up a little ...
		  
		  Dim gc As Graphics
		  Dim bodyHeight1, bodyHeight2 As Integer
		  Dim lh2(3) As Integer
		  Dim bilingual As Boolean
		  Dim oldFactor, factor As Double
		  Dim bodyFont, l2Font As FontFace
		  Dim maxTextHeight As Integer
		  Dim kScrew As Double = 100
		  
		  gc = g.Clip(0, 0, g.Width, g.Height)
		  
		  bilingual = lineCountPerLanguage(2) > 0
		  minimumReached = False
		  
		  If Not bilingual Then
		    bodyFont = Style.BodyFont
		    maxTextHeight = Floor(MainHeight / lineCountPerLanguage(1))
		    bodyHeight1 = lineCountPerLanguage(1) * lineHeightPerLanguage(1)
		    factor = zoom * bodyZoom * MainHeight / bodyHeight1
		    oldFactor = zoom * bodyZoom
		    bodyFont.OntoGraphics(gc, oldFactor)
		    If gc.TextHeight <= 4 Or gc.TextSize <= 1 Then
		      minimumReached = True
		      Return (bodyZoom)
		    End If
		    Do
		      bodyFont.OntoGraphics(gc, factor)
		      lh2(1) = FontFaceHeight(gc, bodyFont)
		      If lh2(1) <= maxTextHeight Then Exit
		      If gc.TextHeight <= 4 Or gc.TextSize <= 1 Then
		        minimumReached = True
		        Exit
		      End If
		      factor = factor * (1 - 1 / (lh2(1) * kScrew))
		    Loop
		    If lh2(1) <= maxTextHeight Then
		      Do
		        oldFactor = factor
		        factor = factor * (1 + 1 / (maxTextHeight * kScrew))
		        bodyFont.OntoGraphics(gc, factor)
		        lh2(1) = FontFaceHeight(gc, bodyFont)
		        If lh2(1) > maxTextHeight Then
		          factor = oldFactor
		          Exit
		        End
		      Loop
		    End If
		  Else
		    bodyHeight1 = _
		    lineCountPerLanguage(0) * lineHeightPerLanguage(0) + _
		    lineCountPerLanguage(1) * lineHeightPerLanguage(1) + _
		    lineCountPerLanguage(2) * lineHeightPerLanguage(2)
		    factor = zoom * bodyZoom * MainHeight / bodyHeight1
		    bodyFont = Style.BodyFont
		    l2Font = Style.SecondLanguageFont
		    oldFactor = zoom * bodyZoom
		    bodyFont.OntoGraphics(gc, oldFactor)
		    If gc.TextHeight <= 4 Or gc.TextSize <= 1 Then
		      minimumReached = True
		      Return (bodyZoom)
		    End If
		    l2Font.OntoGraphics(gc, oldFactor)
		    If gc.TextHeight <= 4 Or gc.TextSize <= 1 Then
		      minimumReached = True
		      Return (bodyZoom)
		    End If
		    Do
		      bodyFont.OntoGraphics(gc, factor)
		      If gc.TextHeight <= 4 Or gc.TextSize <= 1 Then minimumReached = True
		      lh2(1) = FontFaceHeight(gc, bodyFont)
		      l2Font.OntoGraphics(gc, factor)
		      lh2(2) = FontFaceHeight(gc, l2Font)
		      lh2(0) = Ceil(Style.BiLanguageInterline(gc, factor))
		      bodyHeight2 = _
		      lineCountPerLanguage(0) * lh2(0) + _
		      lineCountPerLanguage(1) * lh2(1) + _
		      lineCountPerLanguage(2) * lh2(2)
		      If bodyHeight2 <= MainHeight Then Exit
		      If gc.TextHeight <= 4 Or gc.TextSize <= 1 Then minimumReached = True
		      If minimumReached Then Exit
		      factor = factor * (1 - 1 / (Max(lh2(0), lh2(1), lh2(2)) * kScrew))
		    Loop
		    If bodyHeight2 < MainHeight Then
		      Do
		        oldFactor = factor
		        factor = factor * (1 + 1 / (Max(lh2(0), lh2(1), lh2(2)) * kScrew))
		        bodyFont.OntoGraphics(gc, factor)
		        lh2(1) = FontFaceHeight(gc, bodyFont)
		        l2Font.OntoGraphics(gc, factor)
		        lh2(2) = FontFaceHeight(gc, l2Font)
		        lh2(0) = Ceil(Style.BiLanguageInterline(gc, factor))
		        bodyHeight2 = _
		        lineCountPerLanguage(0) * lh2(0) + _
		        lineCountPerLanguage(1) * lh2(1) + _
		        lineCountPerLanguage(2) * lh2(2)
		        If bodyHeight2 > MainHeight Then
		          factor = oldFactor
		          Exit
		        End If
		      Loop
		    End If
		  End If
		  Return (factor / zoom)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetNextSlide(xSlide As XmlNode) As XmlNode
		  Dim slide_group As XmlNode
		  
		  If xslide.NextSibling <> Nil Then
		    Return xslide.NextSibling
		  Else
		    slide_group = xSlide.Parent.Parent.NextSibling
		    Do Until slide_group = Nil Or SmartML.GetValue(slide_group, "@type") <> "style"
		      slide_group = slide_group.NextSibling
		    Loop
		    
		    If slide_group <> Nil Then
		      Return SmartML.GetNode(slide_group, "slides", True).FirstChild
		    Else
		      Return Nil
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPrevSlide(xSlide As XmlNode) As XmlNode
		  Dim slide_group As XmlNode
		  
		  If xslide.PreviousSibling <> Nil Then
		    Return xslide.PreviousSibling
		  Else
		    slide_group = xSlide.Parent.Parent.PreviousSibling
		    Do Until slide_group = Nil Or SmartML.GetValue(slide_group, "@type") <> "style"
		      slide_group = slide_group.PreviousSibling
		    Loop
		    If slide_group <> Nil Then
		      Return SmartML.GetNode(slide_group, "slides", True).LastChild
		    Else
		      Return Nil
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetSetItem(xSet As XmlDocument, index As Integer) As XmlNode
		  Dim slide_groups As XmlNode
		  Dim i As Integer
		  i = 1
		  
		  slide_groups = SmartML.GetNode(xSet.DocumentElement, "slide_groups", True)
		  If slide_groups = Nil Or index < 1 Or index > slide_groups.ChildCount Then
		    Return Nil
		  Else
		    Return slide_groups.Child(index-1)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetSlide(xSet As XmlDocument, index As Integer) As XmlNode
		  // index is one-based
		  If index < 1 Then
		    App.DebugWriter.Write CurrentMethodName + ": Received request for an out-of-bounds slide. Returning Nil. Requested slide: " + Str(index), 3
		    Return Nil
		  End If
		  
		  Dim xNodes As XMLNodeList
		  Dim xQuery As String
		  
		  xQuery = "/set/slide_groups/slide_group[@type!=""style""]/slides/slide"
		  
		  Try
		    xNodes = xSet.XQL(xQuery)
		    
		    If xNodes = Nil Then Return Nil
		    If xNodes.Length = 0 Then Return Nil
		    If index > xNodes.Length Then
		      App.DebugWriter.Write CurrentMethodName + StringUtils.Sprintf(": Received a request for an out-of-bounds slide. Requested: %s; Last slide: %s", index, xNodes.Length), 3
		      App.DebugWriter.Write CurrentMethodName + ": Returning last slide", 3
		    End If
		    Return xNodes.Item(index - 1)
		    
		  Catch ex As RuntimeException
		    
		    App.DebugWriter.Write CurrentMethodName + ": Got a " + Introspection.GetType(ex).Name + " while getting index " + Str(index), 3
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetSlideGroupCaption(SlideGroup As XmlNode) As String
		  Dim set_item_name As String = SmartML.GetValue(slideGroup, "@name", True)
		  Dim set_item_type As String = SmartML.GetValue(slideGroup, "@type", True)
		  If set_item_type = "style" Then
		    // style has no user provided name, thus the name needs to be translated; additionally the action goes to the type
		    If SmartML.GetValue(slideGroup, "@action", True) = "revert" Then
		      set_item_name = App.T.Translate("sets_mode/items/revert")
		      set_item_type = "revert"
		    Else
		      set_item_name = App.T.Translate("sets_mode/items/style")
		    End If
		  End If
		  
		  Dim set_item_caption As String = App.T.Translate("sets_mode/items/"+set_item_type+"/@caption")
		  If set_item_type = "external" Then
		    Dim subtype As String = SmartML.GetValue(SlideGroup, "@application", False)
		    If subtype <> "" Then
		      Dim found As Boolean
		      subtype = App.T.Translate("external_slide/" + subtype + "/@caption", found)
		      If found Then set_item_caption = "(" + subtype + ")"
		    End If
		  End If
		  If set_item_type = "" or set_item_caption = "" Then // unknown slide type
		    App.DebugWriter.Write CurrentMethodName + ": Unknown slide type '" + set_item_type + "/@caption" + "'", 2
		    set_item_caption = "*ERROR*"
		  End If
		  Return set_item_name + " " + set_item_caption
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetSlideStyle(xSlide As XmlNode) As SlideStyle
		  Dim StyleDict As Dictionary
		  If Globals.Status_Presentation Then
		    StyleDict = PresentWindow.StyleDict
		  Else
		    StyleDict = BuildStyleDictFromDeck(xSlide.OwnerDocument)
		  End If
		  Return GetSlideStyle(xSlide, StyleDict)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetSlideStyle(xSlide As XmlNode, StyleDict As Dictionary) As SlideStyle
		  Dim styleNode As XmlNode
		  Dim styleIndex As String
		  
		  styleNode = SmartML.GetNode(xSlide.Parent.Parent, "style")
		  styleIndex = SmartML.GetValue(styleNode, "@index", False)
		  If styleIndex = "" Or GetStyle(StyleDict, styleIndex) = Nil Then
		    styleIndex = "default_style"
		    If xSlide <> Nil Then
		      If xSlide.Parent <> Nil Then
		        If SmartML.GetValue(xSlide.Parent.Parent, "@type", False) = "scripture" Then
		          styleIndex = "scripture_style"
		        End If
		      End If
		    End If
		  End If
		  
		  Return GetStyle(StyleDict, styleIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetSlideTransition(xSlide As XmlNode) As SlideTransitionEnum
		  Dim transition As SlideTransitionEnum
		  Dim slide_group As XmlNode
		  Dim t As Integer
		  
		  transition = SlideTransitionEnum.ApplicationDefault
		  
		  If xslide <> Nil Then
		    slide_group = xSlide.Parent.Parent
		    If slide_group <> Nil Then
		      t = SmartML.GetValueN(slide_group, "@transition", False)
		      Select Case t
		      Case 1
		        transition = SlideTransitionEnum.UseTransition
		      Case 2
		        transition = SlideTransitionEnum.NoTransition
		      Case Else
		        transition = SlideTransitionEnum.ApplicationDefault
		      End Select
		    End If
		  End If
		  
		  Return transition
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSong(slidegroup As XmlNode, Songs As FolderDB, ByRef songFolder As String) As XmlDocument
		  Dim songDoc As XmlDocument
		  Dim songF as FolderItem
		  
		  If slidegroup <> Nil Then
		    
		    songFolder = Songs.CleanPath(SmartML.GetValue(slidegroup, "@path", False))
		    songf = Songs.GetFile(songFolder, SmartML.GetValue(slidegroup, "@name", False))
		    If songf = Nil Or (Not songf.Exists) Then
		      songDoc = Nil
		    Else
		      songDoc = SmartML.XDocFromFile(songf)
		      If songDoc = Nil Then
		        InputBox.Message App.T.Translate("errors/bad_format", SmartML.GetValue(slidegroup, "@name", False), SmartML.ErrorString)
		      Else
		        ' Can be used by an external renderer.
		        Dim pathnode As XmlNode = songDoc.FirstChild.AppendChild(songDoc.CreateElement("path"))
		        pathnode.AppendChild(songDoc.CreateTextNode(songfolder))
		      End If
		      If Not songF.IsFolder Then
		        songF = songF.Parent
		      End If
		      If songF <> Nil Then
		        songFolder = Songs.CleanPath(Songs.DBPathFromFolderItem(songF))
		      End If
		    End If
		  Else
		    songFolder = ""
		  End If
		  
		  Return songDoc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStyle(StyleDict As Dictionary, Key As String) As SlideStyle
		  //++EMP
		  // September 2005
		  // Returns the SlideStyle referenced by the key
		  //
		  If Not StyleDict.HasKey(Key) Then Return Nil
		  Return StyleDict.Value(Key)
		  //--EMP
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ImportExternals(byRef setDoc As XmlDocument, PresentMode As Integer, PresentScreen As Integer)
		  Dim slide_group, slide_groups As XmlNode
		  Dim slidesCount As Integer = 0
		  Dim embeddedFilesBase As FolderItem = GetTemporaryFolderItem()
		  Try
		    embeddedFilesBase.Delete()
		    embeddedFilesBase.CreateAsFolder()
		  Catch
		  End Try
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  slide_groups = SmartML.GetNode(setDoc.DocumentElement, "slide_groups", True)
		  
		  ProgressWindow.lbl_status.Text = App.T.Translate("progress_status/load_externals") + "..."
		  ProgressWindow.SetMaximum(slide_groups.ChildCount())
		  ProgressWindow.SetProgress(slidesCount)
		  ProgressWindow.CanCancel False
		  ProgressWindow.SetStatus("")
		  ProgressWindow.Show()
		  
		  slide_group = slide_groups.FirstChild
		  While slide_group <> Nil
		    slidesCount = slidesCount + 1
		    If SmartML.GetValue(slide_group, "@type", True) = "external" Then
		      ProgressWindow.SetStatus(slide_group.GetAttribute("name"))
		      
		      Select Case SmartML.GetValue(slide_group, "@application")
		      Case "presentation"
		        
		        Dim presFileName As String
		        Dim presFile As FolderItem
		        
		        presFile = SmartML.GetValueFI(slide_group, "@filename")
		        If presFile = Nil Then
		          presFileName = SmartML.GetValue(slide_group, "@filename")
		        Else
		          presFileName = presFile.NativePath
		        End If
		        
		        Dim embedFiledata As String = SmartML.GetValue(slide_group, "file", False)
		        If embedFiledata.Len() > 0 Then
		          Try
		            Dim tempFileName As String
		            If presFile <> Nil Then
		              tempFileName = presFile.Name
		            Else
		              tempFileName = FileUtils.LastPathPart(presFileName)
		            End If
		            presFile = embeddedFilesBase.Child(tempFileName)
		            
		            Dim outputStream As BinaryStream = BinaryStream.Create(presFile, True)
		            outputStream.Write DecodeBase64(embedFiledata)
		            outputStream.Close
		            
		            SmartML.SetValue slide_group, "@_localfilename", presFile.NativePath()
		          Catch
		            InputBox.Message App.T.Translate("errors/fileutils/temporaryfailed", presFileName)
		          End Try
		        End If
		        
		        Dim presFileOk As Boolean = False
		        If Not IsNull(presFile) Then
		          If presFile.Exists() Then
		            
		            presFileOk = True
		            Dim presHost As PresentationHost = PresentationHost.Automatic
		            Select Case SmartML.GetValue(slide_group, "@host")
		            Case "ppt"
		              presHost = PresentationHost.PowerPoint
		            Case "pptview"
		              presHost = PresentationHost.PowerPointViewer
		            Case "impress"
		              presHost = PresentationHost.OpenOffice
		            End Select
		            
		            Dim oExtPres As iPresentation = PresentationFactory.GetOrCreate(presFile.NativePath, presHost)
		            If Not IsNull(oExtPres) Then
		              
		              If oExtPres.CanControl() Then
		                Dim img As StyleImage
		                Dim i As Integer
		                Dim w, h As Integer
		                Dim getPreview As Boolean = False
		                Dim noteText As String
		                
		                Dim presSlides As XmlNode = SmartML.InsertChild(slide_group, "slides", 0)
		                Dim presSlideCount As Integer = oExtPres.SlideCount()
		                
		                If (PresentMode <> PresentWindow.MODE_SINGLE_SCREEN) And presSlideCount > 0 And oExtPres.CanPreview() Then
		                  Dim landscape As Boolean
		                  getPreview = True
		                  
		                  img = New StyleImage()
		                  
		                  If PresentMode = PresentWindow.MODE_PREVIEW Then
		                    Dim b As REALbasic.Rect
		                    b = OSScreen(PresentScreen).Bounds
		                    landscape = b.Width >= b.Height
		                    If SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "monitors/@force_4_3_preview", False, False) Then
		                      If landscape Then
		                        w = 3 * 240
		                        h = 4 * 240
		                      Else
		                        w = 4 * 240
		                        h = 3 * 240
		                      End If
		                    End If
		                    
		                    If SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "monitors/@force_16_9_preview", False, False) Then
		                      If landscape Then
		                        w = 16 * 80
		                        h = 9 * 80
		                      Else
		                        w = 9 * 80
		                        h = 16 * 80
		                      End If
		                    End If
		                  Else
		                    w = OSScreen(PresentScreen).Width
		                    h = OSScreen(PresentScreen).Height
		                    While w * h > 640000
		                      w = w \ 2
		                      h = h \ 2
		                    Wend
		                  End If
		                End If
		                
		                For i = 1 To presSlideCount
		                  
		                  If Not oExtPres.IsHidden(i) Then
		                    Dim presSlide As XmlNode = SmartML.InsertChild(presSlides, "slide", presSlides.ChildCount())
		                    SmartML.SetValueN(presSlide, "@id", i)
		                    SmartML.SetValue(presSlide, "description", oExtPres.SlideName(i))
		                    
		                    If getPreview Then
		                      img.SetImage(oExtPres.PreviewSlide(i, w, h))
		                      SmartML.SetValue(presSlide, "preview", img.GetImageAsString())
		                    End If
		                    
		                    If PresentMode <> PresentWindow.MODE_SINGLE_SCREEN Then
		                      noteText = oExtPres.PresenterNotes(i)
		                      If noteText <> "" Then
		                        SmartML.SetValue(presSlide, "notes", noteText)
		                      End If
		                    End If
		                  End If
		                  
		                Next
		              End If
		              
		            Else
		              InputBox.Message App.T.Translate("errors/presentations/load_failed", presFile.NativePath)
		            End If
		            
		          Else
		            InputBox.Message App.T.Translate("errors/fileutils/filenotfound", presFile.NativePath)
		          End If
		        End If
		        
		        If Not presFileOk Then
		          InputBox.Message App.T.Translate("errors/fileutils/destdoesnotexisterror", presFileName)
		        End If
		        
		      Case "videolan"
		        Dim videolanLocation As FolderItem = App.MainPreferences.GetValueFI(Prefs.kVideolanLocation, Nil, False)
		        If Not IsNull(videolanLocation) And videolanLocation.Exists Then
		          Dim mediaFileName, tempFileName As String
		          Dim mediaFile As FolderItem
		          
		          Dim embedFiledata As String = SmartML.GetValue(slide_group, "file", False)
		          If embedFiledata.Len() > 0 Then
		            Try
		              mediaFile = GetTemporaryFolderItem()
		              mediaFileName = SmartML.GetValue(slide_group, "@filename")
		              tempFileName = mediaFile.Name + FileUtils.Extension(mediaFileName, True)
		              Try
		                mediaFile.Delete()
		              Catch
		              End Try
		              mediaFile = embeddedFilesBase.Child(tempFileName)
		              
		              Dim outputStream As BinaryStream = BinaryStream.Create(mediaFile, True)
		              outputStream.Write DecodeBase64(embedFiledata)
		              outputStream.Close
		              
		              mediaFileName = mediaFile.NativePath()
		              SmartML.SetValue slide_group, "@_localfilename", mediaFileName
		            Catch
		              InputBox.Message App.T.Translate("errors/fileutils/temporaryfailed", mediaFileName)
		              mediaFile = Nil
		            End Try
		          End If
		          
		          If mediaFile = Nil Then
		            mediaFile = SmartML.GetValueFI(slide_group, "@filename")
		            If mediaFile = Nil Then
		              mediaFileName = Trim(SmartML.GetValue(slide_group, "@filename"))
		              If mediaFileName <> "" Then
		                mediaFile = GetFolderItem(mediaFileName, FileUtils.PathType)
		              End If
		            Else
		              mediaFileName = mediaFile.NativePath
		            End If
		          End If
		          
		          If mediaFileName = "" Then
		            Dim videoLanParams As String = SmartML.GetValue(slide_group, "@videolan_parameters", False)
		            If videoLanParams.InStrB("%s") > 0 Then
		              InputBox.Message App.T.Translate("errors/videolan/no_medium_in_slide", SetML.GetSlideGroupCaption(slide_group))
		            End If
		          ElseIf IsNull(mediaFile) Then
		            // mediaFileName might be a URL or MRL (Media Resource Locator)
		          ElseIf Not mediaFile.Exists() Then
		            InputBox.Message App.T.Translate("errors/fileutils/filenotfound", mediaFileName)
		          End If
		        Else
		          InputBox.Message App.T.Translate("errors/videolan_app_missing")
		        End If
		        
		      Case "launch"
		        // No action required here
		        // As early warning, we will check if the application that is to be started does exist
		        
		        Dim appFileName As String
		        Dim appFile As FolderItem = SmartML.GetValueFI(slide_group, "@app_filename")
		        If appFile = Nil Then
		          appFileName = SmartML.GetValue(slide_group, "@app_filename")
		        Else
		          appFileName = appFile.NativePath
		        End
		        Dim appFileOk As Boolean = False
		        If Not IsNull(appFile) Then
		          If appFile.Exists() Then
		            appFileOk = True
		          End If
		        End If
		        
		        If Not appFileOk Then
		          InputBox.Message App.T.Translate("errors/fileutils/destdoesnotexisterror", appFileName)
		        End If
		        
		      End Select
		    End If
		    
		    slide_group = slide_group.NextSibling
		    ProgressWindow.SetProgress(slidesCount)
		  Wend
		  
		  ProgressWindow.Close()
		  App.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ImportSongs(setDoc As XmlDocument, AddToLog As Boolean, embedHtml As Boolean = True, hideProgress As Boolean = False)
		  Dim slide_group, slide_groups As XmlNode
		  Dim songDoc As XmlDocument
		  Dim Presentation As String
		  Dim Notes As String
		  Dim ItemNumber As Integer
		  Dim StyleGroupCount As Integer = 0
		  Dim i As Integer
		  Dim Transition As Integer
		  Dim SetItemStyle, SongStyle As XmlNode
		  Dim songPath As String
		  Dim setListIndex As Integer
		  
		  App.MouseCursor = System.Cursors.Wait
		  slide_groups = SmartML.GetNode(setDoc.DocumentElement, "slide_groups", True)
		  slide_group = slide_groups.FirstChild
		  
		  If Not hideProgress Then
		    ProgressWindow.lbl_status.Text = App.T.Translate("progress_status/load_songs") + "..."
		    ProgressWindow.SetMaximum( slide_groups.ChildCount() )
		    ProgressWindow.SetProgress(ItemNumber)
		    ProgressWindow.CanCancel False
		    ProgressWindow.SetStatus( "" )
		    ProgressWindow.Show()
		  End If
		  
		  ItemNumber = 1
		  setListIndex = 0
		  i = 1
		  While slide_group <> Nil
		    setListIndex = setListIndex + 1  // The index of the listbox in the set editor. We start at 1 rather than 0 because SmartML.GetValueN cannot distinguish between "" and "0"
		    SmartML.SetValueN(slide_group, "@set_list_index", setListIndex)
		    If SmartML.GetValue(slide_group, "@type", True) = "song" Then
		      If Not hideProgress Then
		        ProgressWindow.SetStatus(SmartML.GetValue(slide_group, "@name", False))
		      End If
		      
		      Presentation = SmartML.GetValue(slide_group, "@presentation", False)
		      Transition = SmartML.GetValueN(slide_group, "@transition", False)
		      Notes = SmartML.GetValue(slide_group, "notes", False)
		      
		      songDoc = SetML.GetSong( slide_group, MainWindow.Songs, songPath )
		      If songDoc <> Nil Then
		        // get song info for logging
		        If AddToLog Then
		          Dim d As New Date
		          
		          ActLog.Append(New LogEntry(Globals.SongActivityLog))
		          
		          ActLog(i).Title = SmartML.GetValue(SongDoc.DocumentElement, "title", True)
		          ActLog(i).Author = SmartML.GetValue(SongDoc.DocumentElement, "author", True)
		          ActLog(i).CCLISongNumber = SmartML.GetValue(SongDoc.DocumentElement, "ccli", True)  //The song's CCLI number
		          ActLog(i).SongFileName = songPath + SmartML.GetValue(slide_group, "@name", False)
		          ActLog(i).DateAndTime = d
		          ActLog(i).HasChords = ActLog(i).CheckLyricsForChords(SmartML.GetValue(songDoc.DocumentElement, "lyrics"))
		          ActLog(i).Presented = True
		          ActLog(i).SetItemNumber = ItemNumber 'Assign an index to this song
		          ActLog(i).Displayed = false 'Set this to true if user displays this song
		          
		          i = i + 1
		        End If
		        
		        'save the style from the set item before it gets overwritten - it superseeds a style from the song
		        SetItemStyle = SmartML.GetNode(slide_group, "style")
		        
		        slide_group = SmartML.ReplaceWithImportNode(slide_group, songDoc.DocumentElement)
		        SmartML.SetValueN(slide_group, "@ItemNumber", ItemNumber)
		        SmartML.SetValueN(slide_group, "@set_list_index", setListIndex)
		        
		        If Presentation <> "" Then 'Override the song's default presentation
		          SmartML.SetValue(slide_group, "presentation", presentation)
		        End If
		        If Transition <> 0 Then 'Override the song's transition
		          SmartML.SetValueN(slide_group, "@transition", Transition)
		        End If
		        
		        If Notes <> "" Then
		          SmartML.SetValue(slide_group, "notes", Notes)
		        End If
		        
		        SongML.ToSetML(slide_group, Nil, embedHtml)
		        
		        songStyle = SmartML.GetNode(slide_group, "style", False)
		        If songStyle <> Nil Then
		          SongStyle.Name = "song_style"
		        End If
		        If SetItemStyle <> Nil Then
		          SetItemStyle = slide_group.AppendChild(SetItemStyle)
		        End If
		        
		        slide_group  = slide_group.NextSibling
		      Else
		        // If it is Nil, either a FolderDB error occured, or a SmartML error has been displayed already
		        If MainWindow.Songs.ErrorCode <> 0 Then
		          InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(MainWindow.Songs.ErrorCode)+"']", SmartML.GetValue(slide_group, "@name", True))
		        End If
		        
		        If slide_group.NextSibling <> Nil Then
		          slide_group = slide_group.NextSibling
		          slide_group.Parent.RemoveChild slide_group.PreviousSibling
		        Else
		          slide_group.Parent.RemoveChild slide_group
		          slide_group = slide_group.NextSibling
		        End If
		      End If
		      
		      ItemNumber = ItemNumber + 1
		      
		    Elseif SmartML.GetValue(slide_group, "@type", True) = "style"  Then
		      slide_group  = slide_group.NextSibling
		      StyleGroupCount = StyleGroupCount + 1
		    Else
		      SmartML.SetValueN(slide_group, "@ItemNumber", ItemNumber)
		      
		      slide_group  = slide_group.NextSibling
		      ItemNumber = ItemNumber + 1
		    End If
		    
		    If Not hideProgress Then
		      ProgressWindow.SetProgress(ItemNumber + StyleGroupCount)
		    End If
		  Wend
		  setDoc.DocumentElement.SetAttribute("NumberOfItems",Str(ItemNumber - 1))
		  If Not hideProgress Then
		    ProgressWindow.Close()
		  End If
		  
		  App.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InsertAfterBreak(slideType As String) As String
		  If slideType = "song" Then
		    If  SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@insping_after_break", True, False) Then // there's no GUI for this option
		      Return "   "
		    End If
		  End If
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InsertBlankIntoSet(slide_group As XmlNode, before As Boolean = True) As XmlNode
		  Dim newSlideGroup, styleSibling As XmlNode
		  Dim groupIndex, setIndex As String
		  
		  If slide_group = Nil Then Return Nil
		  
		  If slide_group.Name = "slide_groups" Then
		    If before Then
		      newSlideGroup = SmartML.InsertChild(slide_group, "slide_group", 0)
		    Else
		      newSlideGroup = SmartML.InsertChild(slide_group, "slide_group", slide_group.ChildCount)
		    End If
		  Else
		    If before Then
		      newSlideGroup = SmartML.InsertBefore(slide_group, "slide_group")
		    Else
		      newSlideGroup = SmartML.InsertAfter(slide_group, "slide_group")
		    End If
		  End If
		  SmartML.SetValue(newSlideGroup, "@type", "blank")
		  SmartML.SetValue(newSlideGroup, "slides/slide/body", "")
		  
		  styleSibling = newSlideGroup
		  If SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blank_uses_next", True, True) Then
		    Do
		      styleSibling = styleSibling.NextSibling
		    Loop Until styleSibling = Nil Or SmartML.GetValue(styleSibling, "@type") <> "style"
		  Else
		    Do
		      styleSibling = styleSibling.PreviousSibling
		    Loop Until styleSibling = Nil Or SmartML.GetValue(styleSibling, "@type") <> "style"
		  End If
		  If styleSibling = Nil Then styleSibling = slide_group
		  
		  groupIndex = SmartML.GetValue(styleSibling, "style/@index", False)
		  If groupIndex = "" Then groupIndex = "default_style"
		  SmartML.SetValue(newSlideGroup, "style/@index", groupIndex)
		  
		  setIndex = SmartML.GetValue(styleSibling, "style/@setIndex", False)
		  If setIndex = "" Then setIndex = "default_style"
		  SmartML.SetValue(newSlideGroup, "style/@setIndex", setIndex)
		  
		  Return newSlideGroup
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InsertBlanksIntoSet(ByRef Set As XmlDocument)
		  Dim slide_group As XmlNode
		  Dim slide_groups As XmlNode
		  Dim slideType, previousSlideType As String
		  Dim slideName, previousSlideName As String
		  
		  If Not SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blanks") Then Return
		  
		  slide_groups = SmartML.GetNode(Set.DocumentElement, "slide_groups", True)
		  slide_group = slide_groups.FirstChild
		  
		  While slide_group <> Nil
		    
		    If SmartML.GetValue(slide_group, "@type") <> "style" Then
		      previousSlideType = slideType
		      previousSlideName = slideName
		      slideType = SmartML.GetValue(slide_group, "@type")
		      slideName = SmartML.GetValue(slide_group, "@name")
		      If slideType <> "blank" And previousSlideType <> "blank" And slideName <> previousSlideName Then
		        slide_group = InsertBlankIntoSet(slide_group, True)
		        slide_group = slide_group.NextSibling
		      End If
		    End If
		    If slide_group.NextSibling = Nil Then
		      // if we are on the last slide item/group, lets go ahead and add the last blank while we're here.
		      If slideType <> "blank" Then
		        slide_group = InsertBlankIntoSet(slide_group, False)
		      End If
		    End If
		    
		    slide_group = slide_group.NextSibling
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsExternal(slide As XmlNode) As Boolean
		  Dim slideType As String
		  Dim external As Boolean = False
		  
		  Try
		    If slide <> Nil Then
		      'Handle both the situation that the slide XmlNode is passend (PresentWindow.XCurrentSlide) and that the slideGroup XmlNode is passed (PresentWindow.PreviousSlide)
		      If slide.Name = "slide" Then
		        slideType = SmartML.GetValue(slide.Parent.Parent, "@type", False)
		      ElseIf slide.Name = "slide_group" Then
		        slideType = SmartML.GetValue(slide, "@type", False)
		      End If
		      
		      If slideType = "external" Then
		        external = True
		      End If
		    End If
		  Catch e as NilObjectException
		    '... no idea why this Nil check has no effect
		    Break
		  End Try
		  
		  Return external
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PrepareBodyText(bodytext As String, section As SectionMode, slideType As String, style As SlideStyle, zoom As Double, bodyFont As FontFace, secondLanguageFont As Fontface, usableWidth As Double, mainHeight As Double, g As Graphics, tabs() As StyleTabsType, splitLinePrefix As String, separationMark As String, ByRef lineCountPerLanguage() As Integer, ByRef lineHeightPerLanguage() As Integer, ByRef bodyZoom As Double) As String()
		  Dim s As string
		  Dim lines(0) As String
		  Dim maxLineWidth As Double
		  Dim bodyTextHeight As Integer
		  Dim secondLanguage As Boolean = (section = SectionMode.Bilingual)
		  Dim lineWidth As Double
		  Dim maxLineWidthAtLargestZoom As Double
		  Dim maxLineWidthAtHorizonlalZoom As Double
		  Dim f As FontFace
		  Dim hasTabs As Boolean
		  Dim needsTabs As Boolean
		  Dim zoomedTabs() As StyleTabsType
		  Dim multiwrap As Boolean
		  Dim smartWrapped As Boolean
		  Dim wrapAnew As Boolean
		  Dim splitWidth As Double
		  Dim stopZoomingOut As Boolean
		  Dim horizontalZoom, verticalZoom As Double
		  Dim fallBackZoom As Double  // the largest zoom I know will fit the text. This gets finally used if a reasonable number of loops did not settle on a result
		  Dim fallBackWrapWith, fallbackWrapZoom As Double
		  Dim largestZoom As Double  // i.e. the zoom that provides the largest result and thus also is numerically largest. Gets smaller than 1 if height is limitting factor
		  Dim kSplitThreshold As Double = 0.85  // maximum zoom without wrapping
		  Dim splitBodyLinePrefix As String  // splitLinePrefix adjusted for horizonal alignment; for use in WrapLines
		  Dim i, z As Integer
		  
		  // these are for diagnostics only
		  Dim loopCount As Integer
		  Dim loopReason As String
		  
		  // Take a pass at the slide to see if the lines will fit reasonably as they are.
		  // Hopefully in most cases this will be all we need
		  bodyZoom = 1.0
		  largestZoom = bodyZoom
		  
		  s = bodytext.FormatUnixEndOfLine
		  s = StringUtils.Trim(s, StringUtils.WhiteSpaces)
		  
		  // make sure the first line does not start with a separationMark
		  While s.StartsWith(SeparationMarkBilingual)
		    s = s.Mid(SeparationMarkBilingual.Len + 1)
		  Wend
		  
		  wrapAnew = True
		  multiwrap = (SlideType = "scripture")
		  hasTabs = tabs.UBound >= 0
		  needsTabs = bodytext.InStr(&u9) > 0
		  If hasTabs And needsTabs Then multiwrap = True
		  maxLineWidthAtLargestZoom = 0
		  horizontalZoom = 1
		  maxLineWidthAtHorizonlalZoom = 0
		  stopZoomingOut = Not style.BodyScale
		  If style.BodyScale Then
		    splitWidth = 0  // first pass without bound, then set it as needed
		  Else
		    splitWidth = usableWidth
		  End If
		  
		  If Style.BodyAlign <> "left" Then
		    splitBodyLinePrefix = splitLinePrefix.LTrim
		  Else
		    splitBodyLinePrefix = splitLinePrefix
		  End If
		  Do
		    loopCount = loopCount + 1
		    If App.DebugWriter.Level >= 10 Then  // avoid having to evaluate Sprintf
		      App.DebugWriter.Write StringUtils.Sprintf("%s %3d bodyZoom=%8.6f splitWidth=%5.1f lines=%2d %-12s %s %s ", CurrentMethodName, loopCount, bodyZoom, splitWidth, lines.Count - 1, loopReason, If(wrapAnew, "wrapAnew", ""), If(multiwrap, "multiwrap", "")).RTrim, 10
		    End If
		    
		    maxLineWidth = 0
		    bodyTextHeight = 0
		    lineCountPerLanguage = Array(0,0,0)
		    If bodyZoom = largestZoom Then maxLineWidthAtLargestZoom = 0
		    
		    If section = SectionMode.Bilingual Then
		      secondLanguage = True  // gets toggled withing the For loop the first line will be primary language
		    Else
		      // these only get altered within the For loop if SectionMode.Bilingual
		      secondLanguage = False
		      f = bodyFont
		      f.OntoGraphics(g, zoom * bodyZoom)
		    End If
		    
		    If wrapAnew Then
		      smartWrapped = False
		      SplitToArray(s, lines, Chr(10))
		      wrapAnew = False
		    End If
		    
		    If hasTabs And needsTabs Then
		      zoomedTabs = ZoomTabs(tabs, zoom * bodyZoom)
		    Else
		      zoomedTabs = Nil
		    End If
		    
		    For i = 1 to UBound(lines)
		      
		      // Second language feature: calculate character length with different font size, change every second line
		      If section = SectionMode.Bilingual Then
		        If Not lines(i).StartsWith(separationMark) Then  // only change style if not line break inserted automatically before
		          secondLanguage = Not secondLanguage
		          If secondLanguage Then
		            f = secondLanguageFont
		          Else
		            f = bodyFont
		            lineCountPerLanguage(0) = lineCountPerLanguage(0) + 1  // count transitions from 2nd to 1st language for interline gap
		          End If
		          f.OntoGraphics(g, zoom * bodyZoom)
		        End If
		      End If
		      If secondLanguage Then
		        lineCountPerLanguage(2) = lineCountPerLanguage(2) + 1
		      Else
		        lineCountPerLanguage(1) = lineCountPerLanguage(1) + 1
		      End If
		      
		      If splitWidth > 0 Then
		        Dim oldMultiWrap As Boolean = multiwrap
		        lineWidth = WrapLines(lines, i, splitWidth, multiwrap, smartWrapped, lineCountPerLanguage, maxLineWidth, section = SectionMode.Bilingual, g, zoom * bodyZoom, f, zoomedTabs, secondLanguage, separationMark, splitBodyLinePrefix)
		        If oldMultiWrap <> multiwrap Then
		          wrapAnew = True
		          loopReason = "multiwrapOn"
		          Continue Do
		        End If
		      Else
		        If separationMark <> "" And lines(i).StartsWith(separationMark) Then
		          z = separationMark.Len + 1
		        Else
		          z = 1
		        End If
		        lineWidth = FontFaceLineWidth(g, lines(i).Mid(z), f, zoomedTabs)
		      End If
		      If lineWidth > maxLineWidth Then
		        maxLineWidth = lineWidth
		      End If
		      If bodyZoom = largestZoom And maxLineWidth > maxLineWidthAtLargestZoom Then
		        maxLineWidthAtLargestZoom = maxLineWidth
		      End If
		      
		    Next i
		    
		    If loopReason = "fallback" Then
		      If maxLineWidth <= usableWidth Then Exit
		      If splitWidth <> 0 Then
		        splitWidth = 0  // do not wrap lines any further, just zoom out
		        bodyZoom = fallBackZoom
		      Else
		        // fallBackZoom was still too large: zoom out
		        bodyZoom = bodyZoom * Min(0.95, usableWidth / maxLineWidth)
		      End If
		      Continue
		    End If
		    
		    If splitWidth = 0 Then
		      splitWidth = maxLineWidth
		      If bodyZoom <> 1 And loopReason = "mainHeight" Then  // we are here after a FindVerticalZoom
		        If maxLineWidth <= usableWidth Then
		          splitWidth = usableWidth
		          wrapAnew = True
		        Else
		          splitWidth = maxLineWidth - 1
		          wrapAnew = multiwrap
		        End If
		        loopReason = "mainHeight2"
		        Continue
		      End If
		    End If
		    
		    // calculate resulting bodyTextHeight  -------------------------------------------------------------
		    bodyTextHeight = 0
		    If section = SectionMode.Bilingual Then
		      lineCountPerLanguage(0) = lineCountPerLanguage(0) - 1
		      lineHeightPerLanguage(0) = Ceil(style.BiLanguageInterline(g, zoom * bodyZoom))
		      bodyTextHeight = lineCountPerLanguage(0) * lineHeightPerLanguage(0)
		      If Not secondLanguage Then
		        secondLanguageFont.OntoGraphics(g, zoom * bodyZoom)
		      End If
		      lineHeightPerLanguage(2) = Max(Round(FontFaceHeight(g, secondLanguageFont)), 1)
		      bodyTextHeight = bodyTextHeight + lineCountPerLanguage(2) * lineHeightPerLanguage(2)
		      bodyFont.OntoGraphics(g, zoom * bodyZoom)
		    End If
		    lineHeightPerLanguage(1) = Max(Round(FontFaceHeight(g, bodyFont)), 1)
		    bodyTextHeight = bodyTextHeight + lineCountPerLanguage(1) * lineHeightPerLanguage(1)
		    
		    // Check used width and height and decide what to do next  -----------------------------------------
		    If style.BodyScale Then
		      Dim newZoom, maxLineWidthAtNewZoom As Double
		      newZoom = Min(bodyZoom * (usableWidth / maxLineWidth), 1)
		      maxLineWidthAtNewZoom = maxLineWidth
		      If bodyTextHeight > mainHeight Then
		        If stopZoomingOut Then Exit
		        verticalZoom = FindVerticalZoomFactor(g, style, zoom, bodyZoom, lineCountPerLanguage, lineHeightPerLanguage, mainHeight, stopZoomingOut)
		        If verticalZoom >= bodyZoom Then Exit
		        If verticalZoom > horizontalZoom Or horizontalZoom = 1 Or bodyZoom <= horizontalZoom Then
		          If verticalZoom > fallBackZoom Then
		            fallBackZoom = verticalZoom
		            fallBackWrapWith = maxLineWidth
		            fallbackWrapZoom = bodyZoom
		          End If
		          bodyZoom = verticalZoom
		          largestZoom = bodyZoom
		          loopReason = "mainHeight"
		          // if we don't multiwrap we might now start to smartWrap a line already smartWrapped, so start over
		          If Not multiwrap Then
		            // Keep splitWidth and measure at new bodyZoom
		            wrapAnew = True
		          Else
		            // keep the lines wrapped as they are and measure width with new bodyZoom.
		            // If they fit wrapAnew (lines might get wrapped longer now they are smaller
		            // If they don't fit we have a better new splitWidth to continue from
		            splitWidth = 0
		          End If
		        Else
		          // this zoom has been rejected before, because it is below the kSplitThreshold
		          // it now turns out it yields a better result than adding new lines through split
		          bodyZoom = horizontalZoom
		          If bodyZoom <= largestZoom Then
		            splitWidth = maxLineWidthAtHorizonlalZoom
		          Else
		            splitWidth = 0
		          End If
		          largestZoom = horizontalZoom
		          maxLineWidthAtLargestZoom = maxLineWidthAtHorizonlalZoom
		          wrapAnew = True
		          loopReason = "wrap_less"
		        End If
		      ElseIf maxLineWidth > usableWidth Then
		        horizontalZoom = newZoom
		        maxLineWidthAtHorizonlalZoom = maxLineWidthAtNewZoom
		        If horizontalZoom > fallBackZoom Then
		          fallBackZoom = horizontalZoom
		          fallBackWrapWith = splitWidth
		          fallbackWrapZoom = bodyZoom
		        End If
		        If bodyZoom > kSplitThreshold Then
		          // may be zoomed more
		          If horizontalZoom >= kSplitThreshold Then
		            If bodyZoom - horizontalZoom > 0.0001 Then  // avoid getting in trouble when maxLineWidth is close to usableWidth
		              bodyZoom = horizontalZoom
		            Else
		              bodyZoom = bodyZoom - 0.0001
		            End If
		            wrapAnew = multiwrap
		            loopReason = "zoom"
		          Else
		            // new Zoom is too aggressive - decrease splitWidth
		            bodyZoom = largestZoom
		            splitWidth = Min(splitWidth - 1, maxLineWidthAtLargestZoom - 1)
		            wrapAnew = multiwrap
		            loopReason = "split"
		          End If
		        Else
		          // needs to get wrapped tighter
		          bodyZoom = largestZoom
		          splitWidth = Min(splitWidth - 1, maxLineWidthAtLargestZoom - 1)
		          wrapAnew = True
		          loopReason = "split_nz"
		        End If
		      Else
		        Exit
		      End If
		    Else
		      Exit
		    End If
		    
		    If loopCount = 250 Then
		      // fall back to the best zoom find so far and leave the loop
		      // to do so, we need to wrap the lines anew
		      bodyZoom = fallbackWrapZoom
		      splitWidth = fallBackWrapWith
		      wrapAnew = True
		      loopReason = "fallback"
		    End If
		  Loop
		  
		  lines.Remove(0)
		  Return lines
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessStyles(Set As XmlDocument, ByRef StyleDict As Dictionary)
		  // Fills the StyleDict with SlideStyles and assigns the keys to each slide_group's style element
		  // The style element is created if it does not yet exist and two indices are set as attributes:
		  // @index to be used by the slides of the group
		  // @setIndex to be used by new entries inserted on the fly (i.e. quick insert song)
		  // this way, any slide element's grandparent knows which style to use
		  // Style slides are no longer used hereafter, so they could be removed
		  // They are kept for backward compatibility to external renderers
		  //
		  // An older implementation of building the StyleDict removed the style node and replaced it with one that had just the index
		  // This was done after the deck had been sent to the external renderer. Now we do this before and therefore need to keep all setting
		  
		  // TODO: consider a redesign which adds the style dictionary as an xml section. This breaks compatibility with external renderes, though
		  
		  Dim slide_groups, slide_group As XmlNode
		  Dim styleNode As XmlNode
		  Dim presentationSettings As XmlNode
		  Dim setStyles() As String
		  Dim setIndex, groupIndex, songStyleIndex As String
		  Dim slideType As String
		  Dim slideCount As Integer
		  
		  StyleDict = New Dictionary
		  
		  // first handle the default styles
		  presentationSettings = App.MyPresentSettings.DocumentElement
		  Call AddNodeToStyleDict(StyleDict, SmartML.GetNode(presentationSettings, "default_style"), "default_style")
		  Call AddNodeToStyleDict(StyleDict, SmartML.GetNode(presentationSettings, "scripture_style"), "scripture_style")
		  
		  // now process the slide deck
		  If Set = Nil Then Return
		  slide_groups = SmartML.GetNode(Set.DocumentElement, "slide_groups", True)
		  
		  setIndex = "default_style"
		  slide_group = slide_groups.FirstChild
		  While slide_group <> Nil
		    slideType = SmartML.GetValue(slide_group, "@type")
		    
		    slideCount = slideCount + 1
		    groupIndex = setIndex
		    StyleNode = SmartML.GetNode(slide_group, "style", False)
		    If styleNode <> Nil Then
		      groupIndex = AddNodeToStyleDict(StyleDict, styleNode)
		    End If
		    If slideType = "song" Then
		      styleNode = SmartML.GetNode(slide_group, "song_style", False)
		      If styleNode <> Nil Then
		        songStyleIndex = AddNodeToStyleDict(StyleDict, styleNode)
		        If groupIndex = setIndex _  // no set item style is defined
		          And (setIndex = "default_style" _  // no Style slide is in effect
		          Or SetML.SongStylePreferred(slide_group)) Then // or the song stile overrides the style slide
		          groupIndex = songStyleIndex
		        End If
		      End If
		    End If
		    
		    Select Case slideType
		    Case "style"
		      Select Case SmartML.GetValue(slide_group, "@action")
		      Case "new"
		        setStyles.Append(setIndex)
		        setIndex = groupIndex
		      Case "revert"
		        If setStyles.Ubound >= 0 Then setIndex = setStyles.Pop
		      Else
		        If setIndex <> groupIndex Then
		          setStyles.Append(groupIndex) ' handle as "new", if it has a style; as an alternative; throw an exception
		        End If
		      End Select
		      SmartML.SetValue(slide_group, "style/@setIndex", setIndex)
		    Case "blank"
		      // this is not expected here (ought to be added later). We just ignore it here,
		      // because we do not have the style of the next slide yet, in case we need it
		    Case "scripture"
		      SmartML.SetValue(slide_group, "style/@setIndex", setIndex)
		      If groupIndex = setIndex Then
		        SmartML.SetValue(slide_group, "style/@index", "scripture_style")
		      Else
		        SmartML.SetValue(slide_group, "style/@index", groupIndex)
		      End If
		    Else
		      SmartML.SetValue(slide_group, "style/@index", groupIndex)
		      SmartML.SetValue(slide_group, "style/@setIndex", setIndex)
		    End Select
		    
		    slide_group = slide_group.NextSibling
		    
		  Wend
		  
		  // Handle an edge case where we had a style slide as the only slide:
		  // Add a blank slide, even if insert blanks is not enabled. We need at least one item to existst for presentation.
		  If slideType = "style" And slideCount = 1 Then
		    If Not SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blanks") Then
		      slide_group = slide_groups.FirstChild
		      slide_group = InsertBlankIntoSet(slide_groups, False)
		      If groupIndex = "" Then groupIndex = setIndex
		      SmartML.SetValue(slide_group, "style/@index", groupIndex)
		      SmartML.SetValue(slide_group, "style/@setIndex", setIndex)
		    End If
		  End If
		  
		  AddSongSubtitles(Set, StyleDict)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SeparationMarkBilingual() As String
		  'This actually is a const, however Xojo unfortunately does not support constant expressions
		  Return Encodings.UTF8.Chr(244)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetItemCount(xSet As XmlDocument) As Integer
		  Dim slide_groups As XmlNode
		  
		  slide_groups = SmartML.GetNode(xSet.DocumentElement, "slide_groups", True)
		  
		  If slide_groups = Nil Then Return 0
		  Return slide_groups.ChildCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetToPresentationDeck(SetDoc As XmlDocument, CopyAllChildren As Boolean, LogActivity As Boolean, PresentMode As Integer, PresentScreen As Integer, ByRef StyleDict As Dictionary) As XmlDocument
		  Dim deck As XmlDocument
		  // Copy the set to a working copy we can change
		  deck = New XmlDocument
		  deck.AppendChild deck.SafeImportNode(SetDoc.FirstChild, CopyAllChildren)
		  
		  
		  ImportSongs(deck, LogActivity)
		  ImportExternals(deck, PresentMode, PresentScreen)
		  ProcessStyles(deck, StyleDict)
		  InsertBlanksIntoSet(deck)
		  VerifySlideBodies(deck)
		  Return deck
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SmartWrap(ByRef str As String) As String
		  // Truncates the passed string at the wrap point and returns the second line of the string
		  
		  Dim temp, c As String
		  Dim i, center, quarter, breakpoint As Integer
		  Const Punctuation = ",.;:?!)""" 'EMP 09/05
		  
		  center = Len(str)/2
		  quarter = Len(str)/4
		  breakpoint = 0
		  
		  For i = quarter To 3*quarter
		    c = Mid(str, i, 1)
		    If c = "," Or c = ":" Or c = ";" Or c = "." Or c = "?" Or c = "!" Or c = ")" Then
		      If Abs(i - center) <= Abs(breakpoint - center) Then breakpoint = i Else Exit
		    End If
		  Next i
		  If breakpoint = 0 Then
		    For i = 1 To Len(str)
		      c = Mid(str, i, 1)
		      If c = "," Or c = ":" Or c = ";" Or c = "." Or c = "?" Or c = "!" Or c = ")" Or c = " " Then
		        If Abs(i - center) <= Abs(breakpoint - center) Then breakpoint = i Else Exit
		      End If
		    Next i
		    If breakpoint = 0 Then Return ""
		  End If
		  
		  If breakpoint = 0 Then breakpoint = center
		  
		  //++EMP 09/05
		  'Take care of a corner case with this....since the loop counts upward, it can miss
		  ' the case where two or more punctuation marks immediately follow each other
		  ' example is something like: Here I am ("Here I am"),
		  ' this should wrap after the comma, not the quote mark
		  '
		  c = mid(str, breakpoint + 1, 1)
		  While InStr(Punctuation, c) > 0
		    breakpoint = breakpoint + 1
		    c = mid(str, breakpoint + 1, 1)
		  Wend
		  //--EMP 09/05
		  
		  temp = Trim(Mid(str, breakpoint+1))
		  str = Trim(Left(str, breakpoint))
		  Return temp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SongStylePreferred(SlideGroup As XmlNode) As Boolean
		  //++
		  // Determine if a song-specific style should be used even
		  // if a style change is active.
		  // Current implementation does not use the song's
		  // slide group passed as argument (looks at PresentationSettings).
		  // Coded this way to allow for this to be handled on a song-by-song basis
		  // in  the future.
		  //--
		  #pragma Unused SlideGroup
		  
		  Return SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "song_style_preferred", True, True)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SplitToArray(str As String, ByRef arr() As String, char As String)
		  Dim st, x As Integer
		  ReDim arr(0)
		  
		  str = str + char
		  
		  st = 1
		  x = InStr(st, str, char)
		  While x >= st
		    arr.Append RTrim(Mid(str, st, x-st))
		    
		    st = x + Len(char)
		    x = InStr(st, str, char)
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub VerifySlideBodies(Set As XmlDocument)
		  ' Make sure every slide has a body
		  Dim slide_groups As XmlNode
		  Dim slide_group As XmlNode
		  
		  slide_groups = SmartML.GetNode(Set.DocumentElement, "slide_groups")
		  If slide_groups <> Nil Then
		    slide_group = slide_groups.FirstChild
		  Else
		    Return
		  End If
		  
		  While slide_group <> Nil
		    If SmartML.GetValue(slide_group, "@type") <> "style" And _
		      SmartML.GetNode(slide_group, "slides", True).ChildCount < 1 Then
		      SmartML.SetValue slide_group, "slides/slide/body", ""
		    End If
		    
		    slide_group = slide_group.NextSibling
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WrapLines(ByRef lines() As String, ByRef i As Integer, splitWidth As Double, ByRef multiwrap As Boolean, ByRef smartWrapped As Boolean, ByRef lineCountPerLanguage() As Integer, ByRef MaxLineWidth As Double, isBilingual As Boolean, g As Graphics, zoom As Double, f As FontFace, tabs() As StyleTabsType, secondLanguage As Boolean, separationMark As String, insertAfterBreak As String) As Double
		  // this is basically part of DrawSlide, outsourced here to hopefully get a better overview.
		  // On the other hand, there are a lot of parameters, most of which are even ByRef, because they may change
		  //
		  // The line lines(i) is split to fit within the width of splitWidth
		  // Parameters should support for splitting the corresponding line of the alternate language in sync with line i. This is not done yet.
		  
		  #Pragma Unused zoom
		  #Pragma Unused isBilingual
		  
		  Dim lineWidth As Double
		  Dim x, y, z As Integer
		  Dim Line As String
		  Dim d, d2 As String
		  Dim lineSepMark As String
		  Dim insertAfterBreakWidth As Double
		  
		  line = lines(i)
		  If separationMark <> "" And line.StartsWith(separationMark) Then
		    line = line.Mid(separationMark.Len + 1)
		    lineSepMark = separationMark
		  Else
		    lineSepMark = ""
		  End If
		  
		  If insertAfterBreak = "" Then
		    insertAfterBreakWidth = 0
		  Else
		    insertAfterBreakWidth = FontFaceWidth(g, insertAfterBreak, f)
		  End If
		  lineWidth = FontFaceLineWidth(g, line, f, tabs)
		  If (lineWidth + insertAfterBreakWidth > splitWidth * 2) Or (multiwrap And lineWidth > splitWidth) Then
		    // this line is more than twice as long: multiple-wrapping
		    // or this line is too long and this slide has already been multiwrapped
		    If Not multiwrap Then
		      multiwrap = True
		      If smartWrapped Then Return lineWidth  // restart, don't change mid through
		    End If
		    // find what fits on the line
		    // estimate the number of characters that fit on the line (y) and choose a character count (x) to start the search with
		    y = line.Len() / (lineWidth / splitWidth)
		    x = y \ 8
		    If x = 0 Then x = 1
		    lineWidth = FontFaceLineWidth(g, line.Left(y), f, tabs)
		    If lineWidth < splitWidth Then
		      Do
		        y = y + x
		      Loop Until FontFaceLineWidth(g, line.Left(y), f, tabs) >= splitWidth
		      x = x \ 2
		      z = -1
		    ElseIf lineWidth > splitWidth Then
		      Do
		        y = y - x
		      Loop Until FontFaceLineWidth(g, line.Left(y), f, tabs) <= splitWidth
		      x = x \ 2
		      z = 1
		    Else
		      x = 0
		    End If
		    // binary search for limit of what fits on the line, y: len, x: increment, z: direction (+/-)
		    While x > 0
		      If z > 0 Then
		        y = y + x
		      Else
		        y = y - x
		      End If
		      lineWidth = FontFaceLineWidth(g, line.Left(y), f, tabs)
		      If lineWidth > splitWidth Then
		        z = -1
		      ElseIf lineWidth < splitWidth Then
		        z = 1
		      Else
		        x = 0
		      End If
		      x = x \ 2
		      If x = 0 And lineWidth > splitWidth And y > 1 Then
		        x = 1
		        z = -1
		      End If
		    Wend
		    If lineWidth > splitWidth Then y = y - 1
		    
		    // back off until we fit...
		    For z = y DownTo 2
		      d = Mid(line, z, 1)
		      If d = " " And z <> 2 Then // wrap it here
		        y = z
		        Exit
		      End If
		      //++
		      // For CJK characters, it is perfectly ok to wrap before or after
		      // a CJK character (Unicode codepoint between 4E00 and 9FBF)
		      // (Additional fix for 1530629 added after section outside "For z" loop was inserted)
		      //--
		      d2 = Mid(line, z - 1, 1)
		      If (d.Asc >= &h4E00 And d.Asc <= &h9FBF) Or _
		        (d2.Asc >= &h4E00 And d2.Asc <= &h9FBF) Then
		        y = z
		        Exit
		      End If
		    Next z
		    
		    // If we did not alter y in the back off loop above, we just wrap at the end of splitWidth
		    If z = 0 Or y = 0 Then
		      y = 1 // even one character is too wide
		      lines(i) = lineSepMark + line.Left(y)
		      lineWidth = splitWidth
		    Else
		      lines(i) = lineSepMark + line.Left(y).RTrim
		      z = lineSepMark.Len + 1
		      lineWidth = FontFaceLineWidth(g, lines(i).Mid(z), f, tabs)
		    End If
		    line = Mid(line, y + 1).LTrim
		    If line <> "" Then
		      lines.Insert(i + 1, separationMark + insertAfterBreak + line)
		    End If
		  ElseIf lineWidth > splitWidth Then  // this line is less than twice as long, but still too long: smart wrap it
		    d = SmartWrap(line)
		    If d = "" Or line = "" Then
		      multiwrap = True
		      Return lineWidth
		    Else
		      lines(i) = lineSepMark + line
		      lineWidth = FontFaceLineWidth(g, line, f, tabs)
		      If lineWidth > MaxLineWidth Then
		        MaxLineWidth = lineWidth
		      End If
		      lines.Insert i + 1, separationMark + insertAfterBreak + d
		      z = separationMark.Len + 1
		      lineWidth = FontFaceLineWidth(g, lines(i + 1).Mid(z), f, tabs)
		      i = i + 1  // indicate the inserted line is handled
		      smartWrapped = True
		      If secondLanguage Then
		        lineCountPerLanguage(2) = lineCountPerLanguage(2) + 1
		      Else
		        lineCountPerLanguage(1) = lineCountPerLanguage(1) + 1
		      End If
		      If lineWidth > MaxlineWidth Then
		        MaxLineWidth = lineWidth
		      End If
		      If MaxLineWidth > splitWidth Then  // SmartWrap returned a line which is longer than splitWidth -> switch to multiwrap
		        multiwrap = True
		        Return MaxLineWidth
		      End If
		    End If
		  End If
		  
		  If lineWidth > MaxLineWidth Then
		    MaxLineWidth = lineWidth
		  End If
		  
		  Return lineWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ZoomMargins(ByRef margins As StyleMarginType, zoom as Double)
		  margins.Left = margins.Left * zoom
		  margins.Right = margins.Right * zoom
		  margins.Top = margins.Top * zoom
		  margins.Bottom = margins.Bottom * zoom
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ZoomTabs(ByRef tabs() As StyleTabsType, zoom as Double)
		  If tabs = Nil Then Return
		  
		  Dim i As Integer
		  
		  For i = 0 to UBound(tabs)
		    tabs(i).Position = tabs(i).Position * zoom
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ZoomTabs(tabs() as StyleTabsType, zoom as Double) As StyleTabsType()
		  Dim i As Integer
		  Dim zTabs() As StyleTabsType
		  
		  If tabs <> Nil Then
		    Redim zTabs(tabs.UBound)
		    
		    For i = 0 to UBound(tabs)
		      zTabs(i) = tabs(i)
		      zTabs(i).Position = tabs(i).Position * zoom
		    Next i
		  End If
		  
		  Return zTabs
		End Function
	#tag EndMethod


	#tag Enum, Name = SectionMode, Type = Integer, Flags = &h0
		Normal
		Bilingual
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
