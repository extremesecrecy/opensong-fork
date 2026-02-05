#tag Window
Begin Window PresentWindow Implements ScriptureReceiver
   BackColor       =   "&c00000000"
   Backdrop        =   0
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   1104
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   False
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Presentation"
   Visible         =   False
   Width           =   300
   Begin Canvas cnvSlide
      AcceptFocus     =   True
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   300
   End
   Begin Timer timerAdvance
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   10000
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   249
      Visible         =   True
      Width           =   32
   End
   Begin Timer timerTransition
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   125
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   249
      Visible         =   True
      Width           =   32
   End
   Begin SnapshotThread m_SnapshotThread
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   249
      Visible         =   True
      Width           =   32
   End
   Begin Timer timerClick
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   1
      Period          =   333
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   32
   End
   Begin Timer timerWindowLocation
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   250
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Visible         =   True
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  App.DebugWriter.Write "PresentWindow.Activate: Enter"
		  
		  If Globals.Status_Presentation Then
		    If HelperActive Then
		      If PresentHelperWindow.IsCollapsed Then
		        App.RestoreWindow(PresentHelperWindow)
		      Else
		        App.SetForeground(PresentHelperWindow)
		      End If
		    Else
		      If Not SetML.IsExternal(XCurrentSlide) Then
		        If PresentWindow.IsCollapsed Then
		          App.RestoreWindow(PresentWindow)
		        End If
		        App.SetForeground(PresentWindow)
		        PresentWindow.SetFocus
		      End If
		    End If
		    Me.MenuBarVisible = (Not Me.FullScreen) Or (PresentScreen <> 0) // Make assumption that screen 0 has the menu; not always true
		    If PositionSaved Then timerWindowLocation.Enabled = True
		  End If
		  
		  App.DebugWriter.Write "PresentWindow.Activate: Exit"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  'MainWindow.Status_Presentation = False
		  'MainWindow.Show
		  'MainWindow.SetFocus
		  
		  m_ExternalRenderer.EndPresent()
		  
		  Call ResetPaint(Nil) 'This will cleanup external slide stuff
		  
		  App.MouseCursor = Nil
		  MainWindow.Status_Presentation = False
		  Globals.Status_Presentation = False
		  If HelperActive Then PresentHelperWindow.Close
		  timerAdvance.Enabled = False
		  
		  m_updatingSlide = False
		  While m_SnapshotThread.State = Thread.Running Or m_SnapshotThread.State = Thread.Sleeping
		    App.SleepCurrentThread(100)
		  Wend
		  
		  MainWindow.CleanupPresentation CurrentSet
		  
		  UpdateStatusNotifiers "closed"
		  
		  '++JRC Prevent resizing MainWindow
		  'MainWindow.Show
		  #If Not TargetMacOS
		    App.RestoreWindow(MainWindow)
		  #endif
		  App.SetForeground(MainWindow)
		  '--
		  
		  MainWindow.SetFocus
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  App.DebugWriter.Write("PresentWindow.Deactivate: Enter")
		  timerWindowLocation.Enabled = False
		  App.DebugWriter.Write("PresentWindow.Deactivate: Exit")
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim status As Boolean
		  
		  status = KeyDownX(Key)
		  
		  Return status
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If IsContextualClick Then
		    Return KeyDownX(Chr(30)) 'Pass up key
		  Else
		    If GetClickCount()>1 And _
		      SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@exit_doubleclick") Then
		      Return KeyDownX(Chr(27)) 'Pass Esc
		    Else
		      Return KeyDownX(Chr(31)) 'Pass down key
		    End If
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  AppCursor = App.MouseCursor
		  App.MouseCursor = PresentCursor
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  App.MouseCursor = AppCursor
		End Sub
	#tag EndEvent

	#tag Event
		Sub Moved()
		  cnvSlide.SetFocus
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #If TargetLinux
		    #If RBVersion < 2017.02
		      Soft Declare Sub gtk_window_set_decorated Lib "libgtk-x11-2.0.so" (gtkwindow As Integer, decorated As Boolean)
		    #Else
		      Soft Declare Sub gtk_window_set_decorated Lib "libgtk-3.so" (gtkwindow As Integer, decorated As Boolean)
		    #EndIf
		  #EndIf
		  
		  //++EMP 09/04
		  // Rewritten to get transition speed characteristics from presentation preferences
		  //
		  App.DebugWriter.Write("PresentWindow.Open: Enter")
		  Dim time As Integer
		  
		  time = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "style/@transition_time", False)
		  If time = 0 Then Time = 100 'Set a reasonable default
		  TransitionFrames = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "style/@transition_frames", False)
		  If TransitionFrames = 0 Then TransitionFrames= 5 'again, reasonable default
		  timerTransition.Period = time / TransitionFrames
		  //--
		  Mode = SmartML.GetValue(App.MyPresentSettings.DocumentElement, "style/@initial_mode")
		  If Len(Mode) <> 1 Then Mode = "N"
		  doTransition = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@transition")
		  curslideTransition = SlideTransitionEnum.NoTransition
		  m_Snapshots = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "snapshot/@enable", False, False)
		  
		  #If TargetLinux
		    Try
		      gtk_window_set_decorated( self.handle, False )
		    Catch
		      'This could fail if libgtk cannot be loaded
		    End Try
		  #EndIf
		  
		  m_videolanController = New VideolanController 'Initialise shell control for videolan
		  m_AppLaunchShell = New Shell 'Initialise shell control for external applications
		  m_ExternalRenderer = New ExternalRenderer
		  m_updatingSlide = False
		  
		  App.DebugWriter.Write("PresentWindow.Open: Exit")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function AddNodeToStyleDict(StyleNode as XmlNode, Key As String = "") As String
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
		Protected Sub AddSongSubtitles(Set As XmlDocument)
		  ' Now that we know the song's style, we can compose the subtitle's text
		  ' We do it here in advance because of REST and the external renderer
		  
		  Dim slide_groups As XmlNode
		  Dim slide_group As XmlNode
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
		      style = SetML.GetSlideStyle(SmartML.GetNode(slide_group, "slides/slide", False))
		      subtitle = SongML.BuildSubtitle(slide_group, style)
		      SmartML.SetValue(slide_group, "subtitle", subtitle)
		      SmartML.SetValue(slide_group, "subtitle/@subtitle_list", style.SubtitleList)
		    End If
		    
		    slide_group = slide_group.NextSibling
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoClosePresentation(confirmClose As Boolean = True) As Boolean
		  Dim messagebox As New MessageDialog
		  Dim msgboxbutton As MessageDialogButton
		  Dim bFound As Boolean
		  //++
		  // Check for an open dialog box and ignore if one is found (Bug 1693567)
		  // Only windows that can remain open when a presentation closes are the MainWindow
		  // or the two Present windows.  Assume anything else is a dialog that should block closing.
		  //--
		  bFound = False
		  For i As Integer = 0 To WindowCount - 1
		    If Not (Window(i) IsA MainWindow Or _
		      Window(i) IsA PresentWindow Or _
		      Window(i) IsA PresentHelperWindow) Then
		      bFound = True
		    End If
		  Next
		  If bFound Then Return True
		  '++JRC: made the prompt optional
		  if confirmClose And _
		    SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@exit_prompt") then
		    If PresentationMode = MODE_SINGLE_SCREEN Then // Use operating system message box
		      messagebox.Message = App.T.Translate("presentation_helper/exit/@caption")
		      messagebox.Title = "OpenSong"
		      messagebox.ActionButton.Default = True
		      messagebox.CancelButton.Visible = True
		      messagebox.CancelButton.Cancel = True
		      msgboxbutton = messagebox.ShowModal
		      If msgboxbutton = messagebox.ActionButton Then
		        Close
		      End If
		    Else // Use the OpenSong one so it ends up on the right screen
		      If InputBox.Ask(App.T.Translate("presentation_helper/exit/@caption")) Then
		        Close
		      End If
		    End If
		  else // No prompt before exit
		    Close
		  end if
		  
		  return true
		  '--End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoPickScripture() As Boolean
		  App.DebugWriter.Write "PresentWindow.DoPickScripture: Enter", 4
		  
		  Dim w As ScripturePickerWindow
		  
		  Dim c As ScripturePickerController
		  
		  '++JRC No Bibles were found, return
		  If UBound(BibleFactory.BibleList) < 0 Then Return False
		  '--
		  
		  c = New ScripturePickerController
		  c.registerScriptureReceiver Self
		  
		  w = New ScripturePickerWindow(c, True)
		  savedMode = Mode
		  w.Live = True
		  w.ShowModal
		  w = Nil
		  c.unregisterScriptureReceiver Self
		  c = Nil
		  Mode = savedMode
		  ResetPaint XCurrentSlide
		  App.DebugWriter.Write "PresentWindow.DoPickScripture: Exit", 4
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoPickSong() As Boolean
		  Dim CheckLinked As Boolean = True
		  Dim result As Boolean = False
		  
		  '++JRC Check if we have a songs folder if not try to create one
		  If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		    If  App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.AbsolutePath + App.STR_SONGS)
		    Else
		      InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return False
		  End If
		  '--
		  '++JRC If Songs is Nil, try to generate FolderDB
		  If MainWindow.Songs = Nil Then
		    If App.DocsFolder <> Nil Then
		      MainWindow.Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		    Else
		      'InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      Return False
		    End If
		    If MainWindow.Songs = Nil Then
		      'Songs is still Nil, return (should never get here but we probably should
		      'give some error message anyway ;)
		      Return False
		    End If
		  End If
		  
		  Dim presentation As String
		  Dim f As FolderItem = SongPickerWindow.Popup(presentation)
		  
		  If f <> Nil Then
		    ' Added code to remember current position so song can be inserted without changing
		    ' what's up on the screen (allows operator to cue next song in a highly dynamic,
		    ' Spirit-lead P&W service before the previous song is finished).
		    '
		    ' TODO: Parameterize this behavior -- add checkbox or radiobuttons to the
		    ' add song dialog box.
		    '
		    ' EMP 6/20/05
		    '
		    App.MouseCursor = System.Cursors.Wait
		    
		    result = InsertSongIntoSet(f, CurrentSlide, presentation, CheckLinked, True)
		    
		    ' Added to move back to original position (see EMP 6/20/05 comments above).
		    '
		    
		    If HelperActive Then
		      App.MouseCursor = Nil
		      PresentHelperWindow.ScrollTo currentSlide
		    Else
		      App.MouseCursor = Nil
		      ResetPaint XCurrentSlide
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoSwapFullScreen() As Boolean
		  If HelperActive Then
		    PresentHelperWindow.SwapFullScreen
		    Return True
		  Else
		    Return False
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawAlert(g As Graphics, alert As String)
		  Dim alertFont As FontFace = SmartML.GetValueF(App.MyPresentSettings.DocumentElement, "alert")
		  Dim RealSize As Integer = alertFont.Size * g.Width / 500
		  'Dim Margin As Integer = RealSize / 10
		  
		  alertFont.OntoGraphics g
		  
		  g.TextSize = RealSize
		  alertFont.Size = RealSize
		  
		  Dim valign As String = Lowercase(SmartML.GetValue(App.MyPresentSettings.DocumentElement, "alert/@valign"))
		  Dim align As String = Lowercase(SmartML.GetValue(App.MyPresentSettings.DocumentElement, "alert/@align"))
		  Dim Border As Integer = CalcBorderSize(g)
		  
		  Call GraphicsX.DrawFontString(g, _
		  alert, _
		  Border*3, _
		  Border, _
		  alertFont, _
		  cnvSlide.Width-Border*6, _
		  align, _
		  cnvSlide.Height-Border*7, _
		  valign)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindKey(key As String, XCurSlide As XmlNode, CurSlide As Integer, byRef XNewSlide As XmlNode, byRef NewSlide As Integer) As Boolean
		  '
		  ' Function to help reduce amount of code in KeyDownX by implementing the common aspects of looking for
		  ' a specific item (chorus, bridge, verse) in a Set's Section
		  'Assumes ?? (...a lot -- EMP 6/20/05 :^O )
		  '
		  'XNewSlide and NewSlide will always point to a valid slide unless their Current equivalents passed in garbage
		  '
		  ' EMP 09/04-10/04
		  
		  Dim startSlide as integer 'Where the search started from
		  Dim XstartSlide as XMLnode 'Same, but XML for the slide
		  Dim bFound as Boolean 'Search successful? (Loop control)
		  Dim temp as String
		  Dim ppName as String
		  Dim SearchType as Integer
		  Const SEARCH_ANYVERSE = 1
		  Const SEARCH_SPECIFICVERSE = 2
		  Const SEARCH_OTHER = 3
		  
		  if (lowercase(key) = "v") Then
		    SearchType = SEARCH_ANYVERSE
		  elseif IsNumeric(key) then 'Verse can be  either a V or digit
		    SearchType = SEARCH_SPECIFICVERSE
		  else
		    SearchType = SEARCH_OTHER
		  end if
		  
		  ppName = SmartML.GetValue(XcurrentSlide.Parent.Parent, "@name", False) 'EMP debug 10/1 -- RB  debug crashed with old IF statement below
		  xNewSlide = xCurrentSlide
		  NewSlide = CurrentSlide
		  If ppName = "" Then 'If we're on a blank, go forward one 'EMP debug 10/1
		    xNewSlide = SetML.GetNextSlide(XCurrentSlide)
		    NewSlide = CurrentSlide + 1
		    If xNewSlide = Nil Then ' We're at the end of the set
		      NewSlide = CurSlide 'point to where we started from
		      XNewSlide = XCurSlide
		      Return False 'Couldn't find it
		    End If
		  End If
		  'Mark where we are starting EMP 10/1
		  startSlide = NewSlide
		  xStartSlide = XNewSlide
		  
		  If ppName <> "" Then 'Always go forward to start searching IF the current slide upon entry to this routine wasn't a blank
		    if xNewSlide.NextSibling <> Nil then 'always start on the next slide if possible
		      xNewSlide = xNewSlide.NextSibling
		      newslide = newslide + 1
		    else ' End of song, go back to the beginning to start the search EMP 10/3
		      While xNewSlide.PreviousSibling <> Nil
		        xNewSlide = XNewSlide.PreviousSibling
		        newSlide = newSlide - 1
		      wend
		    end if
		  End If
		  
		  ' Test until we hit a match or the starting slide again
		  
		  bFound = False
		  While not bFound
		    Select Case SearchType
		    Case SEARCH_OTHER
		      If Lowercase(Left(SmartML.GetValue(xNewSlide, "@id", False), len(key))) = key Then
		        bFound = True 'break the loop EMP 9/28
		      end if
		    Case SEARCH_SPECIFICVERSE
		      temp = SmartML.GetValue(xNewSlide, "@id", False)
		      If (Lowercase(temp) = "v" + Key) Or temp = Key Then
		        bFound = True
		      end if
		    Case SEARCH_ANYVERSE
		      temp = SmartML.GetValue(xNewSlide, "@id", False)
		      if (Lowercase(Left(temp,1)) = "v") Or IsNumeric(temp) Then
		        bFound = True
		      End If
		    end select
		    
		    if not bFound then 'Still not a match
		      '
		      'Make two checks:
		      ' 1. See if we've gone all around the song (startSlide is current)
		      ' 2. See if we're at the end so we can rewind and start from the beginning
		      '
		      if xNewSlide.NextSibling = Nil then 'At end of song.  Be kind: rewind.
		        'While loop looks before it leaps to cover corner case of single slide song  EMP 10/1/04
		        While xNewSlide.PreviousSibling <> Nil
		          xNewSlide = XNewSlide.PreviousSibling
		          newSlide = newSlide - 1
		        Wend 'Backup Loop
		      else 'Move forward to next slide
		        xnewSlide = xNewSlide.NextSibling
		        newslide = newslide + 1
		      end if 'xNewSlide.NextSibling = Nil !!! End of changes EMP 9/28
		      if newSlide = startSlide then '
		        'Didn't find a match EMP 10/1
		        newSlide = CurSlide
		        xNewSlide = xStartSlide
		        return false
		      end if
		    End If 'chorus?
		  Wend '!bFound
		  
		  ' If control comes here, match was found and it's in the "new" variables
		  xCurrentSlide = xNewSlide
		  CurrentSlide = newSlide
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetClickCount() As Integer
		  If m_ClickCount = 0 Then
		    m_ClickCount = 1
		    
		    timerClick.Mode = Timer.ModeSingle
		    timerClick.Enabled = True
		  Else
		    m_ClickCount = m_ClickCount + 1
		  End If
		  
		  Return m_clickCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStyle(Key As String) As SlideStyle
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
		Protected Function GoBridge() As Boolean
		  Dim xNewSlide As XmlNode
		  Dim newSlide As Integer
		  
		  If Not FindKey("b", xNewSlide, newSlide, xNewSlide, newSlide) then
		    Return False 'don''t change anything
		  end if
		  
		  If HelperActive Then
		    PresentHelperWindow.ScrollTo currentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoChorus() As Boolean
		  Dim xNewSlide As XmlNode
		  Dim newSlide As Integer
		  
		  If Not FindKey("c", xNewSlide, newSlide, xNewSlide, newSlide) then
		    Return False 'don''t change anything
		  End If
		  
		  If HelperActive Then
		    PresentHelperWindow.ScrollTo currentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoFirstSlide(Update As Boolean = True) As Boolean
		  CurrentSlide = 1
		  XCurrentSlide = SetML.GetSlide(CurrentSet, 1)
		  
		  If Update Then
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo currentSlide
		    Else
		      ResetPaint XCurrentSlide
		    End If
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoLastSlide() As Boolean
		  Dim xNewSlide As XmlNode
		  Dim newSlide As Integer
		  
		  xNewSlide = xCurrentSlide
		  newSlide = CurrentSlide
		  Do Until xNewSlide = Nil
		    xCurrentSlide = xNewSlide
		    CurrentSlide = newSlide
		    xNewSlide = SetML.GetNextSlide(xCurrentSlide)
		    newSlide = newSlide + 1
		  Loop
		  
		  If HelperActive Then
		    PresentHelperWindow.ScrollTo currentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoNextSection(Update As Boolean = True) As Boolean
		  Dim xNewSlide As XmlNode
		  Dim newSlide As Integer
		  Dim oldName As String
		  Dim oldType As String
		  Dim newName As String
		  Dim newType As String
		  
		  //++EMP, 15 Jan 2006
		  // Updated to recognize new section type "blank" for program-generated blank slides
		  //++JRC, 2 Apr 2009
		  //Updated to allow the option of moving to the next section without updating the screen
		  //
		  
		  xNewSlide = SetML.GetNextSlide(XCurrentSlide)
		  If xNewSlide = Nil Then // at end of presentation, just return
		    Return False
		  End If
		  
		  oldName = SmartML.GetValue(XCurrentSlide.Parent.Parent, "@name", True) 'What is the section name?
		  oldType = SmartML.GetValue(XCurrentSlide.Parent.Parent, "@type", True) 'And its type?
		  ' Check to see if we started on a blank slide, if so, use the section name from the slide we just moved to
		  '++JRC: Or if this is a custom slide without a name
		  If xNewSlide <> Nil and oldType = "blank" Then
		    'If oldName = "" And xNewSlide <> Nil And SmartML.GetValue(XCurrentSlide.Parent.Parent, "@type", True) <> "custom" Then
		    oldName = SmartML.GetValue(xNewSlide.Parent.Parent, "@name", True)
		  end if
		  '--
		  newType = ""
		  newName = oldName
		  
		  xNewSlide = xCurrentSlide
		  newSlide = CurrentSlide
		  
		  ' Keep moving forward until the section name changes
		  While xNewSlide <> Nil And newName = oldName And newType <> "blank"
		    newSlide = newSlide + 1
		    xNewSlide = SetML.GetNextSlide(xNewSlide)
		    
		    If xNewSlide <> Nil Then
		      newType = SmartML.GetValue(xNewSlide.Parent.Parent, "@type", True)
		      newName = SmartML.GetValue(xNewSlide.Parent.Parent, "@name", True)
		    End If
		  Wend
		  
		  // If the slide pointed to by newSlide exists (in other words, we're not at the end)
		  // then we move to it.
		  //
		  If xNewSlide <> Nil Then
		    XCurrentSlide = xNewSlide
		    CurrentSlide = newSlide
		  End If
		  //--EMP, 15 Jan 06
		  
		  '++JRC
		  If Update Then
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo currentSlide
		    Else
		      ResetPaint XCurrentSlide
		    End If
		  End If
		  '--
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoNextSlide() As Boolean
		  Dim xNewSlide As XmlNode
		  
		  xNewSlide = SetML.GetNextSlide(XCurrentSlide)
		  If xNewSlide <> Nil Then
		    currentSlide = currentSlide + 1
		    XCurrentSlide = xNewSlide
		    
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo currentSlide
		    Else
		      ResetPaint XCurrentSlide
		    End If
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoPreChorus() As Boolean
		  Dim xNewSlide As XmlNode
		  Dim newSlide As Integer
		  
		  if not FindKey("p", XNewSlide, NewSlide, XNewSlide, NewSlide) then
		    Return False 'don''t change anything
		  end if
		  
		  If HelperActive Then
		    PresentHelperWindow.ScrollTo currentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoPreviousSection(Action As Integer) As Boolean
		  Const ASC_KEY_BACKSPACE = 8
		  
		  Dim newSlide As Integer
		  Dim xNewSlide As XmlNode
		  Dim oldName As String
		  Dim oldType As String
		  Dim newName As String
		  Dim newType As String
		  
		  If CurrentSlide = 1 Then Return False ' Can't go back any further
		  
		  newSlide = CurrentSlide - 1 '  "New" is back one
		  xNewSlide = SetML.GetPrevSlide(XCurrentSlide)
		  If xNewSlide = Nil Then // at beginning of presentation, just return
		    Return False
		  End If
		  
		  oldName = SmartML.GetValue(XCurrentSlide.Parent.Parent, "@name", True) 'What is the section name?
		  oldType = SmartML.GetValue(XCurrentSlide.Parent.Parent, "@type", True) 'And its type?
		  If xNewSlide <> Nil and oldType = "blank" Then
		    oldName = SmartML.GetValue(xNewSlide.Parent.Parent, "@name", True)
		  end if
		  
		  //++EMP, 15 Jan 06
		  // Two options for finding the start of the section:
		  // 1. If blanks are being used, just look type="blank" as we count back
		  // 2. No blanks: look for name change
		  //
		  'keep backing up until the name changes (well, it really becomes Nil)
		  newType = SmartML.GetValue(xNewSlide.Parent.Parent, "@type", True)
		  newName = SmartML.GetValue(xNewSlide.Parent.Parent, "@name", True)
		  
		  // Before starting the loop, check to see if the current slide was the first one
		  // of a section.  If so, update the pointers to the current slide.  That means
		  // the first time through the loop both current and next are the same.
		  If newName <> oldName Then
		    oldName = newName
		    oldType = newType
		    XCurrentSlide = xNewSlide
		    CurrentSlide = newSlide
		  End If
		  
		  While xNewSlide <> Nil And newName = oldName And newType <> "blank"
		    XCurrentSlide = xNewSlide
		    CurrentSlide = newSlide
		    
		    newSlide = CurrentSlide - 1
		    xNewSlide = SetML.GetPrevSlide(XCurrentSlide)
		    
		    If xNewSlide <> Nil Then
		      newName = SmartML.GetValue(xNewSlide.Parent.Parent, "@name", True)
		      newType = SmartML.GetValue(xNewSlide.Parent.Parent, "@type", True)
		    End If
		  Wend
		  
		  //
		  // At this point, XCurrentSlide is the first slide of a section.
		  // xNewSlide will either be Nil or have type="blank"
		  // If blank, make it the current slide if the command is ACTION_START_OF_SECTION
		  // Otherwise, stay on the first slide of the section
		  //
		  
		  If xNewSlide <> Nil Then ' See if this is a blank
		    '++JRC: If this is a custom slide without a name, ignore
		    'If SmartML.GetValue(xNewSlide.Parent.Parent, "@name", True) = ""_
		    'And SmartML.GetValue(XCurrentSlide.Parent.Parent, "@type", True) <> "custom"_
		    'And Not (Action = ASC_KEY_BACKSPACE  Or Action = ACTION_FIRST_SLIDE_OF_SECTION) Then 'Stay on first slide if BS or special code instead of the separating blank slide
		    If newType = "blank" _
		      And Not (Action = ASC_KEY_BACKSPACE Or Action = ACTION_FIRST_SLIDE_OF_SECTION) Then
		      XCurrentSlide = xNewSlide
		      CurrentSlide = newSlide
		    End If
		    '--
		  End If
		  
		  If HelperActive Then
		    PresentHelperWindow.ScrollTo CurrentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		  
		  //--EMP, 15 Jan 06
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoPreviousSlide() As Boolean
		  Dim xNewSlide As XmlNode
		  
		  xNewSlide = SetML.GetPrevSlide(XCurrentSlide)
		  If xNewSlide <> Nil Then
		    currentSlide = currentSlide - 1
		    xCurrentSlide = xNewSlide
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo currentSlide
		    Else
		      ResetPaint XCurrentSlide
		    End If
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoSetItem(Item As Integer) As Boolean
		  'This function will position the presentation to the set item indicated by Item
		  Dim Result As Boolean = True
		  
		  IF Item = -1 Then
		    Result = GoFirstSlide
		  ElseIf Item < 0 Then
		    Result = False
		  Else
		    Dim xNewSlide As XmlNode = SetML.GetSlide(CurrentSet, 1)
		    Dim newSlide As Integer = 1
		    
		    Item = Item + 1  // we made @set_list_index 1-based
		    While Item > SmartML.GetValueN(xNewSlide.Parent.Parent, "@set_list_index", False)
		      newSlide = newSlide + 1
		      xNewSlide = SetML.GetNextSlide(xNewSlide)
		      If xNewSlide = Nil Then
		        Exit While
		      End If
		    Wend
		    
		    If xNewSlide = Nil Then
		      Result = False
		    Else
		      
		      CurrentSlide = newSlide
		      xCurrentSlide = xNewSlide
		      
		      If HelperActive Then
		        PresentHelperWindow.ScrollTo CurrentSlide
		      Else
		        ResetPaint XCurrentSlide
		      End If
		      Result = True
		    End If
		  End If
		  
		  If xCurrentSlide = Nil Then
		    Call GoFirstSlide
		    // that's not what was suposed to be happening, so return false
		    Result = False
		  End If
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GoSlide(slideIndex As Integer) As Boolean
		  Dim slide As XmlNode = SetML.GetSlide(Me.CurrentSet, slideIndex)
		  
		  If Not IsNull(slide) Then
		    Me.CurrentSlide = slideIndex
		    Me.XCurrentSlide = slide
		    
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo Me.CurrentSlide
		    End If
		    
		    ResetPaint Me.XCurrentSlide
		  End If
		  
		  Return Not IsNull(slide)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoSong(number As Integer) As Boolean
		  'RealBasic: The Definitive Guide
		  'http://books.google.com/books?id=1NfFvedzfggC&lpg=PA593&ots=vXNPwnD8nD&dq=realbasic%20keycode%20keyboard%20layout&pg=PA460#v=onepage&q&f=false
		  Dim newSlide As Integer = 1
		  Dim songSlide As Integer = 0
		  Dim songName As String = ""
		  Dim songItemNr As Integer = -1
		  Dim xNewSlide As XmlNode = SetML.GetSlide(CurrentSet, 1)
		  
		  While songSlide < number And xNewSlide <> Nil
		    
		    If SmartML.GetValue(xNewSlide.Parent.Parent, "@type") = "song" Then
		      If songName <> SmartML.GetValue(xNewSlide.Parent.Parent, "@name") Or _
		        SongItemNr <> SmartML.GetValueN(xNewSlide.Parent.Parent, "@ItemNumber") Then
		        songSlide = songSlide + 1
		        songName = SmartML.GetValue(xNewSlide.Parent.Parent, "@name")
		        SongItemNr = SmartML.GetValueN(xNewSlide.Parent.Parent, "@ItemNumber")
		      End If
		    End If
		    
		    If songSlide < number Then
		      xNewSlide = SetML.GetNextSlide(xNewSlide)
		      If xNewSlide <> Nil Then
		        newSlide = newSlide + 1
		      End If
		    End If
		  Wend
		  
		  If songSlide = number Then
		    CurrentSlide = newSlide
		    XCurrentSlide = xNewSlide
		    
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo currentSlide
		    Else
		      ResetPaint XCurrentSlide
		    End If
		    
		  End If
		  
		  Return songSlide = number
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoTag() As Boolean
		  Dim xNewSlide As XmlNode
		  Dim newSlide As Integer
		  
		  if not FindKey("t", XNewSlide, NewSlide, XNewSlide, NewSlide) then
		    Return False 'don''t change anything
		  end if
		  
		  If HelperActive Then
		    PresentHelperWindow.ScrollTo currentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoVerse(Key As String) As Boolean
		  Dim xNewSlide As XmlNode
		  Dim newSlide As Integer
		  
		  if FindKey(key,  xCurrentSlide, CurrentSlide, xNewSlide, NewSlide) Then
		    xCurrentSlide = xNewSlide
		    CurrentSlide = NewSlide
		  Else
		    Return False
		  End If
		  
		  If HelperActive Then
		    PresentHelperWindow.ScrollTo currentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ImportExternals(byRef setDoc As XmlDocument, PresentMode As Integer)
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
		  ProgressWindow.SetMaximum( slide_groups.ChildCount() )
		  ProgressWindow.SetProgress(slidesCount)
		  ProgressWindow.CanCancel False
		  ProgressWindow.SetStatus( "" )
		  ProgressWindow.Show()
		  
		  slide_group = slide_groups.FirstChild
		  While slide_group <> Nil
		    slidesCount = slidesCount + 1
		    If SmartML.GetValue(slide_group, "@type", True) = "external" Then
		      ProgressWindow.SetStatus( slide_group.GetAttribute("name") )
		      
		      Select Case SmartML.GetValue(slide_group, "@application")
		      Case "presentation"
		        
		        Dim presFileName As String = SmartML.GetValue(slide_group, "@filename")
		        Dim presFile As FolderItem = GetFolderItem( presFileName )
		        
		        Dim embedFiledata As String = SmartML.GetValue(slide_group, "file", False)
		        If embedFiledata.Len() > 0 Then
		          Try
		            presFile = embeddedFilesBase.Child(presFileName)
		            
		            Dim outputStream As BinaryStream = BinaryStream.Create(presFile, True)
		            outputStream.Write DecodeBase64(embedFiledata)
		            outputStream.Close
		            
		            SmartML.SetValue slide_group, "@_localfilename", presFile.AbsolutePath()
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
		            
		            Dim oExtPres As iPresentation = PresentationFactory.GetOrCreate( presFile.AbsolutePath, presHost )
		            If Not IsNull( oExtPres ) Then
		              
		              If oExtPres.CanControl() Then
		                Dim img As StyleImage
		                Dim i As Integer
		                
		                Dim presSlides As XmlNode = SmartML.InsertChild( slide_group, "slides", 0 )
		                For i = 1 to oExtPres.SlideCount()
		                  
		                  If Not oExtPres.IsHidden(i) Then
		                    Dim presSlide As XmlNode = SmartML.InsertChild( presSlides, "slide", presSlides.ChildCount() )
		                    SmartML.SetValueN( presSlide, "@id", i )
		                    SmartML.SetValue( presSlide, "description", oExtPres.SlideName(i) )
		                    
		                    If (PresentMode <> PresentWindow.MODE_SINGLE_SCREEN) And oExtPres.CanPreview() Then
		                      img = New StyleImage()
		                      img.SetImage( oExtPres.PreviewSlide( i, 320, 240 ) )
		                      SmartML.SetValue(presSlide, "preview", img.GetImageAsString())
		                    End If
		                  End If
		                  
		                Next
		              End If
		              
		            Else
		              InputBox.Message App.T.Translate("errors/presentations/load_failed", presFile.AbsolutePath)
		            End If
		            
		          Else
		            InputBox.Message App.T.Translate("errors/fileutils/filenotfound", presFile.AbsolutePath)
		          End If
		        End If
		        
		        If Not presFileOk Then
		          InputBox.Message App.T.Translate("errors/fileutils/destdoesnotexisterror", presFileName)
		        End If
		        
		      Case "videolan"
		        Dim videolanLocation As FolderItem = App.MainPreferences.GetValueFI(Prefs.kVideolanLocation, Nil, False)
		        If Not IsNull(videolanLocation) And videolanLocation.Exists Then
		          Dim mediaFileName As String
		          Dim mediaFile As FolderItem
		          
		          Dim embedFiledata As String = SmartML.GetValue(slide_group, "file", False)
		          If embedFiledata.Len() > 0 Then
		            Try
		              mediaFile = embeddedFilesBase.Child(mediaFileName)
		              
		              Dim outputStream As BinaryStream = BinaryStream.Create(mediaFile, True)
		              outputStream.Write DecodeBase64(embedFiledata)
		              outputStream.Close
		              
		              mediaFileName = mediaFile.AbsolutePath()
		              SmartML.SetValue slide_group, "@_localfilename", mediaFileName
		            Catch
		              InputBox.Message App.T.Translate("errors/fileutils/temporaryfailed", mediaFileName)
		              mediaFile = Nil
		            End Try
		          End If
		          
		          If mediaFile = Nil Then
		            mediaFileName = Trim(SmartML.GetValue(slide_group, "@filename"))
		            If mediaFileName <> "" Then
		              mediaFile = GetFolderItem( mediaFileName )
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
		        'No action required here
		        'As early warning, we will check if the application that is to be started does exist
		        
		        Dim appFileName As String = SmartML.GetValue(slide_group, "@app_filename")
		        Dim appFile As FolderItem = GetFolderItem( appFileName )
		        Dim appFileOk As Boolean = False
		        If Not IsNull( appFile ) Then
		          If appFile.Exists() Then
		            appFileOk = True
		          End If
		        End If
		        
		        If Not appFileOk Then
		          InputBox.Message App.T.Translate("errors/fileutils/destdoesnotexisterror", appFileName)
		        End If
		        
		      End Select
		    End If
		    
		    slide_group  = slide_group.NextSibling
		    ProgressWindow.SetProgress( slidesCount )
		  Wend
		  
		  ProgressWindow.Close()
		  App.MouseCursor = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ImportSongs(setDoc As XmlDocument, AddToLog As Boolean)
		  Dim slide_group, slide_groups As XmlNode
		  Dim songDoc As XmlDocument
		  Dim Presentation As String
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
		  
		  ProgressWindow.lbl_status.Text = App.T.Translate("progress_status/load_songs") + "..."
		  ProgressWindow.SetMaximum( slide_groups.ChildCount() )
		  ProgressWindow.SetProgress(ItemNumber)
		  ProgressWindow.CanCancel False
		  ProgressWindow.SetStatus( "" )
		  ProgressWindow.Show()
		  
		  ItemNumber = 1
		  setListIndex = 0
		  i = 1
		  While slide_group <> Nil
		    setListIndex = setListIndex + 1  // The index of the listbox in the set editor. We start at 1 rather than 0 because SmartML.GetValueN cannot distinguish between "" and "0"
		    SmartML.SetValueN(slide_group, "@set_list_index", setListIndex)
		    If SmartML.GetValue(slide_group, "@type", True) = "song" Then
		      ProgressWindow.SetStatus(SmartML.GetValue(slide_group, "@name", False))
		      
		      Presentation = SmartML.GetValue(slide_group, "@presentation", False)
		      Transition = SmartML.GetValueN(slide_group, "@transition", False)
		      
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
		        
		        SongML.ToSetML(slide_group)
		        
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
		    
		    ProgressWindow.SetProgress(ItemNumber + StyleGroupCount)
		  Wend
		  setDoc.DocumentElement.SetAttribute("NumberOfItems",Str(ItemNumber - 1))
		  ProgressWindow.Close()
		  
		  App.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InsertBlankIntoSet(slide_group As XmlNode, before As Boolean = True) As XmlNode
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

	#tag Method, Flags = &h1
		Protected Function InsertSlideGroupIntoSet(SlideGroupToAdd As XmlNode, AfterPosition As Integer, PositionIsCurrent As Boolean = False, AfterXSlide As XmlNode = Nil) As Integer
		  // Inserts SlideGroupToAdd into the currently presenting deck after the position given by AfterPosition
		  // - Adds blank slides before and/or after the new group as needed.
		  // - if PositionIsCurrent, and that slide is a blank with a style different from the blank needed before the new slides,
		  //   an addidional blank slide with the style required before the new slides given by SlideGroupToAdd is inserted.
		  //   You only need to set this to True if you plan on staying there, after the slides have been inserted, and do not wish
		  //   to have the currently presenting slide change
		  // - AfterXSlide is ment to be an optimization. If you have the slide corresponding to AfterPosition as an XmlNode, provide
		  //   it here. If this is Nil, that slide is computed
		  // - Returns the slide number of the first slide of SlideGroupToAdd. Use it to position the presentation afterwards (subtract 1 for the blank before).
		  // - inserting a style change slide is not implemented; inserting a blank slide does not add any more blank slides around it
		  
		  Dim xSlide, slideGroup, neighborGroup, styleNode as XmlNode
		  Dim blankUsesNext As Boolean
		  Dim slideNo, positionOfFirstSlide As Integer
		  Dim slideType As String
		  Dim styleIndex, setStyleIndex, defaultStyleIndex As String
		  
		  If SmartMl.GetNode(SlideGroupToAdd, "slides/slide", False) = Nil Then Return 0
		  
		  If AfterXSlide = Nil Then
		    AfterXSlide = SetML.GetSlide(CurrentSet, AfterPosition)
		    If AfterXSlide = Nil Then Return 0
		  End If
		  slideGroup = AfterXSlide.Parent
		  If slideGroup <> Nil Then slideGroup = slideGroup.Parent  // this actually handles the slides node
		  If slideGroup = Nil Then Return 0
		  neighborGroup = slideGroup
		  Do
		    neighborGroup = neighborGroup.NextSibling
		    If neighborGroup = Nil Then Exit
		    If SmartMl.GetValue(neighborGroup, "@type") <> "style" Then
		      If SmartML.GetValue(slideGroup, "@name") <> SmartML.GetValue(neighborGroup, "@name") Then
		        Exit
		      End If
		      slideGroup = neighborGroup
		    End If
		  Loop
		  setStyleIndex = SmartML.GetValue(slideGroup, "style/@setIndex", False)
		  defaultStyleIndex = "default_style"
		  If setStyleIndex = "" Then setStyleIndex = defaultStyleIndex
		  styleIndex = setStyleIndex
		  
		  slideGroup = SmartML.InsertAfter(slideGroup, "slide_group")
		  slideGroup = SmartML.ReplaceWithImportNode(slideGroup, SlideGroupToAdd)
		  NumberOfItems = NumberOfItems + 1
		  SmartML.SetValueN(slideGroup, "@ItemNumber", NumberOfItems)
		  SmartML.SetValueB(slideGroup, "@LiveInsertion", True)
		  slideType = SmartMl.GetValue(slideGroup, "@type", False)
		  styleNode = SmartML.GetNode(slideGroup, "style", False)
		  If styleNode <> Nil Then
		    If slideType <> "song" Or _
		      SetML.SongStylePreferred(slideGroup) Or styleIndex = defaultStyleIndex Then
		      styleIndex = AddNodeToStyleDict(StyleNode)
		    Else
		      styleNode.Parent.RemoveChild(styleNode)
		    End If
		  End If
		  If slideType = "scripture" and styleIndex = defaultStyleIndex Then
		    styleIndex = "scripture_style"
		  End If
		  SmartML.SetValue(slideGroup, "style/@setIndex", setStyleIndex)
		  SmartML.SetValue(slideGroup, "style/@index", styleIndex)
		  
		  // find first inserted slide
		  xSlide = AfterXSlide
		  slideNo = AfterPosition
		  While SmartML.GetValueN(xSlide.Parent.Parent, "@ItemNumber", False) <> NumberOfItems
		    slideNo = slideNo + 1
		    xSlide = SetML.GetNextSlide(xSlide)
		  Wend
		  positionOfFirstSlide = slideNo
		  If HelperActive Then
		    While xSlide <> Nil
		      PresentHelperWindow.InsertItem(xSlide, slideNo - 1)
		      xSlide = xSlide.NextSibling
		      slideNo = slideNo + 1
		    Wend
		  End If
		  
		  // now check blank slides before and after
		  If slideType = "blank" Then Return positionOfFirstSlide  // this breaks the "subtract 1 for the blank before"-rule, but we're not adding yet another blank
		  IF Not SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blanks", False, True) Then Return positionOfFirstSlide
		  
		  blankUsesNext = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blank_uses_next", False, True)
		  
		  neighborGroup = SlideGroup.PreviousSibling
		  If SmartML.GetValue(neighborGroup, "@type", False) <> "blank" Or _
		    (PositionIsCurrent And blankUsesNext And _
		    SmartML.GetValue(neighborGroup, "style/@index", False) <> SmartML.GetValue(SlideGroup, "style/@index", False)) Then
		    neighborGroup = InsertBlankIntoSet(SlideGroup, True)
		    If HelperActive Then
		      xSlide = SmartML.GetNode(neighborGroup, "slides/slide")
		      PresentHelperWindow.InsertItem(xSlide, positionOfFirstSlide - 1)
		      slideNo = slideNo + 1
		    End If
		  End If
		  
		  neighborGroup = SlideGroup.NextSibling
		  If SmartML.GetValue(neighborGroup, "@type", False) <> "blank" Then
		    neighborGroup = InsertBlankIntoSet(slideGroup, False)
		    If HelperActive Then
		      xSlide = SmartML.GetNode(neighborGroup, "slides/slide")
		      PresentHelperWindow.InsertItem(xSlide, SlideNo - 1)
		    End If
		  Else
		    If Not blankUsesNext Then
		      // make sure it takes the style of the inserted one
		      SmartML.SetValue(neighborGroup, "style/@index",  styleIndex)
		    End If
		  End If
		  
		  Return positionOfFirstSlide
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertSongIntoSet(fSong As Folderitem, atSlide As Integer, presentation As String, CheckLinked As Boolean, showErrorPopup As Boolean) As Boolean
		  Dim success As Boolean = False
		  Dim position As Integer
		  Dim positionIsCurrent As Boolean
		  Dim positioning As Integer = 0  // preparation to add this as a parameter/config setting; 0=stay,1=first section of song,2=blank before song
		  Dim newCurrentSlide As Integer = 0
		  Dim InsertLinkedSongs As Boolean
		  Dim fSongs() As FolderItem
		  Dim j As Integer
		  Dim xSlide As XmlNode
		  
		  If atSlide < 0 Then
		    atSlide = Me.CurrentSlide
		  End If
		  position = atSlide
		  positionIsCurrent = (atSlide = CurrentSlide)
		  
		  If positioning = 2 Then
		    If Not SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blanks", False) Then
		      positioning = 0
		    End If
		  End If
		  
		  fSongs.Append(fSong)
		  j = 0
		  While j <= fSongs.Ubound
		    fSong = fSongs(j)
		    Dim s As XmlDocument = SmartML.XDocFromFile(fSong)
		    If s = Nil Then
		      If showErrorPopup Then
		        SmartML.DisplayError
		      End If
		      j = j + 1
		      Continue
		    End If
		    
		    NumberOfItems = NumberOfItems + 1
		    
		    // get song info for logging
		    // Don't log in preview mode
		    If App.MainPreferences.GetValueB(App.kActivityLog, True) And _
		      Globals.SongActivityLog <> Nil And _
		      PresentationMode <> MODE_PREVIEW And _
		      Globals.AddToLog Then
		      ActLog.Append(New LogEntry(Globals.SongActivityLog))
		      Dim d As New Date
		      
		      Dim i As Integer = UBound(ActLog)
		      ActLog(i).Title = SmartML.GetValue(s.DocumentElement, "title", True)
		      ActLog(i).Author = SmartML.GetValue(s.DocumentElement, "author", True)
		      ActLog(i).CCLISongNumber = SmartML.GetValue(s.DocumentElement, "ccli", True)  //The song's CCLI number
		      ActLog(i).SongFileName = MainWindow.Songs.DBPathFromFolderItem(fSong) 'Should we use AbsolutePath?
		      ActLog(i).DateAndTime = d
		      ActLog(i).HasChords = ActLog(i).CheckLyricsForChords(SmartML.GetValue(s.DocumentElement, "lyrics", True))
		      ActLog(i).Presented = True
		      ActLog(i).SetItemNumber = NumberOfItems  'Assign an index to this song
		      ActLog(i).Displayed = False 'Set this to true if user displays this song
		    End If
		    
		    If CheckLinked Then
		      If MainWindow.HasLinkedSongs(s.DocumentElement) Then
		        InsertLinkedSongs = True
		        If showErrorPopup And SmartML.GetValueB(App.MyMainSettings.DocumentElement, "linked_songs/@prompt", True) Then
		          App.MouseCursor = Nil
		          
		          InsertLinkedSongs = InputBox.AskYN(App.T.Translate("questions/linked_songs/@caption"))
		          
		          App.MouseCursor = System.Cursors.Wait
		        End If
		        
		        If InsertLinkedSongs Then
		          fSongs = MainWindow.AddLinkedSongsFolderItem(fSong, s.DocumentElement, False)
		          j = -1
		        End If
		      End If
		      
		      CheckLinked = False
		    End If
		    
		    If presentation <> "" Then 'Override the song's default presentation
		      SmartML.SetValue(s.DocumentElement, "presentation", presentation)
		      presentation = ""  // makes probably no sense for linked songs, so prevent setting it there
		    End If
		    
		    SongML.ToSetML s.DocumentElement
		    If SmartML.GetNode(s.DocumentElement, "slides").ChildCount < 1 Then
		      App.MouseCursor = Nil
		      If showErrorPopup Then
		        InputBox.Message App.T.Translate("errors/empty_group", SmartML.GetValue(s.DocumentElement, "@name", True))
		      End If
		      j = j + 1
		      Continue
		    End If
		    
		    position = InsertSlideGroupIntoSet(s.DocumentElement, position, positionIsCurrent)
		    If newCurrentSlide = 0 Then
		      Select Case positioning
		      Case 1
		        newCurrentSlide = position
		      Case 2
		        newCurrentSlide = position - 1
		      Else
		        newCurrentSlide = CurrentSlide
		      End Select
		      success = True
		    End If
		    
		    'setup loop initial state for next (linked) song
		    j = j + 1
		    presentation = ""
		  Wend
		  
		  If success Then
		    UpdateStatusNotifiers "insert_song"
		  End If
		  If success And positioning = 0 And atSlide < CurrentSlide Then
		    // we need to adjust for what we inserted
		    // SvA TODO: this might not give  the right answer if atSlide is a blank
		    position = position + CurrentSlide - atSlide
		    xSlide = SetMl.GetSlide(CurrentSet, atSlide)
		    Do
		      xSlide = xSlide.NextSibling
		      If xSlide = Nil Then Exit
		      position = position - 1
		    Loop
		    xSlide = SetMl.GetSlide(CurrentSet, newCurrentSlide)
		    Do
		      xSlide = xSlide.NextSibling
		      If xSlide = Nil Then Exit
		      position = position + 1
		    Loop
		    CurrentSlide = position
		  ElseIf newCurrentSlide <> 0 Then
		    CurrentSlide = newCurrentSlide
		  End If
		  XCurrentSlide = SetML.GetSlide(CurrentSet, CurrentSlide)
		  Return success
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsClosingExternal() As Boolean
		  Return self._IsClosingExternal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSlidechangeExternal() As Boolean
		  Return self._IsSlidechangeExternal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsUpdatingSlide() As Boolean
		  Return m_updatingSlide Or _
		  (timerTransition.Enabled And timerTransition.Mode <> Timer.ModeOff)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeyDownX(Key As String) As Boolean
		  '
		  ' This routine was originally where all the code to decode a keystroke was kept
		  '
		  ' What I'd like to do is use this to decode keypresses and then pass a function code on
		  ' to PerformAction.  That way, it starts separating the function to be performed from
		  ' the keystrokes used, allowing us to (a) call PerformAction from elsewhere with
		  ' a command code, and (b) support keyboard remapping through this routine.È
		  
		  ' TODO: Put the commands into the Language file and load it from there
		  ' TODO: Find all the places KeyDownX is called and redirect the call to PerformAction with the proper command
		  ' TODO: (this implies that the PerformAction actioncode constants are defined Public
		  '
		  ' EMP, 1/19/05 ff
		  '
		  ' Temporarily just do the regular function until the code is fleshed out
		  '
		  Const ASC_KEY_SPACE = 32
		  Const ASC_KEY_LEFT = 28
		  Const ASC_KEY_RIGHT = 29
		  Const ASC_KEY_UP = 30
		  Const ASC_KEY_DOWN = 31
		  Const ASC_KEY_PGDN=12
		  Const ASC_KEY_PGUP =11
		  Const ASC_KEY_HOME=1
		  Const ASC_KEY_END=4
		  
		  Dim Command As Integer
		  
		  If Asc(Key) = ASC_KEY_PGDN Then Key = Chr(ASC_KEY_DOWN)
		  If Asc(Key) = ASC_KEY_PGUP Then Key = Chr(ASC_KEY_UP)
		  
		  Command = AscB(Lowercase(Key))
		  
		  Select Case Command
		  Case ASC_KEY_SPACE
		    Command = ACTION_NEXT_SLIDE
		  End Select
		  
		  Call PerformAction(Command) ' sets LastCommandHandled as a side effect
		  Return LastCommandHandled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LiveDisplay(slide As XmlNode)
		  //++
		  // Part of ScriptureReceiver interface
		  // Called to display a verse slide without adding it
		  // to the active set
		  //--
		  Mode = "N"
		  ResetPaint(slide)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PerformAction(Action As Integer, param As Variant = Nil) As Boolean
		  'KeyDown needs to know, if the command das been handled, not necessarily if it has been successful
		  'assume the command is valid until prooven otherwise
		  LastCommandHandled = True
		  
		  'Constants added for clarity EMP 9/30/04
		  Const ASC_KEY_LEFT = 28
		  Const ASC_KEY_RIGHT = 29
		  Const ASC_KEY_UP = 30
		  Const ASC_KEY_DOWN = 31
		  Const ASC_KEY_PGDN=12
		  Const ASC_KEY_PGUP =11
		  Const ASC_KEY_HOME=1
		  Const ASC_KEY_END=4
		  Const ASC_KEY_BACKSPACE = 8
		  Const KEY_PGDN=&h79
		  Const KEY_PGUP=&h74
		  Const KEY_RIGHT=&h7c
		  Const KEY_LEFT=&h7b
		  Const KEY_UP=&h7e
		  Const KEY_DOWN=&h7d
		  Const KEY_ESCAPE = 27
		  
		  '
		  'Temporary hack until the command arguments are fixed
		  '
		  Dim Key As String
		  Key = ChrB(Action)
		  
		  '
		  '  NEXT SLIDE
		  '
		  If Keyboard.AsyncKeyDown(KEY_DOWN) Or _
		    Action = ASC_KEY_DOWN Or _
		    Action = ACTION_NEXT_SLIDE Then
		    Return GoNextSlide
		    '
		    ' PREVIOUS SLIDE
		    '
		  ElseIf Keyboard.AsyncKeyDown(KEY_UP)  Or _
		    Action = ASC_KEY_UP Or _
		    Action = ACTION_PREV_SLIDE Then
		    Return GoPreviousSlide
		    '
		    ' FIRST SLIDE in presentation
		    '
		  ElseIf Action = ASC_KEY_HOME Or _
		    Action = ACTION_FIRST_SLIDE Then
		    Return GoFirstSlide
		    '
		    ' LAST SLIDE in presentation
		    '
		  ElseIf Action = ASC_KEY_END Or _
		    Action = ACTION_LAST_SLIDE Then
		    Return GoLastSlide
		    '
		    ' NEXT SECTION
		    '
		  ElseIf Keyboard.AsyncKeyDown(KEY_RIGHT) Or _
		    Action = ASC_KEY_RIGHT Or _
		    Action = ACTION_NEXT_SECTION Then
		    Return GoNextSection
		    '
		    ' PREVIOUS SECTION
		    '
		  ElseIf Keyboard.AsyncKeyDown(KEY_LEFT) Or _
		    Action = ASC_KEY_LEFT Or _
		    Action = ASC_KEY_BACKSPACE Or _
		    Action = ACTION_FIRST_SLIDE_OF_SECTION Or _
		    Action = ACTION_PREV_SECTION Then 'special code 126 comes from inside the program instead of keyboard
		    Return GoPreviousSection(Action)
		    '
		    ' Jump to Chorus
		    '
		  ElseIf Lowercase(Key) = "c" Or Key = "`" Or _
		    Action = ACTION_CHORUS Then ' c = Chorus
		    Return GoChorus
		    '
		    ' Jump to  Bridge
		    '
		  ElseIf Lowercase(Key) = "b" Or _
		    Action = ACTION_BRIDGE Then ' b = Bridge
		    Return GoBridge
		    '
		    ' Jump to PreChorus
		    '
		  ElseIf Lowercase(Key) = "p" Or _
		    Action = ACTION_PRECHORUS Then ' p = Pre-chorus
		    Return GoPreChorus
		    '
		    ' Jump to slide
		    '
		  ElseIf (Lowercase(Key) = "i" Or _
		    Action = ACTION_SLIDE) And _
		    Not IsNull(param) And param.IsNumeric Then ' i = Slide
		    Return Not IsNull(GoSlide(param.IntegerValue))
		    '
		    ' Jump to tag
		    '
		  ElseIf Lowercase(Key) = "t" Or _
		    Action = ACTION_TAG Then ' t = Tag
		    Return GoTag
		    '
		    ' Jump to Verse "N"
		    '
		  ElseIf lowercase(key) = "v" or isNumeric(key) Then ' v = Verse
		    Return GoVerse(key)
		  ElseIf Action = ACTION_VERSE And _
		    Not IsNull(param) And param.IsNumeric Then
		    Return GoVerse(param.StringValue)
		    '
		    ' Jump to Song "N"
		    '
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F1) Then
		    Return GoSong(1)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F2) Then
		    Return GoSong(2)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F3) Then
		    Return GoSong(3)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F4) Then
		    Return GoSong(4)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F5) Then
		    Return GoSong(5)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F6) Then
		    Return GoSong(6)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F7) Then
		    Return GoSong(7)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F8) Then
		    Return GoSong(8)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F9) Then
		    Return GoSong(9)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F10) Then
		    Return GoSong(10)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F11) Then
		    Return GoSong(11)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F12) Then
		    Return GoSong(12)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F13) Then ' AKA PrintScreen
		    Return GoSong(13)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F14) Then ' AKA ScreenLock
		    Return GoSong(14)
		  ElseIf KeyBoard.AsyncKeyDown(KEY_F15) Then ' AKA Pause
		    Return GoSong(15)
		  ElseIf Action = ACTION_SONG And _
		    Not IsNull(param) And param.IsNumeric Then
		    Return GoSong(param.IntegerValue)
		    
		    '
		    ' Close Presentation
		    '
		  ElseIf  Action = KEY_ESCAPE Then ' Escape
		    Return DoClosePresentation
		  ElseIf Action = ACTION_EXIT_NOPROMPT Then
		    Return DoClosePresentation(False)
		    
		    '
		    ' Black screen (can't be "B" since that's the hotkey for "Bridge" :-(
		    '
		  ElseIf Lowercase(Key) = "k"Or _
		    Action = ACTION_BLACK Then
		    Return ToggleBlack
		    '
		    ' White Screen
		    '
		  ElseIf Lowercase(Key) = "w"Or _
		    Action = ACTION_WHITE Then
		    Return ToggleWhite
		    '
		    ' Hide Slide (leaves background up)
		    '
		  ElseIf Lowercase(Key) = "h"Or _
		    Action = ACTION_HIDE Then
		    Return ToggleHidden
		    '
		    ' Put up the LOGO
		    '
		  ElseIf Lowercase(Key) = "l"Or _
		    Action = ACTION_LOGO Then
		    Return ToggleLogo
		    '
		    ' Freeze display screen
		    '
		  ElseIf Lowercase(Key) = "f" Or _
		    Action = ACTION_FREEZE Then
		    Return ToggleFreeze
		    '
		    '  Normal Screen (less important now that the modes are toggles)
		    '  It's a trump -- disables any other mode
		    '
		  ElseIf Lowercase(Key) = "n" Or _
		    Action = ACTION_NORMAL Then
		    Return ShowNormal
		    '
		    ' Put up an ALERT
		    '
		  ElseIf Lowercase(Key) = "a" Or _
		    Action = ACTION_ALERT Then
		    Return ShowAlert(param)
		    
		    '
		    ' SCRIPTURE
		    '
		  ElseIf Lowercase(Key) = "s" Then
		    Return DoPickScripture
		    '
		    ' Add SONG
		    '
		  ElseIf Lowercase(Key) = "q" Then
		    Return DoPickSong
		    
		  ElseIf Lowercase(Key) = "m" Then
		    Return DoSwapFullScreen
		  Else
		    LastCommandHandled = False
		    Return False
		  End If
		  
		  //++EMP 15 Jan 2006
		  // Add a generic exception handler in an attempt to keep from bailing out
		  // TODO: This needs to log somewhere and notify the operator after the presentation is done.
		  //
		Exception ex
		  // Do something here later.  For now, validate that XCurrentSlide isn't Nil and
		  // return to the caller.
		  //
		  If XCurrentSlide = Nil Then
		    // Sorry, the only possible valid action is to go back to the first slide, otherwise
		    // how do you keep XCurrentSlide and CurrentSlide in sync?
		    // (perhaps look at xNewSlide to get close to the original location?)
		    CurrentSlide = 1
		    XCurrentSlide = SetML.GetSlide(CurrentSet, 1)
		  End If
		  // Put up wherever we're at now (and pray!)
		  If HelperActive Then
		    PresentHelperWindow.SetMode Mode
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  
		  'Unless a condition threw an error, the command was valid; it just failed to execute
		  LastCommandHandled = True
		  Return False // Show that it failed
		  //--EMP 15 Jan 06
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Present(setDoc As XmlDocument, PresentMode As Integer, Item As Integer = 0)
		  Dim i As Integer
		  Dim slide As XmlNode
		  Dim de As XmlNode // Holds PresentationSettings Document Element
		  Dim tmpPic As Picture
		  Dim availableWidth As Integer 'For screensize calculations adapted to Linux Xinerama in preview dual screen
		  Dim presentScreenAspect As Single
		  Dim LogActivity As Boolean
		  
		  App.MouseCursor = System.Cursors.Wait
		  PositionSaved = False
		  
		  // Copy the set to a working copy we can change
		  CurrentSet = New XmlDocument
		  CurrentSet.AppendChild CurrentSet.ImportNode(setDoc.FirstChild, CopyAllChildren)
		  
		  'System.DebugLog "Setup monitors"
		  de = App.MyPresentSettings.DocumentElement
		  presentScreen = SmartML.GetValueN(de, "monitors/@present") - 1
		  controlScreen = SmartML.GetValueN(de, "monitors/@control") - 1
		  If presentScreen < 0 Or presentScreen > OSScreenCount() - 1 Then presentScreen = 0
		  If controlScreen < 0 Or controlScreen > OSScreenCount() -1 Then controlScreen = 0
		  
		  cnvSlide.Visible = False 'Prevent the canvas to redraw itself for all size changes below
		  'System.DebugLog "Determine correct PresentMode"
		  
		  PositionChanging = True
		  
		  Select Case PresentMode
		  Case MODE_SINGLE_SCREEN, MODE_PREVIEW
		    ' PresentMode is known
		  Case MODE_DUAL_SCREEN
		    If PresentScreen = ControlScreen Then
		      PresentMode = MODE_SINGLE_SCREEN
		    End If
		  Else
		    If PresentScreen <> ControlScreen Then
		      PresentMode = MODE_DUAL_SCREEN
		    Else
		      PresentMode = MODE_PREVIEW
		    End If
		  End Select
		  
		  'Don't log in preview mode
		  If PresentMode <> PresentWindow.MODE_PREVIEW And App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil  Then
		    If App.MainPreferences.GetValueB(App.kPromptBeforePresenting, True) Then
		      LogActivity = InputBox.AskYN(App.T.Translate("questions/activity_log/@caption"))
		    Else
		      LogActivity = True
		    End If
		  Else
		    LogActivity =  False
		  End If
		  Globals.AddToLog = LogActivity
		  
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("1_Set.xml"))
		  #endif
		  ImportSongs CurrentSet, LogActivity
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("2_SongsImported.xml"))
		  #endif
		  ImportExternals CurrentSet, PresentMode
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("3_ExternalsImported.xml"))
		  #endif
		  ProcessStyles(CurrentSet)
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("4_StylesPrepared.xml"))
		  #endif
		  AddSongSubtitles(CurrentSet)
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("5_SubtitlesAdded.xml"))
		  #endif
		  InsertBlanksIntoSet(CurrentSet)
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("6_BlanksAdded.xml"))
		  #endif
		  VerifySlideBodies(CurrentSet)
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("7_BodiesVerified.xml"))
		  #endif
		  
		  If SetML.GetSlide(CurrentSet, 1) = Nil Then
		    Close
		    InputBox.Message App.T.Translate("sets_mode/current_set/present/no_slides")
		    Return
		  End If
		  
		  PresentationMode = PresentMode
		  If PresentMode = MODE_SINGLE_SCREEN Then ' Single Screen
		    presentScreen = controlScreen
		    HelperActive = False
		    MenuBarVisible = False
		    Top = OSScreen(presentScreen).Top
		    Left = OSScreen(presentScreen).Left
		    Width = OSScreen(presentScreen).Width
		    Height = OSScreen(presentScreen).Height
		    FullScreen = True
		    
		  ElseIf PresentMode = MODE_PREVIEW Then ' Split Screen
		    HelperActive = True
		    MenuBarVisible = True
		    presentScreenAspect = OSScreen(presentScreen).Width / OSScreen(presentScreen).Height
		    
		    If SmartML.GetValueB(de, "monitors/@force_4_3_preview", False, False) Then
		      If presentScreenAspect >= 1 Then
		        presentScreenAspect = 4/3
		      Else
		        presentScreenAspect = 3/4
		      End If
		    End If
		    
		    If SmartML.GetValueB(de, "monitors/@force_16_9_preview", False, False) Then
		      If presentScreenAspect >= 1 Then
		        presentScreenAspect = 16/9
		      Else
		        presentScreenAspect = 9/16
		      End If
		    End If
		    
		    presentScreen = controlScreen
		    Top = OSScreen(presentScreen).AvailableTop + 10
		    Left = OSScreen(presentScreen).AvailableLeft + 10
		    availableWidth = OSScreen(presentScreen).AvailableWidth
		    
		    Width = availableWidth - PresentHelperWindow.Width - 30
		    Height = Width / presentScreenAspect
		    If Height > OSScreen(ControlScreen).AvailableHeight Then
		      Height = OSScreen(ControlScreen).AvailableHeight
		      Width = Height * presentScreenAspect
		    End If
		    
		    PresentHelperWindow.Left = OSScreen(presentScreen).AvailableLeft + availableWidth - PresentHelperWindow.Width - 10
		    PresentHelperWindow.Top = OSScreen(presentScreen).AvailableTop + OSScreen(presentScreen).Height - PresentHelperWindow.Height - 40
		    
		    If Not SmartML.GetValueB(de, "snapshot/@export_preview", False, False) Then
		      m_Snapshots = False
		    End If
		    
		    Mode = "N"  // Start preview in normal mode
		    
		  ElseIf PresentMode = MODE_DUAL_SCREEN Then ' Multiple Screens
		    HelperActive = True
		    Top = OSScreen(presentScreen).Top
		    Left = OSScreen(presentScreen).Left
		    Width = OSScreen(presentScreen).Width
		    Height = OSScreen(presentScreen).Height
		    FullScreen = True
		    MenuBarVisible = (presentScreen > 0) // Only show the menu bar if we're presenting on a secondary screen
		    PresentHelperWindow.Left = OSScreen(controlScreen).Left + (OSScreen(controlScreen).Width - PresentHelperWindow.Width) / 2
		    PresentHelperWindow.Top = OSScreen(controlScreen).Top + (OSScreen(controlScreen).Height - PresentHelperWindow.Height) / 2
		    presentScreenAspect = Width / Height
		  End If
		  cnvSlide.Visible = True
		  
		  #if RBVersion >= 2012.1
		    Position = Self.Bounds.Clone
		  #else
		    Position = New REALbasic.Rect(Left,Top,Width,Height)
		  #endif
		  PositionScreen = PresentScreen
		  PositionChanging = False
		  PositionChanged = False
		  PositionSaved = True
		  timerWindowLocation.Mode = Timer.ModeMultiple
		  timerWindowLocation.Enabled = True
		  
		  m_ExternalRenderer.Prepare(CurrentSet, Width, Height)
		  
		  NumberOfItems = Val(CurrentSet.DocumentElement.GetAttribute("NumberOfItems"))
		  
		  //++
		  // EMP, September 2006
		  // Move the allocation of pictures before doing anything with
		  // the Helper window.  Depending on how events fired,
		  // Helper could get a Repaint event before everything was
		  // initialized.
		  //--
		  'System.DebugLog "Allocate Picture space"
		  If HelperActive And Width < 320 Then
		    CurrentPicture = New Picture(320, 320 / presentScreenAspect, 32)
		    LastPicture = New Picture(320, 320 / presentScreenAspect, 32)
		    PreviewPicture = New Picture(320, 320 / presentScreenAspect, 32)
		  Else
		    CurrentPicture = New Picture(Width, Height, 32)
		    LastPicture = New Picture(Width, Height, 32)
		    PreviewPicture = New Picture(Width, Height, 32)
		  End If
		  CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		  CurrentPicture.Graphics.FillRect(0, 0, CurrentPicture.Width, CurrentPicture.Height)
		  LastPicture.Graphics.DrawPicture CurrentPicture, 0, 0
		  PreviewPicture.Graphics.DrawPicture CurrentPicture, 0, 0
		  
		  'System.DebugLog "Get Logo Picture"
		  tmpPic = SmartML.GetValueP(de, "logo")
		  
		  If tmpPic <> Nil Then
		    LogoCache = New Picture(tmpPic.Width, tmpPic.Height, 32)
		    LogoCache.Graphics.DrawPicture tmpPic, 0, 0
		    LogoCache.Mask.Graphics.DrawPicture SmartML.GetValueP(de, "logo_mask"), 0, 0
		  End If
		  
		  UpdateStatusNotifiers "starting"
		  
		  If HelperActive Then
		    i = 1
		    
		    slide = SetML.GetSlide(CurrentSet, i)
		    'System.DebugLog "PresentWindow.Present: GetSlide 1 returned a " + SmartML.GetValue(slide.Parent.Parent, "@type") +_
		    '" with name '" + SmartML.GetValue(slide.Parent.Parent, "@name") + "'"
		    Dim StyleIndex, prevStyleIndex As String
		    Dim prevIsStyleChange As Boolean
		    styleIndex = SmartML.GetValue(slide.Parent.Parent, "style/@setIndex", False)
		    While slide <> Nil
		      
		      prevIsStyleChange = False
		      If slide.PreviousSibling Is Nil Then
		        prevStyleIndex = styleIndex
		        styleIndex = SmartML.GetValue(slide.Parent.Parent, "style/@setIndex", False)
		        prevIsStyleChange = (prevStyleIndex <> styleIndex)
		      End If
		      
		      PresentHelperWindow.InsertItem slide, i, prevIsStyleChange
		      i = i + 1
		      slide = SetML.GetNextSlide(slide)
		      'If slide <> Nil Then _
		      'System.DebugLog "PresentWindow.Present: GetNextSlide for i = " + cstr(i) + " returned a " + SmartML.GetValue(slide.Parent.Parent, "@type") +_
		      '" with name '" + SmartML.GetValue(slide.Parent.Parent, "@name") + "'"
		    Wend
		    'PresentHelperWindow.lst_all_slides.ListIndex = 0
		  End If
		  
		  Call GoFirstSlide(False)
		  Call GoSetItem(Item)
		  
		  Globals.Status_Presentation = True
		  
		  'Show
		  App.MouseCursor = Nil
		  #if Not TargetMacOS
		    App.MinimizeWindow(MainWindow)
		  #endif
		  
		  If HelperActive Then
		    PresentHelperWindow.Show
		    PresentHelperWindow.SetMode Me.Mode, False
		    App.RestoreWindow(PresentHelperWindow)
		    App.SetForeground(PresentHelperWindow)
		    PresentHelperWindow.lst_all_slides.SetFocus
		  Else
		    // Bring PresentWindow to front in Singe Screen Mode
		    App.SetForeground(PresentWindow)
		    
		    ResetPaint XCurrentSlide
		  End If
		  
		  Dim temp As String
		  temp = SmartML.GetValue(de, "style/@mouse_cursor")
		  Select Case temp
		  Case "arrow"
		    Self.MouseCursor = System.Cursors.StandardPointer
		  Case "cross"
		    Self.MouseCursor = System.Cursors.ArrowAllDirections
		  Case "hidden"
		    Self.MouseCursor = System.Cursors.InvisibleCursor
		  Case "hourglass"
		    Self.MouseCursor = System.Cursors.Wait
		  Case "ibeam"
		    Self.MouseCursor = System.Cursors.IBeam
		  Else
		    Self.MouseCursor = System.Cursors.InvisibleCursor
		  End Select
		  PresentCursor = Self.MouseCursor
		  AppCursor = App.MouseCursor
		  Self.Visible = True
		  
		  'SvA:Trace
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("PresentWPresent.xml"))
		  #endif
		  
		Catch e
		  RuntimeException(e).message = "In PresentWindow.Present: " + e.Message
		  Raise e
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessStyles(Set As XmlDocument)
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
		  Dim slideStyle As SlideStyle
		  
		  StyleDict = New Dictionary
		  
		  // first handle the default styles
		  presentationSettings = App.MyPresentSettings.DocumentElement
		  setIndex = AddNodeToStyleDict(SmartML.GetNode(presentationSettings, "default_style"), "default_style")
		  setIndex = AddNodeToStyleDict(SmartML.GetNode(presentationSettings, "scripture_style"), "scripture_style")
		  
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
		      groupIndex = AddNodeToStyleDict(styleNode)
		    End If
		    If slideType = "song" Then
		      styleNode = SmartML.GetNode(slide_group, "song_style", False)
		      If styleNode <> Nil Then
		        songStyleIndex = AddNodeToStyleDict(styleNode)
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
		      // because wo do not have the style of the next slide yet, in case we need it
		    Case "scripture"
		      SmartML.SetValue(slide_group, "style/@setIndex", setIndex)
		      If groupIndex = "default_style" Then
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
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetPaint(slide As XmlNode)
		  Dim slideStyle As SlideStyle
		  Dim w, h As Integer
		  Dim advanceNext As Boolean = False
		  Dim currAppl As String
		  Dim slideGroup As XmlNode
		  
		  If Not IsNull(slide) Then
		    slideGroup = slide.Parent.Parent
		    currAppl = SmartML.GetValue(slideGroup, "@application", False)
		  End If
		  
		  If SetML.IsExternal(PreviousSlide) Then
		    'Check if we need to close the running external.
		    Dim bClose As Boolean = False
		    Dim prevAppl As string = SmartML.GetValue(PreviousSlide, "@application", False)
		    Dim prevHost As string = SmartML.GetValue(PreviousSlide, "@host", False)
		    Dim prevFile As String = SmartML.GetValue(PreviousSlide, "@_localfilename", False)
		    If prevFile.Len() = 0 Then
		      prevFile = SmartML.GetValue(PreviousSlide, "@filename", False)
		    End If
		    
		    If Not SetML.IsExternal(slide) Then
		      bClose = True
		    Else
		      'See if the external in the new slide is equal to the current slide.
		      If Not IsNull(slide) Then
		        If currAppl <> prevAppl Or _
		          SmartML.GetValue(slideGroup, "@host", False) <> prevHost Or _
		          (SmartML.GetValue(slideGroup, "@_localfilename", False) <> prevFile And _
		          SmartML.GetValue(slideGroup, "@filename", False) <> prevFile) Then
		          bClose = True
		        End If
		      End If
		    End If
		    
		    If bClose Then
		      self._IsClosingExternal = True
		      
		      If prevAppl = "presentation" Or prevAppl = "videolan" Then
		        If currAppl <> "presentation" And currAppl <> "videolan" Or (currAppl = "videolan" And SmartML.GetValue(slideGroup, "@action", False) = "stop") Then
		          PresentWindow.Restore()
		          'PresentWindow.Show()
		          'If PresentWindow.HelperActive Then
		          'PresentHelperWindow.SetFocus
		          'End If
		        End If
		      End If
		      
		      Select Case prevAppl
		      Case "presentation"
		        Dim presFile As FolderItem = GetFolderItem( prevFile )
		        If Not IsNull(presFile) Then
		          If presFile.Exists() Then
		            
		            Dim presHost As PresentationHost = PresentationHost.Automatic
		            Select Case prevHost
		            Case "ppt"
		              If PresentationFactory.PowerPointAvailable() Then
		                presHost = PresentationHost.PowerPoint
		              End If
		              If PresentationFactory.OpenOfficeAvailable() Then
		                presHost = PresentationHost.OpenOffice
		              End If
		            Case "pptview"
		              If PresentationFactory.PPTViewAvailable() Then
		                presHost = PresentationHost.PowerPointViewer
		              End If
		            Case "impress"
		              If PresentationFactory.OpenOfficeAvailable() Then
		                presHost = PresentationHost.OpenOffice
		              End If
		            End Select
		            
		            Dim oExtPres As iPresentation = PresentationFactory.GetOrCreate( presFile.AbsolutePath(), presHost )
		            If Not IsNull( oExtPres ) Then
		              Call oExtPres.EndShow()
		            End If
		          End If
		        End If
		        
		      Case "videolan"
		        // Videolan is only stopped when explicitly set in the slide
		        // or if it is set up to wait on the item
		        If slide = Nil Or m_VideolanController.WaitForPlayback Then
		          m_VideolanController.Stop()
		        End If
		        
		      Case "launch"
		        If IsNull(slide) And m_AppLaunchShell.IsRunning Then
		          'Close any running external application instance.
		          m_AppLaunchShell.Close()
		        End If
		        
		      End Select
		      
		      self._IsClosingExternal = False
		    End If
		  End If
		  
		  If IsNull( slide ) Then
		    m_VideolanController.Stop()
		    If m_AppLaunchShell.IsRunning Then
		      m_AppLaunchShell.Close()
		    End If
		    
		    UpdateStatusNotifiers "clear"
		    Return
		  End If
		  
		  timerAdvance.Enabled = False
		  
		  If SetML.IsExternal(slide) Then
		    _IsSlidechangeExternal = True
		    
		    Select Case currAppl
		    Case "presentation"
		      
		      If mode = "N" then
		        'First check if there is a 'local' filename (a saved embedded presentation)
		        Dim presFilename As String = SmartML.GetValue(slideGroup, "@_localfilename", False)
		        If presFilename.Len() = 0 Then
		          presFilename = SmartML.GetValue(slideGroup, "@filename", False)
		        End If
		        Dim presFile As FolderItem = GetFolderItem( presFilename )
		        If Not IsNull(presFile) Then
		          If presFile.Exists() Then
		            
		            Dim presHost As PresentationHost = PresentationHost.Automatic
		            Select Case SmartML.GetValue(slideGroup, "@host", False)
		            Case "ppt"
		              If PresentationFactory.PowerPointAvailable() Then
		                presHost = PresentationHost.PowerPoint
		              ElseIf PresentationFactory.OpenOfficeAvailable() Then
		                presHost = PresentationHost.OpenOffice
		              ElseIf PresentationFactory.PPTViewAvailable() Then
		                presHost = PresentationHost.PowerPointViewer
		              End If
		            Case "pptview"
		              If PresentationFactory.PPTViewAvailable() Then
		                presHost = PresentationHost.PowerPointViewer
		              ElseIf PresentationFactory.PowerPointAvailable() Then
		                presHost = PresentationHost.PowerPoint
		              End If
		            Case "impress"
		              If PresentationFactory.OpenOfficeAvailable() Then
		                presHost = PresentationHost.OpenOffice
		              End If
		            End Select
		            
		            Dim oExtPres As iPresentation = PresentationFactory.GetOrCreate( presFile.AbsolutePath(), presHost )
		            If Not IsNull( oExtPres ) Then
		              
		              Dim presIndex As Integer = SmartML.GetValueN(slide, "@id", False)
		              If presIndex <> oExtPres.CurrentSlide() Then
		                If oExtPres.IsShowing() Then
		                  Call oExtPres.GotoSlide( presIndex )
		                Else
		                  Dim loopPresentation As Boolean = SmartML.GetValueB(slideGroup, "@loop_presentation", False)
		                  Call oExtPres.StartShow( loopPresentation )
		                  
		                  'Starting a presentation from a different slide (index) than the default (first), breaks the slide preview synchronisation
		                  'Thefore, the index is set directly after startin, in case it is different from the first slide
		                  'The slideindex of the first slide does not need to be 1 as a first slide can be hidden.
		                  'We thus cannot use the index, but must use the slide structure.
		                  If Not IsNull( slide.PreviousSibling ) Then
		                    Call oExtPres.GotoSlide( presIndex )
		                  End If
		                End If
		              End If
		              
		            End If
		          End If
		          
		          'PresentWindow.Hide()
		          App.MinimizeWindow(PresentWindow)
		        End If
		      Else
		        PresentWindow.Restore()
		      End If
		      
		      PreviewPicture.Graphics.ForeColor = RGB(0,0,0)
		      PreviewPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		      
		      slideStyle = SetML.GetSlideStyle(slide)
		      
		      Dim external_did_draw As Boolean = m_ExternalRenderer.Render(PreviewPicture.Graphics, slide, PresentWindow.CurrentSlide)
		      If Not external_did_draw Then
		        SetML.DrawSlide PreviewPicture.Graphics, slide, slideStyle
		      End If
		      CurrentPicture.Graphics.DrawPicture PreviewPicture, 0, 0
		      
		    Case "videolan"
		      If mode = "N" then
		        m_VideolanController.Stop()
		        
		        If SmartML.GetValue(slideGroup, "@action") = "start" Then
		          Dim params As String = SmartML.GetValue(slideGroup, "@videolan_parameters")
		          Dim waitForPlayback As Boolean = SmartML.GetValueB(slideGroup, "@wait_to_finish")
		          
		          'First check if there is a 'local' filename (a saved embedded media file)
		          Dim mediaFilename As String = SmartML.GetValue(slideGroup, "@_localfilename", False)
		          If mediaFilename.Len = 0 Then
		            mediaFilename = SmartML.GetValue(slideGroup, "@filename", False)
		          End If
		          
		          Dim fullScreen As Boolean = PresentationMode <> MODE_PREVIEW
		          If m_VideolanController.Start(mediaFilename, params, presentScreen, waitForPlayback, fullScreen) Then
		            CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		            CurrentPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		            
		            'PresentWindow.Hide()
		            App.MinimizeWindow(PresentWindow)
		            
		            advanceNext = Not waitForPlayback
		          End If
		        Else
		          'Case @action = stop is covered by generic application close above _
		          advanceNext = True
		        End If
		      End If
		    Case "launch"
		      If mode = "N" then
		        Dim launchAppLocation As FolderItem = GetFolderItem(SmartML.GetValue(slideGroup, "@app_filename", False))
		        Dim cmd As String
		        Dim params As String = SmartML.GetValue(slideGroup, "@app_parameters", False)
		        
		        If Not IsNull(launchAppLocation) Then
		          If launchAppLocation.Exists() Then
		            cmd = launchAppLocation.AbsolutePath()
		          End If
		        End If
		        
		        If m_AppLaunchShell.IsRunning Then
		          'Close any running external application instance.
		          m_AppLaunchShell.Close()
		        End If
		        
		        If SmartML.GetValue(slideGroup, "@action") = "start" Then
		          If SmartML.GetValueB(slideGroup, "@wait_to_finish", False) = True Then
		            m_AppLaunchShell.Mode = 0 'Synchronous
		          Else
		            m_AppLaunchShell.Mode = 1 'Asynchronous
		          End If
		          
		          CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		          CurrentPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		          
		          If cmd.Len() > 0 Then
		            m_AppLaunchShell.Execute( """" + cmd + """" + " " + params )
		          End If
		        Else
		          'Case @action = stop is covered by generic application close above
		        End If
		        
		        advanceNext = True
		      End If
		    End Select
		    
		    _IsSlidechangeExternal = False
		  Else
		    
		    If SmartML.GetValue(slideGroup, "@type", False) = "song" Then
		      '++JRC
		      SongSetDisplayed(slide)
		    End If
		    
		    'App.DebugWriter.Write("PresentWindow.ResetPaint: Enter", 5)
		    ' Remember the current (old) slide for the transition
		    LastPicture.Graphics.DrawPicture CurrentPicture, 0, 0
		    'LastPicture = LastPicture.CXG_Composite(CurrentPicture, 1.0, 0, 0)
		    
		    ' === Draw the slide to the PreviewPicture ===
		    m_updatingSlide = True
		    
		    Profiler.BeginProfilerEntry "PresentWindow::ResetPaint::PreviewPicture"
		    ' -- Old way -- (value not passed)
		    'xStyle = SetML.GetStyle(XCurrentSlide)
		    'SetML.DrawSlide PreviewPicture.Graphics, XCurrentSlide, xStyle
		    ' -- New way --
		    slideStyle = SetML.GetSlideStyle(slide)
		    
		    Dim external_did_draw as Boolean = m_ExternalRenderer.Render(PreviewPicture.Graphics, slide, PresentWindow.CurrentSlide)
		    if not external_did_draw then
		      SetML.DrawSlide PreviewPicture.Graphics, slide, slideStyle
		    end if
		    
		    curslideTransition = SetML.GetSlideTransition(slide)
		    
		    Profiler.EndProfilerEntry'
		    
		    ' === Setup CurrentPicture based on Mode ===
		    Profiler.BeginProfilerEntry "PresentWindow::ResetPaint::CurrentPicture"
		    If Mode = "B" Then
		      CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		      CurrentPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		    ElseIf Mode = "W" Then
		      CurrentPicture.Graphics.ForeColor = RGB(255,255,255)
		      CurrentPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		    ElseIf Mode = "H" Or Mode = "L" Then
		      SetML.DrawSlide CurrentPicture.Graphics, Nil, slideStyle
		      
		      If Mode = "L" Then
		        If LogoCache <> Nil Then
		          If LogoCache.Height > CurrentPicture.Height Then
		            ' Logos only shrink if needed; they will not stretch out
		            h = CurrentPicture.Height
		            w = (CurrentPicture.Height/LogoCache.Height) * LogoCache.Width
		          Else
		            h = LogoCache.Height
		            w = LogoCache.Width
		          End If
		          CurrentPicture.Graphics.DrawPicture LogoCache, (CurrentPicture.Width-w)/2, (CurrentPicture.Height-h)/2, w, h, 0, 0, LogoCache.Width, LogoCache.Height
		        End If
		      End If
		    ElseIf Mode = "F" Then
		      ' Freeze: no changes to CurrentPicture
		    Else ' Probably normal mode
		      CurrentPicture.Graphics.DrawPicture PreviewPicture, 0, 0
		      'CurrentPicture = CurrentPicture.CXG_Composite(PreviewPicture, 1.0, 0, 0)
		      If m_Snapshots Then
		        m_snapshotThread.Export CurrentSlide, PreviewPicture, slide, slideStyle
		      End If
		    End If
		    Profiler.EndProfilerEntry
		    
		    ' === Add the Alert ===
		    If Len(AlertText) > 0 Then
		      DrawAlert CurrentPicture.Graphics, AlertText
		      DrawAlert PreviewPicture.Graphics, AlertText
		    End If
		    
		    ' === Check for auto-advance ===
		    If SmartML.GetValueN(XCurrentSlide.Parent.Parent, "@seconds", True) > 0 Then
		      timerAdvance.Mode = 1
		      timerAdvance.Period = SmartML.GetValueN(XCurrentSlide.Parent.Parent, "@seconds", True) * 1000
		      timerAdvance.Reset
		      timerAdvance.Enabled = True
		    Else
		      timerAdvance.Enabled = False
		    End If
		    
		    ' === Start the transition ===
		    If (doTransition And (curslideTransition = SlideTransitionEnum.ApplicationDefault)) Or (curslideTransition = SlideTransitionEnum.UseTransition) Then
		      TransitionFrame = 1
		      timerTransition.Mode = 2
		      timerTransition.Reset
		      timerTransition.Enabled = True
		    Else
		      TransitionFrame = TransitionFrames
		    End If
		    
		    cnvSlide.Refresh False
		    m_updatingSlide = False
		  End If
		  
		  UpdateStatusNotifiers "change"
		  
		  'Keep a copy of this slide to be able do a cleanup when a next slide is shown
		  'A 'next' slide is always set in XCurrentSlide before this method is called and can therefore not be used for this purpose
		  PreviousSlide = slide.Parent.Parent.Clone( False )
		  PreviousSlide.AppendChild( slide.Parent.Clone( False ) ).AppendChild( slide.Clone( False ) )
		  
		  'App.DebugWriter.Write("PresentWindow.ResetPaint: Exit", 5)
		  
		  If advanceNext Then
		    Call PerformAction(ACTION_NEXT_SLIDE)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScriptureSelected(scripture As XmlNode)
		  App.MouseCursor = System.Cursors.Wait
		  
		  CurrentSlide = InsertSlideGroupIntoSet(scripture, CurrentSlide, True, XCurrentSlide)
		  XCurrentSlide = SetML.GetSlide(XCurrentSlide.OwnerDocument, CurrentSlide)
		  
		  UpdateStatusNotifiers "insert_scripture"
		  
		  If HelperActive Then
		    PresentHelperWindow.ScrollTo CurrentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  App.MouseCursor = Nil
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShowAlert(alert As Variant = Nil) As Boolean
		  If IsNull(alert) Then
		    AlertText = InputBox.Input(App.T.Translate("presentation_helper/actions/alert") + ":", "")
		  Else
		    AlertText = ConvertEncoding(alert.StringValue(), Encodings.UTF8)
		  End If
		  
		  If HelperActive Then
		    ResetPaint XCurrentSlide
		    PresentHelperWindow.Refresh False
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShowNormal() As Boolean
		  Mode = "N"
		  If HelperActive Then
		    PresentHelperWindow.SetMode Mode
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SongSetDisplayed(slide As XmlNode)
		  Dim ItemNumber As Integer
		  
		  If slide = Nil Then Return 'sanity check
		  If SmartML.GetValue(slide.Parent.Parent, "@type", false) <> "song" Then Return
		  
		  'get set item number
		  ItemNumber = SmartML.GetValueN(slide.Parent.Parent, "@ItemNumber", false)
		  
		  'find item in the song activity log array
		  For i as Integer = 1 To UBound(ActLog)
		    If ActLog(i).SetItemNumber = ItemNumber Then ActLog(i).Displayed = true
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ToggleBlack() As Boolean
		  'Great idea :)
		  ' Now it's a toggle EMP 9/28
		  if Mode <> "B" then
		    Mode = "B"
		  else
		    Mode = "N"
		  end if
		  'End of toggle EMP 9/28
		  'Mode = "B"
		  If HelperActive Then
		    PresentHelperWindow.SetMode Mode
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ToggleFreeze() As Boolean
		  ' Now it's a toggle EMP 9/28
		  if Mode <> "F" then
		    Mode = "F"
		  else
		    Mode = "N"
		  end if
		  'End of toggle EMP 9/28
		  'Mode = "F"  'Old Code EMP 9/28
		  If HelperActive Then
		    PresentHelperWindow.SetMode Mode
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ToggleHidden() As Boolean
		  'Great idea :)
		  ' Now it's a toggle EMP 9/28
		  if Mode <> "H" then
		    Mode = "H"
		  else
		    Mode = "N"
		  end if
		  'End of toggle EMP 9/28
		  'Mode = "H"
		  If HelperActive Then
		    PresentHelperWindow.SetMode Mode
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ToggleLogo() As Boolean
		  if Mode <> "L" Then
		    Mode = "L"
		  else
		    Mode = "N"
		  end if
		  'End of toggle EMP 9/28
		  'Mode = "L"
		  If HelperActive Then
		    PresentHelperWindow.SetMode Mode
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ToggleWhite() As Boolean
		  'Great idea :)
		  ' Now it's a toggle EMP 9/28
		  if Mode <> "W" then
		    Mode = "W"
		  else
		    Mode = "N"
		  end if
		  'End of toggle EMP 9/28
		  'Mode = "W"
		  If HelperActive Then
		    PresentHelperWindow.SetMode Mode
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateStatusNotifiers(reason As String)
		  App.StatusNotifierUpdate("presentation", reason)
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


	#tag Note, Name = Key Codes
		  Map(kTab) = New Key("TAB", &h30)
		  Map(kSpace) = New Key("SPACE", &h31)
		  Map(kTilde) = New Key("`", &h32)
		  Map(kBackspace) = New Key("BACKSPACE", &h33)
		  Map(kEscape) = New Key("ESCAPE", &h35)
		  Map(kCommand) = New Key("COMMAND", &h37)
		  Map(kLShift) = New Key("LSHIFT", &h38)
		  Map(kCapslock) = New Key("CAPSLOCK", &h39)
		  Map(kLOption) = New Key("LOPTION", &h3a)
		  Map(kLControl) = New Key("LCONTROL", &h3b)
		  Map(kRShift) = New Key("RSHIFT", &h3c)
		  Map(kROption) = New Key("ROPTION", &h3d)
		  Map(kRControl) = New Key("RCONTROL", &h3e)
		  Map(kPadPeriod) = New Key("PAD_PERIOD", &h41)
		  Map(kPadAsterisk) = New Key("PAD_ASTERISK", &h43)
		  Map(kPadPlus) = New Key("PAD_PLUS", &h45)
		  Map(kPadClear) = New Key("PAD_CLEAR", &h47)' AKA NumLock
		  Map(kPadEnter) = New Key("PAD_ENTER", &h4c)
		  Map(kPadSlash) = New Key("PAD_SLASH", &h4b)
		  Map(kPadMinus) = New Key("PAD_MINUS", &h4e)
		  Map(kPadEquals) = New Key("PAD_EQUALS", &h51)
		  Map(kPad0) = New Key("PAD_0", &h52)
		  Map(kPad1) = New Key("PAD_1", &h53)
		  Map(kPad2) = New Key("PAD_2", &h54)
		  Map(kPad3) = New Key("PAD_3", &h55)
		  Map(kPad4) = New Key("PAD_4", &h56)
		  Map(kPad5) = New Key("PAD_5", &h57)
		  Map(kPad6) = New Key("PAD_6", &h58)
		  Map(kPad7) = New Key("PAD_7", &h59)
		  Map(kPad8) = New Key("PAD_8", &h5b)
		  Map(kPad9) = New Key("PAD_9", &h5c)
		  Map(kF5) = New Key("F5", &h60)
		  Map(kF6) = New Key("F6", &h61)
		  Map(kF7) = New Key("F7", &h62)
		  Map(kF3) = New Key("F3", &h63)
		  Map(kF8) = New Key("F8", &h64)
		  Map(kF9) = New Key("F9", &h65)
		  Map(kF11) = New Key("F11", &h67)
		  Map(kF13) = New Key("F13", &h69)' AKA PrintScreen
		  Map(kF14) = New Key("F14", &h6b)' AKA ScreenLock
		  Map(kF10) = New Key("F10", &h6d)
		  Map(kF12) = New Key("F12", &h6f)
		  Map(kF15) = New Key("F15", &h71)' AKA Pause
		  Map(kHelp) = New Key("HELP", &h72)' AKA Insert
		  Map(kHome) = New Key("HOME", &h73)
		  Map(kPageUp) = New Key("PAGEUP", &h74)
		  Map(kDelete) = New Key("DELETE", &h75)
		  Map(kF4) = New Key("F4", &h76)
		  Map(kEnd) = New Key("END", &h77)
		  Map(kF2) = New Key("F2", &h78)
		  Map(kPageDown) = New Key("PAGEDOWN", &h79)
		  Map(kF1) = New Key("F1", &h7a)
		  Map(kLeft) = New Key("LEFT", &h7b)
		  Map(kRight) = New Key("RIGHT", &h7c)
		  Map(kDown) = New Key("DOWN", &h7d)
		  Map(kUp) = New Key("UP", &h7e)
	#tag EndNote


	#tag Property, Flags = &h0
		AlertText As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected AppCursor As MouseCursor
	#tag EndProperty

	#tag Property, Flags = &h0
		ControlScreen As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentSet As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentSlide As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected curslideTransition As SlideTransitionEnum
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected doTransition As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HelperActive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastCommandHandled As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		LastPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		LogoCache As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_AppLaunchShell As Shell = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_ClickCount As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		m_ExternalRenderer As ExternalRenderer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_Snapshots As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_updatingSlide As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_VideolanController As VideolanController = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberOfItems As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Position As REALbasic.Rect
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PositionChanged As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PositionChanging As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PositionSaved As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PositionScreen As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PresentationMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PresentCursor As MouseCursor
	#tag EndProperty

	#tag Property, Flags = &h0
		PresentScreen As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PreviewPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PreviousSlide As XmlNode = Nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected savedMode As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StyleDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		TransitionFrame As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TransitionFrames As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		XCurrentSlide As XmlNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _IsClosingExternal As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _IsSlidechangeExternal As Boolean = False
	#tag EndProperty


	#tag Constant, Name = ACTION_ALERT, Type = Double, Dynamic = False, Default = \"1023", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_BLACK, Type = Integer, Dynamic = False, Default = \"1013", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_BRIDGE, Type = Integer, Dynamic = False, Default = \"1008", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_CHORUS, Type = Integer, Dynamic = False, Default = \"1009", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_EXIT, Type = Integer, Dynamic = False, Default = \"1018", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_EXIT_NOPROMPT, Type = Integer, Dynamic = False, Default = \"1020", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_EXIT_PROMPT, Type = Integer, Dynamic = False, Default = \"1019", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_FIRST_SLIDE, Type = Integer, Dynamic = False, Default = \"1003", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_FIRST_SLIDE_OF_SECTION, Type = Integer, Dynamic = False, Default = \"126", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ACTION_FREEZE, Type = Integer, Dynamic = False, Default = \"1015", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_HIDE, Type = Integer, Dynamic = False, Default = \"1017", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_LAST_SLIDE, Type = Integer, Dynamic = False, Default = \"1004", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_LOGO, Type = Integer, Dynamic = False, Default = \"1016", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_NEXT_SECTION, Type = Integer, Dynamic = False, Default = \"1005", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_NEXT_SLIDE, Type = Integer, Dynamic = False, Default = \"1001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_NORMAL, Type = Integer, Dynamic = False, Default = \"1012", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_PRECHORUS, Type = Integer, Dynamic = False, Default = \"1010", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_PREV_SECTION, Type = Integer, Dynamic = False, Default = \"1006", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_PREV_SLIDE, Type = Integer, Dynamic = False, Default = \"1002", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_SLIDE, Type = Double, Dynamic = False, Default = \"1022", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_SONG, Type = Integer, Dynamic = False, Default = \"1021", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_TAG, Type = Integer, Dynamic = False, Default = \"1011", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_VERSE, Type = Integer, Dynamic = False, Default = \"1007", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_WHITE, Type = Integer, Dynamic = False, Default = \"1014", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ControlKey, Type = Integer, Dynamic = False, Default = \"&h1000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CopyAllChildren, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = KEY_F1, Type = Double, Dynamic = False, Default = \"&h7A", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F10, Type = Double, Dynamic = False, Default = \"&h6D", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F11, Type = Double, Dynamic = False, Default = \"&h67", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F12, Type = Double, Dynamic = False, Default = \"&h6F", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F13, Type = Double, Dynamic = False, Default = \"&h69", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F14, Type = Double, Dynamic = False, Default = \"&h6B", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F15, Type = Double, Dynamic = False, Default = \"&h71", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F2, Type = Double, Dynamic = False, Default = \"&h78", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F3, Type = Double, Dynamic = False, Default = \"&h63", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F4, Type = Double, Dynamic = False, Default = \"&h76", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F5, Type = Double, Dynamic = False, Default = \"&h60", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F6, Type = Double, Dynamic = False, Default = \"&h61", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F7, Type = Double, Dynamic = False, Default = \"&h62", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F8, Type = Double, Dynamic = False, Default = \"&h64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KEY_F9, Type = Double, Dynamic = False, Default = \"&h65", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MODE_DUAL_SCREEN, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MODE_PREVIEW, Type = Integer, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MODE_SINGLE_SCREEN, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OptionKey, Type = Integer, Dynamic = False, Default = \"&h10000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ShiftKey, Type = Integer, Dynamic = False, Default = \"&h100", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events cnvSlide
	#tag Event
		Sub GotFocus()
		  If HelperActive Then
		    If PresentHelperWindow.IsCollapsed Then
		      App.RestoreWindow(PresentHelperWindow)
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim status As Boolean
		  status = KeyDownX(Key)
		  Return Status
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics)
		  If Not Globals.Status_Presentation Then Return
		  #Pragma BreakOnExceptions False
		  '#if DebugBuild then
		  'App.DebugWriter.Write("PresentWindow.cnvSlide.Paint: Enter")
		  '#endif
		  
		  If (doTransition And (curslideTransition = SlideTransitionEnum.ApplicationDefault)) Or (curslideTransition = SlideTransitionEnum.UseTransition) Then
		    Profiler.BeginProfilerEntry "PresentWindow::Repaint Timer::Blit"
		    
		    Dim transparency As Integer
		    #if RBVersion >= 2016.04 then
		      transparency = 100 * (TransitionFrames - TransitionFrame) / TransitionFrames
		      LastPicture.Graphics.Transparency = transparency
		    #else
		      transparency = 255 * (TransitionFrames - TransitionFrame) / TransitionFrames
		      CurrentPicture.Mask.Graphics.ForeColor = rgb(transparency, transparency, transparency)
		      CurrentPicture.Mask.Graphics.FillRect(0, 0, CurrentPicture.Mask.Graphics.Width, CurrentPicture.Mask.Graphics.Height)
		    #endif
		    LastPicture.Graphics.DrawPicture CurrentPicture, 0, 0
		    g.DrawPicture LastPicture, 0, 0, g.Width, g.Height, 0, 0, LastPicture.Width, LastPicture.Height
		    Profiler.EndProfilerEntry
		  Else
		    g.DrawPicture CurrentPicture, 0, 0, g.Width, g.Height, 0, 0, CurrentPicture.Width, CurrentPicture.Height
		  End If
		  
		  '#if DebugBuild Then
		  'App.DebugWriter.Write("PresentWindow.cnvSlide.Paint: Exit")
		  '#endif
		  #Pragma BreakOnExceptions Default
		  //++
		  // EMP: handle any exceptions by ignoring them.
		  // This corrects an issue seen when changing the SButton style
		  // after a presentation and for some reason this window is still open
		  //--
		Catch ex
		  App.DebugWriter.Write("PresentWindow.cnvSlide.Paint: Got an exception: " +_
		  RuntimeException(ex).Message, 1)
		  Return
		  #Pragma BreakOnExceptions Default
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timerAdvance
	#tag Event
		Sub Action()
		  If Not Globals.Status_Presentation Then
		    Me.Enabled = False
		    Return
		  End If
		  
		  If XCurrentSlide.NextSibling = Nil And SmartML.GetValueB(XCurrentSlide.Parent.Parent, "@loop") Then
		    Call PerformAction(ACTION_FIRST_SLIDE_OF_SECTION)
		  Else
		    'TODO Should probably check if next slide is a new set item
		    'and stop auto-advancing if it is
		    Call PerformAction(ACTION_NEXT_SLIDE)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timerTransition
	#tag Event
		Sub Action()
		  If Not Globals.Status_Presentation Then
		    Me.Enabled = False
		    Return
		  End If
		  
		  If TransitionFrame = TransitionFrames Then
		    Me.Enabled = False
		    Me.Reset
		  Else
		    TransitionFrame = TransitionFrame + 1
		  End If
		  
		  cnvSlide.Refresh False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timerClick
	#tag Event
		Sub Action()
		  m_ClickCount = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timerWindowLocation
	#tag Event
		Sub Action()
		  If PresentationMode <> MODE_DUAL_SCREEN Then Return
		  If Not PositionSaved Then Return
		  If Self.IsCollapsed Then Return
		  
		  Dim currentPosition As REALbasic.Rect
		  #if RBVersion >= 2012.1
		    currentPosition = Self.Bounds.Clone
		  #else
		    currentPosition = New REALbasic.Rect(Left,Top,Width,Height)
		  #endif
		  
		  If currentPosition = Position Then Return
		  
		  If PositionScreen > OSScreenCount - 1 Then Return
		  
		  Dim screenPosition As REALbasic.Rect = OSScreen(PositionScreen).Bounds
		  App.DebugWriter.Write CurrentMethodName + ": Attempting to reposition to " + screenPosition.ToString
		  If screenPosition = Position Then
		    #if RBVersion >= 2012.1
		      Self.Bounds = screenPosition
		    #else
		      Left = screenPosition.Left
		      Top = screenPosition.Top
		      Width = screenPosition.Width
		      Height = screenPosition.Height
		    #endif
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
