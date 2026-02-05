#tag Window
Begin Window PresentWindow Implements ScriptureReceiver
   BackColor       =   &c00000000
   Backdrop        =   0
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   True
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "False"
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
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   300
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
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   300
   End
   Begin Timer timerAdvance
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   10000
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Timer timerTransition
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   125
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin SnapshotThread m_SnapshotThread
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin Timer timerClick
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   333
      RunMode         =   1
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin Timer timerWindowLocation
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   250
      RunMode         =   0
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  App.DebugWriter.Write("Begin PresentWindow.Activate", 8)
		  If App.ProgramIsExiting Then Return
		  If Globals.Status_Presentation Then
		    If HelperActive Then
		      If PresentHelperWindow.IsWindowMinimized Then
		        App.DebugWriter.Write CurrentMethodName + ": RestoreWindow(PresentHelperWindow)"
		        App.RestoreWindow(PresentHelperWindow)
		      Else
		        App.DebugWriter.Write CurrentMethodName + ": SetForeground(PresentHelperWindow)"
		        App.SetForeground(PresentHelperWindow)
		      End If
		    Else
		      Dim slideContentBase As Integer = CurrentSlideContentMask And kSlideContent_BaseMask
		      If slideContentBase = kSlideContent_Presentation Or slideContentBase = kSlideContent_Videolan Then
		        // these sources minimize the presentation window
		        If Not PresentWindow.IsWindowMinimized Then
		          App.DebugWriter.Write CurrentMethodName + ": minimizing myself again. External app should present"
		          Self.Minimize
		          //§ is there a way to switch to the proper window?
		        End If
		      Else
		        // the presentation window should be restored or maximized and in the forground.
		        // rely on the OS to do things right
		        'If PresentWindow.IsWindowMinimized Then
		        'App.DebugWriter.Write CurrentMethodName + ": RestoreWindow(PresentWindow)"
		        'App.RestoreWindow(PresentWindow)
		        'End If
		        'App.DebugWriter.Write CurrentMethodName + ": SetForeground(PresentWindow)"
		        'App.SetForeground(PresentWindow)
		        'PresentWindow.SetFocus
		      End If
		    End If
		    Me.MenuBarVisible = (Not Me.FullScreen) Or (PresentScreen <> 0) // Make assumption that screen 0 has the menu; not always true
		    If PositionSaved Then timerWindowLocation.Enabled = True
		  End If
		  
		  App.DebugWriter.Write("End PresentWindow.Activate", 8)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  m_ExternalRenderer.EndPresent
		  SaveVmixXML(Nil)
		  SaveSlideTextFile(Nil)
		  
		  Call ResetPaint(Nil)  // This will cleanup external slide stuff
		  
		  Dim hasMainWindow As Boolean = False
		  Dim hasHelperWindow As Boolean = False
		  For i As Integer = WindowCount - 1 DownTo 0
		    If Window(i) IsA MainWindow Then
		      hasMainWindow = True
		    End If
		    If Window(i) IsA PresentHelperWindow Then
		      hasHelperWindow = True
		    End If
		  Next
		  
		  App.MouseCursor = Nil
		  Globals.Status_Presentation = False
		  If hasHelperWindow Then 
		    HelperActive = False
		    PresentHelperWindow.Close
		  End If
		  timerAdvance.Enabled = False
		  
		  m_updatingSlide = False
		  timerTransition.Enabled = False
		  While m_SnapshotThread.State = Thread.Running Or m_SnapshotThread.State = Thread.Sleeping
		    App.SleepCurrentThread(100)
		  Wend
		  
		  If hasMainWindow Then MainWindow.CleanupPresentation(CurrentSet)
		  
		  UpdateStatusNotifiers "closed"
		  
		  If App.ProgramIsExiting Then Return
		  
		  If hasMainWindow Then
		    #If Not TargetMacOS
		      If MainWindow.WindowState = WindowState.Minimized Then
		        If MainWindow.WindowStateBefore = WindowState.Maximized Then
		          MainWindow.Maximize
		        Else
		          App.RestoreWindow(MainWindow)
		        End If
		      End If
		    #EndIf
		    Timer.CallLater(30, AddressOf MainWindow.SetForeground)  // give the window some time to get out on minimized
		  End If
		  
		  Return
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  App.DebugWriter.Write("Begin PresentWindow.Deactivate", 8)
		  timerWindowLocation.Enabled = False
		  App.DebugWriter.Write("End PresentWindow.Deactivate", 8)
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
		  #pragma Unused X
		  #pragma Unused Y
		  
		  If IsContextualClick Then
		    Return KeyDownX(Chr(ASC_KEY_UP))
		  Else
		    If GetClickCount()>1 And _
		      SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@exit_doubleclick") Then
		      Return KeyDownX(Chr(ASC_KEY_ESCAPE))
		    Else
		      Return KeyDownX(Chr(ASC_KEY_DOWN))
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
		  
		  //
		  // Rewritten to get transition speed characteristics from presentation preferences
		  //
		  App.DebugWriter.Write("PresentWindow.Open: Enter")
		  Dim time As Integer
		  
		  time = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "style/@transition_time", False)
		  If time = 0 Then Time = 100  // Set a reasonable default
		  TransitionFrames = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "style/@transition_frames", False)
		  If TransitionFrames = 0 Then TransitionFrames = 5  // again, reasonable default
		  timerTransition.Period = Round(time / TransitionFrames)
		  
		  Mode = SmartML.GetValue(App.MyPresentSettings.DocumentElement, "style/@initial_mode")
		  If Len(Mode) <> 1 Then Mode = "N"
		  doTransition = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@transition")
		  curslideTransition = SlideTransitionEnum.NoTransition
		  m_Snapshots = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "snapshot/@enable", False, False)
		  
		  #If TargetLinux
		    Try
		      gtk_window_set_decorated( self.handle, False )
		    Catch
		      // This could fail if libgtk cannot be loaded
		    End Try
		  #EndIf
		  
		  m_videolanController = New VideolanController  // Initialise shell control for videolan
		  m_AppLaunchShell = New Shell  // Initialize shell control for external applications
		  AddHandler m_AppLaunchShell.Completed, AddressOf ExternalSlideTerminated
		  #If TargetWin32
		    m_AppLaunchProcess = New Win32Process
		  #Endif
		  m_ExternalRenderer = New ExternalRenderer
		  m_updatingSlide = False
		  
		  CurrentSlideContentMask = 0
		  
		  SaveVMixXML(Nil)
		  SaveSlideTextFile(Nil)
		  App.DebugWriter.Write("PresentWindow.Open: Exit")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AdjustSlideOffsetForBlanks(setDoc As XMLDocument, StartingSlide As Integer) As Integer
		  //++
		  // Treat StartingSlide < 1 as equivalent to starting at the first slide,
		  // whether blank or not.
		  //--
		  If StartingSlide < 1 Then Return 1
		  
		  Dim xSlides As XMLNodeList
		  Dim xSlide As XMLNode
		  Dim i As Integer
		  Dim adjustedSlideNumber As Integer = 0
		  Dim nonblankSlideNumber As Integer = 0
		  
		  xSlides = setDoc.XQL("//slide")
		  If xSlides = Nil Or xSlides.Length = 0 Then Return 1
		  
		  i = 0
		  While i < xSlides.Length
		    xSlide = xSlides.Item(i)
		    Dim slideGroupType As String = SmartML.GetValue(xSlide.Parent.Parent, "@type")
		    
		    Select Case slideGroupType
		      
		    Case "style"
		      // Ignore (This is consistent with the behavior of SetML.GetSlide)
		      
		    Case "blank"
		      adjustedSlideNumber = adjustedSlideNumber + 1
		      
		    Case Else
		      adjustedSlideNumber = adjustedSlideNumber + 1
		      nonblankSlideNumber = nonblankSlideNumber + 1
		      If nonblankSlideNumber = StartingSlide Then
		        Exit
		      End If
		      
		    End Select
		    
		    i = i + 1
		  Wend
		  
		  Return adjustedSlideNumber
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoClosePresentation(confirmClose As Boolean = True) As Boolean
		  Dim messagebox As New MessageDialog
		  Dim msgboxbutton As MessageDialogButton
		  Dim bFound As Boolean
		  Dim willClose As Boolean = False
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
		  If confirmClose And _
		    SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@exit_prompt") Then
		    If PresentationMode = MODE_SINGLE_SCREEN Then // Use operating system message box
		      messagebox.Message = App.T.Translate("presentation_helper/exit/@caption")
		      messagebox.Title = "OpenSong"
		      messagebox.ActionButton.Default = True
		      messagebox.CancelButton.Visible = True
		      messagebox.CancelButton.Cancel = True
		      msgboxbutton = messagebox.ShowModal
		      If msgboxbutton = messagebox.ActionButton Then
		        willClose = True
		      End If
		    Else // Use the OpenSong one so it ends up on the right screen
		      If InputBox.Ask(App.T.Translate("presentation_helper/exit/@caption")) Then
		        willClose = True
		      End If
		    End If
		  Else // No prompt before exit
		    willClose = True
		  End If
		  
		  If willClose Then
		    If App.NDIEnabled Then
		      NDI.FinishSending
		    End If
		    Close
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoPickScripture() As Boolean
		  App.DebugWriter.Write "PresentWindow.DoPickScripture: Enter", 4
		  
		  Dim w As ScripturePickerWindow
		  
		  Dim c As ScripturePickerController
		  
		  // If no Bibles were found, return
		  If Not BibleFactory.HasBible Then Return False
		  
		  c = New ScripturePickerController
		  c.registerScriptureReceiver Self
		  
		  w = New ScripturePickerWindow(c, True, True)
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
		      InputBox.Message App.T.Translate("errors/create_songs_folder", JoinNativePath(App.DocsFolder.NativePath, App.STR_SONGS))
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
		    App.MouseCursor = System.Cursors.Wait
		    
		    result = InsertSongIntoSet(f, CurrentSlide, presentation, CheckLinked, True)
		    
		    ' Added to move back to original position (see EMP 6/20/05 comments above).
		    '
		    
		    If HelperActive Then
		      App.MouseCursor = Nil
		      PresentHelperWindow.ScrollTo CurrentSlide
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
		  Border * 3, _
		  Border, _
		  alertFont, _
		  g.Width - Border * 6, _
		  align, _
		  g.Height - Border * 7, _
		  valign)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ExternalSlideTerminated(Sender As Shell)
		  // this is an event handler for m_AppLaunchShell.Completed
		  App.DebugWriter.Write CurrentMethodName + " PID=" + CStr(m_AppLaunchShell.PID) + " IsRunning=" + CStr(m_AppLaunchShell.IsRunning) + " Result=" + Sender.Result.Left(500), 8
		  If mExternalSlideWait Then
		    mExternalSlideWait = False
		    Call PerformAction(ACTION_NEXT_SLIDE)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalSlideTerminatedW32(lpParameter As Ptr, TimerOrWaitFired As Boolean)
		  #If TargetWin32
		    #pragma X86CallingConvention StdCall
		    #pragma DisableBackgroundTasks
		    
		    #pragma Unused lpParameter
		    
		    // this is an event handler for Win32Process.CreateProcess.RegisterWaitForSingleObject
		    App.DebugWriter.Write CurrentMethodName + " PID=" + CStr(m_AppLaunchProcess.PID) + " IsRunning=" + CStr(m_AppLaunchProcess.IsRunning), 8
		    m_AppLaunchProcess.StopWaiting
		    
		    If mExternalSlideWait Then
		      mExternalSlideWait = False
		      Call PerformAction(ACTION_NEXT_SLIDE)
		    End If
		    If TimerOrWaitFired Then
		      Call m_AppLaunchProcess.TerminateProcess(-1)
		    End If
		    CurrentExternalSlide = 0
		    App.DebugWriter.Write CurrentMethodName + ": Set CurrentExternalSlide = 0", 7
		  #EndIf
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
		  
		  ppName = SmartML.GetValue(XCurrentSlide.Parent.Parent, "@name", False) 'EMP debug 10/1 -- RB  debug crashed with old IF statement below
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
		Function GetPresentationObjFromSlide(slide As XmlNode) As iPresentation
		  Dim slideGroup As XmlNode
		  Dim presFilename As String
		  Dim presFile As FolderItem
		  
		  If slide = Nil Or slide.Parent = Nil Then
		    Return Nil
		  End If
		  slideGroup = slide.Parent.Parent
		  If slideGroup = Nil Then
		    Return Nil
		  End If
		  
		  Try
		    // First check if there is a 'local' filename (a saved embedded presentation)
		    presFilename = SmartML.GetValue(slideGroup, "@_localfilename", False)
		    If presFilename = "" Then
		      presFile = PathToFolderItem(presFilename)
		    End If
		    If presFile = Nil Or Not presFile.Exists Or Not presFile.IsReadable Then
		      presFile = SmartML.GetValueFI(slideGroup, "@filename")
		    End If
		    
		    If presFile <> Nil And presFile.Exists Then
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
		      Return PresentationFactory.GetOrCreate(presFile.NativePath, presHost)
		    End If
		  Catch
		    Return Nil
		  End Try
		  
		  Return Nil
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
		    PresentHelperWindow.ScrollTo CurrentSlide
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
		    PresentHelperWindow.ScrollTo CurrentSlide
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
		      PresentHelperWindow.ScrollTo CurrentSlide
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
		    PresentHelperWindow.ScrollTo CurrentSlide
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
		      PresentHelperWindow.ScrollTo CurrentSlide
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
		    CurrentSlide = CurrentSlide + 1
		    XCurrentSlide = xNewSlide
		    
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo CurrentSlide
		    Else
		      ResetPaint XCurrentSlide
		    End If
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoNextStep() As Boolean
		  Try
		    Dim oPres As iPresentation = GetPresentationObjFromSlide(XCurrentSlide)
		    If oPres <> Nil Then
		      If oPres.StepForward Then
		        Return True
		      End If
		    End If
		  Catch
		    
		  End Try
		  
		  Return GoNextSlide
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
		    PresentHelperWindow.ScrollTo CurrentSlide
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
		    CurrentSlide = CurrentSlide - 1
		    xCurrentSlide = xNewSlide
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo CurrentSlide
		    Else
		      ResetPaint XCurrentSlide
		    End If
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoPreviousStep() As Boolean
		  Try
		    Dim oPres As iPresentation = GetPresentationObjFromSlide(XCurrentSlide)
		    If oPres <> Nil Then
		      If oPres.StepBackward Then
		        Return True
		      End If
		    End If
		  Catch
		    
		  End Try
		  
		  Return GoPreviousSlide
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoSetItem(Item As Integer) As Boolean
		  // This function will position the presentation to the set item indicated by Item
		  Dim Result As Boolean = True
		  
		  If Item = -1 Then
		    Result = GoFirstSlide
		  ElseIf Item < 0 Then
		    Result = False
		  Else
		    Dim xNewSlide As XmlNode = SetML.GetSlide(CurrentSet, 1)
		    Dim newSlide As Integer = 1
		    
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
		  Dim slide As XmlNode = SetML.GetSlide(CurrentSet, slideIndex)
		  
		  If Not IsNull(slide) Then
		    CurrentSlide = slideIndex
		    XCurrentSlide = slide
		    
		    If HelperActive Then
		      PresentHelperWindow.ScrollTo CurrentSlide
		    End If
		    
		    ResetPaint XCurrentSlide
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
		      PresentHelperWindow.ScrollTo CurrentSlide
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
		    PresentHelperWindow.ScrollTo CurrentSlide
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
		    PresentHelperWindow.ScrollTo CurrentSlide
		  Else
		    ResetPaint XCurrentSlide
		  End If
		  Return True
		End Function
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
		  Dim slideType, neighborType As String
		  Dim styleIndex, setStyleIndex, defaultStyleIndex As String
		  Dim numberOfSlidesInserted As Integer = 0
		  
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
		  styleIndex = ""
		  
		  slideGroup = SmartML.InsertAfter(slideGroup, "slide_group")
		  slideGroup = SmartML.ReplaceWithImportNode(slideGroup, SlideGroupToAdd)
		  NumberOfItems = NumberOfItems + 1
		  SmartML.SetValueN(slideGroup, "@ItemNumber", NumberOfItems)
		  SmartML.SetValueB(slideGroup, "@LiveInsertion", True)
		  slideType = SmartMl.GetValue(slideGroup, "@type", False)
		  styleNode = SmartML.GetNode(slideGroup, "style", False)
		  If styleNode <> Nil Then
		    If slideType <> "song" Or _
		      SetML.SongStylePreferred(slideGroup) Or setStyleIndex = defaultStyleIndex Then
		      styleIndex = SetML.AddNodeToStyleDict(StyleDict, StyleNode)
		    Else
		      styleNode.Parent.RemoveChild(styleNode)
		    End If
		  End If
		  If styleIndex = "" Then
		    If slideType = "scripture" Then
		      styleIndex = "scripture_style"
		    Else
		      styleIndex = setStyleIndex
		    End If
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
		  While xSlide <> Nil
		    If HelperActive Then
		      PresentHelperWindow.InsertItem(xSlide, slideNo - 1)
		      slideNo = slideNo + 1
		    End If
		    xSlide = xSlide.NextSibling
		    numberOfSlidesInserted = numberOfSlidesInserted + 1
		  Wend
		  
		  // now check blank slides before and after
		  If slideType = "blank" _ // this breaks the "subtract 1 for the blank before"-rule, but we're not adding yet another blank
		    Or Not SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blanks", False, True) Then
		    If CurrentSlide > AfterPosition Then
		      CurrentSlide = CurrentSlide + numberOfSlidesInserted
		    End If
		    Return positionOfFirstSlide
		  End If
		  
		  blankUsesNext = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "style/@blank_uses_next", False, True)
		  
		  neighborGroup = slideGroup
		  Do
		    neighborGroup = neighborGroup.PreviousSibling
		    neighborType = SmartML.GetValue(neighborGroup, "@type", False)
		  Loop Until neighborGroup = Nil Or neighborType <> "style"
		  If neighborType <> "blank" Or _
		    (PositionIsCurrent And blankUsesNext And _
		    SmartML.GetValue(neighborGroup, "style/@index", False) <> SmartML.GetValue(SlideGroup, "style/@index", False)) Then
		    neighborGroup = SetML.InsertBlankIntoSet(SlideGroup, True)
		    If HelperActive Then
		      xSlide = SmartML.GetNode(neighborGroup, "slides/slide")
		      PresentHelperWindow.InsertItem(xSlide, positionOfFirstSlide - 1)
		      slideNo = slideNo + 1
		    End If
		    numberOfSlidesInserted = numberOfSlidesInserted + 1
		  ElseIf blankUsesNext Then
		    SmartML.SetValue(neighborGroup, "style/@index",  styleIndex)
		  End If
		  
		  neighborGroup = slideGroup
		  Do
		    neighborGroup = neighborGroup.NextSibling
		    neighborType = SmartML.GetValue(neighborGroup, "@type", False)
		  Loop Until neighborGroup = Nil Or neighborType <> "style"
		  If neighborType <> "blank" Then
		    neighborGroup = SetML.InsertBlankIntoSet(slideGroup, False)
		    If HelperActive Then
		      xSlide = SmartML.GetNode(neighborGroup, "slides/slide")
		      PresentHelperWindow.InsertItem(xSlide, SlideNo - 1)
		    End If
		    numberOfSlidesInserted = numberOfSlidesInserted + 1
		  ElseIf Not blankUsesNext Then
		    // make sure it takes the style of the inserted one
		    SmartML.SetValue(neighborGroup, "style/@index",  styleIndex)
		  End If
		  
		  If CurrentSlide > AfterPosition Then
		    CurrentSlide = CurrentSlide + numberOfSlidesInserted
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
		  
		  If atSlide < 0 Then
		    atSlide = CurrentSlide
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
		      ActLog(i).SongFileName = MainWindow.Songs.DBPathFromFolderItem(fSong)
		      ActLog(i).DateAndTime = d
		      ActLog(i).HasChords = ActLog(i).CheckLyricsForChords(SmartML.GetValue(s.DocumentElement, "lyrics", True))
		      ActLog(i).Presented = True
		      ActLog(i).SetItemNumber = NumberOfItems + 1  // Assign an index to this song. NumberOfItems will get incremented and assigned to this song in InsertSlideGroupIntoSet
		      ActLog(i).Displayed = False  // Set this to true if user displays this song
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
		Function IsSlideChangeExternal() As Boolean
		  Return self._IsSlideChangeExternal
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
		  ' a command code, and (b) support keyboard remapping through this routine.
		  
		  ' TODO: Put the commands into the Language file and load it from there
		  ' TODO: Find all the places KeyDownX is called and redirect the call to PerformAction with the proper command
		  ' TODO: (this implies that the PerformAction actioncode constants are defined Public
		  '
		  ' EMP, 1/19/05 ff
		  '
		  ' Temporarily just do the regular function until the code is fleshed out
		  '
		  
		  Dim Command As Integer
		  
		  If Asc(Key) = ASC_KEY_PGDN Then Key = Chr(ASC_KEY_DOWN)
		  If Asc(Key) = ASC_KEY_PGUP Then Key = Chr(ASC_KEY_UP)
		  
		  Command = AscB(Lowercase(Key))
		  
		  Select Case Command
		  Case ASC_KEY_SPACE
		    Select Case True
		    Case Keyboard.AltKey, Keyboard.ControlKey, Keyboard.OSKey
		      Command = 0
		    Case Keyboard.ShiftKey
		      Command = ACTION_RETRACT_SLIDE
		    Case Else
		      Command = ACTION_ADVANCE_SLIDE
		    End Select
		  End Select
		  
		  Call PerformAction(Command) ' sets LastCommandHandled as a side effect
		  Return LastCommandHandled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LiveDisplay(slide As XmlNode, slides As XmlNodeList)
		  #Pragma Unused slides
		  //++
		  // Part of ScriptureReceiver interface
		  // Called to display a verse slide without adding it
		  // to the active set
		  //--
		  
		  If Mode <> "F" Then
		    Mode = "N"
		    ResetPaint(slide)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PerformAction(Action As Integer, param As Variant = Nil) As Boolean
		  'KeyDown needs to know, if the command has been handled, not necessarily if it has been successful
		  'assume the command is valid until prooven otherwise
		  LastCommandHandled = True
		  
		  'Constants added for clarity EMP 9/30/04
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
		    ' next substep within slide or ACTION_NEXT_SLIDE
		    '
		  ElseIf Action = ACTION_RETRACT_SLIDE Then
		    Return GoPreviousStep
		    '
		    ' next substep within slide or ACTION_NEXT_SLIDE
		    '
		  ElseIf Action = ACTION_ADVANCE_SLIDE Then
		    Return GoNextStep
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
		  ElseIf Action = KEY_ESCAPE Then ' Escape
		    Return DoClosePresentation
		  ElseIf Action = ACTION_EXIT_NOPROMPT Then
		    Return DoClosePresentation(False)
		    
		    '
		    ' Black screen (can't be "B" since that's the hotkey for "Bridge" :-(
		    '
		  ElseIf Lowercase(Key) = "k" Or _
		    Action = ACTION_BLACK Then
		    Return ToggleBlack
		    '
		    ' White Screen
		    '
		  ElseIf Lowercase(Key) = "w" Or _
		    Action = ACTION_WHITE Then
		    Return ToggleWhite
		    '
		    ' Hide Slide (leaves background up)
		    '
		  ElseIf Lowercase(Key) = "h" Or _
		    Action = ACTION_HIDE Then
		    Return ToggleHidden
		    '
		    ' Put up the LOGO
		    '
		  ElseIf Lowercase(Key) = "l" Or _
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
		Sub Present(setDoc As XmlDocument, PresentMode As Integer, SetListIndex As Integer = 0, StartingSlide As Integer = 0, StartingSlideIncludesBlanks As Boolean = False)
		  // Starts a presentation of the presentation given in setDoc in mode PresentMode
		  // SetListIndex specifies the set item number with which to start. It corresponds to the MainWindow.lst_set_items.ListIndex + 1
		  // and to /set/slide_groups/@set_list_index, once the set is converted to a deck i.e. is prepared to be used within PresentWindow
		  // The first set item is no. 1. Use 0 to start with the blank slide preceding the first set item, if the system is configured to 
		  // insert blanks
		  // When used from the API, StartingSlide and StartingSlideIncludesBlanks may be used.
		  // If a StartingSlide > 0 is given, ItemNumber is ignored and slides are counted from the beginning of the presentation, starting at 1
		  // taking inserted blank slides into account according to StartingSlideIncludesBlanks
		  
		  Dim i As Integer
		  Dim slide As XmlNode
		  Dim de As XmlNode  // Holds PresentationSettings Document Element
		  Dim availableWidth As Integer  // For screensize calculations adapted to Linux Xinerama in preview dual screen
		  Dim presentScreenAspect As Single
		  Dim LogActivity As Boolean
		  Dim monitorIndex As Integer
		  
		  App.MouseCursor = System.Cursors.Wait
		  PositionSaved = False
		  
		  de = App.MyPresentSettings.DocumentElement
		  PresentScreen = SmartML.GetValueN(de, "monitors/@present") - 1
		  ControlScreen = SmartML.GetValueN(de, "monitors/@control") - 1
		  If PresentScreen < 0 Or PresentScreen > OSScreenCount() - 1 Then PresentScreen = 0
		  If ControlScreen < 0 Or ControlScreen > OSScreenCount() -1 Then ControlScreen = 0
		  
		  cnvSlide.Visible = False  // Prevent the canvas to redraw itself for all size changes below
		  
		  PositionChanging = True
		  
		  Select Case PresentMode
		  Case MODE_SINGLE_SCREEN, MODE_PREVIEW
		    // PresentMode is known
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
		  
		  // Don't log in preview mode
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
		  
		  CurrentSet = SetML.SetToPresentationDeck(setDoc, CopyAllChildren, LogActivity, PresentMode, PresentScreen, StyleDict)
		  
		  If SetML.GetSlide(CurrentSet, 1) = Nil Then
		    Close
		    InputBox.Message App.T.Translate("sets_mode/current_set/present/no_slides")
		    Return
		  End If
		  
		  mPresentationMode = PresentMode
		  If PresentMode = MODE_SINGLE_SCREEN Then  // Single Screen
		    PresentScreen = ControlScreen
		    HelperActive = False
		    MenuBarVisible = False
		    App.DebugWriter.Write("------------------------ SCREEN --------------")
		    App.DebugWriter.Write("Screen: (" + Str(OSScreen(PresentScreen).Left) + "," + Str(OSScreen(PresentScreen).Top) + ") " + Str(OSScreen(PresentScreen).Width) + "x" + Str(OSScreen(PresentScreen).Height))
		    Top = OSScreen(PresentScreen).Top
		    Left = OSScreen(PresentScreen).Left
		    Width = OSScreen(PresentScreen).Width
		    Height = OSScreen(PresentScreen).Height
		    App.DebugWriter.Write("Moved : (" + Str(Left) + "," + Str(Top) + ") " + Str(Width) + "x" + Str(Height))
		    monitorIndex = IsOnMonitorIndex
		    FullScreen = True
		    App.DebugWriter.Write("Full  : (" + Str(Left) + "," + Str(Top) + ") " + Str(Width) + "x" + Str(Height))
		    FitOnMonitorIndex(monitorIndex)  // Xojo's FullScreen is broken. It may get the window's position and / or size wrong on Windows. This should fix it
		    App.DebugWriter.Write("Fitted: (" + Str(Left) + "," + Str(Top) + ") " + Str(Width) + "x" + Str(Height))
		    presentScreenAspect = Width / Height
		  ElseIf PresentMode = MODE_PREVIEW Then  // Split Screen
		    HelperActive = True
		    MenuBarVisible = True
		    presentScreenAspect = OSScreen(PresentScreen).Width / OSScreen(PresentScreen).Height
		    
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
		    
		    Top = OSScreen(controlScreen).AvailableTop + 10
		    Left = OSScreen(controlScreen).AvailableLeft + 10
		    availableWidth = OSScreen(controlScreen).AvailableWidth
		    
		    Width = availableWidth - PresentHelperWindow.Width - 30
		    Height = Width / presentScreenAspect
		    If Height > OSScreen(ControlScreen).AvailableHeight Then
		      Height = OSScreen(ControlScreen).AvailableHeight
		      Width = Height * presentScreenAspect
		    End If
		    
		    PresentHelperWindow.Left = OSScreen(controlScreen).AvailableLeft + availableWidth - PresentHelperWindow.Width - 10
		    PresentHelperWindow.Top = OSScreen(controlScreen).AvailableTop + OSScreen(controlScreen).Height - PresentHelperWindow.Height - 40
		    
		    presentScreen = controlScreen
		    
		    If Not SmartML.GetValueB(de, "snapshot/@export_preview", False, False) Then
		      m_Snapshots = False
		    End If
		    
		    Mode = "N"  // Start preview in normal mode
		    
		  ElseIf PresentMode = MODE_DUAL_SCREEN Then  // Multiple Screens
		    HelperActive = True
		    App.DebugWriter.Write("------------------------ SCREEN --------------")
		    App.DebugWriter.Write("Screen: (" + Str(OSScreen(PresentScreen).Left) + "," + Str(OSScreen(PresentScreen).Top) + ") " + Str(OSScreen(PresentScreen).Width) + "x" + Str(OSScreen(PresentScreen).Height))
		    Top = OSScreen(PresentScreen).Top
		    Left = OSScreen(PresentScreen).Left
		    Width = OSScreen(PresentScreen).Width
		    Height = OSScreen(PresentScreen).Height
		    App.DebugWriter.Write("Moved : (" + Str(Left) + "," + Str(Top) + ") " + Str(Width) + "x" + Str(Height))
		    monitorIndex = IsOnMonitorIndex
		    FullScreen = True
		    App.DebugWriter.Write("Full  : (" + Str(Left) + "," + Str(Top) + ") " + Str(Width) + "x" + Str(Height))
		    FitOnMonitorIndex(monitorIndex)  // Xojo's FullScreen is broken. It may get the window's position and / or size wrong on Windows. This should fix it
		    App.DebugWriter.Write("Fitted: (" + Str(Left) + "," + Str(Top) + ") " + Str(Width) + "x" + Str(Height))
		    #If TargetMacOS
		      MenuBarVisible = False
		    #Else
		      MenuBarVisible = (PresentScreen > 0)  // Only show the menu bar if we're presenting on a secondary screen
		    #EndIf
		    Dim screenBounds As New REALbasic.Rect
		    screenBounds.Left = OSScreen(ControlScreen).Left
		    screenBounds.Top = OSScreen(ControlScreen).Top
		    screenBounds.Width = OSScreen(ControlScreen).Width
		    screenBounds.Height = OSScreen(ControlScreen).Height
		    Dim windowBounds As New REALbasic.Rect
		    windowBounds.Left = App.MainPreferences.GetValueN(prefs.kPresentHelperGeometry + "/@left", 0, False)
		    windowBounds.Top = App.MainPreferences.GetValueN(prefs.kPresentHelperGeometry + "/@top", 0, False)
		    windowBounds.Width = App.MainPreferences.GetValueN(prefs.kPresentHelperGeometry + "/@width", 0, False)
		    windowBounds.Height = App.MainPreferences.GetValueN(prefs.kPresentHelperGeometry + "/@height", 0, False)
		    If windowBounds.Size.Area > 0 And screenBounds.Contains(windowBounds) Then
		      PresentHelperWindow.Bounds = windowBounds
		      
		      Dim pos As Double
		      pos = App.MainPreferences.GetValueN(prefs.kPresentHelperGeometry + "/@splitter_preview_top", 0, False)
		      If pos > 0 Then 
		        pos = pos - PresentHelperWindow.spl_text_graphics.Top
		        PresentHelperWindow.spl_text_graphics.MoveSplitter(0, pos)
		      End If
		      pos = App.MainPreferences.GetValueN(prefs.kPresentHelperGeometry + "/@splitter_preview_left", 0, False)
		      If pos > 0 Then
		        pos = pos - PresentHelperWindow.spl_previews.Left
		        PresentHelperWindow.spl_previews.MoveSplitter(pos, 0)
		      Else
		        PresentHelperWindow.ResizePreview
		      End If
		      
		      Dim dockPos As imSplitter.imSplitterIs
		      Dim dp As Integer
		      pos = App.MainPreferences.GetValueN(prefs.kPresentHelperGeometry + "/@splitter_notes_top", 0, False)
		      dp = App.MainPreferences.GetValueN(prefs.kPresentHelperGeometry + "/@splitter_notes_dockpos", 2, False)
		      dockPos = imSplitter.imSplitterIs(dp)
		      If pos > 0 Then
		        If dockPos = imSplitter.imSplitterIs.UnDocked Then
		          pos = pos - PresentHelperWindow.spl_slidelist_text.Top
		          PresentHelperWindow.spl_slidelist_text.MoveSplitter(0, pos)
		        Else
		          PresentHelperWindow.spl_slidelist_text.Dock(dockPos = imSplitter.imSplitterIs.DockedBefore)
		          PresentHelperWindow.spl_slidelist_text.PositionBeforeDock = pos
		        End If
		      End If
		    Else
		      PresentHelperWindow.Left = OSScreen(ControlScreen).Left + (OSScreen(ControlScreen).Width - PresentHelperWindow.Width) / 2
		      PresentHelperWindow.Top = OSScreen(ControlScreen).Top + (OSScreen(ControlScreen).Height - PresentHelperWindow.Height) / 2
		    End If
		    presentScreenAspect = Width / Height
		  End If
		  cnvSlide.Visible = True
		  
		  #if RBVersion >= 2012
		    Position = Self.Bounds.Clone
		  #else
		    Position = New REALbasic.Rect(Left,Top,Width,Height)
		  #endif
		  PositionScreen = PresentScreen
		  PositionScreenBounds = OSScreen(PositionScreen).Bounds
		  PositionScreenHandle = IsOnMonitorHandle()
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
		  'App.DebugWriter.Write "Allocate Picture space"
		  //++
		  // Allocate pictures assuming a FHD (1920 x 1080) display or the actual
		  // display size, whichever is larger.
		  // The Paint events for cnv_slide here and the canvases on the control screens
		  // will scale down if necessary, but the NDI feed gets an image at the full size
		  //--
		  Dim picWidth As Integer
		  Dim picHeight As Integer
		  If App.NDIEnabled Then
		    If presentScreenAspect > 1 Then
		      picWidth = Max(1920, Width)
		      picHeight = Floor(picWidth / presentScreenAspect)
		    Else
		      picHeight = Max(1080, Height)
		      picWidth = Floor(picHeight / presentScreenAspect)
		    End If
		  Else
		    // With NDI disabled we use the actual size to avoid potential bluriness due to scaling
		    picHeight = Height
		    picWidth = Width
		  End If
		  
		  CurrentPicture = New Picture(picWidth, picHeight, 32)
		  LastPicture = New Picture(picWidth, picHeight, 32)
		  PreviewPicture = New Picture(picWidth, picHeight, 32)
		  
		  CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		  CurrentPicture.Graphics.FillRect(0, 0, CurrentPicture.Width, CurrentPicture.Height)
		  LastPicture.Graphics.DrawPicture CurrentPicture, 0, 0
		  PreviewPicture.Graphics.DrawPicture CurrentPicture, 0, 0
		  
		  Dim tmpLogo As Picture
		  Dim tmpMask As Picture
		  Dim logoMask As Picture
		  
		  tmpLogo = SmartML.GetValueP(de, "logo")
		  If tmpLogo <> Nil Then
		    #If RBVersion > 2018.03
		      LogoCache = Self.BitmapForCaching(tmpLogo.Width, tmpLogo.Height)
		      logoMask = Self.BitmapForCaching(tmpLogo.Width, tmpLogo.Height)
		    #Else
		      LogoCache = New Picture(tmpLogo.Width, tmpLogo.Height, 32)
		      logoMask = New PIcture(tmpLogo.Width, tmpLogo.Height, 32)
		    #EndIf
		    
		    LogoCache.Graphics.DrawPicture tmpLogo, _
		    0, 0, LogoCache.Graphics.Width, LogoCache.Graphics.Height, _
		    0, 0, tmpLogo.Width, tmpLogo.Height
		    
		    tmpMask = SmartML.GetValueP(de, "logo_mask")
		    If tmpMask <> Nil Then
		      If (tmpMask.Width <> tmpLogo.Width) Or (tmpMask.Height <> tmpLogo.Height) Then
		        tmpMask = Nil
		      Else
		        logoMask.Graphics.DrawPicture tmpMask, _
		        0, 0, logoMask.Graphics.Width, logoMask.Graphics.Height, _
		        0, 0, tmpMask.Width, tmpMask.Height
		        If logoMask <> Nil Then
		          LogoCache.ApplyMask logoMask
		        End If
		      End If
		    End If
		  End If
		  
		  UpdateStatusNotifiers "starting"
		  
		  If HelperActive Then
		    i = 1
		    
		    slide = SetML.GetSlide(CurrentSet, i)
		    'App.DebugWriter.Write "PresentWindow.Present: GetSlide 1 returned a " + SmartML.GetValue(slide.Parent.Parent, "@type") +_
		    '" with name '" + SmartML.GetValue(slide.Parent.Parent, "@name") + "'"
		    Dim StyleIndex, prevStyleIndex As String
		    Dim prevIsStyleChange As Boolean
		    styleIndex = SmartML.GetValue(slide.Parent.Parent, "style/@setIndex", False)
		    While slide <> Nil
		      SmartML.SetValue(slide, "title", SmartML.GetValue(slide.parent.parent, "title"))
		      SmartML.SetValue(slide, "subtitle", SmartML.GetValue(slide.Parent.Parent, "subtitle"))
		      
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
		      'App.DebugWriter.Write "PresentWindow.Present: GetNextSlide for i = " + cstr(i) + " returned a " + SmartML.GetValue(slide.Parent.Parent, "@type") +_
		      '" with name '" + SmartML.GetValue(slide.Parent.Parent, "@name") + "'"
		    Wend
		    'PresentHelperWindow.lst_all_slides.ListIndex = 0
		  End If
		  
		  'SvA:Trace
		  #if DebugBuild
		    CurrentSet.SaveXml(App.DocsFolder.Child("PresentWPresent.xml"))
		  #endif
		  
		  If StartingSlide > 0 Then
		    //++
		    // Starting slide needs to be adjusted if the presentation options inserts blanks. This needs to take into account ALL blanks
		    // since it is possible to use the /slide:<n> parameter in the REST API for presenting a set.
		    //--
		    If Not StartingSlideIncludesBlanks Then
		      StartingSlide = AdjustSlideOffsetForBlanks(CurrentSet, StartingSlide)
		    End If
		    Call GoSlide(StartingSlide)
		  Else
		    Call GoSetItem(SetListIndex)
		  End If
		  
		  Globals.Status_Presentation = True
		  
		  // Show
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
		    // Bring PresentWindow to front in Single Screen Mode
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
		  Globals.Status_Presentation = True
		  Catch e
		    RuntimeException(e).message = "In PresentWindow.Present: " + e.Message
		    Raise e
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetPaint(slide As XmlNode)
		  Dim slideStyle As SlideStyle
		  Dim w, h As Integer
		  Dim advanceNext As Boolean = False
		  Dim currAppl As String
		  Dim action As String
		  Dim slideGroup As XmlNode
		  Dim lastSlideContentMask As Integer
		  
		  App.DebugWriter.Write CurrentMethodName + " BEGIN", 7
		  
		  lastSlideContentMask = CurrentSlideContentMask
		  If Not IsNull(slide) Then
		    slideGroup = slide.Parent.Parent
		    currAppl = SmartML.GetValue(slideGroup, "@application", False)
		    action = SmartML.GetValue(slideGroup, "@action", False)
		  End If
		  
		  If SetML.IsExternal(PreviousSlide) Then
		    // Check if we need to close the running external.
		    Dim bClose As Boolean = False
		    Dim prevAppl As String = SmartML.GetValue(PreviousSlide, "@application", False)
		    Dim prevHost As String = SmartML.GetValue(PreviousSlide, "@host", False)
		    Dim presFile As FolderItem
		    Dim prevFilename As String = SmartML.GetValue(PreviousSlide, "@_localfilename", False)
		    If prevFilename.Len() = 0 Then
		      If prevAppl = "presentation" Then
		        presFile = SmartML.GetValueFI(PreviousSlide, "@filename")  // get the folderItem with relative file info, if any
		      End If
		      prevFilename = SmartML.GetValue(PreviousSlide, "@filename", False)  // keep prevFilename as stored in the deck in order to compare
		    End If
		    
		    If IsNull(slide) Then
		      bClose = True
		    ElseIf SetML.IsExternal(slide) Then
		      // See if the external in the new slide is equal to the current slide.
		      If (prevAppl <> "") And ( _
		        (currAppl <> prevAppl) Or _
		        (currAppl = "launch") Or _  // prevAppl has one slide per group. Even if an External of the same @application is launched, it likely will be an new instance
		        SmartML.GetValue(slideGroup, "@host", False) <> prevHost Or _
		        action = "stop" Or _
		        (SmartML.GetValue(slideGroup, "@_localfilename", False) <> prevFilename And _
		        SmartML.GetValue(slideGroup, "@filename", False) <> prevFilename)) Then
		        bClose = True
		      End If
		    Else
		      Select Case prevAppl
		      Case "presentation"
		        bClose = True
		      Case "videolan"
		        bClose = m_VideolanController.WaitForPlayback
		      Case "launch"
		        bClose = mExternalSlideWait
		      End Select
		    End If
		    
		    If bClose Then
		      self._IsClosingExternal = True
		      
		      If prevAppl = "presentation" Or prevAppl = "videolan" Then
		        If currAppl <> "presentation" And currAppl <> "videolan" Or (currAppl = "videolan" And action = "stop") Then
		          PresentWindow.Restore()
		          'PresentWindow.Show()
		          'If PresentWindow.HelperActive Then
		          'PresentHelperWindow.SetFocus
		          'End If
		        End If
		      End If
		      
		      Select Case prevAppl
		      Case "presentation"
		        If presFile = Nil Then
		          presFile = PathToFolderItem(prevFilename)
		        End If
		        If Not IsNull(presFile) Then
		          Dim oExtPres As iPresentation = PresentationFactory.GetCachedPresentation(presFile)
		          If Not IsNull(oExtPres) Then
		            Call oExtPres.EndShow()
		          End If
		        End If
		        
		      Case "videolan"
		        m_VideolanController.Stop()
		        
		      Case "launch"
		        #If TargetWin32
		          mExternalSlideWait = False
		          App.DebugWriter.Write CurrentMethodName + " closing 'launch' slide, PID=" + CStr(m_AppLaunchProcess.PID), 7
		          m_AppLaunchProcess.QuitProcess()
		        #Else
		          // Close any running external application instance.
		          mExternalSlideWait = False
		          App.DebugWriter.Write CurrentMethodName + " closing 'launch' slide, PID=" + CStr(m_AppLaunchShell.PID), 7
		          m_AppLaunchShell.Close()
		        #Endif
		        
		      End Select
		      
		      CurrentExternalSlide = 0
		      self._IsClosingExternal = False
		    End If
		  End If
		  
		  If IsNull(slide) Then
		    m_VideolanController.Stop()
		    If m_AppLaunchShell <> Nil And m_AppLaunchShell.IsRunning Then
		      mExternalSlideWait = False
		      m_AppLaunchShell.Close()
		    End If
		    If m_AppLaunchProcess <> Nil And m_AppLaunchProcess.IsRunning Then
		      mExternalSlideWait = False
		      m_AppLaunchProcess.QuitProcess()
		    End If
		    
		    UpdateStatusNotifiers "clear"
		    
		    // what is showing? what is supposed to be showing? All external sources should be closed, so some slide may be showing.
		    CurrentSlideContentMask = (lastSlideContentMask And (Not kSlideContent_BaseMask)) And kSlideContent_Slide
		    Return
		  End If
		  
		  timerAdvance.Enabled = False
		  CurrentSlideContentMask = (lastSlideContentMask And (Not kSlideContent_BaseMask))
		  
		  If SetML.IsExternal(slide) Then
		    _IsSlideChangeExternal = True
		    
		    Select Case currAppl
		    Case "presentation"
		      
		      If mode = "N" then
		        Dim oExtPres As iPresentation = GetPresentationObjFromSlide(slide)
		        If Not IsNull(oExtPres) Then
		          
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
		              If Not IsNull(slide.PreviousSibling) Then
		                Call oExtPres.GotoSlide( presIndex )
		              End If
		            End If
		          End If
		          CurrentExternalSlide = CurrentSlide
		          CurrentSlideContentMask = kSlideContent_Presentation Or (lastSlideContentMask And kSlideContent_Alert)
		          
		          'PresentWindow.Hide()
		          App.MinimizeWindow(PresentWindow)
		        End If
		      Else
		        PresentWindow.Restore()
		        CurrentSlideContentMask = kSlideContent_Slide Or (lastSlideContentMask And kSlideContent_Alert)
		      End If
		      
		      Dim sPreviewImage As String = SmartML.GetValue(slide, "preview", False)
		      If sPreviewImage <> "" Then
		        Dim img As StyleImage = New StyleImage()
		        If img.SetImageFromString( sPreviewImage ) Then
		          Dim g As Graphics
		          img.ImageFit = StyleImage.ObjectFit.contain
		          
		          g = CurrentPicture.Graphics
		          g.DrawingColor = Color.Black
		          g.FillRectangle(0, 0, CurrentPicture.Width, CurrentPicture.Height)
		          img.Draw(g)
		        End If
		      Else
		        CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		        CurrentPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		      End If
		      
		    Case "videolan"
		      If action = "stop" Then
		        m_VideolanController.Stop()
		        advanceNext = True
		      Else
		        If mode = "N" then
		          If m_VideolanController.IsPlaying And CurrentSlide = CurrentExternalSlide Then
		            // The running slide was selected again - just leave it running
		            CurrentSlideContentMask = kSlideContent_Videolan Or (lastSlideContentMask And kSlideContent_Alert)
		          Else
		            m_VideolanController.Stop()
		            
		            Dim params As String = SmartML.GetValue(slideGroup, "@videolan_parameters")
		            Dim waitForPlayback As Boolean = SmartML.GetValueB(slideGroup, "@wait_to_finish")
		            
		            // First check if there is a 'local' filename (a saved embedded media file)
		            Dim mediaFilename As String = SmartML.GetValue(slideGroup, "@_localfilename", False)
		            If mediaFilename.Len = 0 Then
		              Dim mediaFile As FolderItem = SmartML.GetValueFI(slideGroup, "@filename")
		              If mediaFile = Nil Then
		                mediaFilename = SmartML.GetValue(slideGroup, "@filename", False)
		              Else
		                mediaFilename = mediaFile.NativePath
		              End If
		            End If
		            
		            Dim fullScreen As Boolean = PresentationMode <> MODE_PREVIEW
		            If m_VideolanController.Start(mediaFilename, params, presentScreen, waitForPlayback, fullScreen) Then
		              CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		              CurrentPicture.Graphics.FillRect(0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height)
		              
		              'PresentWindow.Hide()
		              App.MinimizeWindow(PresentWindow)
		              
		              advanceNext = Not waitForPlayback
		              CurrentExternalSlide = CurrentSlide
		              CurrentSlideContentMask = kSlideContent_Videolan Or (lastSlideContentMask And kSlideContent_Alert)
		            End If
		          End If
		        End If
		      End If
		    Case "launch"
		      If action = "stop" Then
		        mExternalSlideWait = False
		        If m_AppLaunchProcess <> Nil And m_AppLaunchProcess.IsRunning Then
		          m_AppLaunchProcess.QuitProcess()
		        End If
		        If m_AppLaunchShell <> Nil And m_AppLaunchShell.IsRunning Then
		          m_AppLaunchShell.Close
		        End If
		        advanceNext = True
		      Else
		        If mode = "N" then
		          Dim launchAppLocation As FolderItem
		          Dim cmd As String
		          Dim params As String
		          
		          If CurrentExternalSlide <> CurrentSlide Then
		            #If TargetWin32
		              If m_AppLaunchProcess.IsRunning Then
		                mExternalSlideWait = False
		                m_AppLaunchProcess.QuitProcess
		              End If
		            #Else
		              If m_AppLaunchShell.IsRunning Then
		                'Close any running external application instance.
		                mExternalSlideWait = False
		                m_AppLaunchShell.Close()
		              End If
		            #Endif
		            CurrentExternalSlide = 0
		          End If
		          
		          If CurrentExternalSlide <> CurrentSlide Then
		            launchAppLocation = SmartML.GetValueFI(slideGroup, "@app_filename")
		            If launchAppLocation = Nil Then
		              cmd = SmartML.GetValue(slideGroup, "@app_filename", False)
		              cmd = cmd.Trim
		            End If
		            
		            params = SmartML.GetValue(slideGroup, "@app_parameters", False)
		            If params.Trim = "" Then params = ""
		            
		            #If TargetWin32
		              If launchAppLocation <> Nil And launchAppLocation.Exists() Then
		                cmd = launchAppLocation.NativePath
		              Else
		                If cmd <> "" Then
		                  If cmd.Instr(" ") <> 0 Then
		                    cmd = """" + cmd + """"
		                  End If
		                  If params.Trim = "" Then
		                    params = cmd
		                  Else
		                    params = cmd + " " + params
		                  End If
		                End If
		              End If
		            #Else
		              If launchAppLocation <> Nil And launchAppLocation.Exists() Then
		                cmd = launchAppLocation.ShellPath()
		              End If
		            #Endif
		            
		            If SmartML.GetValueB(slideGroup, "@wait_to_finish", False) = True Then
		              mExternalSlideWait = True
		            Else
		              advanceNext = True
		            End If
		            
		            If cmd <> "" Or params <> "" Then
		              #If TargetWin32
		                If m_AppLaunchProcess.CreateProcess(cmd, params, AddressOf PresentWindowLaunchAppExitCallback) And m_AppLaunchProcess.PID <> 0 Then
		                  CurrentExternalSlide = CurrentSlide
		                  CurrentSlideContentMask = kSlideContent_Launch Or (lastSlideContentMask And kSlideContent_Alert)
		                End If
		                App.DebugWriter.Write CurrentMethodName + " 'launch' slide; PID=" + CStr(m_AppLaunchProcess.PID), 7
		              #Else
		                m_AppLaunchShell.Mode = 1 'Asynchronous
		                m_AppLaunchShell.TimeOut = -1
		                m_AppLaunchShell.Execute(cmd, params)
		                App.DebugWriter.Write CurrentMethodName + " 'launch' slide; PID=" + CStr(m_AppLaunchShell.PID), 7
		                If m_AppLaunchShell.IsRunning Then
		                  CurrentExternalSlide = CurrentSlide
		                  CurrentSlideContentMask = kSlideContent_Launch Or (lastSlideContentMask And kSlideContent_Alert)
		                End If
		              #Endif
		            End If
		            
		            CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		            CurrentPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		          End If
		        End If
		      End If
		    End Select
		    
		    Dim external_did_draw As Boolean = m_ExternalRenderer.Render(PreviewPicture.Graphics, slide, PresentWindow.CurrentSlide)
		    If Not external_did_draw Then
		      SetML.DrawSlide(PreviewPicture.Graphics, slide, Nil)
		    End If
		    
		    _IsSlideChangeExternal = False
		  Else
		    
		    If SmartML.GetValue(slideGroup, "@type", False) = "song" Then
		      SongSetDisplayed(slide)
		    End If
		    
		    // Remember the current (old) slide for the transition
		    LastPicture.Graphics.DrawPicture CurrentPicture, 0, 0
		    
		    Profiler.BeginProfilerEntry "PresentWindow::ResetPaint::PreviewPicture"
		    
		    // === Draw the slide to the PreviewPicture ===
		    m_updatingSlide = True
		    
		    slideStyle = SetML.GetSlideStyle(slide, StyleDict)
		    
		    Dim external_did_draw As Boolean = m_ExternalRenderer.Render(PreviewPicture.Graphics, slide, PresentWindow.CurrentSlide)
		    If Not external_did_draw Then
		      SetML.DrawSlide PreviewPicture.Graphics, slide, slideStyle
		    End If
		    CurrentSlideContentMask = kSlideContent_Slide Or (lastSlideContentMask And kSlideContent_Alert)
		    
		    curslideTransition = SetML.GetSlideTransition(slide)
		    
		    Profiler.EndProfilerEntry'
		    
		    // === Setup CurrentPicture based on Mode ===
		    Profiler.BeginProfilerEntry "PresentWindow::ResetPaint::CurrentPicture"
		    If Mode = "B" Then
		      CurrentPicture.Graphics.ForeColor = RGB(0,0,0)
		      CurrentPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		      SaveVMixXML(Nil)
		      SaveSlideTextFile(Nil)
		      XVisibleSlide = XCurrentSlide
		      CurrentSlideContentMask = CurrentSlideContentMask Or kSlideContent_Black
		    ElseIf Mode = "W" Then
		      CurrentPicture.Graphics.ForeColor = RGB(255,255,255)
		      CurrentPicture.Graphics.FillRect 0, 0, CurrentPicture.Graphics.Width, CurrentPicture.Graphics.Height
		      SaveVMixXML(Nil)
		      SaveSlideTextFile(Nil)
		      XVisibleSlide = XCurrentSlide
		      CurrentSlideContentMask = CurrentSlideContentMask Or kSlideContent_White
		    ElseIf Mode = "H" Or Mode = "L" Then
		      SetML.DrawSlide CurrentPicture.Graphics, Nil, slideStyle
		      SaveVMixXML(Nil)
		      SaveSlideTextFile(Nil)
		      XVisibleSlide = XCurrentSlide
		      CurrentSlideContentMask = CurrentSlideContentMask Or kSlideContent_Hidden
		      
		      If Mode = "L" Then
		        If LogoCache <> Nil Then
		          If LogoCache.Height > CurrentPicture.Height Then
		            // Logos only shrink if needed; they will not stretch out
		            h = CurrentPicture.Height
		            w = (CurrentPicture.Height/LogoCache.Height) * LogoCache.Width
		          Else
		            h = LogoCache.Height
		            w = LogoCache.Width
		          End If
		          CurrentPicture.Graphics.DrawPicture LogoCache, (CurrentPicture.Width - w) / 2, (CurrentPicture.Height - h) / 2, w, h, 0, 0, LogoCache.Width, LogoCache.Height
		          CurrentSlideContentMask = CurrentSlideContentMask Or kSlideContent_Logo
		        End If
		      End If
		    ElseIf Mode = "F" Then
		      // Freeze: no changes to CurrentPicture
		      CurrentSlideContentMask = CurrentSlideContentMask Or kSlideContent_Frozen
		    Else  // Probably normal mode
		      CurrentPicture.Graphics.DrawPicture PreviewPicture, 0, 0
		      If slide <> Nil Then
		        SaveVMixXML(slide)
		        SaveSlideTextFile(slide)
		      End If
		      If m_Snapshots Then
		        m_snapshotThread.Export CurrentSlide, PreviewPicture, slide, slideStyle
		      End If
		      XVisibleSlide = XCurrentSlide
		    End If
		    Profiler.EndProfilerEntry
		    
		    // === Add the Alert ===
		    If Len(AlertText) > 0 Then
		      DrawAlert CurrentPicture.Graphics, AlertText
		      DrawAlert PreviewPicture.Graphics, AlertText
		      CurrentSlideContentMask = CurrentSlideContentMask Or kSlideContent_Alert
		    End If
		    
		    // === Check for auto-advance ===
		    If SmartML.GetValueN(XCurrentSlide.Parent.Parent, "@seconds", True) > 0 Then
		      timerAdvance.Mode = Timer.ModeSingle
		      timerAdvance.Period = SmartML.GetValueN(XCurrentSlide.Parent.Parent, "@seconds", True) * 1000
		      timerAdvance.Reset
		      timerAdvance.Enabled = True
		    Else
		      timerAdvance.Enabled = False
		    End If
		    
		    // === Start the transition ===
		    If (doTransition And (curslideTransition = SlideTransitionEnum.ApplicationDefault)) Or (curslideTransition = SlideTransitionEnum.UseTransition) Then
		      TransitionFrame = 0
		      timerTransition.Mode = Timer.ModeMultiple
		      timerTransition.Reset
		      timerTransition.Enabled = True
		      #if DebugBuild then
		        App.DebugWriter.Write "Slide Transision Start: Frames=" + Str(TransitionFrames) + " Period=" + Str(timerTransition.Period), 8
		      #endif
		      // don't refresh the cnvSlide here and now. The timer will do it, once this processing is back in the event loop
		      // the delay until the transition starts is accepted for a smother transition 
		    Else
		      TransitionFrame = TransitionFrames
		      cnvSlide.Refresh False
		    End If
		    
		    m_updatingSlide = False
		  End If
		  
		  UpdateStatusNotifiers "change"
		  
		  // Keep a copy of this slide to be able do a cleanup when a next slide is shown
		  // A 'next' slide is always set in XCurrentSlide before this method is called and can therefore not be used for this purpose
		  PreviousSlide = slide.Parent.Parent.Clone( False )
		  PreviousSlide.AppendChild( slide.Parent.Clone( False ) ).AppendChild( slide.Clone( False ) )
		  
		  If advanceNext Then
		    App.DebugWriter.Write CurrentMethodName + " perform ACTION_NEXT_SLIDE", 6
		    Call PerformAction(ACTION_NEXT_SLIDE)
		  End If
		  App.DebugWriter.Write CurrentMethodName + " CurrentSlide = " + CurrentSlide.ToString + " CurrentExternalSlide = " + CurrentExternalSlide.ToString, 7
		  App.DebugWriter.Write CurrentMethodName + " END", 7
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveSlideTextFile(slide As XmlNode)
		  If Not App.MainPreferences.GetValueB(prefs.kSlideTextOutputOptionsEnabled) Then Return
		  
		  Dim elements() As String
		  Dim textFile As FolderItem
		  
		  textFile = App.MainPreferences.GetValueFI(Prefs.kSlideTextOutputFile, Nil, False)
		  If textFile = Nil Then Return
		  
		  If slide <> Nil Then
		    If App.MainPreferences.GetValueB(prefs.kSlideTextOutputOptionsTitle) Then
		      elements.Append SmartML.GetValue(slide, "title", False)
		    End If
		    
		    If App.MainPreferences.GetValueB(prefs.kSlideTextOutputOptionsSubTitle) Then
		      elements.Append SmartML.GetValue(slide, "subtitle", False)
		    End If
		    
		    If App.MainPreferences.GetValueB(prefs.kSlideTextOutputOptionsBody) Then
		      elements.Append SmartML.GetValue(slide, "body", False)
		    End If
		  End If
		  
		  Dim output As String
		  Select Case elements.Ubound
		  Case 0
		    output = elements(0)
		  Case Is > 0
		    output = Join(elements, DecodeHex(App.MainPreferences.GetValue(prefs.kSlideTextOutputOptionsSeparator)))
		  End Select
		  
		  Try
		    Dim outputStream As BinaryStream
		    If textFile.Exists Then
		      outputStream = BinaryStream.Open(textFile, True)
		      outputStream.Position = 0
		    Else
		      outputStream = BinaryStream.Create(textFile)
		    End If
		    outputStream.Write output
		    outputStream.Length = outputStream.BytePosition
		    outputStream.Flush
		    outputStream.Close
		  Catch ex
		    App.DebugWriter.Write CurrentMethodName + ": Could not save " + textFile.NativePath, 1
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveVMixXML(slide As XmlNode)
		  If Not App.MainPreferences.GetValueB(prefs.kvMixEnable) Then Return
		  
		  Dim vMixFile As FolderItem
		  Dim xDoc As New XmlDocument
		  Dim n As XmlNode
		  n = xdoc.AppendChild(xdoc.CreateElement("slide"))
		  n.AppendChild(xdoc.CreateElement("title"))
		  n.AppendChild(xdoc.CreateElement("subtitle"))
		  n.AppendChild(xdoc.CreateElement("body"))
		  
		  If slide <> Nil Then
		    SmartML.SetValue(n, "title", SmartML.GetValue(slide, "title", False))
		    SmartML.SetValue(n, "subtitle", SmartML.GetValue(slide, "subtitle", False))
		    SmartML.SetValue(n, "body", SmartML.GetValue(slide, "body", False))
		  End If
		  
		  vMixFile = App.MainPreferences.GetValueFI(Prefs.kVmixLocation, App.DocsFolder)
		  If vMixFile = Nil Then vMixFile = App.DocsFolder
		  
		  vMixFile = vMixFile.Child("VMixOpenSong.xml")
		  
		  Try
		    xDoc.SaveXml vMixFile
		  Catch ex
		    App.DebugWriter.Write CurrentMethodName + ": Could not save " + vMixFile.NativePath, 1
		  End Try
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
		  If Mode <> "B" Then
		    Mode = "B"
		  Else
		    Mode = "N"
		  End If
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
		  if Mode <> "F" then
		    Mode = "F"
		  else
		    Mode = "N"
		  end if
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
		  if Mode <> "H" then
		    Mode = "H"
		  else
		    Mode = "N"
		  end if
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
		  if Mode <> "W" then
		    Mode = "W"
		  else
		    Mode = "N"
		  end if
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
		CurrentExternalSlide As Integer
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

	#tag Property, Flags = &h0
		#tag Note
			This property shall be set to inform it's user what should be visible on the presentation screen
		#tag EndNote
		CurrentSlideContentMask As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected curslideTransition As SlideTransitionEnum
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected doTransition As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mExternalSlideWait
			End Get
		#tag EndGetter
		ExternalSlideWait As Boolean
	#tag EndComputedProperty

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

	#tag Property, Flags = &h21
		Private mExternalSlideWait As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPresentationMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_AppLaunchProcess As Win32Process
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

	#tag Property, Flags = &h21
		Private PositionScreenBounds As REALbasic.Rect
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PositionScreenHandle As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPresentationMode
			End Get
		#tag EndGetter
		PresentationMode As Integer
	#tag EndComputedProperty

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

	#tag Property, Flags = &h0
		StyleDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TransitionClock As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		TransitionFrame As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TransitionFrames As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If XVisibleSlide = Nil Then Return -1
			  Dim path As String = XVisibleSlide.XPath
			  Dim xSlides As XmlNodeList
			  Dim slideNumber As Integer
			  
			  xSlides = CurrentSet.Xql("/set/slide_groups/slide_group/slides/slide")
			  
			  slideNumber = -1
			  
			  For i As Integer = 1 To xSlides.Length
			    Dim xSlide As XmlNode = xSlides.Item(i - 1)
			    If xSlide <> Nil And xSlide.XPath = path Then
			      slideNumber = i
			      Exit For
			    End If
			  Next
			  
			  Return slideNumber
			End Get
		#tag EndGetter
		VisibleSlideIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		XCurrentSlide As XmlNode
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 52657475726E732074686520586D6C4E6F6465206F662074686520736C6964652063757272656E746C792073686F776E206F6E207468652070726573656E746174696F6E2077696E646F772E204D617920626520646966666572656E74207468616E205843757272656E74536C69646520696620746865206D6F6465206973206E6F74204E6F726D616C2E
		Private XVisibleSlide As XmlNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _IsClosingExternal As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _IsSlideChangeExternal As Boolean = False
	#tag EndProperty


	#tag Constant, Name = ACTION_ADVANCE_SLIDE, Type = Integer, Dynamic = False, Default = \"1025", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_ALERT, Type = Integer, Dynamic = False, Default = \"1023", Scope = Public
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

	#tag Constant, Name = ACTION_RETRACT_SLIDE, Type = Integer, Dynamic = False, Default = \"1026", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ACTION_SLIDE, Type = Integer, Dynamic = False, Default = \"1022", Scope = Public
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

	#tag Constant, Name = kSlideContent_Alert, Type = Double, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_BaseMask, Type = Double, Dynamic = False, Default = \"&h0F", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_Black, Type = Double, Dynamic = False, Default = \"&h10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_Frozen, Type = Double, Dynamic = False, Default = \"&h100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_Hidden, Type = Double, Dynamic = False, Default = \"&h40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_Launch, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_Logo, Type = Double, Dynamic = False, Default = \"&h80", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_Presentation, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_Slide, Type = Double, Dynamic = False, Default = \"1", Scope = Public, Description = 43757272656E74506963747572652C207265676172646C657373206F662069742773206F726967696E
	#tag EndConstant

	#tag Constant, Name = kSlideContent_Videolan, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSlideContent_White, Type = Double, Dynamic = False, Default = \"&h20", Scope = Public
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
		    If PresentHelperWindow.IsWindowMinimized Then
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
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  If Not Globals.Status_Presentation Then Return
		  #Pragma BreakOnExceptions False
		  #Pragma DisableBackgroundTasks
		  
		  Dim myNDI As NDI
		  If App.NDIEnabled Then
		    myNDI = NDI.NDI
		  End If
		  
		  Dim inTransition As Boolean
		  If TransitionFrames >= TransitionFrame Then
		    If curslideTransition = SlideTransitionEnum.UseTransition Then
		      inTransition = True
		    ElseIf curslideTransition = SlideTransitionEnum.ApplicationDefault Then
		      inTransition = doTransition
		    End If
		  End If
		  
		  If inTransition Then
		    Profiler.BeginProfilerEntry "PresentWindow::Repaint Timer::Blit"
		    
		    Dim transparency As Double
		    transparency = (TransitionFrames - TransitionFrame) / (TransitionFrames - TransitionFrame + 1)
		    #if RBVersion >= 2016.04 then
		      LastPicture.Graphics.Transparency = transparency * 100.0
		    #else
		      transparency = 255 * transparency
		      CurrentPicture.Mask.Graphics.ForeColor = rgb(transparency, transparency, transparency)
		      CurrentPicture.Mask.Graphics.FillRect(0, 0, CurrentPicture.Mask.Graphics.Width, CurrentPicture.Mask.Graphics.Height)
		    #endif
		    LastPicture.Graphics.DrawPicture CurrentPicture, 0, 0, LastPicture.Width, LastPicture.Height, 0, 0, CurrentPicture.Width, CurrentPicture.Height
		    g.DrawPicture LastPicture, 0, 0, g.Width, g.Height, 0, 0, LastPicture.Width, LastPicture.Height
		    If App.NDIEnabled And myNDI <> Nil Then
		      myNDI.NDI.SendImage LastPicture
		    End If
		    Profiler.EndProfilerEntry
		    If TransitionFrame = TransitionFrames Then
		      // This frame is the first fully transitioned one.
		      // The code above made sure that both, CurrentPicture, and LastPicture contain the now presenting slide
		      // after the transition has completed.
		      // Next time the else part will be taken and CurrentPicture is correctly set up to be used there.
		      // Also, LastPicture is ready as the starting point for the next transition
		      TransitionFrame = TransitionFrame + 1
		    End If
		  Else
		    g.DrawPicture CurrentPicture, 0, 0, g.Width, g.Height, 0, 0, CurrentPicture.Width, CurrentPicture.Height
		    If App.NDIEnabled And myNDI <> Nil Then
		      myNDI.NDI.SendImage CurrentPicture
		    End If
		  End If
		  
		  //++
		  // EMP: handle any exceptions by ignoring them.
		  // This corrects an issue seen when changing the SButton style
		  // after a presentation and for some reason this window is still open
		  //--
		  Catch ex
		    App.DebugWriter.Write(CurrentMethodName + ": " + ex.ToString, 1)
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
		  
		  If TransitionFrame = 0 Then
		    TransitionClock = System.Microseconds - Me.Period * 1000
		  End If
		  Dim timePassed As Integer = CType(System.Microseconds - TransitionClock, Integer)
		  TransitionFrame = TransitionFrame + 1
		  If TransitionFrames > 12 Then
		    // If there are view transition frames, carry them out even if delayed
		    // else skip those that are more than a Period delayed
		    Dim expectedFrame As Integer
		    expectedFrame = Floor(timePassed / 1000 / Me.Period)
		    If expectedFrame > TransitionFrame Then
		      If expectedFrame > TransitionFrames Then
		        TransitionFrame = TransitionFrames
		      Else
		        TransitionFrame = expectedFrame
		      End If
		      #if DebugBuild then
		        App.DebugWriter.Write "Slide Transision: skipping frames", 8
		      #endif
		    End If
		  End If
		  
		  If TransitionFrame = TransitionFrames Then
		    Me.Enabled = False
		    Me.Reset
		  End If
		  
		  #if DebugBuild then
		    App.DebugWriter.Write "Slide Transision: Frame=" + Str(TransitionFrame) + " Time=" + Str(timePassed), 8
		  #endif
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
		  If Self.IsWindowMinimized Then Return
		  
		  Dim currentPosition As REALbasic.Rect
		  #if RBVersion >= 2012
		    currentPosition = Self.Bounds.Clone
		  #else
		    currentPosition = New REALbasic.Rect(Left,Top,Width,Height)
		  #endif
		  
		  If currentPosition = Position Then Return
		  
		  If PositionScreenHandle <> 0 Then
		    // is the handle still valid? If so, some other screen changed, we need to re-position the window and adjust the saved position
		    Dim i, cnt As Integer
		    cnt = MonitorCount
		    For i = 0 To cnt - 1
		      If MonitorHandle(i) = PositionScreenHandle Then
		        // yes, we found it. Place the window there
		        PositionChanging = True
		        PositionSaved = False
		        
		        If Not IsOnMonitorHandle = PositionScreenHandle Then
		          FullScreen = False
		          PutOnMonitorIndex(i)
		        End If
		        FullScreen = True
		        FitOnMonitor(PositionScreenHandle)
		        
		        #if RBVersion >= 2012
		          Position = Self.Bounds.Clone
		        #else
		          Position = New REALbasic.Rect(Left,Top,Width,Height)
		        #endif
		        PositionScreen = IsOnScreen
		        PositionScreenBounds = OSScreen(PositionScreen).Bounds
		        PositionChanging = False
		        PositionSaved = True
		        
		        Return
		      End If
		    Next i
		  End If
		  
		  If PositionScreen > OSScreenCount - 1 Then Return
		  
		  Dim screenPosition As REALbasic.Rect = OSScreen(PositionScreen).Bounds
		  If screenPosition = PositionScreenBounds Then
		    App.DebugWriter.Write CurrentMethodName + ": Attempting to reposition to " + screenPosition.ToString
		    #if RBVersion >= 2012
		      Self.Bounds = Position
		    #else
		      Left = Position.Left
		      Top = Position.Top
		      Width = Position.Width
		      Height = Position.Height
		    #endif
		    Dim monitorIndex As Integer = IsOnMonitorIndex
		    If Not FullScreen Then 
		      FullScreen = True
		    End If
		    // Xojo's FullScreen is broken. It may get the window's position and / or size wrong on Windows. 
		    // Positioning while in FullScreen might not work at all. This should fix it
		    FitOnMonitorIndex(monitorIndex)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AlertText"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlScreen"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentExternalSlide"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentSlide"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="ExternalSlideWait"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelperActive"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LastPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LogoCache"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Mode"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="NumberOfItems"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PresentationMode"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PresentScreen"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PreviewPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TransitionFrame"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="VisibleSlideIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentSlideContentMask"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
