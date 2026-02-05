#tag Module
Module SongML
	#tag Method, Flags = &h21
		Private Function AdjustSlideBreaks(lyrics As String, isBilingual As Boolean = False) As String
		  // Regularize Line Endings
		  lyrics = lyrics.FormatUnixEndOfLine
		  lyrics = StringUtils.RTrim(lyrics, EndOfLine.UNIX)
		  If SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blank_is_slide_change") Then
		    lyrics = lyrics.ReplaceAll(EndOfLine.UNIX + EndOfLine.UNIX, "||" + EndOfLine.UNIX)
		  End If
		  
		  If isBilingual Then
		    If InStr(lyrics, "||") > 0 Then
		      // place slide breaks at the end of a second language line
		      Dim lines() As String
		      Dim pos1, pos2 As Integer
		      Dim line3, line4 As String
		      Dim i As Integer
		      
		      lines = Split(lyrics, EndOfLine.UNIX)
		      If lines.Ubound() Mod 2 = 0 Then
		        lines.Append("")
		      End If
		      ' going to do the following changes
		      ' E = split mark at end
		      ' M = split mark somewhere in the middle
		      ' 0 = no split mark
		      ' R = rest after split mark
		      ' _ = empty line to keep languages in sync
		      '
		      '0 1    0 1 2 3  line i+n is -> will be
		      'E,E -> 0,E
		      'E,M -> 0,E,_,R
		      'E,0 -> 0,E
		      'M,E -> 0,E,R,_
		      'M,M -> 0,E,R,R
		      'M,0 -> 0,E,R,_
		      '0,0 -> 0,0
		      '0,E -> 0,E
		      '0,M -> 0,E,_,R
		      line3 = ""
		      line4 = ""
		      i = 0
		      ' FIX: Must check i+1 is in bounds before accessing lines(i+1)
		      While i < lines.Ubound
		        pos1 = InStr(lines(i), "||")
		        pos2 = InStr(lines(i + 1), "||")
		        If Pos1 <> 0 Then
		          If pos1 = lines(i).Len - 2 Then
		            lines(i) = StringUtils.Chop(lines(i), 2)
		          Else
		            line3 = lines(i).Mid(pos2 + 2)
		            lines(i) = lines(i).Left(pos2 - 1)
		          End If
		        End If
		        If pos2 <> 0 Then
		          If pos2 <> lines(i + 1).Len - 2 Then
		            line4 = lines(i + 1).Mid(pos2 + 2)
		            lines(i + 1) = lines(i + 1).Left(pos2 + 1)
		          End If
		        End If
		        If line3.Len > 0 Or line4.Len > 0 Then
		          lines.Insert(i + 2, line3)
		          lines.Insert(i + 3, line4)
		          line3 = ""
		          line4 = ""
		        End If
		        i = i + 2
		      Wend
		      
		      lyrics = Join(lines, EndOfLine.UNIX)
		    End If
		  End If
		  
		  Return lyrics
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildHeading(Tag As String, Heading As String, default As String = "") As String
		  //++
		  // Save some repetitive work building headings
		  //
		  // Tag is the tag for the translator.  All that's needed is verse, chorus, etc.
		  //
		  //--
		  
		  If tag.Trim = "" Then Return Heading.Trim
		  
		  Dim translate As String
		  Dim result As String
		  Dim found As Boolean
		  
		  translate = "songml/" + tag + "/@caption"
		  
		  result = App.T.Translate(translate, found)
		  If Not found Then result = Default
		  
		  If Heading <> "" Then
		    result = result + " " + Heading.Trim
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function BuildSubtitle(songElement As XmlNode, Style As SlideStyle = Nil) As String
		  //++
		  // Create a string with the appropriate subtitles and return.
		  //--
		  
		  Dim Subtitles(-1) As String
		  Dim SubtitleOptions As String
		  Dim Separator As String
		  Dim CurrSubtitle As Integer
		  Dim AddDescriptions As Boolean
		  Dim ThisSubtitle As String
		  Dim Caption As String
		  Dim CopyrightSymbol As String
		  Dim DesiredSubtitles(-1) As String
		  
		  If Style = Nil Then
		    If SmartML.HasNode(songElement, "style") Then
		      Style = New SlideStyle(SmartML.GetNode(songElement, "style"))
		    Else
		      Style = New SlideStyle(SmartML.GetNode(App.MyPresentSettings.DocumentElement, "default_style"))
		    End If
		  End If
		  
		  If Not Style.SubtitleEnable Then Return ""
		  
		  SubtitleOptions = Style.SubtitleList
		  AddDescriptions = Style.DescriptiveSubtitles
		  DesiredSubtitles = Split(SubtitleOptions, "|")
		  
		  Separator = App.T.Translate("songml/separator/@caption")
		  If Separator = "|NL|" Then Separator = Chr(10)
		  
		  For CurrSubtitle = 0 To UBound(DesiredSubtitles)
		    
		    Select Case DesiredSubtitles(CurrSubtitle)
		      
		    Case "copyright"
		      Caption = ""
		      ThisSubtitle = SmartML.GetValue(songElement, "copyright")
		      'Don't add the caption if the copyright symbol is already in the subtitle text
		      'Assuming that the presence of the copyright symbol means the field is
		      'complete within the text.
		      '(Had to force UTF-8 for this string, otherwise the symbol wasn't handled properly on display)
		      ThisSubtitle = ConvertEncoding(ThisSubtitle, Encodings.UTF8)
		      CopyrightSymbol = ConvertEncoding(App.T.Translate("songml/symbol/@caption"), Encodings.UTF8)
		      If ThisSubtitle <> "" And InStr(ThisSubtitle, CopyrightSymbol) = 0 Then
		        Caption = App.T.Translate("songml/copyright/@caption")
		        Caption.Append ConvertEncoding(" " + CopyrightSymbol, Encodings.UTF8)
		      End If
		      
		    Case "hymn_number"
		      ThisSubtitle = SmartML.GetValue(songElement, "hymn_number")
		      Caption = App.T.Translate("songml/hymn_number/@caption")
		      
		    Case "author"
		      ThisSubtitle = SmartML.GetValue(songElement, "author")
		      Caption = App.T.Translate("songml/author/@caption")
		      
		    Case "ccli_number" //The song's CCLI number, not the church license
		      ThisSubtitle = SmartML.GetValue(songElement, "ccli")
		      Caption = App.T.Translate("songml/ccli_number/@caption")
		      
		    Case "ccli_license" //The church license
		      ThisSubtitle = SmartML.GetValue(App.MyMainSettings.DocumentElement, "ccli/@number")
		      Caption = App.T.Translate("songml/ccli_license/@caption")
		      
		    Case Else
		      App.DebugWriter.Write Chr(9) + "Unexpected subtitle requested: " + Subtitles(CurrSubtitle)
		      Continue
		      
		    End Select
		    
		    If Trim(ThisSubtitle).Len > 0 Then
		      If AddDescriptions And Caption <> ""  Then
		        ThisSubtitle = Caption + " " + ThisSubtitle
		      End If
		      
		      Subtitles.Append ThisSubtitle
		    End If
		    
		  Next CurrSubtitle
		  
		  Return Join(Subtitles, Separator)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ChordPositions(chordLine As String) As Integer()
		  Dim chordPos(0) As Integer
		  
		  Dim i As Integer
		  Dim blank As Boolean
		  
		  blank = True
		  For i = 2 To Len(chordLine)
		    If blank Then
		      If Mid(chordLine, i, 1) <> " " Then
		        chordPos.Append(i)
		        blank = False
		      End If
		    Else
		      If Mid(chordLine, i, 1) = " " Then
		        blank = True
		      End If
		    End If
		  Next
		  
		  Return chordPos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CleanLyrics(ByRef lines() As String)
		  // needs to keep positions
		  
		  // replaces "|" with " "
		  // also replaces any strech of _ which is bounded by a space or the start or end of the line
		  // these stretches must not be replaced by a dash when formatting chord sheets
		  // SongSelect uses undescores in music sheets to indicate a chord (or note) is played while the syllabel is sung. We don't (yet).
		  
		  Dim i, st, pos As Integer
		  Dim replaceWithBlank As Boolean
		  Dim blankLineIsNewSlide As Boolean
		  blankLineIsNewSlide = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blank_is_slide_change")
		  
		  For i = 1 To lines.Ubound
		    If InStr("123456789 ", lines(i).Left(1)) > 0 Then
		      lines(i) = lines(i).ReplaceAll("|", " ").RTrim
		      st = 2
		      Do
		        st = InStr(st, lines(i), "_")
		        If st = 0 Then Exit
		        
		        If st = 2 Or lines(i).Mid(st - 1, 1) = " " Then
		          replaceWithBlank = True
		        End If
		        pos = st + 1
		        While lines(i).Mid(pos, 1) = "_"
		          pos = pos + 1
		        Wend
		        If lines(i).Mid(pos, 1) = "" Or lines(i).Mid(pos, 1) = " " Then
		          replaceWithBlank = True
		        End If
		        If replaceWithBlank Then
		          lines(i) = lines(i).Left(st - 1) + ReplaceAll(lines(i).Mid(st, pos - st), "_", " ") + lines(i).Mid(Pos)
		          If pos > lines(i).Len Then
		            lines(i) = lines(i).RTrim
		          End If
		          replaceWithBlank = False
		        End If
		        st = pos
		      Loop
		    End If
		    
		    If blankLineIsNewSlide Then
		      If StringUtils.Trim(lines(i), StringUtils.WhiteSpaces).Len = 0 Then
		        lines(i) = ""
		      End If
		    ElseIf lines(i).Len = 0 Then
		      lines(i) = " "
		    End If
		  Next
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloneStyle(fromNode As XmlNode, toNode As XmlNode)
		  SmartML.CloneAttributes fromNode, toNode
		  SmartML.CloneChildren fromNode, toNode
		  SmartML.RemoveNode(toNode, "@index")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ColonTrim(s As String) As String
		  s = Trim(s)
		  If Right(s, 1) = ";" Then s = Left(s, s.Len-1)
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DeflateString(lyrics As String, separationMark As String = "") As String
		  // For bilingual sections, lines are initially interleaved. If lines are split using "|", this might get messed up.
		  // -> we try to keep them properly interleaved where possible, or else mark a second line for the same language
		  // with a separationMark
		  Dim bodytext as String
		  
		  bodytext = ReplaceAll(lyrics, "_", "")
		  Dim lineIsSplit As Boolean
		  #If XojoVersion < 2022.02
		    If (separationMark <> "") And lyrics.ContainsSU("|") Then
		      lineIsSplit = True
		    End If
		  #Else
		    If (separationMark <> "") And lyrics.Contains("|") Then
		      lineIsSplit = True
		    End If
		  #EndIf
		  If lineIsSplit Then
		    Dim lines() As String = Split(bodytext, Chr(10))
		    Dim i As Integer = 0
		    Dim barpos1, barpos2 As Integer
		    
		    // ensure even number of lines to begin with
		    If lines.Ubound() Mod 2 = 0 Then
		      lines.Append("")
		    End If
		    // if lines have to be split either split both or add in a separationMark
		    ' FIX: Must check i+1 is in bounds before accessing lines(i+1)
		    While i < lines.Ubound()
		      barpos1 = InStr(lines(i), "|")
		      barpos2 = InStr(lines(i+1), "|")
		      If barpos1 > 0 Then
		        If barpos2 > 0 Then
		          lines.Insert(i+2, Mid(lines(i), barpos1+1))
		          lines(i) = Left(lines(i), barpos1-1)
		          lines.Insert(i+3, Mid(Lines(i+1), barpos2+1))
		          lines(i+1) = Left(lines(i+1), barpos2-1)
		          i = i + 2
		        Else
		          lines.Insert(i+1, separationMark + Mid(lines(i), barpos1+1))
		          lines(i) = Left(lines(i), barpos1-1)
		          i = i + 1
		        End If
		      Else
		        If barpos2 > 0 Then
		          lines.Insert(i+2, separationMark + Mid(lines(i+1), barpos2+1))
		          lines(i+1) = Left(lines(i+1), barpos2-1)
		          i = i + 1
		        Else
		          i = i + 2
		        End If
		      End If
		    Wend
		    bodytext = Join(lines, Chr(10))
		  Else
		    bodytext = ReplaceAll(bodytext, "|", Chr(10))
		  End If
		  
		  Return bodytext.CleanSpaces
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Draw(songDoc As XmlDocument, g As Graphics, zoom As Double, StartPage As Integer = 1, LayoutSettings As XmlDocument = Nil) As Group2D
		  // Returns a Group2D where each element is a Group2D representing a page
		  // Added optional parameter to allow for running page numbers if multiple songs are being printed
		  // Ed Palmer, 12/05
		  //--
		  
		  Dim section, lines(0), line As String
		  
		  Dim l, lineCount, i As Integer
		  Dim firstBase, runningBase, bottom, leftEdge As Double
		  
		  Dim Height, Width As Double
		  
		  Dim x, y As Double
		  x = 0 // Graphics object passed in will be printable area only
		  y = 0
		  
		  Dim Pages As Group2D
		  Dim Page As Group2D
		  Dim Multicolumn As Boolean = False
		  Dim ColumnLeft As Double // Left point for the second column
		  Dim ColumnWidth As Double // Width of a column
		  Dim gutter As Double // Space between columns
		  Dim LyricFont As FontFace // Font used for lyrics
		  Dim LastHeadingIndex As Integer // Position in Pages group of last heading for widow control
		  Dim LastHeadingLine As Integer
		  Dim LastLine As Integer
		  Dim ElementHeight As Double
		  Dim NewPageNeeded As Boolean
		  Dim NewColumnNeeded As Boolean
		  Dim isBilingual As Boolean
		  Dim hasPrefix As Boolean
		  Dim xLayout As XmlNode
		  Dim layPrintChords, layPrintCapo, layPrintLang1, layPrintLang2, layFilterSections As Boolean
		  Dim presentationOrder As String
		  Dim useSection As Dictionary
		  Dim hideSection As Boolean
		  Dim verseIsCaption As Boolean
		  
		  If LayoutSettings = Nil Then
		    xLayout = App.MyPrintSettings.DocumentElement
		  Else
		    xLayout = LayoutSettings.DocumentElement
		  End If
		  
		  layPrintChords = SmartML.GetValueB(xLayout, "layout/chords/@print", True, True)
		  If layPrintChords Then
		    layPrintCapo = SmartML.GetValueB(xLayout, "layout/capo/@print", True, True)
		    If layPrintCapo And SmartML.GetValueB(xLayout, "layout/capo/@hideregularchords", True, False) Then
		      layPrintChords = False
		    End If
		  End If
		  layPrintLang1 = True
		  layPrintLang2 = SmartML.GetValueB(xLayout, "layout/lyrics_language2/@print", True, True)
		  If layPrintLang2 And SmartML.GetValueB(xLayout, "layout/lyrics_language2/@hideprimary", True, False) Then
		    layPrintLang1 = False
		  End If
		  layFilterSections = SmartML.GetValueB(xLayout, "leadsheet/@hide_unused_sections", True, False)
		  If layFilterSections Then
		    presentationOrder = SmartML.GetValue(songDoc.DocumentElement, "presentation")
		    If presentationOrder.Trim.Len = 0 Then
		      layFilterSections = False
		    Else
		      Dim sections() As String = presentationOrder.Split(" ")
		      useSection = New Dictionary
		      For Each section In sections
		        useSection.Value(section) = Nil
		      Next
		    End If
		  End If
		  Pages = New Group2D
		  
		  Height = g.Height
		  Width = g.Width
		  ColumnWidth = Width  // Assume single column for now
		  NewPageNeeded = True
		  NewColumnNeeded = False
		  isBilingual = False
		  
		  App.DebugWriter.Write "SongML::Draw: w, h, zoom = " + str(x) + ", " + str(y) + ", " + str(width) + ", " + str(height) + ", " + str(zoom)
		  
		  verseIsCaption = songDoc.DocumentElement.Name = "set_list" // use text in V sections literally
		  
		  Dim lyrics As String
		  lyrics = SmartML.GetValue(songDoc.DocumentElement, "lyrics")
		  LyricsToLines lyrics, lines
		  CleanLyrics(lines)
		  LyricFont = SmartML.GetValueF(xLayout, "lyrics")
		  
		  If lyrics.InStr(EndOfLine.UNIX + "---") <> 0 Or Lyrics.StartsWith("---") Then  // Multicolumn: flag and set up -- TODO: allow Multicolumn via page setup, not only explicit column break
		    Multicolumn = True
		    Gutter = TextWidthV("MM", LyricFont, g, zoom)  // Two M gutter -- TODO: Part of page setup
		    ColumnWidth = (Width - gutter) / 2
		    ColumnLeft = Width - ColumnWidth
		  End If
		  
		  For l = 1 To UBound(lines)
		    If NewColumnNeeded Then
		      NewColumnNeeded = False
		      If leftEdge > 0 Then
		        NewPageNeeded = True
		      Else
		        runningBase = firstBase
		        leftEdge = ColumnLeft
		        ElementHeight = 0
		        LastHeadingIndex = -1
		      End If
		    End If
		    
		    If NewPageNeeded Then
		      If Page <> Nil Then Pages.Append Page
		      Page = New Group2D
		      NewPageNeeded = False
		      firstBase = y + Draw_Header(songDoc, g, 0, 0, width, zoom, Page, LayoutSettings)
		      leftEdge = 0
		      App.DebugWriter.Write "SongML::Draw: Back from DrawHeader, returned val = " + str(firstBase)
		      bottom = y + height - Draw_Footer(songDoc, g, 0, height, width, zoom, Pages.Count + StartPage, Page, LayoutSettings)
		      App.DebugWriter.Write "SongML::Draw: Back from DrawFooter, height - returned val = " + str(bottom)
		      runningbase = firstBase
		      LastHeadingIndex = -1
		    End If
		    
		    line = lines(l)
		    If hideSection And line.left(1) <> "[" Then Continue
		    If InStr(". 123456789", Left(line, 1)) > 0 Then
		      ' --------------- CHORDS and/or LYRICS ---------------
		      Dim chordPos() As Integer
		      Dim chordLineCnt As Integer
		      If Left(lines(l), 1) = "." Then
		        If layPrintChords Or layPrintCapo Then
		          chordPos = ChordPositions(lines(l))
		          chordlineCnt = 1
		        Else
		          Continue
		        End If
		      Else
		        ReDim chordPos(0)
		        chordlineCnt = 0
		      End If
		      lineCount = chordlineCnt + FindLyricLineCount(lines, l + chordlineCnt, isBilingual, hasPrefix)
		      If isBilingual And (Not layPrintLang1 Or Not layPrintLang2) Then
		        // filter the lyrics lines that really need to get printed
		        Dim fltLn() As String
		        If chordLineCnt = 1 Then
		          fltLn.Append lines(l)
		        End If
		        For i = 0 To lineCount - chordLineCnt - 1
		          If i Mod 2 = 0 Then
		            If layPrintLang1 Then
		              fltLn.Append lines(l + chordLineCnt + i)
		            End If
		          Else
		            If layPrintLang2 Then
		              fltLn.Append lines(l + chordLineCnt + i)
		            End If
		          End If
		        Next
		        ElementHeight = Draw_ChordLyricLine(songDoc, g, x+leftEdge, runningBase, ColumnWidth, zoom, section, isBilingual, fltLn, 0, chordPos, fltLn.Ubound + 1, Page, xLayout)
		      Else
		        ElementHeight = Draw_ChordLyricLine(songDoc, g, x+leftEdge, runningBase, ColumnWidth, zoom, section, isBilingual, lines, l, chordPos, lineCount, Page, xLayout)
		      End If
		      LastLine = l //save where we started in case of page change
		      l = l + lineCount - 1 ' l will increment again b/c of the For loop
		      
		    ElseIf Left(line, 3) = "-__" Then
		      ' ------------------- SEPARATOR LINE -------------------
		      ElementHeight = Draw_Separator(g, x+leftEdge, runningBase, ColumnWidth, zoom, LyricFont, Page)
		      LastLine = l
		      
		    ElseIf Left(line, 3) = "---" Then
		      ' ------------------- NEW COLUMN -------------------
		      // Am I already on the top of a column?  If so, ignore
		      ElementHeight = 0
		      If runningBase <> firstBase Then
		        NewColumnNeeded = True
		      End If
		      LastLine = l
		      
		    ElseIf Left(line, 3) = "-!!" Then
		      ' ------------------- NEW PAGE -------------------
		      // Only do this if we are not at the start of a page
		      ElementHeight = 0
		      If Not ((leftEdge = 0) And (runningBase = firstBase)) Then
		        NewPageNeeded = True
		      End If
		      LastLine = l
		      
		    ElseIf Left(line, 1) = ";" Then
		      ' ---------------------- COMMENT ----------------------
		      ElementHeight = Draw_CommentLine(g, x+leftEdge, runningBase, ColumnWidth, zoom, line, Page, xLayout)
		      LastLine = l
		      
		    ElseIf Left(lines(l), 1) = "[" Then
		      ' ----------------------- HEADING -----------------------
		      Dim success As Boolean
		      Dim sectionOptions As Dictionary
		      Dim sectionString As String
		      success = ParseSectionLine(line, section, sectionOptions, True)
		      If sectionOptions.HasKey("TrueSectionName") Then
		        sectionString = sectionOptions.Value("TrueSectionName")
		      Else
		        sectionString = section
		      End If
		      If layFilterSections And Not useSection.HasKey(sectionString) Then
		        hideSection = Not FilterSectionLines(lines,l+1,useSection,section)
		      Else
		        hideSection = False
		      End If
		      If hideSection Then
		        ElementHeight = 0
		      Else
		        isBilingual = sectionOptions <> Nil And sectionOptions.HasKey("L")
		        ElementHeight = Draw_HeadingLine(g, x+leftEdge, runningBase, ColumnWidth, zoom, section, Page, xLayout, verseIsCaption)
		        LastHeadingIndex = Page.Count - 1  // Used for widow control on page change
		        LastHeadingLine = l  // Ditto
		        LastLine = l
		      End If
		      
		    ElseIf lines(l).Len = 0 Then
		      ' ----------------------- Slide Separator with @blank_is_slide_change = True  -----------------------
		      // one lyric  line gap. May be smaller at the bottom and shall be ignored at the top
		      ElementHeight = SmartML.GetValueN(xLayout, "layout/lyrics/@space_before") * zoom _
		      + TextHeightV(LyricFont, g, zoom) _
		      + SmartML.GetValueN(xLayout, "layout/lyrics/@space_after") * zoom
		      If runningBase + ElementHeight >= bottom Then
		        If MultiColumn Then
		          NewColumnNeeded = True
		        Else
		          NewPageNeeded = True
		        End If
		        ElementHeight = 0
		      ElseIf runningBase = firstBase Then
		        ElementHeight = 0
		      End If
		    Else
		      ' -------------- ??? --------------
		      // don't know what it is. Just draw it in lyrics font
		      ElementHeight = DrawFontStringV(g, line.Mid(1), x+leftEdge, runningBase, LyricFont, ColumnWidth, zoom, Page)
		      LastLine = l
		    End If
		    
		    // Check for page/column change needed
		    App.DebugWriter.Write "SongML.Draw: Check at bottom of page, runningBase, ElementHeight, bottom = " _
		    + str(runningBase) + ", " + str(ElementHeight) + ", " + str(bottom)
		    If runningBase + ElementHeight >= bottom Then  // This element put us over
		      App.DebugWriter.Write "SongML.Draw: looking to go to a new column/page"
		      // Widow control: see if the header was the previous element or two
		      If (Page.Count - LastHeadingIndex < 3) And (LastHeadingIndex > 0) Then
		        For i = page.count - 1 downto LastHeadingIndex
		          Page.Remove i
		        Next
		        l = LastHeadingLine - 1  // position before the heading line
		      Else
		        Page.Remove Page.Count - 1  // pull out the element that put us over
		        l = LastLine - 1  // position before it
		      End If
		      
		      If MultiColumn Then
		        NewColumnNeeded = True
		      Else
		        NewPageNeeded = True
		      End If
		      
		    Else // Everything fit on the page/column, continue
		      runningBase = runningBase + ElementHeight
		    End If
		  Next l
		  
		  // If there's a partial page, add it to the pages
		  If Page <> Nil Then
		    If Page.Count > 0 Then Pages.Append Page
		  End If
		  Return Pages
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Draw_ChordLyricLine(songDoc As XmlDocument, g As Graphics, x As Double, y As Double, width As Double, zoom As Double, section As String, isBilingual As Boolean, ByRef lines() As String, startLineIndex As Integer, chordPos() As Integer, lineCount As Integer, ByRef Page As Group2D, xLayout As XmlNode) As Double
		  // this functions draws a chord line and the following lyrics lines that need to be spaced interdependent on the chord line
		  
		  #pragma Unused width
		  
		  If LineCount < 1 Then Return 0
		  
		  // get paramters from setup and song
		  Dim chordLineIndex, firstLineIndex As Integer
		  Dim chordFont, capoFont, bodyFont, langFont As FontFace
		  Dim printCapo, useSharp As Boolean
		  Dim capoPosition As Integer
		  Dim highlightChorus, hasChords, hasPrefix As Boolean
		  Dim lineSpaceBefore, lineSpaceAfter, langSpaceBefore, langSpaceAfter As Double
		  Dim blankUnderChordWidth As Double  // use the same with for body font and 2nd language
		  Static dash As String = &u2010  // hyphen
		  Static blankUnderChord As String = &u2003  // em-space : used as a minimum indent if there's whitespace in the lyrics beneath the chord
		  
		  hasChords = lines(startLineIndex).Len > 0 And lines(startLineIndex).Left(1) = "."
		  If hasChords Then
		    chordLineIndex = startLineIndex
		    firstLineIndex = chordLineIndex + 1
		  Else
		    chordLineIndex = -1
		    firstLineIndex = startLineIndex
		  End If
		  
		  bodyFont = SmartML.GetValueF(xLayout, "lyrics")
		  blankUnderChordWidth = TextWidthV(blankUnderChord, bodyFont, g, zoom)
		  lineSpaceBefore = SmartML.GetValueN(xLayout, "layout/lyrics/@space_before") * zoom
		  lineSpaceAfter = SmartML.GetValueN(xLayout, "layout/lyrics/@space_after") * zoom
		  
		  If isBilingual Then
		    langFont = SmartML.GetValueF(xLayout, "lyrics_language2")
		    langSpaceBefore = SmartML.GetValueN(xLayout, "layout/lyrics_language2/@space_before") * zoom
		    langSpaceAfter  = SmartML.GetValueN(xLayout, "layout/lyrics_language2/@space_after") * zoom
		  End If
		  If IsChorus(section) Then
		    highlightChorus = SmartML.GetValueB(xLayout, "style/@highlight_chorus", False, True)
		    If highlightChorus Then
		      bodyFont.Bold = Not bodyFont.Bold
		      If IsBilingual Then
		        langFont.Bold = Not langFont.Bold
		      End If
		    End If
		  End If
		  
		  Dim layPrintChords, layPrintCapo As Boolean
		  If hasChords Then
		    layPrintChords = SmartML.GetValueB(xLayout, "layout/chords/@print", True, True)
		    If layPrintChords Then
		      layPrintCapo = SmartML.GetValueB(xLayout, "layout/capo/@print", True, True)
		    End If
		    chordFont = SmartML.GetValueF(xLayout, "chords")
		    If layPrintCapo Then
		      printCapo = SmartML.GetValueB(SmartML.GetNode(songDoc.DocumentElement, "capo"), "@print")
		    End If
		    If printCapo Then
		      capoPosition = 12 - SmartML.GetValueN(songDoc.DocumentElement, "capo")
		      If StrComp(SmartML.GetValue(songDoc.DocumentElement, "capo/@sharp", False, "unDefined"), "unDefined", 0) = 0 Then
		        useSharp = MainWindow.pop_song_accidentals.ListIndex = 0
		      Else
		        useSharp = SmartML.GetValueB(songDoc.DocumentElement, "capo/@sharp")
		      End If
		      If SmartML.GetValueB(xLayout, "layout/capo/@hideregularchords", True, False) Then
		        layPrintChords = False
		        printCapo = False
		      Else
		        capoFont = SmartML.GetValueF(xLayout, "capo_chords")
		      End If
		    End If
		  End If
		  
		  Dim i, j, lastLineIndex As Integer
		  Dim st, chars As Integer
		  Dim lineX, sliceX, sliceY As Double
		  Dim oldY As Double
		  Dim line, slice As String
		  Dim OutputGraphics As New Group2D
		  Dim sliceWidth() As Double
		  
		  oldY = y
		  
		  
		  // print prefixes if needed
		  lastLineIndex = startLineIndex + lineCount - 1
		  i = firstLineIndex
		  While i <= lastLineIndex
		    If lines(i).Left(1) <> " " Then
		      hasPrefix = True
		      x = x + Draw_LinePrefixes(g, x, y, zoom, lines, startLineIndex, lineCount, IsChorus(section), IsBilingual, printCapo, OutputGraphics, xLayout)
		      Exit
		    End If
		    i = i + 1
		  Wend
		  
		  lineX = x
		  
		  
		  // get width for each "column"
		  chordPos.Append 0  // this helps processing the last slice
		  chordPos(0) = 2  // this helps processing the slice before the first chord on the line
		  ReDim sliceWidth(UBound(chordPos))
		  
		  st = 2
		  For i = 1 To UBound(chordPos)
		    chars = chordPos(i) - st
		    If chars = 0 Then Continue
		    For j = startLineIndex To lastLineIndex
		      line = lines(j)
		      If chordPos(i) = 0 Then
		        slice = line.Mid(st)
		      Else
		        slice = line.Mid(st, chars)
		      End If
		      If j = chordLineIndex Then
		        // chords
		        slice = slice.RTrim
		        If slice.Len > 0 Then
		          sliceWidth(i-1) = TextWidthV(slice + "M", chordFont, g, zoom)  // 1 em spacing for chords
		          
		          If printCapo Then
		            slice = SingleTranspose(slice, capoPosition, useSharp)
		            sliceWidth(i-1) = Max(sliceWidth(i-1), TextWidthV(slice + "M", capoFont, g, zoom))
		          End If
		        End If
		      Else
		        // lyrics
		        slice = slice.ReplaceAll("_", "").CleanSpaces.LTrim
		        If slice.Len > 0 Then
		          Dim thisWidth As Double
		          If isBilingual And (j - firstLineIndex) Mod 2 = 1 Then
		            thisWidth = TextWidthV(slice, langFont, g, zoom)
		          Else
		            thisWidth = TextWidthV(slice, bodyFont, g, zoom)
		          End If
		          // if a slice starts with _ or " ", an initial space needs to be maintained
		          If i > 1 And InStr(" _",line.Mid(st,1)) <> 0 Then // i=1 is text before the first chord
		            sliceWidth(i-1) = Max(sliceWidth(i-1), thisWidth + blankUnderChordWidth)
		          Else
		            sliceWidth(i-1) = Max(sliceWidth(i-1), thisWidth)
		          End If
		        End If
		      End If
		    Next
		    st = chordPos(i)
		  Next
		  
		  If hasChords Then
		    // draw chords
		    line = lines(chordLineIndex)
		    st = 2
		    y = y + (SmartML.GetValueN(xLayout, "layout/chords/@space_before") * zoom)
		    sliceX = lineX
		    sliceY = y + TextAscentV(chordFont, g, zoom)  // Set baseline
		    For i = 1 To UBound(chordPos)
		      If chordPos(i) = 0 Then
		        slice = line.Mid(st)
		      Else
		        slice = line.Mid(st,chordPos(i) - st)
		      End If
		      slice = slice.RTrim
		      If Not layPrintChords Then
		        slice = SingleTranspose(slice, capoPosition, useSharp)
		      End If
		      If slice.Len > 0 Then
		        OutputGraphics.Append Draw_StringShape(sliceX, sliceY, slice, chordFont, zoom)
		      End If
		      sliceX = sliceX + sliceWidth(i-1)
		      st = chordPos(i)
		    Next
		    y = y + TextHeightV(chordFont, g, zoom) + (SmartML.GetValueN(xLayout, "layout/chords/@space_after") * zoom)
		    
		    // draw capo chords
		    If printCapo THEN
		      st = 2
		      y = y + (SmartML.GetValueN(xLayout, "layout/capo/@space_before") * zoom)
		      sliceX = lineX
		      sliceY = y + TextAscentV(capoFont, g, zoom)  // Set baseline
		      For i = 1 To UBound(chordPos)
		        If chordPos(i) = 0 Then
		          slice = line.Mid(st)
		        Else
		          slice = line.Mid(st,chordPos(i) - st)
		        End If
		        slice = slice.RTrim
		        
		        If slice.Len > 0 Then
		          OutputGraphics.Append Draw_StringShape(sliceX, sliceY, SingleTranspose(slice, capoPosition, useSharp), capoFont, zoom)
		        End If
		        sliceX = sliceX + sliceWidth(i-1)
		        st = chordPos(i)
		      Next
		      y = y + TextHeightV(capoFont, g, zoom) + (SmartML.GetValueN(xLayout, "layout/capo/@space_after") * zoom)
		    End If
		  End If
		  
		  // draw lyrics
		  Dim dashStart, dashWidth As Double
		  Dim joinedToNext As Boolean  // true if there is no whitespace at the border between this and the next slice
		  Dim offsetC As Integer  // number of characters from the previous slice is to be prepended to the next
		  Dim offsetX As Double
		  Dim lineFont As FontFace
		  Dim lineHeight, bodyHeight, langHeight As Double
		  Dim lineAscent, bodyAscent, langAscent As Double
		  Dim lineIs2ndLanguage As Boolean
		  bodyHeight = TextHeightV(bodyFont, g, zoom)
		  bodyAscent = TextAscentV(bodyFont, g, zoom)
		  If isBilingual Then
		    langHeight = TextHeightV(langFont, g, zoom)
		    langAscent = TextAscentV(langFont, g, zoom)
		  End If
		  For j = firstLineIndex To lastLineIndex
		    line = lines(j)
		    st = 2
		    dashStart = 0
		    lineIs2ndLanguage = isBilingual And (j - firstLineIndex) Mod 2 = 1
		    If lineIs2ndLanguage Then
		      lineFont = langFont
		      lineHeight = langHeight
		      lineAscent = langAscent
		    Else
		      lineFont = bodyFont
		      lineHeight = bodyHeight
		      lineAscent = bodyAscent
		    End If
		    If lineIs2ndLanguage Then
		      y = y + langSpaceBefore
		    Else
		      y = y + lineSpaceBefore
		    End If
		    sliceX = lineX
		    sliceY = y + lineAscent  // Set baseline
		    offsetX = 0
		    offsetC = 0
		    For i = 1 To UBound(chordPos)
		      If chordPos(i) = 0 Then
		        slice = line.Mid(st + offsetC)
		        joinedToNext = False
		      Else
		        slice = line.Mid(st + offsetC, chordPos(i) - (st + offsetC))
		        joinedToNext = chordPos(i) > 2 And LettersOnly(line.Mid(chordPos(i)-1,2))
		      End If
		      offsetX = 0
		      If offsetC <> 0 Then
		        offsetX = TextWidthV(StringUtils.RTrim(Line.Mid(st + offsetC, Abs(offsetC)), "_"), lineFont, g, zoom) * Sign(offsetC)
		        offsetC = 0
		      End If
		      
		      Dim fixedStart As Boolean  // may we add space at the start of this slice?
		      If i = 1 Then
		        fixedStart = False  // at the start of a line: yes
		      Else
		        fixedStart = LettersOnly(line.Mid(chordPos(i), 1))  // otherwise only if the first character is no letter
		      End If
		      If joinedToNext Then
		        Dim cp As Integer
		        cp = chordPos(i) - 1
		        While cp >= st And line.Mid(cp, 1) = "_"  // ignore dash at end
		          cp = cp - 1
		        Wend
		        While cp >= st And InStr(" _", line.Mid(cp, 1)) = 0
		          cp = cp - 1
		        Wend
		        If cp > st Or (cp = st and Not fixedStart) Then
		          offsetC = cp - chordPos(i) + 1
		          slice = slice.Left(slice.Len + offsetC)
		        End If
		      End If
		      slice = slice.ReplaceAll("_", "").CleanSpaces.LTrim
		      
		      If slice.Len > 0 Then
		        If i > 1 And InStr(" _", line.Mid(st,1)) <> 0 Then
		          offsetX = blankUnderChordWidth
		        End If
		        If hasChords Or hasPrefix Then
		          OutputGraphics.Append Draw_StringShape(sliceX + offsetX, sliceY, slice, lineFont, zoom)
		        Else
		          lineHeight = GraphicsX.DrawFontStringV(g, slice, sliceX + offsetX, sliceY - lineAscent, lineFont, width, zoom, OutputGraphics)
		        End If
		        
		        // print dashes preceding this slice
		        If dashStart <> 0 Then
		          dashWidth = TextWidthV(dash, lineFont, g, zoom)
		          If dashStart + dashWidth + 2 * zoom <= sliceX Then  // there's enough room for the dash
		            OutputGraphics.Append Draw_StringShape((sliceX + offsetX + dashStart - dashWidth) / 2, sliceY, dash, lineFont, zoom)
		          End If
		          
		          dashStart = 0
		        End If
		        
		        // prepare for dashes following this slice
		        If chordPos(i) > 2 Then
		          If InStr(line.Mid(chordPos(i) + offsetC - 1, 2), "_") <> 0 Or (JoinedToNext And offsetC = 0) Then
		            dashStart = sliceX + offsetX + TextWidthV(slice, lineFont, g, zoom)
		          Else
		            dashStart = 0
		          End If
		        Else
		          dashStart = 0
		        End If
		      End If
		      sliceX = sliceX + sliceWidth(i-1)
		      st = chordPos(i)
		    Next
		    y = y + lineHeight
		    If lineIs2ndLanguage Then
		      y = y + langSpaceAfter
		    Else
		      y = y + lineSpaceAfter
		    End If
		  Next
		  
		  Page.Append OutputGraphics  // Add what we've done to the page.
		  Return y - oldY
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Draw_CommentLine(g As Graphics, x As Double, y As Double, Width As Double, zoom As Double, ByRef line As String, ByRef Page As Group2D, xLayout As XmlNode) As Double
		  Dim tempFont As FontFace
		  Dim Comment As String
		  Dim elementHeight As Double
		  
		  // Don't print if the line starts with two semi-colons (allows "hidden" comments to be created)
		  If Left(line, 2) = ";;" Then Return 0
		  
		  tempFont = SmartML.GetValueF(xLayout, "copyright")
		  Comment = Mid(line, 2)
		  
		  elementHeight = DrawFontStringV(g, Comment, x, y, tempFont, Width, zoom, Page)
		  
		  Return elementHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Draw_Footer(songDoc As XmlDocument, g As Graphics, x As Double, y As Double, width As Double, zoom As Double, PageNum As Integer, ByRef Page As Group2D, LayoutSettings As XmlDocument = Nil) As Double
		  ' Pass x, y based on lower-left corner
		  ' Returns height
		  // Vector graphics version
		  // Ed Palmer, 12/05
		  //
		  Dim ext As String
		  Dim height As Double
		  Dim tempFont As FontFace
		  Dim PageNumString As String
		  Dim PageNumWidth As Double
		  Dim xLayout As XmlNode
		  
		  Dim Footer As New Group2D
		  
		  Dim copyrightSymbol As String = ConvertEncoding(App.T.Translate("songml/symbol/@caption"), Encodings.UTF8)
		  
		  g.PenWidth = 1
		  g.PenHeight = 1
		  height = 0
		  
		  If LayoutSettings = Nil Then
		    xLayout = App.MyPrintSettings.DocumentElement
		  Else
		    xLayout = LayoutSettings.DocumentElement
		  End If
		  
		  tempFont = SmartML.GetValueF(xLayout, "copyright")
		  
		  // Compute the width of the page number first so we can avoid a collision with longer copyright strings
		  If PageNum > 1 Then
		    PageNumString = App.T.Translate("print/page/@caption", str(PageNum))
		    PageNumWidth = TextWidthV(PageNumString + "N", tempFont, g, zoom)
		  Else
		    PageNumString = ""
		    PageNumWidth = 0
		  End If
		  
		  // Copyright stuff - from the bottom upwards
		  ext = SmartML.GetValue(App.MyMainSettings.DocumentElement, "ccli/@number")
		  If Len(ext) > 0  Then
		    ext = App.T.Translate("print/ccli_license/@caption") + " " + ext
		    height = height + GraphicsX.DrawFontStringV(g, ext, x + PageNumWidth, y-height, tempFont, width - (2 * PageNumWidth), zoom, Footer, "center", 0, "bottom")
		  End If
		  ext = SmartML.GetValue(songDoc.DocumentElement, "ccli", True)
		  If Len(ext) > 0 And ext <> "0000" Then
		    ext = App.T.Translate("print/ccli_number/@caption") + " " + ext
		    height = height + GraphicsX.DrawFontStringV(g, ext, x + PageNumWidth, y - height, tempFont, width - (2 * PageNumWidth), zoom, Footer, "center", 0, "bottom")
		  End If
		  
		  ext = SmartML.GetValue(songDoc.DocumentElement, "copyright", True)
		  Try
		    ext = ConvertEncoding(ext, Encodings.UTF8)
		  Catch ex as RuntimeException
		    App.DebugWriter.Write "SongML::Draw_Footer: caught exception converting copyright to UTF-8"
		  End Try
		  If Len(ext) > 0 Then
		    If Instr(ext, copyrightSymbol) = 0 And InStr(ext, &ua9) = 0 Then
		      ext = App.T.Translate("print/copyright/@caption") + " " + copyrightSymbol + " " + ext
		    End If
		    height = height + GraphicsX.DrawFontStringV(g, ext, x + PageNumWidth, y-height, tempFont, width - (2 * PageNumWidth), zoom, Footer, "center", 0, "bottom")
		  End If
		  // Draw the page number on the same line as the last line of text.
		  // If there's not a last line of text, then this is the last line
		  If PageNum > 1 Then
		    If height = 0 Then
		      height = GraphicsX.DrawFontStringV(g, PageNumString, x, y - height, tempFont, width, zoom, Footer, "left", 0, "bottom")
		    Else
		      Call GraphicsX.DrawFontStringV(g, PageNumString, x, y - height, tempFont, width, zoom, Footer, "left", 0, "top")
		    End If
		  End If
		  Dim footerLineY As Double = y - height - g.PenWidth - 1
		  Footer.Append GraphicsX.DrawLineV(x, footerLineY, x + width, footerLineY, RGB(0, 0, 0), g.PenWidth)
		  height = height + TextHeightV(tempFont, g, zoom) // Add a one-line margin above horizontal line
		  Page.Append Footer
		  Return height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Draw_Header(songDoc As XmlDocument, g As Graphics, x As Double, y As Double, width As Double, zoom As Double, Page As Group2D, LayoutSettings As XmlDocument = Nil) As Double
		  Dim height As Double = 0
		  Dim lineheight As Double
		  Dim ext As String
		  Dim titleFont, authorFont, songnoFont As FontFace
		  Dim extraFont As FontFace
		  Dim title, author, songno As String
		  Dim titleWidth, authorWidth, songnoWidth As Double
		  Dim EM_Width As Double
		  Dim Header As New Group2D
		  Dim lineObj As CurveShape
		  Dim TitleHeight As Double
		  Dim SongNumHeight As Double
		  Dim AuthorHeight As Double
		  Dim MaxAscent As Double
		  Dim MaxHeight As Double
		  Dim TitleDescent, SongNoDescent As Double
		  Dim SongNoWrapWidth As Double
		  Dim xLayout As XmlNode
		  
		  If LayoutSettings = Nil Then
		    xLayout = App.MyPrintSettings.DocumentElement
		  Else
		    xLayout = LayoutSettings.DocumentElement
		  End If
		  
		  title = SmartML.GetValue(songDoc.DocumentElement, "title", True).Trim
		  author = SmartML.GetValue(songDoc.DocumentElement, "author", True).Trim
		  songno = SmartML.GetValue(songDoc.DocumentElement, "hymn_number", True).Trim
		  
		  titleFont = SmartML.GetValueF(xLayout, "title")
		  authorFont = SmartML.GetValueF(xLayout, "author")
		  songnoFont = SmartML.GetValueF(xLayout, "title")
		  extraFont = SmartML.GetValueF(xLayout, "copyright")
		  
		  If SmartML.GetValueB(xLayout, "style/@caps_song_title") Then title = Uppercase(title)
		  
		  'Title
		  EM_Width = TextWidthV("M", titleFont, g, zoom) 'for spacing between elements
		  titleWidth = TextWidthV(title, titleFont, g, zoom)
		  MaxAscent = TextAscentV(titleFont, g, zoom)
		  MaxHeight = TextHeightV(titleFont, g, zoom)
		  TitleDescent = TextHeightV(titleFont, g, zoom) + TextAscentV(titleFont, g, zoom)
		  
		  'Song Number
		  songnoWidth = 0
		  If Len(songno) > 0 Then
		    songnoWidth = TextWidthV(songno, songnoFont, g, zoom) + EM_Width
		    MaxAscent = Max(MaxAscent, TextAscentV(songnoFont, g, zoom))
		    MaxHeight = Max(MaxHeight, TextHeightV(songnoFont, g, zoom))
		    SongNoDescent = TextHeightV(songnoFont, g, zoom) + TextAscentV(songnoFont, g, zoom)
		  End If
		  
		  'Author
		  authorWidth = 0
		  AuthorHeight = 0
		  If len(author) > 0 Then
		    authorWidth = TextWidthV(author, authorFont, g, zoom) + EM_Width
		    AuthorHeight = TextHeightV(authorFont, g, zoom)
		  End If
		  
		  //
		  // At the end of the this If, height will be the height of all the text including descenders
		  // lineheight will be the baseline of the last line of the title, author and song number
		  //
		  If titleWidth + authorWidth + songnoWidth >  width Then  //Put author on a new line
		    //
		    // Song number and Title may still overlap.
		    // Balance the header
		    //
		    If songnoWidth + titleWidth > width Then
		      If songnoWidth > width / 4 Then
		        SongNoWrapWidth = width / 4
		      Else
		        SongNoWrapWidth = songnoWidth
		      End If
		      TitleHeight = DrawFontStringV(g, title, x, y, titleFont, width - SongNoWrapWidth, zoom, Header, "left")
		      SongNumHeight = 0
		      If songnoWidth > 0 Then
		        SongNumHeight = DrawFontStringV(g, songno, x  + (width - SongNoWrapWidth), y, songnoFont, _
		        SongNoWrapWidth, zoom, Header, "right")
		      End If
		    Else
		      SongNumHeight = 0
		      TitleHeight = DrawFontStringV(g, title, x, y, titleFont, width, zoom, Header, "left")
		      If songnoWidth > 0 Then
		        SongNumHeight = DrawFontStringV(g, songno, x, y, songnoFont, width, zoom, Header, "right")
		      End If
		    End If
		    height = Max(TitleHeight, SongNumHeight)
		    If len(author) > 0 Then
		      AuthorHeight = DrawFontStringV(g, author, x, height, authorFont, width, zoom, Header, "right")
		      height = height + AuthorHeight
		      lineheight = height - (TextHeightV(authorFont, g, zoom) - TextAscentV(authorFont, g, zoom))
		    Else
		      MaxAscent = Max(TitleHeight - TitleDescent, SongNumHeight - SongNoDescent)
		      MaxHeight = Max(TitleHeight, SongNumHeight)
		      lineheight = height - (MaxHeight - MaxAscent)
		    End If
		  Else
		    'add Author values
		    If Len(author) > 0 Then
		      MaxAscent = Max(MaxAscent, TextAscentV(authorFont, g, zoom))
		      MaxHeight = Max(MaxHeight, AuthorHeight)
		    End If
		    
		    'Title
		    height = MaxAscent
		    titleFont.OntoGraphics g, zoom 'in case the Title isn't the largest font
		    Header.Append GraphicsX.DrawStringShapeV(title, x, y + height, titleFont, zoom, StringShape.Alignment.Left)
		    
		    'Author
		    If Len(author) > 0 Then
		      authorWidth = authorWidth - EM_Width 'Will right justify if no song number, otherwise it's between the title and song number
		      Header.Append GraphicsX.DrawStringShapeV(author, x + width - songnoWidth, y + height, authorFont, zoom, StringShape.Alignment.Right)
		    End If
		    
		    'Songno
		    songnoWidth = songnoWidth - EM_Width
		    Header.Append GraphicsX.DrawStringShapeV(songno, x + width, y + height, songnoFont, zoom,StringShape.Alignment.Right)
		    height = MaxHeight
		    lineheight = MaxAscent
		  End If
		  
		  'Upper Border
		  Dim lineGap As Double
		  If titleFont.Size > authorFont.Size Then 'Unlikely, but still should check it
		    lineGap = TextHeightV(titleFont, g, zoom) - TextAscentV(titleFont, g, zoom)
		  Else
		    lineGap = TextHeightV(authorFont, g, zoom) - TextAscentV(authorFont, g, zoom)
		  End If
		  lineGap = Max(2, lineGap / 4)
		  
		  lineObj = New CurveShape
		  lineobj.x = x
		  lineobj.y = y + lineheight + lineGap
		  lineobj.x2 = x + width
		  lineobj.y2 = y + lineheight + lineGap
		  lineobj.BorderColor = &c000000
		  lineobj.BorderWidth = 1.0
		  Header.Insert 0, lineObj  // Put the line behind everything else
		  height = lineheight + lineGap + 1
		  
		  ' -- Extra Header Stuff --
		  Dim extVal As String
		  'Tempo
		  ext = SmartML.GetValue(songDoc.DocumentElement, "tempo").Trim
		  'Time
		  extVal = SmartML.GetValue(songDoc.DocumentElement, "time_sig").Trim
		  If extVal <> "" Then
		    If ext <> "" Then
		      ext = ext + " - " + extVal + " Time"
		    Else
		      ext = extVal + " Time"
		    End If
		  End If
		  'Capo
		  If SmartML.GetValueN(songDoc.DocumentElement, "capo") <> 0 _
		    And SmartML.GetValueB(songDoc.DocumentElement, "capo/@print") _
		    And SmartML.GetValueB(xLayout, "layout/capo/@print", True, True) _
		    Then
		    If ext <> "" Then
		      ext = ext + " - " + App.T.Translate("songml/capo/@caption") + " " + Str(SmartML.GetValueN(songDoc.DocumentElement, "capo"))
		    Else
		      ext = App.T.Translate("songml/capo/@caption") + " " + Str(SmartML.GetValueN(songDoc.DocumentElement, "capo"))
		    End If
		  End If
		  If ext <> "" Then
		    lineheight = height + TextAscentV(extraFont, g, zoom)
		    Header.Append GraphicsX.DrawStringShapeV(ext, x + width, y + lineheight, extraFont, zoom, StringShape.Alignment.Right)
		    height = height + TextHeightV(extraFont, g, zoom)
		  End If
		  'Presentation Order
		  '(Make optional element based on xLayout/leadsheet/@presentation)
		  extVal = SmartML.GetValue(songdoc.DocumentElement, "presentation").Trim
		  If extVal <> "" And SmartML.GetValueB(xLayout, "leadsheet/@presentation", True, False) Then
		    ext = App.T.Translate("songml/presentation/@caption") + " " + extVal
		    height = height + GraphicsX.DrawFontStringV(g, ext, x, y + height, extraFont, width, zoom, Header, "right")
		  End If
		  Page.Append Header
		  height = height + TextHeightV(extraFont, g, zoom) 'Now we've written this far + a blank line
		  
		  Return height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Draw_HeadingLine(g As Graphics, x As Double, y As Double, ColWidth As Double, zoom As Double, heading As String, Page As Group2D, xLayout As XmlNode, literalVerseText As Boolean = False) As Double
		  // Revised Routine for Vector Graphics
		  // Ed Palmer, 12/05
		  
		  #pragma Unused ColWidth
		  
		  Dim tempFont As FontFace
		  Dim tempHeight, tempAscent As Double
		  Dim j, oddOffSet As Integer
		  Dim oldY, oldWidth, oldHeight As Double
		  //++
		  Dim rr As RoundRectShape
		  Dim MidX As Double
		  
		  Dim rrx, rry As Integer
		  Dim HeadingLine As New Group2D
		  Dim printHeaderBox As Boolean
		  Const Leading As Integer = 3
		  
		  // be conservative as to what we accept as headers we associate with predefined sections
		  // whatever does not match this pattern will be used litterally as header
		  // See changes in revision 713 and bug report in Discussion forum
		  Dim type As String
		  Dim headerText As String
		  type = HeadingType(heading)
		  If literalVerseText And heading.Left(1) = "V" Then  // special treatment for set list
		    type = ""
		    headerText = FullHeading(type, heading.Mid(2), True)
		  Else
		    headerText = FullHeading(type, heading, True)
		  End If
		  
		  oldY = y
		  
		  tempFont = SmartML.GetValueF(xLayout, "heading")
		  
		  oldWidth = g.PenWidth
		  oldHeight = g.PenHeight
		  g.PenWidth = SmartML.GetValueN(xLayout, "style/@border_thickness")
		  g.PenHeight = g.PenWidth
		  
		  printHeaderBox = SmartML.GetValueB(xLayout, "style/@header_adornment", True, True)
		  
		  tempHeight = TextHeightV(tempFont, g, zoom)
		  tempAscent = TextAscentV(tempFont, g, zoom)
		  
		  y =  y + (SmartML.GetValueN(xLayout, "layout/sections/@space_before") * zoom)
		  
		  oddOffSet = (g.PenWidth + 2) Mod 2
		  
		  Select Case type
		  Case "V"  // -- VERSE --
		    If printHeaderBox Then
		      rr = New RoundRectShape
		      rr.Height = tempHeight + (2 * g.PenWidth) + oddOffSet + (2 * zoom)
		      rr.BorderWidth = g.PenWidth
		      rr.Border = 100 'No transparency
		      rr.CornerHeight = rr.Height / 2
		      rr.CornerWidth = rr.CornerHeight
		      rr.Width = TextWidthV(headerText, tempFont, g, zoom) + rr.BorderWidth * 2 + rr.CornerWidth * 2
		      rrx = x + (rr.Width / 2)
		      rry = y + (rr.Height / 2)
		      rr.X = rrx
		      rr.Y = rry
		      rr.Fill = 0
		      rr.BorderColor = g.ForeColor
		      HeadingLine.Append rr
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, rrX, Y + oddOffSet + rr.BorderWidth + tempAscent, tempFont, zoom, StringShape.Alignment.Center, StringShape.Alignment.BaseLine)
		      // Position to new y
		      y = y + rr.Height
		    Else
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, x, y + tempAscent, tempFont, zoom, StringShape.Alignment.Left, StringShape.Alignment.BaseLine)
		      y = y + tempHeight
		    End If
		    
		  Case "P"  // -- PRE-CHORUS --
		    If printHeaderBox Then
		      j = y + (g.PenWidth / 2)
		      If (g.PenWidth+3) Mod 2 = 0 Then j = j + 1
		      HeadingLine.Append GraphicsX.DrawLineV(x + 1, j, x + g.PenWidth + TextWidthV(headerText, tempFont, g, zoom) + oddOffSet + 1, j, g.ForeColor, g.PenWidth)
		      j = j + tempHeight + (1 * zoom) ' Add one point to give a little space between the text and the line
		      HeadingLine.Append GraphicsX.DrawLineV(x + 1, j, x + g.PenWidth + TextWidthV(headerText, tempFont, g, zoom) + oddOffSet + 1, j, g.ForeColor, g.PenWidth)
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, x + g.PenWidth + 1 + (TextWidthV(headerText, tempFont, g,zoom) / 2), j - (tempHeight - tempAscent) - (1 * zoom), _
		      tempFont, zoom)  // That nasty Y coordinate is just reversing out the one point whitespace and then going up to the baseline (height - ascent = decent)
		      y = j + (g.PenWidth)
		    Else
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, x, y + tempAscent, tempFont, zoom, StringShape.Alignment.Left)
		      y = y + tempHeight
		    End If
		    
		  Case "C"  // -- CHORUS --
		    If printHeaderBox Then
		      Dim boxHeight As Double
		      Dim boxWidth As Double
		      // Width is the width of the text plus the width of the box lines plus an extra point padding on each side
		      boxWidth = TextWidthV(headerText, tempFont, g, zoom) + (2 * g.PenWidth) + oddOffSet + (2 * zoom)
		      boxHeight = tempHeight + (2 * g.PenWidth) + oddOffSet + (2 * zoom)
		      // Calculate the vector x (center of text to be printed)
		      MidX = x + (boxWidth / 2)
		      
		      Dim rect As New RectShape
		      rect.Width = boxWidth
		      rect.Height = boxHeight
		      rect.BorderWidth = g.PenWidth
		      rect.BorderColor = g.ForeColor
		      rect.BorderOpacity = 100
		      rect.FillColor = &cFFFFFF
		      rect.FillOpacity = 0
		      rect.X = MidX
		      rect.Y = y + (boxHeight / 2)
		      
		      HeadingLine.Append rect
		      
		      HeadingLine.Append GraphicsX.DrawStringShapeV(heading, midx, y + oddOffset + rect.BorderWidth + g.TextAscent, tempFont, zoom)
		      
		      y = y + rect.Height
		    Else
		      If SmartML.GetValueB(xLayout, "style/@highlight_chorus") Then
		        If tempFont.Bold Then
		          tempFont.Italic = Not tempFont.Italic
		        Else
		          tempFont.Bold = True
		        End If
		      End If
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, x, y + tempAscent, tempFont, zoom, StringShape.Alignment.Left)
		      y = y + tempHeight
		    End If
		    
		  Case "B"   // -- BRIDGE --
		    If printHeaderBox Then
		      rr = New RoundRectShape
		      rr.Height = tempHeight + g.PenWidth * 2 + oddOffSet
		      rr.BorderWidth = g.PenWidth
		      rr.Border = 100 'No transparency
		      rr.CornerHeight = rr.Height / 4
		      rr.CornerWidth = rr.CornerHeight
		      rr.Width = TextWidthV(headerText, tempFont, g, zoom) + rr.BorderWidth * 2 + rr.CornerWidth * 2
		      rrx = x + (rr.Width / 2)
		      rry = y + (rr.Height / 2)
		      rr.X = rrx
		      rr.Y = rry
		      rr.Fill = 0
		      rr.BorderColor = g.ForeColor
		      HeadingLine.Append rr
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, rrX, Y + oddOffSet + rr.BorderWidth + tempAscent, tempFont, zoom, StringShape.Alignment.Center, StringShape.Alignment.BaseLine)
		      // Position to new y
		      y = y + rr.Height
		    Else
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, x, y + tempAscent, tempFont, zoom, StringShape.Alignment.Left)
		      y = y + tempHeight
		    End If
		    
		  Case "T"   // -- TAG --
		    If printHeaderBox Then
		      headerText = " " + headerText + " "
		      // Side
		      HeadingLine.Append GraphicsX.DrawLineV(x + g.PenWidth / 2, y, x + g.PenWidth / 2, y + tempHeight + g.PenWidth, g.ForeColor, g.PenWidth)
		      // Bottom
		      HeadingLine.Append GraphicsX.DrawLineV(x + g.PenWidth / 2, y + tempHeight + g.PenWidth, _
		      x + TextWidthV(headerText, tempFont, g, zoom) + oddOffSet + (2 * zoom), y + tempHeight + g.PenWidth, g.ForeColor, g.PenWidth)
		      
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, x + g.PenWidth + (TextWidthV(headerText, tempFont, g, zoom) / 2), _
		      y + tempAscent, tempFont, zoom)
		      
		      y = y + tempHeight + g.PenHeight
		    Else
		      HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, x, y + tempAscent, tempFont, zoom, StringShape.Alignment.Left)
		      y = y + tempHeight
		    End If
		    
		  Case Else
		    HeadingLine.Append GraphicsX.DrawStringShapeV(headerText, x, y + tempAscent, tempFont, zoom, StringShape.Alignment.Left)
		    y = y + tempHeight
		  End Select
		  
		  g.PenWidth = oldWidth
		  g.PenHeight = oldHeight
		  
		  Page.Append HeadingLine
		  
		  Dim spaceAfter As Double = SmartML.GetValueN(xLayout, "layout/sections/@space_after")
		  If spaceAfter = 0 Then spaceAfter = Leading
		  
		  y = y + (spaceAfter * zoom)
		  Return y - oldY
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Draw_LinePrefixes(g As Graphics, x As Double, y As Double, zoom As Double, ByRef lines() As String, startLineIndex As Integer, lineCount As Integer, isChorus As Boolean, IsBilingual As Boolean, printCapoChord As Boolean, ByRef Page As Group2D, xLayout As XmlNode) As Double
		  Dim tempFont, langFont As FontFace
		  Dim i, j As Integer
		  Dim prefix As String
		  Dim lineTop, prefixWidth, nextLeft As Double
		  Dim cs As New CurveShape
		  Dim lineSpaceBefore, lineSpaceAfter, lineHeight, lineAscent As Double
		  Dim langSpaceBefore, langSpaceAfter, langHeight, langAscent As Double
		  Dim highlightChorus, lineIs2ndLanguage As Boolean
		  
		  lineTop = y
		  
		  i = startLineIndex
		  If lines(i).Left(1) = "." Then
		    ' Skip the chord line
		    tempFont = SmartML.GetValueF(xLayout, "chords")
		    
		    y = y + TextHeightV(tempFont, g, zoom) ' Skip past the chord line
		    y = y + (SmartML.GetValueN(xLayout, "layout/chords/@space_before") * zoom)
		    y = y + (SmartML.GetValueN(xLayout, "layout/chords/@space_after") * zoom)
		    
		    ' Skip the capo line if needed
		    If printCapoChord Then
		      tempFont = SmartML.GetValueF(xLayout, "capo_chords")
		      
		      y = y + TextHeightV(tempFont, g, zoom) ' Skip past the capo chord line
		      y = y + (SmartML.GetValueN(xLayout, "layout/capo/@space_before") * zoom)
		      y = y + (SmartML.GetValueN(xLayout, "layout/capo/@space_after") * zoom)
		    End If
		    i = i + 1
		  End If
		  
		  If isChorus Then
		    highlightChorus = SmartML.GetValueB(xLayout, "style/@highlight_chorus", False, True)
		  End If
		  tempFont = SmartML.GetValueF(xLayout, "lyrics")
		  lineSpaceBefore = SmartML.GetValueN(xLayout, "layout/lyrics/@space_before") * zoom
		  lineSpaceAfter = SmartML.GetValueN(xLayout, "layout/lyrics/@space_after") * zoom
		  If highlightChorus Then  // spacing bold as lyrics
		    tempFont.Bold = Not tempFont.Bold
		  End If
		  lineHeight = TextHeightV(tempFont, g, zoom)
		  lineAscent = TextAscentV(tempFont, g, zoom)
		  If highlightChorus Then  // drawing non-bold
		    tempFont.Bold = Not tempFont.Bold
		  End If
		  If IsBilingual Then
		    langFont = SmartML.GetValueF(xLayout, "lyrics_language2")
		    langSpaceBefore = SmartML.GetValueN(xLayout, "layout/lyrics_language2/@space_before") * zoom
		    langSpaceAfter  = SmartML.GetValueN(xLayout, "layout/lyrics_language2/@space_after") * zoom
		    If highlightChorus Then
		      langFont.Bold = Not langFont.Bold
		    End If
		    langHeight = TextHeightV(langFont, g, zoom)
		    langAscent = TextAscentV(langFont, g, zoom)
		    If highlightChorus Then
		      langFont.Bold = Not langFont.Bold
		    End If
		  End If
		  
		  lineTop = y
		  
		  ' Loop through the lines and print
		  For j = i To startLineIndex + lineCount - 1
		    prefix = Left(lines(j),1)
		    lineIs2ndLanguage = IsBilingual And (j-i) mod 2 = 1
		    If lineIs2ndLanguage Then
		      lineTop = lineTop + langSpaceBefore
		      Page.Append Draw_StringShape(x, lineTop + langAscent, prefix, langFont, zoom)
		      lineTop = lineTop + langHeight + langSpaceAfter
		      prefixWidth = Max(prefixWidth, TextWidthV(prefix, langFont, g, zoom))
		    Else
		      lineTop = lineTop + lineSpaceBefore
		      Page.Append Draw_StringShape(x, lineTop + lineAscent, prefix, tempFont, zoom)
		      lineTop = lineTop + lineHeight + lineSpaceAfter
		      prefixWidth = Max(prefixWidth, TextWidthV(prefix, tempFont, g, zoom))
		    End If
		  Next j
		  nextLeft = x + prefixWidth
		  
		  ' Draw the line
		  nextLeft = nextLeft + TextWidthV("N", tempFont, g, zoom) ' one-EN separation
		  g.PenWidth = 0
		  g.PenHeight = 0
		  cs.x = nextLeft
		  cs.y = y + (g.TextAscent / 4)
		  cs.x2 = nextleft
		  cs.y2 = linetop - lineHeight + lineAscent + Max(2, Round((lineHeight - lineAscent) / 4))
		  cs.BorderColor = g.ForeColor
		  cs.BorderWidth = 1
		  Page.Append cs
		  
		  nextLeft = nextLeft + TextWidthV("M", tempFont, g, zoom)
		  
		  Return nextLeft - x
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Draw_Separator(g As Graphics, x As Double, y As Double, w As Double, zoom As Double, LyricFont As FontFace, ByRef Page As Group2D) As Double
		  Dim height As Double = TextHeightV(LyricFont, g, zoom)
		  
		  Page.Append GraphicsX.DrawLineV(x, y + (height / 2), x + w, y + (height / 2), RGB(127, 127, 127), 1)
		  Return height
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Draw_StringShape(x As Double, y As Double, text As String, font As FontFace, zoom As Double) As StringShape
		  // simplistic version of GraphicsX.DrawFontString : no wrapping, no border, no shadow, align is always x = left, y = baseline
		  Dim s As New StringShape
		  font.OntoStringShape s, zoom
		  s.HorizontalAlignment = StringShape.Alignment.Left
		  s.X = x
		  s.Y = y
		  s.Text = text
		  Return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterSectionLines(ByRef lines() As String, Start As Integer, ByRef UseSection As Dictionary, ByRef Section As String) As Boolean
		  // removes lines in section starting from Start until next section unless their section is in UseSection
		  // If lines have prefixes, and only one prefix remains, the prefix is removed and appended to the Section parameter instead
		  // Returns True, if the entire section is to be hidden, i.e. the section capton is not to be drawn
		  
		  Dim i As Integer
		  Dim hasLine As Boolean
		  Dim newSection, lineSection As String
		  Dim sectionPrefix, sectionPostfix As String
		  
		  If section.EndsWith("-L") Then
		    sectionPrefix = StringUtils.Chop(section, "-L")
		    sectionPostfix = "-L"
		  ElseIf Section.EndsWith("L") And Section.Len > 1 Then
		    sectionPrefix = StringUtils.Chop(section, "L")
		    sectionPostfix = "L"
		  Else
		    sectionPrefix = Section
		    sectionPostfix = ""
		  End If
		  
		  i = Start
		  While i <= lines.Ubound
		    If lines(i).Left(1) = "[" Then Exit
		    If InStr(" 123456789",lines(i).Left(1)) <> 0 Then
		      lineSection = sectionPrefix + lines(i).Left(1).Trim + sectionPostfix
		      If UseSection.HasKey(lineSection) Then
		        If newSection = "" Then
		          newSection = lineSection
		        ElseIf newSection <> lineSection Then
		          newSection = "[" // used as a marker
		        End If
		        hasLine = True
		      Else
		        lines.Remove(i)
		        Continue
		      End If
		    End If
		    i = i + 1
		  Wend
		  
		  If Not hasLine Then
		    // clean out non-lyrics lines left in above
		    i = Start
		    While i <= lines.Ubound
		      If lines(i).Left(1) = "[" Then Exit
		      lines.Remove(i)
		    Wend
		  End If
		  
		  If hasline And newSection <> "[" Then
		    Section = newSection
		    i = Start
		    While i <= lines.Ubound
		      If lines(i).Left(1) = "[" Then Exit
		      If InStr("123456789",lines(i).Left(1)) <> 0 Then
		        lines(i) = " " + lines(i).Mid(2)
		      End If
		      i = i + 1
		    Wend
		  End If
		  Return hasLine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindChord(songElement As XmlNode, ChordKey As String, ChordForm As String, startPos As Integer = 1, ByRef FoundChord As String) As Integer
		  // JRC
		  //Find the specified chord in song lyrics
		  //startPos is an optional starting position in the lyrics
		  //Returns the location of the chord in the lyrics
		  //or zero if the specified chord cannot be found
		  
		  Dim rawLyrics As String
		  Dim lyricArray() As String
		  Dim i As Integer
		  Dim pos As Integer
		  Dim chordP As Integer
		  Dim formP As Integer
		  Dim startP As Integer
		  Dim chords() As String
		  Dim forms() As String
		  Dim KeyIndex As Integer
		  Dim FormIndex As Integer
		  
		  ' "Any" chord
		  If ChordKey = "." Then
		    chords = Split(App.T.Translate("songml/chordkeys"), ",")
		    chords.Remove 0
		  Else
		    chords.Append  ChordKey
		  End If
		  
		  ' "Any" chord form
		  If ChordForm = "." Then
		    forms = Split(App.T.Translate("songml/chordforms"), ",")
		    forms.Remove 0
		  Else
		    forms.Append  ChordForm
		  End If
		  
		  rawLyrics = SmartML.GetValue(songElement, "lyrics", False).FormatUnixEndOfLine
		  
		  'startPos > lyrics length, probably means we've reached the end of the song from the previous call
		  If startPos > rawLyrics.Len Then
		    startPos = 1
		    pos = 1
		  ElseIf startPos > 0 Then
		    'find start of line from startPos for reference
		    startP = StringUtils.InStrReverse(startPos, rawLyrics, EndOfLine.UNIX)
		    startP = startP + 1
		    pos = startP
		    rawlyrics = Mid(rawlyrics, pos)
		  Else
		    pos = 1
		  End If
		  
		  'split lyrics to separate lines
		  lyricArray = Split(rawLyrics, EndOfLine.UNIX)
		  
		  
		  While i <= UBound(lyricArray)
		    
		    'see if this is a chord line
		    If Instr(0, ".", Left(lyricArray(i), 1)) > 0 Then
		      
		      'first try to find chord key in line
		      chordP = StringUtils.InStrList(0,  lyricArray(i), chords, KeyIndex)
		      If chordP > 0 Then
		        formP = StringUtils.InStrList(chordP+chords(KeyIndex).Len,  lyricArray(i), forms, FormIndex)
		        If formP = 0 Then
		          'Since "Major" chord has no symbol associated with it
		          'a zero return value here may still be valid
		          If ChordForm = "." Or ChordForm = "" Then
		            'set formP to end of chordP
		            formP  = chordP + chords(KeyIndex).Len
		            FormIndex = 0 ' "Major" chord
		          Else
		            'no match, skip it
		            chordP = 0
		          End If
		        End If
		      End If
		      
		      If startP > 0 Then
		        'starting line
		        If pos >= startP Then
		          startP = Pos
		          
		          while chordP > 0
		            
		            If ((startP + chordP) > startPos) And formP > 0  And (formP - chords(KeyIndex).Len ) = chordP  Then
		              pos = (startP + chordP) - 1
		              FoundChord = chords(KeyIndex) + forms(FormIndex)
		              
		              Return pos
		            End If
		            
		            'try to find next chord key in line
		            chordP = StringUtils.InStrList(chordP+chords(KeyIndex).Len,  lyricArray(i), chords, KeyIndex)
		            If chordP > 0 Then
		              formP = StringUtils.InStrList(chordP+chords(KeyIndex).Len,  lyricArray(i), forms, FormIndex)
		              If formP = 0 Then
		                'Since "Major" chord has no symbol associated with it
		                'a zero return value here may still be valid
		                If ChordForm = "." Or ChordForm = "" Then
		                  'set formP to end of chordP
		                  formP  = chordP + chords(KeyIndex).Len
		                  FormIndex = 0   ' "Major" chord
		                End If
		              End If
		            End If
		            
		          Wend
		        Else
		          'keep going
		          chordP = 0
		        End If
		      End If
		      
		      
		      If chordP > 0 Then
		        pos = (pos + chordP) - 1
		        FoundChord = chords(KeyIndex) + forms(FormIndex)
		        
		        Return pos
		      End If
		      
		    End If
		    
		    pos = pos + lyricArray(i).Len + 1
		    
		    'move to next line
		    i = i + 1
		  Wend
		  
		  'didn't find anything
		  FoundChord = ""
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindLyricLineCount(lines() As String, lineIndex As Integer, isBilingual As Boolean, ByRef hasPrefix As Boolean) As Integer
		  // lineIndex is the first (potential) lyrics line
		  // returns the number of lines that should be output as one block
		  // also returns if the lines have verse numbers prefixed; only the first line is inspected, inconsistencies ignored.
		  //   in case bilingual is true, it is expected but not verified that languages are interleaved as usual
		  //   a blank prefix interrupts a sequence on prefixed lines, even if biLingual is set and the number of lines is odd
		  
		  Dim i, lastIndex As Integer
		  
		  lastIndex = lineIndex
		  If UBound(lines) < lineIndex Then
		    hasPrefix = False
		    Return 0
		  Else
		    hasPrefix = InStr("123456789", Left(lines(lineIndex), 1)) <> 0
		  End If
		  If hasPrefix Then
		    For i = lineIndex + 1 To UBound(lines)
		      If InStr("123456789", Left(lines(i), 1)) = 0 Then Exit
		      lastIndex = i
		    Next
		  Else
		    If Left(lines(lineIndex), 1) = " " Then
		      i = lineIndex + 1
		      If isBilingual And UBound(lines) >= i And Left(lines(i), 1) = " " Then
		        lastIndex = i
		      Else
		        lastIndex = lineIndex
		      End If
		    Else
		      Return 0
		    End If
		  End If
		  
		  Return lastIndex - lineIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FullHeading(type As String, heading As String, fullVerses As Boolean = False) As String
		  Dim headerText As String
		  
		  If type <> "" Then heading = heading.Mid(2)
		  heading = heading.Trim
		  
		  Select Case Type
		  Case "V"  // -- VERSE --
		    If fullVerses Or heading = "" Then
		      headerText = BuildHeading("verse", heading, "Verse")
		    Else
		      headerText = heading
		    End If
		  Case "P"  // -- PRE-CHORUS --
		    headerText = BuildHeading("prechorus", heading, "Pre-chorus")
		  Case "C"  // -- CHORUS --
		    headerText = BuildHeading("chorus", heading, "Chorus")
		  Case "B"  // -- BRIDGE --
		    headerText = BuildHeading("bridge", heading, "Bridge")
		  Case "T"  // -- TAG --
		    headerText = BuildHeading("tag", heading, "Tag")
		  Case Else
		    headerText = heading
		  End Select
		  
		  Return headerText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HeadingType(heading As String) As String
		  Dim type As String
		  
		  type = heading.Left(1)
		  If InStr("VPCBT", type) = 0 Then type = ""
		  
		  Return type
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsBilingualSection(sectionLine As String) As boolean
		  Dim section As String
		  Dim option As Dictionary
		  
		  If ParseSectionLine(sectionLine, section, option, False) Then
		    Return(option <> Nil And option.HasKey("L"))
		  Else
		    Return(False)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsChorus(section As String) As Boolean
		  Return Left(section,1) = "C"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LettersOnly(s As String) As Boolean
		  Dim reg As new RegEx
		  Dim s2 As String
		  
		  If s.Len = 0 Then Return False
		  
		  #if RBVersion < 2011.044
		    reg.searchPattern = "\W" 'not a letter
		    s2 = s.ConvertEncoding(Encodings.ASCII)
		  #else
		    reg.searchPattern = "\PL" 'not a letter
		    s2 = s
		  #endif
		  reg.replacementPattern = ""
		  s2 = reg.Replace(s2)
		  
		  Return s.Len = s2.Len
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LinesToSlices(ByRef lines() As String, chordLineIndex As Integer, isBilingual As Boolean, ByRef slices() As String, stripPrefix As Boolean = False) As Integer
		  ' line(chordLineIndex) better be chords
		  ' Returns # of slices in the row a.k.a. the number of chords in the row
		  ' TODO: Or number of lines???
		  //++EMP 12/05
		  // lines() is a one-dimension array containing the <lyrics> text from a song
		  // chordLineIndex is the current position in the array, assumed to point to a chord line
		  // slices is a one-dimension array for output. Odd elements are chords, even elements have the lyrics for that chord
		  // stripPrefix flags if the routine should start at character 2 of the line instead of character one.
		  //--
		  
		  ReDim slices(0)
		  
		  Dim i, j, st, length, lineCount, chordCount, firstLineIndex, lastLineIndex As Integer
		  
		  ' Count ahead how may lines we're doing
		  firstLineIndex = chordLineIndex
		  i = chordLineIndex + 1
		  While lastLineIndex = 0
		    ' FIX: Xojo Or does NOT short-circuit - must check bounds first!
		    If i > UBound(lines) Then
		      lastLineIndex = i - 1
		    ElseIf Len(lines(i)) = 0 Then
		      lastLineIndex = i - 1
		    ElseIf InStr("123456789 ", Left(lines(i), 1)) = 0 Then
		      lastLineIndex = i - 1
		    ElseIf Mid(lines(i),1,1) = " " Then
		      If i = chordLineIndex + 1 Then
		        lastLineIndex = i
		      Else
		        lastLineIndex = i - 1
		      End If
		    End if
		    i = i + 1
		  Wend
		  
		  lineCount = lastLineIndex - firstLineIndex + 1
		  
		  If isBilingual And lineCount = 2 Then
		    If chordLineIndex + lineCount <= lines.Ubound And Mid(lines(chordLineIndex + lineCount),1, 1) = " " Then
		      lineCount = lineCount + 1
		    End If
		  End If
		  
		  Dim chordLine, thisslice() As String
		  ReDim thisslice(lineCount)
		  
		  chordLine = lines(firstLineIndex)
		  
		  Dim blank As Boolean
		  Dim firstChar As Integer
		  
		  chordLine = RTrim(chordLine)
		  length = Len(chordLine)
		  
		  For i = firstLineIndex To lastLineIndex
		    lines(i) = RTrim(lines(i))
		    j = Len(lines(i))
		    If j > length Then length = j
		  Next i
		  
		  st = 2
		  blank = True
		  firstChar = 1
		  If stripPrefix Then firstChar = 2
		  
		  For i = firstChar To Len(chordLine)
		    If Mid(chordLine, i, 1) = " " Then ' nothing happening, just in between chords, adding as we go
		      thisslice(1) = thisslice(1) + Mid(chordLine, i, 1)
		      For j = 2 To lineCount
		        If i <= Len(lines(firstLineIndex+j-1)) Then thisslice(j) = thisslice(j) + Mid(lines(firstLineIndex+j-1), i, 1)
		      Next j
		      blank = False
		    Else ' Looks like we hit the start of a chord
		      ' Store previous block
		      If Not blank Then
		        For j = 1 To lineCount
		          slices.Append "" + thisslice(j)
		          thisslice(j) = ""
		        Next j
		        chordCount = chordCount + 1
		        blank = True
		      End If
		      ' Fast-forward to the end of this chord's characters
		      While Mid(chordLine, i, 1) <> " " And i <= Len(chordLine)
		        thisslice(1) = thisslice(1) + Mid(chordLine, i, 1)
		        For j = 2 To lineCount
		          If i <= Len(lines(firstLineIndex+j-1)) Then thisslice(j) = thisslice(j) + Mid(lines(firstLineIndex+j-1), i, 1)
		        Next j
		        i = i + 1
		        blank = False
		      Wend
		      i = i - 1
		    End If
		  Next i
		  If Not blank Then
		    For j = 1 To lineCount
		      slices.Append "" + thisslice(j)
		      thisslice(j) = ""
		    Next j
		    chordCount = chordCount + 1
		  End If
		  
		  ' Add on extra lyrics to the last block if the lyric line was longer than the chord line
		  For j = 2 To lineCount
		    If Len(lines(firstLineIndex+j-1)) > Len(chordLine) Then
		      slices((chordCount-1)*lineCount+j)  = slices((chordCount-1)*lineCount+j) + Mid(lines(firstLineIndex+j-1), Len(chordLine)+1)
		    End If
		  Next j
		  
		  Return lineCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LyricsToLines(lyrics As String, ByRef arr() As String)
		  lyrics = lyrics.RTrim + EndOfLine.UNIX
		  arr = lyrics.Split(EndOfLine.UNIX)
		  arr.Insert(0,"")  // make it 1-based
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LyricsToLines(songDoc As XmlDocument, ByRef arr() As String)
		  Dim lyrics As String
		  
		  lyrics = SmartML.GetValue(songDoc.DocumentElement, "lyrics")
		  
		  LyricsToLines(lyrics, arr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LyricsToSections(lyrics As String, ByRef dict As Dictionary, ByRef order As String, ByRef isBilingual As Dictionary)
		  // ToDo: If below a section header there are blocks of prefixed lines, and style/@blank_is_slide_change is true,
		  // the blank line needs to be added to each section that exists in both, the block above and the block below
		  
		  Dim st, x, strlen As Integer
		  Dim line, section, subsection As String
		  Dim sectionAdded As Boolean = True
		  Dim includeBlankLines As Boolean
		  
		  dict.Clear
		  order = ""
		  isBilingual.Value(section) = False
		  
		  lyrics = RemoveSpecialChars(lyrics)
		  strlen = Len(lyrics)
		  
		  If strlen > 0 Then
		    includeBlankLines = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blank_is_slide_change")
		    section = "default"
		    isBilingual.Value(section) = False
		    
		    lyrics = lyrics + Chr(10)
		    strlen = strlen + 1
		    
		    st = 1
		    For x = 1 To strlen
		      If Mid(lyrics, x, 1) = Chr(10) Then
		        line = RTrim(Mid(lyrics, st, x - st))
		        If Left(line, 1) = "[" Then
		          ' add a previous empty section unless done already
		          If Not sectionAdded Then
		            If Not dict.HasKey(section) Then
		              dict.Value(section) = ""
		              order = order + section + " "
		            End If
		          End If
		          Dim sectionOk As Boolean
		          Dim sectionOptions As Dictionary
		          sectionOk = ParseSectionLine(line, section, sectionOptions, False)
		          section = section.Replace(" ", &u00A0) ' replace embedded spaces with &nbsp; so the constructed presentation order does not break
		          sectionAdded = False
		          If sectionOptions <> Nil And sectionOptions.HasKey("L") Then
		            isBilingual.Value(section) = True
		          Else
		            If Not isBilingual.HasKey(section) Then
		              isBilingual.Value(section) = False
		            End If
		          End If
		        ElseIf Left(line, 1) = "." Then // Chord
		        ElseIf Left(line, 1) = ";" Then // Comment
		        ElseIf Left(line, 1) = "-" Then // Page layout command [Bug 1515605]
		        Else
		          subsection = Trim(Left(line, 1))
		          If Len(subsection) > 0 And section = "default" Then
		            ' subsection = "V" + subsection // this would break compatibility
		          Else
		            subsection = section + subsection
		          End If
		          If subsection <> section Then
		            isBilingual.Value(subsection) = isBilingual.Value(section)
		          End If
		          line = StringUtils.Trim(Mid(line, 2), StringUtils.WhiteSpaces)
		          If Len(line) > 0 Or includeBlankLines Then
		            If dict.HasKey(subsection) Then
		              dict.Value(subsection) = dict.Value(subsection) + Chr(10) + line
		            Else
		              dict.Value(subsection) = line
		              order = order + subsection + " "
		            End If
		            sectionAdded = True
		          End If
		        End If
		        st = x + 1
		      End If
		    Next x
		    If Not sectionAdded Then
		      If Not dict.HasKey(section) Then
		        dict.Value(section) = ""
		        order = order + section + " "
		      End If
		    End If
		    order = StringUtils.Chop(order, 1) // This deletes the trailing seperator
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LyricText(songElement As XmlNode) As String
		  //
		  // Return only the text of the lyrics from a song,
		  // deleting any chords and formatting, but retaining comments.
		  //
		  
		  Dim rawLyrics As String
		  Dim lyricArray() As String
		  Const kLinesToDiscard = ".-" //No chord lines or print formatting lines
		  
		  rawLyrics = SmartML.GetValue(songElement, "lyrics", False).FormatUnixEndOfLine
		  lyricArray = Split(rawLyrics, EndOfLine.UNIX)
		  
		  For i As Integer = 0 To UBound(lyricArray)
		    If Instr(0, kLinesToDiscard, Left(lyricArray(i), 1)) > 0 Then
		      lyricArray.Remove i
		      Continue
		    End If
		    lyricArray(i) = DeflateString(lyricArray(i))
		  Next
		  
		  Return Join(lyricArray, EndOfLine)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseSectionLine(sectionLine As String, ByRef sectionString As String, ByRef options As Dictionary, cleanSection As Boolean = False) As Boolean
		  // There was initially the convention to append "-L" to the section to mark it as bilingual
		  // this appendage was part of the section header and had to be used in the presentation order
		  //
		  // now this syntax is use: '[' section ']' ['(' Option { ';' Option} ')']
		  // Option is a string, optionally a key-value-pair
		  // e.g. [V1](L)
		  // or   [B](L;L1=en;L2=de)
		  
		  Dim s As String
		  Dim optString() As String
		  Dim p, st As Integer
		  
		  If options = Nil Then
		    options = New Dictionary
		  Else
		    options.Clear
		  End If
		  
		  p = sectionLine.InStr("[")
		  If p <> 1 Then
		    sectionString = ""
		    Return False
		  Else
		    st = 2
		  End If
		  
		  p = sectionLine.InStr(st, "]")
		  If p = 0 Then
		    sectionString = ""
		    Return False
		  Else
		    sectionString = sectionLine.Mid(st, p - st).Trim
		    st = p + 1
		  End If
		  
		  p = sectionLine.InStr(st, "(")
		  If p = 0 Then
		    // no options. Check if we have an old bilingual section
		    If sectionString.Len > 1 And sectionString.Right(1) = "L" Then
		      options.Value("L") = Nil
		      options.Value("TrueSectionName") = sectionString
		      If cleanSection Then
		        sectionString = sectionString.Mid(1, sectionString.Len - 1).RTrim  // remove "L"
		        If sectionString.Right(1) = "-" Then
		          sectionString = sectionString.Mid(1, sectionString.Len - 1).RTrim  // remove "-" if there
		        End If
		      End If
		    End If
		    Return True
		  Else
		    st = p + 1
		  End If
		  
		  p = sectionLine.InStr(st, ")")
		  If p = 0 Then
		    Return False  // incorrectly formatted options
		  Else
		    optString = sectionLine.Mid(st, p - st).Split(";")
		  End If
		  
		  For Each s In optString
		    p = s.InStr("=")
		    If p = 0 Then
		      options.Value(s.Trim) = Nil
		    Else
		      options.Value(s.Left(p - 1).Trim) = s.Mid(p + 1).Trim
		    End If
		  Next
		  
		  Return(True)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RemoveSpecialChars(lyrics As String) As String
		  Const kLowerMacron = &H02CD
		  Const kUndertie = &H203F
		  
		  Dim replaceChars As String = App.MainPreferences.GetValue(prefs.kLyricsReplaceWithSpace, _
		  Encodings.UTF8.Chr(kLowerMacron) + Encodings.UTF8.Chr(kUndertie))
		  Dim cLen As Integer = replaceChars.Len
		  
		  lyrics = ConvertEncoding(lyrics, Encodings.UTF8)
		  
		  For i As Integer = 1 To cLen
		    Lyrics = ReplaceAll(lyrics, replaceChars.Mid(i, 1), " ")
		  Next
		  
		  Return lyrics
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SingleTranspose(chord As String, by As Integer, sharps As Boolean) As String
		  //++
		  // 17 Sep 2006: I18N the chords by putting them in the translator.
		  //-
		  
		  Dim base, bass As String
		  Dim i, strlen As Integer
		  Dim hadPreDot As Boolean
		  
		  strlen = Len(chord)
		  If strlen <= 0 Then Return ""
		  
		  If Len(SharpChords(1)) < 1 Then
		    SharpChords = Split(App.T.Translate("songml/sharpchords"), ",")
		    FlatChords = Split(App.T.Translate("songml/flatchords"), ",")
		  End If
		  '++JRC: Fixed E# not being transposed bug #1122463
		  'table of alternate key names
		  If Len(AltSharpChords(1)) < 1 Then
		    AltSharpChords = Split(App.T.Translate("songml/altsharpchords"), ",")
		    AltFlatChords = Split(App.T.Translate("songml/altflatchords"), ",")
		  End If
		  '--
		  
		  If Left(chord, 1) = "." Then
		    hadPreDot = True
		    chord = Mid(chord, 2)
		  End If
		  
		  ' Calculate base chord
		  If strlen >= 2 Then
		    base = Mid(chord, 2, 1)
		    If base = "#" Or base = "b" Then
		      base = Left(chord, 1) + base
		    Else
		      base = Left(chord, 1)
		    End If
		  Else
		    base = Left(chord, 1)
		  End If
		  
		  'If by > 0 Then
		  'transposingUp = True
		  'Else
		  'transposingUp = False
		  'End If
		  
		  If by < 0 Then by = by + 12
		  
		  Dim which As Integer
		  
		  ' Search for sharps
		  which = 1
		  While which >= 1 And which <= 12
		    '++JRC
		    'TODO: Maybe an option use alternate key names
		    If base = SharpChords(which) Or base = AltSharpChords(which) Then
		      '--
		      If sharps Then
		        chord = SharpChords((which+by-1) Mod 12 + 1) + Mid(chord, Len(base)+1)
		        which = -1
		      Else
		        chord = FlatChords((which+by-1) Mod 12 + 1) + Mid(chord, Len(base)+1)
		        which = -1
		      End If
		    End If
		    which = which + 1
		  Wend
		  
		  ' Search for flats if not already found
		  If which > 0 Then
		    which = 1
		    While which >= 1 And which <= 12
		      '++JRC
		      'TODO: Maybe an option use alternate key names
		      If base = FlatChords(which) Or base = AltFlatChords(which) Then
		        '--
		        If sharps Then
		          chord = SharpChords((which+by-1) Mod 12 + 1) + Mid(chord, Len(base)+1)
		          which = -1
		        Else
		          chord = FlatChords((which+by-1) Mod 12 + 1) + Mid(chord, Len(base)+1)
		          which = -1
		        End If
		      End If
		      which = which + 1
		    Wend
		  End If
		  
		  ' Calculate bass chord
		  strlen = Len(chord)
		  i = InStr(chord, "/")
		  If i >= 1 And i < strlen-1 Then
		    bass = Mid(chord, i+2, 1)
		    If bass = "#" Or bass = "b" Then
		      bass = Mid(chord, i+1, 1) + bass
		    Else
		      bass = Mid(chord, i+1, 1)
		    End If
		  ElseIf i >= 1 And i < strlen Then
		    bass = Mid(chord, i+1, 1)
		  Else
		    bass = ""
		  End If
		  
		  If Len(bass) > 0 Then
		    ' Search for sharps
		    which = 1
		    While which >= 1 And which <= 12
		      '++JRC
		      'TODO: Maybe an option use alternate key names
		      If bass = SharpChords(which) Or bass = AltSharpChords(which) Then
		        '--
		        If sharps Then
		          chord = Left(chord, i) + SharpChords((which+by-1) Mod 12 + 1) + Mid(chord, i+Len(bass)+1)
		          which = -1
		        Else
		          chord = Left(chord, i) + FlatChords((which+by-1) Mod 12 + 1) + Mid(chord, i+Len(bass)+1)
		          which = -1
		        End If
		      End If
		      which = which + 1
		    Wend
		    
		    ' Search for flats if not already found
		    If which > 0 Then
		      which = 1
		      While which >= 1 And which <= 12
		        '++JRC
		        'TODO: Maybe an option use alternate key names
		        If bass = FlatChords(which) Or bass = AltFlatChords(which) Then
		          '--
		          If sharps Then
		            chord = Left(chord, i) + SharpChords((which+by-1) Mod 12 + 1) + Mid(chord, i+Len(bass)+1)
		            which = -1
		          Else
		            chord = Left(chord, i) + FlatChords((which+by-1) Mod 12 + 1) + Mid(chord, i+Len(bass)+1)
		            which = -1
		          End If
		        End If
		        which = which + 1
		      Wend
		    End If
		  End If
		  
		  If hadPreDot Then chord = "." + chord
		  
		  Return chord
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SmartRTrim(str As String) As String
		  Dim i As Integer
		  Dim endingSpace As Boolean
		  If Right(str, 1) = " " Then endingSpace = True
		  str = RTrim(str)
		  i = Len(str)
		  While Mid(str, i, 1) = "_"
		    i = i - 1
		  Wend
		  str = RTrim(Left(str, i))
		  If endingSpace Then str = str + " "
		  Return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextAscentV(font As FontFace, g As Graphics, zoom As Double = 1) As Double
		  Const amp = 20  // amplification factor
		  Dim ascent As Double
		  
		  Font.OntoGraphics g, zoom * amp
		  ascent = g.FontAscent / amp
		  g.FontSize = Font.Size * zoom
		  Return ascent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextHeightV(font As FontFace, g As Graphics, zoom As Double = 1) As Double
		  Const amp = 20  // amplification factor
		  Dim height As Double
		  
		  Font.OntoGraphics g, zoom * amp
		  height = g.TextHeight / amp
		  g.FontSize = Font.Size * zoom
		  Return height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextWidthV(Text As String, Font As FontFace, g As Graphics, zoom As Double = 1) As Double
		  Const amp = 20  // amplification factor
		  Dim width As Double
		  
		  Font.OntoGraphics g, zoom * amp
		  width = g.TextWidth(Text) / amp
		  g.FontSize = Font.Size * zoom
		  Return width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToHTML(songElement As XmlNode, exportOptions As HTMLExportOptions) As String
		  //++
		  // 3 December 2006, EMP
		  // Tag HTML with UTF-8 encoding [Bug 1477964]
		  // Properly encode text in HTML.  Utilizes the HTMLEntityEncode method
		  // in OpenSongUtils [Bug 1607916]
		  //
		  // May 2012, EMP
		  //   Add HTMLExportOptions and logic for embedding CSS instead of linking to a statically-named CSS file
		  //   Copied from original ToHTML(XmlNode) routine, which is now deprecated
		  //--
		  
		  
		  Dim s As String
		  Dim lastChar As String
		  
		  s = "<html><head>" + EndOfLine
		  s = s + "  <meta http-equiv=""Content-type"" content=""text/html;charset=UTF-8"" />" + EndOfLine
		  s = s + "  <title>" + SmartML.GetValue(songElement, "title").HTMLEntityEncode + "</title>" + EndOfLine
		  //++
		  // Process the CSS. Link or Embed per the HTMLExportOptions
		  //--
		  If exportOptions.EmbedCSS Then
		    Dim cssText As String
		    Dim cssInput As TextInputStream
		    If exportOptions.StyleSheet <> Nil Then
		      cssInput = TextInputStream.Open(exportOptions.StyleSheet)
		      //++
		      // Read the file the long way (with a loop) because the CSS file may not use the platform's native line endings
		      // ReadLine will ignore all line endings; ReadAll maintains the input file's line endings even if
		      // they aren't native to the platform.
		      //--
		      While Not cssInput.EOF
		        cssText = cssText + cssInput.ReadLine + EndOfLine
		      Wend
		      cssInput.Close
		    End If
		    s = s + "<style type=""text/css"">" + EndOfLine
		    s = s + "<!--" + EndOfLine
		    s = s + cssText + EndOfLine
		    s = s + "-->" + EndOfLine
		    s = s + "</style>"
		  Else
		    //++
		    // This makes the (possibly inaccurate) assumption that the stylesheet can be found in the same folder as the HTML
		    //--
		    s = s + "  <link rel=""stylesheet"" href=""" + exportOptions.StyleSheet.Name + """ type=""text/css""/>" + EndOfLine
		  End If
		  s = s + "</head>" + EndOfLine + "<body>" + EndOfLine
		  
		  s = s + "  <div id=""title"">" + SmartML.GetValue(songElement, "title").HTMLEntityEncode + "</div>" + EndOfLine
		  s = s + "  <div id=""author"">" + SmartML.GetValue(songElement, "author").HTMLEntityEncode + "</div>" + EndOfLine
		  '++JRC inlucde hymn number in export
		  If SmartML.GetValue(songElement, "hymn_number").Len > 0 Then _
		  s = s + "  <div id=""hymn_number"">" + App.T.Translate("general_song_editor/hymn_number/@caption").HTMLEntityEncode + " " + SmartML.GetValue(songElement, "hymn_number").HTMLEntityEncode + "</div>" + EndOfLine
		  '--
		  If SmartML.GetValue(songElement, "time_sig").Len > 0 Then _
		  s = s + "  <div id=""time_sig"">" + App.T.Translate("advanced_song_editor/time_sig/@caption").HTMLEntityEncode + ": " + SmartML.GetValue(songElement, "time_sig").HTMLEntityEncode + "</div>" + EndOfLine
		  If SmartML.GetValue(songElement, "tempo").Len > 0 Then _
		  s = s + "  <div id=""tempo"">" + App.T.Translate("advanced_song_editor/tempo/@caption").HTMLEntityEncode + ": " + SmartML.GetValue(songElement, "tempo").HTMLEntityEncode + "</div>" + EndOfLine
		  If SmartML.GetValue(songElement, "capo").Len > 0 Then _
		  s = s + "  <div id=""capo"">" + App.T.Translate("advanced_song_editor/capo/@caption").HTMLEntityEncode + " " + SmartML.GetValue(songElement, "capo").HTMLEntityEncode + "</div>" + EndOfLine
		  '++JRC inlucde presentation order in export
		  If SmartML.GetValue(songElement, "presentation").Len > 0 Then _
		  s = s + "  <div id=""presentation"">" + App.T.Translate("general_song_editor/presentation/@caption").HTMLEntityEncode + " " + SmartML.GetValue(songElement, "presentation").HTMLEntityEncode + "</div>" + EndOfLine
		  '--
		  Dim slices(0), lines(0) As String
		  Dim currSlice, currVerse, lineCount, sliceCount As Integer
		  Dim isBilingual As Boolean = False
		  Dim lineIs2ndLanguage, hasPrefix As Boolean
		  Dim lyricsClassName As String
		  Dim thisSlice As String
		  Dim capoPrint, capoUseSharp As Boolean
		  Dim capoPosition As Integer
		  
		  capoPrint = SmartML.GetValueB(songElement, "capo/@print", True, False)
		  If capoPrint Then
		    capoPosition = 12-SmartML.GetValueN(songElement, "capo")
		    If StrComp(SmartML.GetValue(songElement, "capo/@sharp", False, "unDefined"), "unDefined", 0) = 0 Then
		      capoUseSharp = MainWindow.pop_song_accidentals.ListIndex = 0
		    Else
		      capoUseSharp = SmartML.GetValueB(songElement, "capo/@sharp")
		    End If
		  End If
		  
		  s = s + "<br/>" + EndOfLine
		  
		  LyricsToLines(SmartML.GetValue(songElement, "lyrics", False), lines)
		  CleanLyrics(lines)
		  
		  Dim currLine as Integer
		  For currLine = 1 To UBound(lines)
		    If Left(lines(currLine), 1) = "." And currLine < UBound(lines) And InStr("123456789 ", Left(lines(currLine+1), 1)) > 0 Then
		      ' --------------- CHORDS W/ LYRICS ---------------
		      lineCount = LinesToSlices(lines, currLine, isBilingual, slices, False)
		      sliceCount = UBound(slices) / lineCount
		      hasPrefix = InStr("123456789", Left(lines(currLine + 1), 1)) <> 0
		      s = s + "  <table border=""0"" cellpadding=""0"" cellspacing=""0"">" + EndOfLine
		      
		      //++
		      // Don't print capo chords if we wouldn't on regular hardcopy [Bug 1691058]
		      //--
		      If capoPrint Then
		        s = s + "    <tr>" + EndOfLine
		        If hasPrefix Then
		          s = s + "      <td class=""lyrics_prefix capochords"">&nbsp;</td>" + EndOfLine
		        End If
		        For currSlice = 0 To sliceCount - 1 ' Loop through each chord slice
		          thisSlice = slices(currSlice*lineCount+1)
		          If currSlice = 0 Then thisSlice = thisSlice.Mid(2)
		          thisSlice = Trim(SingleTranspose(thisSlice, capoPosition, capoUseSharp))
		          s = s + "      <td class=""capochords"">" + thisSlice.HTMLEntityEncode + "&nbsp;</td>" + EndOfLine
		        Next currSlice
		        s = s + "    </tr>" + EndOfLine
		      End If
		      
		      s = s + "    <tr>" + EndOfLine
		      If hasPrefix Then
		        s = s + "      <td class=""lyrics_prefix chords"">&nbsp;</td>" + EndOfLine
		      End If
		      For currSlice = 0 To sliceCount - 1 ' Loop through each chord slice
		        If currSlice = 0 Then
		          thisSlice = slices(currSlice*lineCount+1).Mid(2).Trim
		        Else
		          thisSlice = slices(currSlice*lineCount+1).Trim
		        End If
		        s = s + "      <td class=""capochords"">" + thisSlice.HTMLEntityEncode + "&nbsp;</td>" + EndOfLine
		      Next currSlice
		      s = s + "    </tr>" + EndOfLine
		      
		      For currVerse = 2 To lineCount ' Loop through the lines and print
		        lineIs2ndLanguage = isBilingual And currVerse Mod 2 = 1
		        If lineIs2ndLanguage Then
		          lyricsClassName = "lyrics2"
		        Else
		          lyricsClassName = "lyrics"
		        End If
		        s = s + "    <tr>" + EndOfLine
		        If hasPrefix Then
		          s = s + "      <td class=""lyrics_prefix " + lyricsClassName + """>" + slices(currVerse).Left(1).HTMLEntityEncode + "&nbsp;&nbsp;</td>" + EndOfLine
		        End If
		        For currSlice = 0 To sliceCount - 1 ' Loop through each slice
		          thisSlice = slices(currSlice * lineCount + currVerse).HTMLEntityEncode
		          If thisSlice.Len = 0 Then
		            thisSlice = "&nbsp;"
		            Continue
		          ElseIf currSlice = 0 Then
		            thisSlice = Mid(thisSlice, 2)
		          End If
		          
		          '
		          ' Check for a break in the middle of the word
		          '
		          If currSlice < sliceCount - 1 Then 'Not on the last slice
		            If exportOptions.HyphenateWordBreaks Then
		              lastChar = Right(thisSlice, 1)
		              If StringUtils.isalpha(asc(lastChar)) Then 'Not an explicitly designated syllable end or a word break
		                If StringUtils.isalpha(asc(Left(slices((currSlice + 1) * lineCount + currVerse), 1))) Then 'there is no space at the end of this slice or beginning of the next
		                  thisSlice = thisSlice + " -&nbsp;"
		                End If
		              End If
		            End If
		          End If
		          If Left(thisSlice, 1) = " " Then
		            If currSlice = 0 Then
		              thisSlice = "&nbsp; " + Mid(thisSlice, 2)
		            Else
		              thisSlice = "&nbsp;" + Mid(thisSlice, 2)
		            End If
		          End If
		          If Right(thisSlice,1) = " " Then thisSlice = RTrim(thisSlice) + "&nbsp;"
		          thisSlice = StringUtils.Squeeze(thisSlice, "_")
		          If exportOptions.HyphenateWordBreaks Then
		            thisSlice = ReplaceAll(thisSlice, "_", " -&nbsp;")
		          Else
		            thisSlice = ReplaceAll(thisSlice, "_", "&nbsp;")
		          End If
		          If Left(thisSlice, 1) = " " Then
		            If currSlice = 0 Then
		              thisSlice = "&nbsp; " + Mid(thisSlice, 2)
		            Else
		              thisSlice = "&nbsp;" + Mid(thisSlice, 2)
		            End If
		          End If
		          s = s + "      <td class=""" + lyricsClassName + """>" + Trim(thisSlice) + "</td>" + EndOfLine
		        Next currSlice
		        s = s + "    </tr>" + EndOfLine
		      Next currVerse
		      
		      s = s + "  </table>" + EndOfLine
		      currLine = currLine + lineCount - 1 ' currLine will increment again b/c of the For loop
		      
		    ElseIf Left(lines(currLine), 1) = "-" Then // A variety of printing directives
		      If Mid(lines(currLine), 2, 2) = "!!" Then // PageBreak
		        s = s + "<div style=""page-break-before: always;""></div>"
		      ElseIf Mid(lines(currLine), 2, 2) = "__" Then // Horizontal line
		        s = s + "<hr />" + EndOfLine
		      End If
		    ElseIf Left(lines(currLine), 1) = "." Then
		      s = s + "  <div class=""chords"">" + Mid(lines(currLine), 2).HTMLEntityEncode + "</div>" + EndOfLine
		      
		    ElseIf Left(lines(currLine), 1) = ";" Then
		      s = s + "  <div class=""comment"">" + Mid(lines(currLine), 2).HTMLEntityEncode + "</div>" + EndOfLine
		      
		    ElseIf Left(lines(currLine), 1) = "[" Then
		      Dim success As Boolean
		      Dim section as String
		      Dim sectionOptions As Dictionary
		      success = ParseSectionLine(lines(currLine), section, sectionOptions, True)
		      isBilingual = sectionOptions <> Nil And sectionOptions.HasKey("L")
		      s = s + "  <p/><div class=""heading""><span class=""heading"">" + FullHeading(HeadingType(section), section, True).HTMLEntityEncode + "</span></div>" + EndOfLine
		      
		    ElseIf lines(currLine).Len = 0 Then
		      // Blank line designating a slide break
		      s = s + "  <div class=""lyrics slide_break""></div>" + EndOfLine
		      
		    Else
		      lineCount = FindLyricLineCount(lines, currLine, isBilingual, hasPrefix)
		      If hasPrefix Then
		        s = s + "  <table border=""0"" cellpadding=""0"" cellspacing=""0"">" + EndOfLine
		        For currVerse = 0 to lineCount - 1
		          lineIs2ndLanguage = isBilingual And currVerse Mod 2 = 1
		          If lineIs2ndLanguage Then
		            lyricsClassName = "lyrics2"
		          Else
		            lyricsClassName = "lyrics"
		          End If
		          s = s + "    <tr>" + EndOfLine
		          s = s + "      <td class=""lyrics_prefix " + lyricsClassName + """>" + Left(lines(currLine + currVerse), 1).HTMLEntityEncode + "&nbsp;</td>" + EndOfLine
		          s = s + "      <td class=""" + lyricsClassName + """>" + Mid(lines(currLine + currVerse), 2).HTMLEntityEncode + "</td>" + EndOfLine
		          s = s + "    </tr>" + EndOfLine
		        Next
		        s = s + "  </table>" + EndOfLine
		      Else
		        For currVerse = 0 to lineCount - 1
		          lineIs2ndLanguage = isBilingual And currVerse Mod 2 = 1
		          If lineIs2ndLanguage Then
		            lyricsClassName = "lyrics2"
		          Else
		            lyricsClassName = "lyrics"
		          End If
		          s = s + "  <div class=""" + lyricsClassName + """>" + Mid(lines(currLine + currVerse), 2).HTMLEntityEncode + "</div>" + EndOfLine
		        Next
		      End If
		      currLine = currLine + Max(lineCount, 1) - 1 ' currLine will increment again b/c of the For loop
		    End If
		  Next currLine
		  s = s + "<br/>" + EndOfLine
		  
		  If SmartML.GetValue(songElement, "aka").Len > 0 Then _
		  s = s + "  <div id=""aka"">" + App.T.Translate("advanced_song_editor/aka/@caption").HTMLEntityEncode + " " + SmartML.GetValue(songElement, "aka").HTMLEntityEncode + "</div>" + EndOfLine
		  If SmartML.GetValue(songElement, "copyright").Len > 0 Then _
		  s = s + "  <div id=""copyright"">" + App.T.Translate("general_song_editor/copyright/@caption").HTMLEntityEncode + " " + SmartML.GetValue(songElement, "copyright").HTMLEntityEncode + "</div>" + EndOfLine
		  If SmartML.GetValue(songElement, "ccli").Len > 0 Then _
		  s = s + "  <div id=""ccli"">" + App.T.Translate("general_song_editor/ccli/@caption").HTMLEntityEncode + " " + SmartML.GetValue(songElement, "ccli").HTMLEntityEncode + "</div>" + EndOfLine
		  If ColonTrim(SmartML.GetValue(songElement, "theme")).Len > 0 Then _
		  s = s + "  <div id=""themes"">" + App.T.Translate("advanced_song_editor/themes/@caption").HTMLEntityEncode + ": " + _
		  ColonTrim(SmartML.GetValue(songElement, "theme")).HTMLEntityEncode + "</div>" + EndOfLine
		  If SmartML.GetValue(songElement, "key_line").Len > 0 Then _
		  s = s + "  <div id=""key_line"">" + App.T.Translate("advanced_song_editor/key_line/@caption").HTMLEntityEncode + ": " + _
		  SmartML.GetValue(songElement, "key_line").HTMLEntityEncode + "</div>" + EndOfLine
		  If SmartML.GetValue(songElement, "key").Len > 0 Then _
		  s = s + "  <div id=""key"">" + App.T.Translate("advanced_song_editor/key/@caption").HTMLEntityEncode + " " + _
		  SmartML.GetValue(songElement, "key").HTMLEntityEncode + "</div>" + EndOfLine
		  
		  If SmartML.GetValue(songElement, "user1").Len > 0 Then _
		  s = s + "  <div id=""user1"">" + MainWindow.lbl_song_user1.Text.HTMLEntityEncode + " " + _
		  SmartML.GetValue(songElement, "user1").HTMLEntityEncode + "</div>" + EndOfLine
		  If SmartML.GetValue(songElement, "user2").Len > 0 Then _
		  s = s + "  <div id=""user2"">" + MainWindow.lbl_song_user2.Text.HTMLEntityEncode + " " + _
		  SmartML.GetValue(songElement, "user2").HTMLEntityEncode + "</div>" + EndOfLine
		  If SmartML.GetValue(songElement, "user3").Len > 0 Then _
		  s = s + "  <div id=""user3"">" + MainWindow.lbl_song_user3.Text.HTMLEntityEncode + " " + _
		  SmartML.GetValue(songElement, "user3").HTMLEntityEncode + "</div>" + EndOfLine
		  
		  s = s + "<p><a class=""opensong"" href=""http://www.opensong.org/"">" + _
		  App.T.Translate("about/created_with_opensong").HTMLEntityEncode + "</a></p>" + EndOfLine
		  s = s + "</body></html>"
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToSetML(songElement As XmlNode, style As SlideStyle = Nil, embedHtml As Boolean = True)
		  Dim slides, slide As XmlNode
		  Dim order As String
		  Dim SubtitleText As String
		  
		  If embedHtml Then
		    Dim htmlCode As String
		    Dim songXmlClone As XmlNode
		    Dim htmlOptions As New HTMLExportOptions
		    Dim htmlDoc As XmlDocument
		    
		    htmlOptions.EmbedCSS = True
		    htmlOptions.StyleSheet = New FolderItem(App.AppFolder.Child("OpenSong Settings").Child("style.css"))
		    'songXmlClone = songElement.Clone(True)
		    htmlDoc = New XmlDocument
		    htmlDoc.LoadXml(songElement.ToString)
		    htmlCode = ToHTML(htmlDoc.DocumentElement, htmlOptions)
		    songXmlClone = Nil
		    songXmlClone = songElement.OwnerDocument.CreateElement("htmldata")
		    songXmlClone.AppendChild(songElement.OwnerDocument.CreateCDATASection(htmlCode))
		    songElement.AppendChild(songXmlClone)
		  End If
		  
		  // This routine makes an in-place change of a song XML encoding to slides for use in a set.  The
		  // XML node that we are passed is modified in-place instead of creating a new one.  That way,
		  // if it is part of a larger grouping (i.e., a set), the node doesn't have to be replaced and the processing time
		  // for repairing the XML linked lists is avoided.
		  
		  songElement.Name = "slide_group"
		  SmartML.SetValue(songElement, "@name", SmartML.GetValue(songElement, "title", True))
		  SmartML.SetValue(songElement, "@type", "song")
		  
		  If style <> Nil Then
		    SubtitleText = BuildSubtitle(songElement, style)
		    SmartML.SetValue(songElement, "subtitle", SubtitleText)
		    SmartML.SetValue(songElement, "subtitle/@subtitle_list", style.SubtitleList)
		  End If
		  
		  slides = SmartML.GetNode(songElement, "slides", True)
		  
		  Dim dict As New Dictionary
		  Dim isBilingual As New Dictionary
		  Dim sub_section, sub_sections(), section, sections() As String
		  
		  LyricsToSections(SmartML.GetValue(songElement, "lyrics", True), dict, order, isBilingual)
		  
		  Dim presentation As String
		  presentation = SmartML.GetValue(songElement, "presentation", True)
		  sections = Split(Trim(presentation), " ")
		  
		  If UBound(sections) < 0 Then
		    ' If there is no presentation defined, we just do the sections in order
		    order = Trim(order)
		    SmartML.SetValue(songElement, "presentation", order)
		    sections = Split(order, " ")
		  End If
		  
		  Dim ChorusNr, PresentationIndex As Integer
		  ChorusNr = 0
		  
		  Dim xbacks As XmlNode = SmartML.GetNode(songElement, "backgrounds", True)
		  Dim xlist As XmlNodeList = Nil
		  Dim xbackground As XmlNode = Nil
		  Dim xbackIndex As Integer
		  
		  For Each section In sections
		    PresentationIndex = PresentationIndex + 1
		    If dict.HasKey(section) Then
		      If Lowercase(Left(section, 1)) = "c" Then
		        ChorusNr = ChorusNr + 1
		      End If
		      
		      'Check if a background is available for this verse
		      If (xbacks.ChildCount() > 0) Then
		        xlist = xbacks.Xql("background[@verse='" + Lowercase(section) + "' or @verse='" + Uppercase(section) + "']")
		        For i As Integer = 0 To xlist.Length() - 1
		          xbackground = xlist.Item(i)
		          
		          'Check if the image file exists
		          Dim sfile As String = SmartML.GetValue(xbackground, "filename")
		          If SmartML.GetValueB(xbacks, "@link", False) = True And sfile <> "" Then
		            If FileUtils.IsPathAbsolute(sfile) Then
		              sfile = FileUtils.AbsolutePathToNativePath(sfile)
		            Else
		              Try
		                sfile = FileUtils.RelativePathToFolderItem(App.MainPreferences.GetValueFI(prefs.kBackgroundsFolder, App.DocsFolder.Child(App.STR_BACKGROUNDS), True), sfile).NativePath
		              Catch
		                App.DebugWriter.Write CurrentMethodName + ": Error retrieving relative file "  + sfile, 1
		                InputBox.Message App.T.Translate("errors/fileutils/filenotfound", sfile)
		                sfile = ""
		              End Try
		              SmartML.SetValue(xbackground, "filename", sfile)
		            End If
		            
		            Dim file As FolderItem
		            Try
		              file = GetFolderItem(sfile, FileUtils.PathType())
		            Catch
		              file = Nil
		            End Try
		            If Not (file = Nil) Then
		              If Not file.Exists() Then
		                InputBox.Message App.T.Translate("errors/fileutils/filenotfound", sfile)
		                
		                xbacks.RemoveChild(xbackground)
		                xbackground = Nil
		              Else
		                Dim img As New StyleImage
		                If Not img.SetImageFromFile(file) Then
		                  InputBox.Message App.T.Translate("errors/unreadable_image", sfile)
		                  xbacks.RemoveChild(xbackground)
		                  xbackground = Nil
		                Else
		                  SmartML.SetValue(xbackground, "image", img.GetImageAsString)
		                End If
		              End If
		            Else
		              InputBox.Message App.T.Translate("errors/fileutils/filenotfound", sfile)
		              
		              xbacks.RemoveChild(xbackground)
		              xbackground = Nil
		            End If
		          End If
		        Next
		      End If
		      
		      // Second language feature -> activate separationMark (detect linebreaks inserted by algorithm)
		      Dim separationMark As String
		      If isBilingual.Value(section) Then
		        separationMark = SetML.SeparationMarkBilingual
		      Else
		        separationMark = ""
		      End If
		      
		      dict.Value(section) = AdjustSlideBreaks(dict.Value(section), isBilingual.Value(section))
		      
		      sub_sections = Split(dict.Value(section), "||")
		      xbackIndex = 0
		      For Each sub_section In sub_sections
		        slide = SmartML.InsertChild(slides, "slide", slides.ChildCount)
		        SmartML.SetValue(slide, "body", DeflateString(StringUtils.Trim(sub_section, StringUtils.WhiteSpaces), separationMark))
		        If section = "default" Then
		          SmartML.SetValue(slide, "@id", "")
		        Else
		          SmartML.SetValue(slide, "@id", section)
		        End If
		        SmartML.SetValueB(slide, "@bilingual", isBilingual.Value(section))
		        If Lowercase(Left(section, 1)) = "c" Then
		          SmartML.SetValueB(slide, "@emphasize", True)
		          SmartML.SetValueN(slide, "@ChorusNr", ChorusNr)
		        End If
		        SmartML.SetValueN(slide, "@PresentationIndex", PresentationIndex)
		        
		        // Assign the background to the verse slide
		        If xlist <> Nil And xlist.Length > 0 Then
		          xbackground = xlist.Item(xbackIndex)
		          If Not IsNull(xbackground) Then
		            SmartML.CloneChildren(xbackground, slide)
		          End If
		          If xbackIndex < xlist.Length() - 1 Then
		            xbackIndex = xbackIndex + 1
		          End If
		        End If
		      Next
		    End If
		  Next
		  
		  If xbacks.ChildCount() > 0 Then
		    'Assign background image handling attribute to the song
		    SmartML.CloneAttributes(xbacks, songElement)
		    SmartML.SetValue(songElement, "@subtype", "image")
		  End If
		  
		  'Remove the backgrounds section from the song
		  songElement.RemoveChild(xbacks)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Transpose(songDoc As XmlDocument, by As Integer, sharps As Boolean)
		  Dim lines() As String
		  Dim l, i, j, k As Integer
		  Dim newText, line As String
		  
		  Dim slices(0) As String
		  Dim linecount, length, longest As Integer
		  Dim isBilingual As Boolean = False
		  
		  LyricsToLines songDoc, lines
		  
		  For l = 1 To UBound(lines)
		    If Left(lines(l), 1) = "." Then
		      linecount = LinesToSlices(lines, l, isBilingual, slices)
		      
		      ' Loop through the columns
		      For i = 1 To UBound(slices) Step linecount
		        If Len(slices(i)) > 0 Then slices(i) = SingleTranspose(slices(i), by, sharps)
		        longest = Len(SmartRTrim(slices(i)))
		        
		        ' Loop through the rows (chords, lyrics, ...), checking actual lengths
		        For j = i To i + linecount - 1
		          length = Len(SmartRTrim(slices(j)))
		          If length > longest Then longest = length
		        Next j
		        
		        ' Loop through the rows (chords, lyrics, ...), matching each Len to longest
		        For j = i To i + linecount - 1
		          slices(j) = SmartRTrim(slices(j))
		          length = Len(slices(j))
		          If i >= UBound(slices) - linecount + 1 Then ' last column
		            slices(j) = RTrim(slices(j))
		          ElseIf j = i Or Right(slices(j), 1) = " " Then ' Or Len(slices(j)) = 0 ?
		            For k = length + 1 To longest
		              slices(j) = slices(j) + " "
		            Next k
		          Else
		            For k = length + 1 To longest
		              slices(j) = slices(j) + "_"
		            Next k
		          End If
		        Next j
		      Next i
		      
		      ' Now, put them back together
		      For j = 0 To linecount - 1
		        line = ""
		        For i = 1 To UBound(slices) Step linecount
		          line = line + slices(i + j)
		        Next i
		        newText = newText + SmartRTrim(line) + Chr(13)
		      Next j
		      l = l + linecount - 1
		    Else
		      If Left(lines(l), 1) = "[" Then
		        isBilingual = IsBilingualSection(lines(l))
		      End If
		      newText = newText + lines(l) + Chr(13)
		    End If
		  Next l
		  
		  newText = RTrim(newText)
		  SmartML.SetValue(songDoc.DocumentElement, "lyrics", newText)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private AltFlatChords(12) As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private AltSharpChords(12) As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FlatChords(12) As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SharpChords(12) As String
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
