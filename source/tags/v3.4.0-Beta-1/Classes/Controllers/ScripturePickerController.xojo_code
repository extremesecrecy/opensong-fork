#tag Class
Protected Class ScripturePickerController
Implements ScriptureNotifier
	#tag Method, Flags = &h0
		Function BuildCitation() As String
		  //++
		  // Take the current book, etc., and return
		  // a citation string for it (i.e., "Gen 2:3-4")
		  //--
		  Dim ref As String
		  Dim startVerse As String
		  Dim endVerse As String
		  Dim verses() As String
		  
		  verses = CurrentBible.GetVerseNumbers(CurrentBook, CurrentChapter)
		  
		  ref = CurrentBible.GetBookNameFromStdBookNumber(CurrentBook) _
		  + " " + CStr(CurrentChapter)
		  
		  // Check to see if the reference is the entire chapter
		  // If it is, don't add verse numbers
		  
		  If Not((CurrentFromVerse = 0) And (CurrentThruVerse = UBound(verses))) Then
		    
		    // Not the entire chapter.  Add the starting verse number
		    CurrentBible.GetVerseRange(CurrentBook, CurrentChapter, CurrentFromVerse, startVerse, endVerse)
		    ref = ref + ":" + startVerse
		    
		    // If only a single verse node in the Bible is selected, see if an endverse was returned (i.e., node is a range of verses)
		    
		    If CurrentFromVerse = CurrentThruVerse Then
		      If endVerse.Len > 0 Then ref = ref + "-" + endVerse
		    Else // Selection is a range of verse nodes.  Add the last verse number to the citation
		      CurrentBible.GetVerseRange(CurrentBook, CurrentChapter, CurrentThruVerse, startVerse, endVerse)
		      If endverse.Len > 0 Then startVerse = endVerse //Most likely case is this is false - node is a single verse
		      ref = ref + "-" + startVerse
		    End If
		  End If
		  
		  Return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ChangeBible(newBible As String)
		  Dim bibleList() As String
		  Dim newiBible As iBible
		  bibleList = BibleFactory.BibleList
		  
		  If biblelist.IndexOf(newBible) >= 0 Then
		    NotifyDisableUI
		    newiBible = BibleFactory.GetBible(newBible)
		    If newiBible Is Nil Then
		      App.DebugWriter.Write "ScripturePickerController: Got Nil loading bible " + newBible, 1
		      Return
		    End If
		    mCurrentBible = newiBible
		    If Not CurrentBible.ValidateCitation(CurrentBook, CurrentChapter, CurrentFromVerse, CurrentThruVerse) Then
		      SetDefaultPassage
		    End If
		    //++
		    // Invalidate the search window
		    //--
		    If Not (ActiveSearchWindow Is Nil) Then ActiveSearchWindow = Nil
		    ClearLiveDisplayPassage
		    NotifyBibleChanged
		    NotifyPassageChanged
		    NotifyEnableUI
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ChangeBook(newBook As Integer)
		  If CurrentBible.ValidateCitation(newBook, 1, 1, 1) Then
		    ClearLiveDisplayPassage
		    CurrentBook = newBook
		    CurrentChapter = 1
		    CurrentFromVerse = 1
		    CurrentThruVerse = 1
		    NotifyPassageChanged
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ChangeLiveDisplaySlide(forward As Boolean)
		  If LiveSlideNumber = -1 Or LiveSlides = Nil Then Return
		  Dim nextSlide As Integer
		  Dim bp As BiblePassage
		  Dim passage() As String
		  
		  NotifyDisableUI
		  
		  If forward Then
		    nextSlide = LiveSlideNumber + 1
		  Else
		    nextSlide = LiveSlideNumber - 1
		  End If
		  
		  If nextSlide > -1 And nextSlide < LiveSlides.Length Then
		    LiveSlideNumber = nextSlide
		    passage = Split(SmartML.GetValue(LiveSlides.Item(LiveSlideNumber), "passage", False), ",")
		    If passage.Ubound = 3 Then
		      bp = New BiblePassage(Val(passage(0)), Val(passage(1)), val(passage(2)), val(passage(3)))
		      NotifyLivePassageChanged(bp)
		    End If
		    NotifyLiveDisplay(LiveSlides.Item(LiveSlideNumber), LiveSlides)
		    NotifyLiveMobility(LiveSlideNumber > 0, LiveSlideNumber < LiveSlides.Length - 1)
		  End If
		  
		  NotifyEnableUI
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ChangePassage(newPassage As BiblePassage)
		  Dim newBook As Integer
		  Dim newChapter As Integer
		  Dim newFromVerse As Integer
		  Dim newThruVerse As Integer
		  
		  newBook = newPassage.BookNumber
		  newChapter = newPassage.ChapterNumber
		  newFromVerse = newPassage.FromVerseNumber
		  newThruVerse = newPassage.ThruVerseNumber
		  
		  // Compare... will determine what has changed and reset these as appropriate
		  
		  CompareToCurrentPassage(newBook, newChapter, newFromVerse, newThruVerse)
		  If CurrentBible.ValidateCitation(newBook, newChapter, newFromVerse, newThruVerse) Then
		    CurrentBook = newBook
		    CurrentChapter = newChapter
		    CurrentFromVerse = newFromVerse
		    CurrentThruVerse = newThruVerse
		  End If
		  ClearLiveDisplayPassage
		  NotifyPassageChanged
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ClearLiveDisplayPassage(notify As Boolean = False)
		  CurrentPassage = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CommandNotification(command As String, sender As iScripturePicker, parameter As Variant)
		  
		  App.DebugWriter.Write "ScripturePickerController.CommandNotification: " + Command, 5
		  
		  Select Case Command
		  Case cmdLiveBackward, cmdLiveDisplay, cmdLiveForward
		    // Noop, still in Live mode
		  Case Else
		    LiveSlideNumber = -1
		    LiveSlides = Nil
		    LiveSlide = Nil
		    NotifyLiveDisplayDone
		  End Select
		  
		  Select Case command
		  Case cmdSelectBible
		    ChangeBible parameter.StringValue
		    
		  Case cmdSelectionChanged
		    ChangePassage BiblePassage(parameter.ObjectValue)
		    
		  Case cmdSelectBook
		    ChangeBook parameter.IntegerValue
		    
		  Case cmdQuickLookup
		    DoQuickLookup parameter.StringValue
		    
		  Case cmdAddToSet
		    CompileScriptureAndNotify
		    
		  Case cmdLiveDisplay
		    CompileScriptureAndDisplay
		    
		  Case cmdLiveForward, cmdLiveBackward
		    ChangeLiveDisplaySlide(command = cmdLiveForward)
		    
		  Case cmdFormatChanged
		    UpdateFormat sender
		    
		  Case cmdSearch
		    DoSearchBible sender
		    
		  Case cmdDone
		    ScripturePickerDone sender
		    
		  Case Else
		    App.DebugWriter.Write "ScripturePickerController.CommandNotification: Unknown command " + command, 1
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CompareToCurrentPassage(ByRef newBook As Integer, ByRef newChapter As Integer, ByRef newFromVerse As Integer, ByRef newThruVerse As Integer)
		  // Determine what has changed in the citation from what is currently selected, and update
		  // the citation as necessary.
		  
		  If newBook <> CurrentBook Then
		    newChapter = 1
		    newFromVerse = 1
		    newThruVerse = 1
		  ElseIf newChapter <> CurrentChapter Then
		    newFromVerse = 1
		    newThruVerse = 1
		  ElseIf (newFromVerse <> CurrentFromVerse) Then
		    If (newFromVerse < 1) Or (newFromVerse > CurrentBible.GetVerseCount(newBook, newChapter)) Then
		      newFromVerse = 1
		    End If
		  ElseIf (newThruVerse <> CurrentThruVerse) Then
		    If (newThruVerse < 1) Or (newThruVerse > CurrentBible.GetVerseCount(newBook, newChapter)) Then
		      newThruVerse = 1
		    End If
		  End If
		  
		  If newThruVerse < newFromVerse Then
		    newThruVerse = newFromVerse
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CompileScriptureAndDisplay()
		  Dim newGroup As XmlNode
		  'Dim bp As New BiblePassage(-1, -1, -1, -1)
		  Dim bp As BiblePassage
		  Dim slidePassage() As String
		  
		  NotifyDisableUI
		  newGroup = CompileSlideGroup
		  If newGroup <> Nil Then
		    LiveSlides = newGroup.XQL("slides/slide")
		    If LiveSlides.Length > 0 Then
		      LiveSlideNumber = 0
		      NotifyLiveDisplay(LiveSlides.Item(LiveSlideNumber), LiveSlides)
		      slidePassage = Split(SmartML.GetValue(LiveSlides.Item(LiveSlideNumber), "passage", False), ",")
		      If slidePassage.Ubound = 3 Then
		        bp = New BiblePassage(Val(slidePassage(0)), Val(slidePassage(1)), Val(slidePassage(2)), Val(slidePassage(3)))
		        'bp.BookNumber = Val(slidePassage(0))
		        'bp.ChapterNumber = Val(slidePassage(1))
		        'bp.FromVerseNumber = Val(slidePassage(2))
		        'bp.ThruVerseNumber = Val(slidePassage(3))
		        NotifyLivePassageChanged(bp)
		      End If
		      NotifyLiveMobility(False, LiveSlides.Length > 1)
		    End If
		  End If
		  NotifyEnableUI
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CompileScriptureAndNotify()
		  Dim newGroup As XmlNode
		  
		  NotifyDisableUI
		  
		  newGroup = CompileSlideGroup
		  
		  NotifyScriptureReceivers(newGroup)
		  
		  NotifyEnableUI
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CompileSlideGroup() As XmlNode
		  //
		  // Take the current settings and build a scripture slide group to pass
		  //
		  Dim xDoc As New XmlDocument
		  Dim newGroup As XmlElement
		  Dim xSlide As XmlElement
		  Dim ref As String
		  Dim slides As XmlNode
		  Dim verses() As String
		  Dim slideBody As String
		  Dim startVerse As String
		  Dim endVerse As String
		  Dim firstVerseIdx As Integer
		  Dim sep As String
		  Dim currVerse As Integer
		  Dim cite As String
		  Dim slideFirstVerse As Integer
		  Dim slidePassage As BiblePassage
		  
		  xDoc.AppendChild(xDoc.CreateElement("slide_group"))
		  newGroup = xdoc.DocumentElement
		  
		  newGroup.SetAttribute("type", "scripture")
		  
		  cite = BuildCitation
		  newGroup.SetAttribute("name", cite + "|" + CurrentBible.Name)
		  SmartML.SetValue(newGroup, "title", cite)
		  SmartML.SetValue(newGroup, "subtitle", CurrentBible.Name)
		  
		  'If PassageThruVerse < PassageFromVerse Then
		  verses = CurrentBible.GetPassage(CurrentBook, CurrentChapter, CurrentFromVerse, _
		  CurrentThruVerse, ShowVerseNumbers)
		  firstVerseIdx = CurrentFromVerse
		  'Else
		  'verses = CurrentBible.GetPassage(CurrentBook, CurrentChapter, PassageFromVerse, _
		  'PassageThruVerse, ShowVerseNumbers)
		  'firstVerseIdx = PassageFromVerse
		  'End If
		  
		  currVerse = 0
		  
		  If FormatParagraph Then
		    sep = " "
		  Else
		    sep = EndOfLine
		  End If
		  
		  Dim slideStartVerse As Integer
		  slides = SmartML.InsertChild(newGroup, "slides", 1)
		  While currVerse <= UBound(verses)
		    xSlide = xDoc.CreateElement("slide")
		    slideBody = ""
		    slideStartVerse = currVerse
		    For i As Integer = 1 To VersesPerSlide
		      If currVerse > UBound(verses) Then Exit For
		      If i > 1 And (slideBody.Len + verses(currVerse).len) > CharsPerSlide Then Exit For
		      
		      If slideBody.Len > 0 Then slideBody = slideBody + sep
		      slideBody = slideBody + verses(currVerse)
		      currVerse = currVerse + 1
		    Next
		    slidePassage = New BiblePassage(CurrentBook, CurrentChapter, _
		    CurrentFromVerse + slideFirstVerse, CurrentFromVerse + currVerse - 1)'MISSING OPENING PARENTHESIS
		    SmartML.SetValue(xSlide, "passage", slidePassage)
		    SmartML.SetValue(xSlide, "body", slideBody)
		    SmartML.SetValueN(xSlide, "@startVerseIdx", slideStartVerse + firstVerseIdx)
		    SmartML.SetValueN(xSlide, "@VerseCount", currVerse - slideStartVerse)
		    slides.AppendChild xSlide
		  Wend
		  
		  Return newGroup
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  LoadState
		  
		  ClearLiveDisplayPassage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  App.DebugWriter.Write "ScripturePickerController.Destructor", 4
		  ReDim Observers(-1)
		  ReDim Receivers(-1)
		  If Not (ActiveSearchWindow Is Nil) Then
		    ActiveSearchWindow.Close
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoQuickLookup(cite As String)
		  Dim result() As Integer
		  
		  Dim versionRegEx As New RegEx
		  Dim versionMatch As RegExMatch
		  Dim lookupBibleName As String
		  Dim lookupBible As iBible
		  Dim bibleNames() As String
		  Dim lookupException As New BibleRefException
		  
		  // See if we need to select a different scripture version
		  
		  //++
		  // The parsing regex was changed to work around an apparent bug in the regex library
		  // that incorrectly excludes extended Latin-1 characters from the [[:alpha:]] and [[:alnum:]] classes
		  // To allow the old regex to be used if it breaks other languages than Turkish (where the error
		  // was first seen), allow a key to be added to the preferences to return to the old behavior.
		  //--
		  versionRegEx.SearchPattern = BibleFactory.kLookupRefRegEx
		  versionMatch = versionRegEx.Search(cite)
		  lookupBible = CurrentBible
		  
		  If versionMatch <> Nil Then
		    If cite.LeftB(versionMatch.SubExpressionStartB(versionMatch.SubExpressionCount-1)).RTrim.Right(1) = "(" Then
		      lookupBibleName = versionMatch.SubExpressionString(5)
		      bibleNames = BibleFactory.BibleList
		      If bibleNames.IndexOf(lookupBibleName) < 0 Then
		        lookupException.Message = App.T.Translate("scripture_lookup/bad_reference/version", lookupBibleName)
		        Raise lookupException
		      End If
		      lookupBible = BibleFactory.GetBible(lookupBibleName)
		    End If
		  Else
		    lookupException.Message = App.T.Translate("scripture_lookup/bad_reference/format")
		    Raise lookupException
		  End If
		  
		  If lookupBible Is Nil Then
		    lookupException.Message = App.T.Translate("scripture_lookup/bad_reference/version", lookupBibleName)
		    Raise lookupException
		  End If
		  
		  result = lookupBible.QuickLookup(cite)
		  
		  If lookupBible.ValidateCitation(result(0), result(1), result(2), result(3)) Then
		    If lookupBible <> CurrentBible Then
		      NotifyDisableUI
		      ChangeBible(lookupBible.Name)
		      NotifyEnableUI
		    End If
		    CurrentBook = result(0)
		    CurrentChapter = result(1)
		    CurrentFromVerse = result(2)
		    CurrentThruVerse = result(3)
		    ClearLiveDisplayPassage
		    NotifyPassageChanged
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoSearchBible(sender As iScripturePicker)
		  //++
		  // Offer the user a search window for
		  // the currently-selected Bible
		  //--
		  If ActiveSearchWindow = Nil Then
		    ActiveSearchWindow = New SearchWindow
		  End If
		  ActiveSearchWindow.Visible = False
		  ActiveSearchWindow.DoSearch(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadState()
		  //++
		  // Get the saved settings from the last ScripturePicker
		  //
		  //--
		  
		  Dim CurrentBibleName As String
		  
		  CurrentBibleName = App.MainPreferences.GetValue(prefs.kScriptureVersion)
		  CurrentBook = App.MainPreferences.GetValueN(prefs.kLastScriptureBook)
		  CurrentChapter = App.MainPreferences.GetValueN(prefs.kLastScriptureChapter)
		  CurrentFromVerse = App.MainPreferences.GetValueN(prefs.kLastScriptureVerse)
		  CurrentThruVerse = App.MainPreferences.GetValueN(prefs.kLastScriptureThru)
		  VersesPerSlide = Max(0, Min(App.MainPreferences.GetValueN(prefs.kScriptureVersePerSlide), 5))
		  CharsPerSlide = Max(0, Min(App.MainPreferences.GetValueN(prefs.kScriptureCharsPerSlide), 1000))
		  ShowVerseNumbers = App.MainPreferences.GetValueB(prefs.kScriptureShowNumbers, False, True)
		  FormatParagraph = ("paragraph" = App.MainPreferences.GetValue(prefs.kScriptureFormat))
		  
		  If VersesPerSlide = 0 Then VersesPerSlide = 3
		  If CharsPerSlide = 0 Then CharsPerSlide = 500
		  mCurrentBible = BibleFactory.GetBible(CurrentBibleName)
		  
		  
		  If CurrentBible Is Nil Then
		    Try
		      mCurrentBible = BibleFactory.GetBible(BibleFactory.BibleList.Pop)
		    Catch ex As OutOfBoundsException
		      // OOB Here is probably due to the BibleList being Empty
		      RuntimeException(ex).Message = "ScripturePickerController: OOB in BeginPickScripture"
		      For Each o As iScripturePicker In Observers
		        o.CloseScripturePicker
		      Next
		      mCurrentBible = Nil
		      Return
		    End Try
		    '--
		  End If
		  
		  Try
		    If Not CurrentBible.ValidateCitation(CurrentBook, CurrentChapter, CurrentFromVerse, CurrentThruVerse) Then
		      SetDefaultPassage
		    End If
		    NotifyBibleChanged
		    NotifyPassageChanged
		  Catch ex As NilObjectException
		    // NOE here is probably due to the iBible object; Abort
		    RuntimeException(ex).Message = "ScripturePickerController: NOE in BeginPickScripture"
		    For Each o As iScripturePicker In Observers
		      o.CloseScripturePicker
		    Next
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyBibleChanged()
		  For Each o As iScripturePicker in Observers
		    o.ChangeBible(CurrentBible)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyDisableUI(picker As iScripturePicker = Nil)
		  For Each o As iScripturePicker in Observers
		    o.DisableUI
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyEnableUI()
		  For Each o As iScripturePicker in Observers
		    o.EnableUI
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyFormatChanged()
		  For Each o As iScripturePicker in Observers
		    o.FormatAsParagraph(FormatParagraph)
		    o.VersesPerSlide(VersesPerSlide)
		    o.CharsPerSlide(CharsPerSlide)
		    o.ShowVerseNumbers(ShowVerseNumbers)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyLiveDisplay(slide As XmlNode, slides As XmlNodeList)
		  For Each r As ScriptureReceiver In Receivers
		    r.LiveDisplay(slide, slides)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyLiveDisplayDone()
		  For Each o As iScripturePicker In Observers
		    o.LiveDisplayDone
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyLiveMobility(backward As Boolean, forward As Boolean)
		  For Each o As iScripturePicker In Observers
		    o.LiveMobility(backward, forward)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyLivePassageChanged(thePassage As BiblePassage = Nil)
		  For Each o As iScripturePicker In Observers
		    o.ChangeSecondaryPassage(thePassage)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyPassageChanged(thePassage As BiblePassage = Nil)
		  If thePassage = Nil Then
		    thePassage = New BiblePassage(CurrentBook, CurrentChapter, CurrentFromVerse, CurrentThruVerse)
		    thePassage.SourceBible = iBible(CurrentBible)
		  End If
		  
		  For Each o As iScripturePicker In Observers
		    o.ChangePassage(thePassage.BookNumber, thePassage.ChapterNumber, thePassage.FromVerseNumber, thePassage.ThruVerseNumber)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyScriptureReceivers(slideGroup As XmlNode)
		  For Each r As ScriptureReceiver in Receivers
		    r.ScriptureSelected(slideGroup)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub registerObserver(newObserver As iScripturePicker)
		  if Observers.IndexOf(newObserver) < 0 Then
		    Observers.Append newObserver
		    NotifyDisableUI
		    NotifyBibleChanged
		    NotifyPassageChanged
		    NotifyFormatChanged
		    NotifyEnableUI
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub registerScriptureReceiver(receiver As ScriptureReceiver)
		  // Part of the ScriptureNotifier interface.
		  
		  If Receivers.IndexOf(receiver) < 0 Then
		    Receivers.Append receiver
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveState()
		  //++
		  // Store the current settings
		  //--
		  
		  App.MainPreferences.SetValue(prefs.kScriptureVersion, CurrentBible.Name)
		  App.MainPreferences.SetValueN(prefs.kLastScriptureBook, CurrentBook)
		  App.MainPreferences.SetValueN(prefs.kLastScriptureChapter, CurrentChapter)
		  App.MainPreferences.SetValueN(prefs.kLastScriptureVerse, CurrentFromVerse)
		  App.MainPreferences.SetValueN(prefs.kLastScriptureThru, CurrentThruVerse)
		  App.MainPreferences.SetValueN(prefs.kScriptureVersePerSlide, VersesPerSlide)
		  App.MainPreferences.SetValueN(prefs.kScriptureCharsPerSlide), CharsPerSlide
		  App.MainPreferences.SetValueB(prefs.kScriptureShowNumbers, ShowVerseNumbers)
		  If FormatParagraph Then
		    App.MainPreferences.SetValue(prefs.kScriptureFormat, "paragraph")
		  Else
		    App.MainPreferences.SetValue(prefs.kScriptureFormat, "verse")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ScripturePickerDone(sender As iScripturePicker)
		  SaveState
		  sender.CloseScripturePicker
		  unregisterObserver sender
		  If Not (ActiveSearchWindow Is Nil) Then ActiveSearchWindow = Nil
		  ClearLiveDisplayPassage
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchComplete(wnd As SearchWindow, result As SearchResult)
		  If Not (result Is Nil) Then
		    CurrentBook = result.book
		    CurrentChapter = result.chapter
		    CurrentFromVerse = result.verse
		    CurrentThruVerse = CurrentFromVerse
		    NotifyPassageChanged
		  End If
		  
		  If wnd = ActiveSearchWindow Then
		    ActiveSearchWindow = Nil
		  End If
		  
		  wnd.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetDefaultPassage()
		  CurrentBook = 1
		  CurrentChapter = 1
		  CurrentFromVerse = 1
		  CurrentThruVerse = 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub unregisterObserver(observer As iScripturePicker)
		  Dim i As Integer
		  
		  i = Observers.IndexOf(observer)
		  If i >= 0 Then
		    Observers.Remove i
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub unregisterScriptureReceiver(receiver As ScriptureReceiver)
		  // Part of the ScriptureNotifier interface.
		  Dim index As Integer
		  
		  index = Receivers.IndexOf(receiver)
		  If index >= 0 Then Receivers.Remove index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateFormat(sender As iScripturePicker)
		  
		  Dim changed As Boolean = False
		  
		  If sender.VersesPerSlide <> VersesPerSlide Then
		    changed = True
		    VersesPerSlide = sender.VersesPerSlide
		  End If
		  
		  If sender.CharsPerSlide <> CharsPerSlide Then
		    changed = True
		    CharsPerSlide = sender.CharsPerSlide
		  End If
		  
		  If sender.ShowVerseNumbers <> ShowVerseNumbers Then
		    changed = True
		    ShowVerseNumbers = Not ShowVerseNumbers
		  End If
		  
		  If sender.FormatAsParagraph <> FormatParagraph Then
		    changed = True
		    FormatParagraph = Not FormatParagraph
		  End If
		  
		  If changed Then
		    PassageSlideGroup = Nil
		    NotifyFormatChanged
		  End If
		End Sub
	#tag EndMethod


	#tag Note, Name = Index Base
		For this module, the base index for the Chapter and Verse references is 1
		It is the responsibility of the Observers to convert as necessary to 0-based
		(for example, to fill a listbox).
	#tag EndNote


	#tag Property, Flags = &h1
		Protected ActiveSearchWindow As SearchWindow
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CharsPerSlide As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCurrentBible
			End Get
		#tag EndGetter
		CurrentBible As iBible
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected CurrentBook As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentChapter As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentFromVerse As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentPassage As BiblePassage
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentThruVerse As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected FormatParagraph As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LiveSlide As XmlNode
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LiveSlideNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LiveSlides As XmlNodeList
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentBible As iBible
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Observers() As iScripturePicker
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			For live display, the start verse of the whole passage
		#tag EndNote
		Protected PassageFromVerse As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PassageSlideGroup As XmlNode
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			For live display, the last verse Of the whole passage
			If this is smaller than PassageThruVerse then no passage Is being live displayed
		#tag EndNote
		Protected PassageThruVerse As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Receivers() As ScriptureReceiver
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedPassage As BiblePassage
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ShowVerseNumbers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected VersesPerSlide As Integer
	#tag EndProperty


	#tag Constant, Name = cmdAddToSet, Type = String, Dynamic = False, Default = \"addscripture", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdDone, Type = String, Dynamic = False, Default = \"done", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdFormatChanged, Type = String, Dynamic = False, Default = \"formatchange", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdLiveBackward, Type = String, Dynamic = False, Default = \"live_backward", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdLiveDisplay, Type = String, Dynamic = False, Default = \"livedisplay", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdLiveForward, Type = String, Dynamic = False, Default = \"live_forward", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdQuickLookup, Type = String, Dynamic = False, Default = \"quicklookup", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdSearch, Type = String, Dynamic = False, Default = \"search", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdSelectBible, Type = String, Dynamic = False, Default = \"selectbible", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdSelectBook, Type = String, Dynamic = False, Default = \"selectbook", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdSelectionChanged, Type = String, Dynamic = False, Default = \"selectionchanged", Scope = Public
	#tag EndConstant


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
End Class
#tag EndClass
