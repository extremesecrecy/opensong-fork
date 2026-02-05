#tag Window
Begin Window SongPickerWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   555
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   1046
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   450
   MinimizeButton  =   True
   MinWidth        =   350
   Placement       =   0
   Resizeable      =   True
   Title           =   "Song Lookup"
   Visible         =   True
   Width           =   436
   Begin Label txt_explanation_header
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   62
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "To add a song, click the song title below and click the ""Add"" button. If you know the name of the song you can type it into the Quick Lookup field, and click ""Add"" or press Enter. Or you can click Search(Ctrl+F) to search song, Ctrl+G to repeat search . You can also double-click on the song name to add it."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   5
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   396
   End
   Begin Label lbl_select_folder
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   14
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Select Folder:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   197
   End
   Begin SPopupMenu pop_select_folder
      AutoDeactivate  =   True
      Bold            =   False
      Changing        =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   12
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   89
      Underline       =   False
      Visible         =   True
      Width           =   206
   End
   Begin Label lbl_quick_lookup
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   14
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   228
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Quick Lookup:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   171
   End
   Begin SEditField edt_quick_lookup
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   228
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   89
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   179
   End
   Begin ListBox lst_all_songs
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "66%,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   171
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Song	Path"
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   121
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   406
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin SmartSplitter SmartSplitter1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DisableLiveDrag =   False
      doNotAttachEmbeddedControls=   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      handleCount     =   0
      handleDimple    =   False
      handleLarge     =   False
      Height          =   9
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaxLimit        =   0
      MaxLimitOffset  =   0
      MinLimit        =   0
      MinLimitOffset  =   0
      Scope           =   0
      showWarningsDialogs=   False
      StayProportional=   False
      StopAtMaxOffset =   False
      StopAtMinOffset =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   296
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   406
   End
   Begin Label lbl_song_preview
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Preview:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   315
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin TextArea edt_preview
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   111
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   339
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   408
   End
   Begin Label lbl_presentation
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   "Custom Presentation Order:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   458
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   170
   End
   Begin TextField edt_order
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   475
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   197
   End
   Begin Label lbl_origorder
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   221
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "Original Presentation Order:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   458
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin TextField edt_origorder
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   221
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   475
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   186
   End
   Begin PushButton btn_add
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Add"
      Default         =   False
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   248
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   515
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton btn_done
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Done"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   329
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   515
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Timer timerLookup
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   443
      LockedInPosition=   False
      Mode            =   2
      Period          =   1500
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
   Begin PushButton btn_search
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Search"
      Default         =   False
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   513
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label lbl_found_text
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   221
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      Text            =   "Found text in:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   315
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   197
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  If Not AddSong Then
		    f = Nil
		    PresentationOrder = ""
		  Else
		    PresentationOrder = Uppercase(Trim(edt_order.Text))
		  End If
		  
		  Globals.Status_SongPickerOpen = False
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Keyboard.AsyncControlKey Then
		    If Keyboard.AsyncKeyDown(&h03) Then 'Ctrl+F
		      Find
		    ElseIf Keyboard.AsyncKeyDown(&h05) Then 'Ctrl+G
		      FindNext
		    End If
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  '++JRC
		  CurrentSel = -1
		  '--
		  Call MainWindow.Songs.GetFolders(pop_select_folder)
		  
		  If Globals.CurrentSongPickerFolder = "" Then
		    pop_select_folder.ListIndex = 0
		  Else
		    For x As Integer = 0 to pop_select_folder.ListCount - 1
		      If Globals.CurrentSongPickerFolder = pop_select_folder.List(x) Then
		        pop_select_folder.ListIndex = x
		        Exit
		      End If
		    Next
		  End If
		  
		  '++JRC
		  SongFolderSel = pop_select_folder.ListIndex
		  
		  Find = New FindClass
		  '--
		  App.T.TranslateWindow Me, "song_lookup", App.TranslationFonts
		  App.CenterInControlScreen Me
		  lst_all_songs.ListIndex = 0
		  edt_quick_lookup.SetFocus()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  'HSizer.Resize
		  SmartSplitter1.behave
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  SmartSplitter1.behave
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  // Set this before calling the Window constructor
		  // because the Open event will fire then
		  If Globals.CurrentSongPickerFolder = "" Then
		    Globals.CurrentSongPickerFolder = Globals.CurrentSongFolder
		  End If
		  // Make sure for proper initialisation
		  SongFolderSel = -1
		  
		  // call the Window constructor, or Open events will not fire
		  Super.Window()
		  
		  HSizer = New HalfSizer(self)
		  
		  HSizer.AddHeight lst_all_songs, .5
		  HSizer.AddTop lbl_select_folder, .5
		  HSizer.AddTop lbl_song_preview, .5
		  HSizer.AddTop edt_quick_lookup, .5
		  HSizer.AddLeftWidth edt_quick_lookup, 0, 1.0
		  HSizer.AddLeftTop lbl_quick_lookup, 0, .5
		  HSizer.AddTop pop_select_folder, .5
		  HSizer.AddWidth pop_select_folder, 0
		  HSizer.AddTopHeight edt_preview, .5, .5
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Find()
		  App.DebugWriter.Write "SongPickerWindow.Find: Enter"
		  If FindWindow.Popup(Find) Then
		    FindStartSong = lst_all_songs.ListIndex
		    App.DebugWriter.Write "SongPickerWindow.Find: FindStartSong = " + Str(lst_all_songs.ListIndex)
		    FindNext
		  End If
		  App.DebugWriter.Write "SongPickerWindow.Find: Exit"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FindNext()
		  App.DebugWriter.Write "MainWindow.FindNext: Enter"
		  '++JRC
		  If Find.FindString.Len = 0 And NOT find.FindChord Then
		    Find
		    Return
		  End If
		  
		  Dim t as String
		  Dim s As XmlDocument
		  Dim i As Integer
		  Dim f As FolderItem
		  Dim found As Boolean = False 'RectControl = Nil
		  Dim edtFound As TextEdit
		  
		  '++JRC
		  Dim ChordKey As String
		  Dim ChordForm As String
		  Dim c As String
		  Dim chords() As String
		  Dim pos As Integer
		  
		  ChordKey = find.ChordKey
		  ChordForm = find.ChordForm
		  '--
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  'If Status_SongChanged Then ActionSongSave True ' updates CurrentSong but doesn't write it to file
		  'If pge_controls.Value <> 0 Then SetMode 0
		  
		  '++JRC Redundant
		  'If Len(t) = 0  Then Return
		  
		  If lst_all_songs.ListCount() > 0 Then
		    i = lst_all_songs.ListIndex
		    If i < 0 Then
		      i = 0 ' if there is no song selected, select the first
		      If FindStartSong < 0 Then FindStartSong = 0 //By implication, if i<0, this is too
		      App.DebugWriter.Write("MainWindow.FindNext: Open " + str(i) + " " +  lst_all_songs.CellTag(i, 0).StringValue + lst_all_songs.List(i))
		      f = MainWindow.Songs.GetFile(lst_all_songs.CellTag(i, 0).StringValue + lst_all_songs.List(i))
		      If f = Nil Or Not f.Exists Then
		        App.MouseCursor = Nil
		        InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(MainWindow.Songs.ErrorCode)+"']", lst_all_songs.List(i))
		        Return
		      End If
		      s = SmartML.XDocFromFile(f)
		    Else
		      s = CurrentSong
		    End If
		    
		    //++
		    // Bug 1089442: Catch s = Nil.  Unlikely to happen, but possible if i < 0 and the first document isn't valid
		    //
		    // For the moment, just error and return.  Could be avoided by splitting out the code that opens the song
		    // files and determines when done (i.e., XmlDocument = GetNextSong( ByRef i, FindStartSong ))
		    //--
		    If s = Nil Then
		      App.MouseCursor = Nil
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(MainWindow.Songs.ErrorCode)+"']", lst_all_songs.List(i))
		      Return
		    End If
		    
		    ProgressWindow.SetProgress 0
		    ProgressWindow.lbl_status.Text =  App.T.Translate("progress_status/song_search") + "..."
		    ProgressWindow.Show()
		    
		    While found = False And i < lst_all_songs.ListCount
		      ProgressWindow.SetProgress (i+1) / lst_all_songs.ListCount * 100
		      ProgressWindow.SetStatus lst_all_songs.List(i)
		      
		      If find.FindTitle And find.IsMatch(SmartML.GetValue(s.DocumentElement, "title")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kTitle
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "title"))
		      ElseIf find.FindAuthor And find.IsMatch(SmartML.GetValue(s.DocumentElement, "author")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kAuthor
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "author"))
		      ElseIf find.FindCopyright And find.IsMatch(SmartML.GetValue(s.DocumentElement, "copyright")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kCopyright
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "copyright"))
		      ElseIf find.FindCCLI And find.IsMatch(SmartML.GetValue(s.DocumentElement, "ccli")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kCCLI
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "ccli"))
		      ElseIf find.FindPresentation And find.IsMatch(SmartML.GetValue(s.DocumentElement, "presentation")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kPresentation
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "presentation"))
		      ElseIf find.FindLyrics And find.IsMatch(SmartML.GetValue(s.DocumentElement, "lyrics")) > 0 And (i <> lst_all_songs.ListIndex  Or ( (edt_preview.SelStart+edt_preview.SelLength = 0 Or InStr(edt_preview.SelStart+edt_preview.SelLength+1, Lowercase(edt_preview.Text), t) > 0) ) ) Then
		        found = True
		        find.Found = find.kLyrics
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "lyrics"))
		      ElseIf find.FindThemes And find.IsMatch(SmartML.GetValue(s.DocumentElement, "theme")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kThemes
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "theme"))
		      ElseIf find.FindTimeSig And find.IsMatch(SmartML.GetValue(s.DocumentElement, "time_sig")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kTimeSig
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "time_sig"))
		      ElseIf find.FindTempo And find.IsMatch(SmartML.GetValue(s.DocumentElement, "tempo")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kTempo
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "tempo"))
		      ElseIf find.FindKey And find.IsMatch(SmartML.GetValue(s.DocumentElement, "key")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kKey
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "key"))
		      ElseIf find.FindAKA And find.IsMatch(SmartML.GetValue(s.DocumentElement, "aka")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kAKA
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "aka"))
		      ElseIf find.FindKeyLine And find.IsMatch(SmartML.GetValue(s.DocumentElement, "key_line")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kKeyLine
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "key_line"))
		      ElseIf find.FindUser1 And find.IsMatch(SmartML.GetValue(s.DocumentElement, "user1")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kUser1
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "user1"))
		      ElseIf find.FindUser2 And find.IsMatch(SmartML.GetValue(s.DocumentElement, "user2")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kUser2
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "user2"))
		      ElseIf find.FindUser3 And find.IsMatch(SmartML.GetValue(s.DocumentElement, "user3")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kUser3
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "user3"))
		      ElseIf find.FindHymnNumber And find.IsMatch(SmartML.GetValue(s.DocumentElement, "hymn_number")) > 0 And (i <> lst_all_songs.ListIndex Or find.FoundPos = 0  ) Then
		        found = True
		        find.Found = find.kHymnNumber
		        find.FoundPos = find.IsMatch(SmartML.GetValue(s.DocumentElement, "hymn_number"))
		        
		      ElseIf find.FindChord  Then
		        
		        pos = SongML.FindChord(s.DocumentElement, ChordKey, ChordForm, (edt_preview.SelStart + edt_preview.SelLength + 1), c)
		        If pos > 0 Then
		          found = True
		          find.Found = find.kChord
		          find.FoundPos = InStr(Lowercase(SmartML.GetValue(s.DocumentElement, "hymn_number")), t)
		          
		          If lst_all_songs.ListIndex <> i Then lst_all_songs.ListIndex = i
		          edt_preview.SelStart = (pos - c.Len - 1)
		          edt_preview.SelLength = c.Len
		          
		          t = c
		        Else
		          found = False
		        End If
		        
		        '--
		      End If
		      
		      If found Then
		        If lst_all_songs.ListIndex <> i Then lst_all_songs.ListIndex = i
		        
		        SetFoundInText
		        
		        If find.Found = find.kLyrics Or find.Found = find.kChord Then
		          If edt_preview.SelStart+edt_preview.SelLength = 0 Then
		            edt_preview.SelStart = InStr(Lowercase(edt_preview.Text), t) - 1
		          Else
		            edt_preview.SelStart = InStr(edt_preview.SelStart+edt_preview.SelLength+1, Lowercase(edt_preview.Text), t) - 1
		          End If
		          edt_preview.SelLength = t.Len 'find.FindString.Len
		        Else
		          
		        End If
		        
		        'found.SetFocus
		        'If found IsA TextEdit Then
		        'edtFound = TextEdit(found)
		        'If edtFound.SelStart+edtFound.SelLength = 0 Then
		        'edtFound.SelStart = InStr(Lowercase(edtFound.Text), t) - 1
		        'Else
		        'edtFound.SelStart = InStr(edtFound.SelStart+edtFound.SelLength+1, Lowercase(edtFound.Text), t) - 1
		        'End If
		        'edtFound.SelLength = t.Len 'find.FindString.Len
		        'End If
		        
		        
		      Else
		        Do
		          i = i + 1
		          If i >= lst_all_songs.ListCount Then
		            i = 0 // Circle around to the beginning
		          End If
		          //
		          //++ Check for finished
		          //
		          If i = FindStartSong Then Exit
		          //--
		          If i < lst_all_songs.ListCount Then
		            f = MainWindow.Songs.GetFile(lst_all_songs.CellTag(i, 0).StringValue + lst_all_songs.List(i))
		            If f = Nil Or Not f.Exists Then
		              App.MouseCursor = Nil
		              InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(MainWindow.Songs.ErrorCode)+"']", lst_all_songs.List(i))
		              ProgressWindow.Close()
		              Return
		            End If
		            s = SmartML.XDocFromFile(f)
		            If s = Nil Then
		              App.DebugWriter.Write("MainWindow.FindNext: Error converting file to XML String: " + lst_all_songs.CellTag(i, 0).StringValue + lst_all_songs.list(i), 1)
		              App.MouseCursor = Nil
		              InputBox.Message App.T.Translate("errors/bad_format", lst_all_songs.List(i))
		              App.MouseCursor = System.Cursors.Wait
		            End If
		          End If
		        Loop Until s <> Nil
		        '++JRC
		        If find.FindChord Then
		          edt_preview.SelStart = 0
		        End If
		        '--
		      End If
		      //++
		      // See if we left the loop because we are at the end.  If so, leave the While loop
		      //--
		      If i = FindStartSong Then
		        Exit
		      End If
		    Wend
		    
		    ProgressWindow.Close()
		  End If
		  
		  If NOT found Then
		    App.MouseCursor = Nil
		    InputBox.Message App.T.Translate("errors/end_of_songs")
		  End If
		  
		  App.MouseCursor = Nil
		  App.DebugWriter.Write("MainWindow.FindNext: Exit")
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Popup(ByRef presentation As String, ShowPresentationOrder As Boolean = True) As FolderItem
		  '++JRC
		  Globals.Status_SongPickerOpen = True
		  
		  lbl_presentation.Enabled = ShowPresentationOrder
		  edt_order.Enabled = ShowPresentationOrder
		  edt_order.ReadOnly = Not ShowPresentationOrder
		  '--
		  
		  PresentationOrder = ""
		  ShowModalWithin(MainWindow)
		  presentation = PresentationOrder
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetFoundInText()
		  Dim str As String
		  
		  Select Case find.Found
		  Case find.kLyrics
		    str = App.T.Translate("shared/lyrics/@caption")
		  Case find.kTitle
		    str = App.T.Translate("shared/title/@caption")
		  Case find.kAuthor
		    str = App.T.Translate("shared/author/@caption")
		  Case find.kCopyright
		    str = App.T.Translate("shared/copyright/@caption")
		  Case find.kCCLI
		    str = App.T.Translate("shared/ccli/@caption")
		  Case find.kPresentation
		    str = App.T.Translate("shared/presentation/@caption")
		  Case find.kChord
		    str = App.T.Translate("shared/chord/@caption")
		  Case find.kHymnNumber
		    str = App.T.Translate("shared/hymn_number/@caption")
		  Case find.kKey
		    str = App.T.Translate("shared/key/@caption")
		  Case find.kKeyLine
		    str = App.T.Translate("shared/key_line/@caption")
		  Case find.kAKA
		    str = App.T.Translate("shared/aka/@caption")
		  Case find.kCapo
		    str = App.T.Translate("shared/capo/@caption")
		  Case find.kThemes
		    str = App.T.Translate("shared/theme/@caption")
		  Case find.kTempo
		    str = App.T.Translate("shared/tempo/@caption")
		  Case find.kTimeSig
		    str = App.T.Translate("shared/time_sig/@caption")
		  Case find.kUser1
		    str = App.T.Translate("shared/user1/@caption")
		  Case find.kUser2
		    str = App.T.Translate("shared/user2/@caption")
		  Case find.kUser3
		    str = App.T.Translate("shared/user3/@caption")
		    
		  End Select
		  
		  
		  str = App.T.Translate("song_lookup/text/@caption") + " " + str
		  
		  lbl_found_text.Text = str
		  Return
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected AddSong As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentSel As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentSong As XMLDocument
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected f As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Find As FindClass
	#tag EndProperty

	#tag Property, Flags = &h0
		FindStartSong As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HSizer As HalfSizer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected KeyedSearch As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PresentationOrder As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SongFolderSel As Integer = -1
	#tag EndProperty


	#tag Constant, Name = kListColumnPath, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kListColumnSong, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events pop_select_folder
	#tag Event
		Sub Change()
		  //++
		  // December 2007, EMP
		  //
		  // Updated to show a second column with the folder name
		  // Won't show if there is only one folder in the list
		  //--
		  Dim multipleFolders As Boolean = False
		  Dim lastFolder As String
		  '++JRC
		  Dim f As FolderItem
		  
		  If Me.ListIndex < 0 Then
		    SongFolderSel = -1
		    Return
		  End If
		  
		  f = FileUtils.RelativePathToFolderItem(App.DocsFolder.Child(App.STR_SONGS), Me.Text)
		  
		  If f = Nil Or NOT f.Exists Then
		    If Me.Text = "( " + App.T.Translate("songs_mode/song_folders/filter_all/@caption") + " )" Or Me.Text = "( " + App.T.Translate("songs_mode/song_folders/filter_main/@caption") + " )" Then
		      'Check if we have a songs folder if not offer to create one
		      If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		        If InputBox.AskYN(App.T.Translate("questions/no_songs_folder/@caption")) Then
		          If Not FileUtils.CreateFolder(App.DocsFolder.Child(App.STR_SONGS)) Then
		            InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.Child(App.STR_SONGS).AbsolutePath)
		            Me.ListIndex = -1
		            SongFolderSel = -1
		          End If
		        Else
		          InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.Child(App.STR_SONGS).AbsolutePath)
		          Me.ListIndex = -1
		          SongFolderSel = -1
		        End If
		      End If
		      '--
		      
		    Else
		      If InputBox.AskYN(App.T.Translate("questions/no_folder/@caption", App.DocsFolder.Child(App.STR_SONGS).AbsolutePath + "\" + ReplaceAll(Me.Text, "/", "\"))) Then
		        If NOT FileUtils.CreateFolderTree(App.DocsFolder.Child(App.STR_SONGS), Me.Text) Then
		          Me.ListIndex = -1
		          SongFolderSel = -1
		        End If
		      Else
		        Me.ListIndex = -1
		        SongFolderSel = -1
		      End If
		    End If
		    
		  End If
		  
		  If SongFolderSel = Me.ListIndex Then
		    Return
		  end If
		  
		  
		  SongFolderSel = Me.ListIndex
		  
		  '--
		  App.MouseCursor = System.Cursors.Wait
		  Call MainWindow.Songs.GetFiles(Me.Text, lst_all_songs)
		  
		  For i As Integer = 0 To lst_all_songs.ListCount - 1
		    lst_all_songs.Cell(i, kListColumnPath) = _
		    StringUtils.Chop(lst_all_songs.CellTag(i, kListColumnSong).StringValue, "/")
		    If i <> 0 Then
		      If lst_all_songs.Cell(i, kListColumnPath) <> lastFolder Then
		        multipleFolders = True
		      End If
		    Else
		      lastFolder = lst_all_songs.Cell(i, kListColumnPath)
		    End If
		  Next
		  App.MouseCursor = Nil
		  
		  If multipleFolders Then
		    lst_all_songs.ColumnWidths = "66%,*"
		  Else
		    lst_all_songs.ColumnWidths = "100%,0"
		  End If
		  Globals.CurrentSongPickerFolder = Me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_quick_lookup
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Const ASC_KEY_PGDN=12
		  Const ASC_KEY_PGUP =11
		  Const ASC_KEY_HOME=1
		  Const ASC_KEY_END=4
		  Const ASC_KEY_DOWN = 31
		  Const ASC_KEY_UP = 30
		  Const ASC_KEY_ESCAPE = 27
		  Const ASC_KEY_BACKSPACE = 8
		  Const ASC_KEY_LEFT  = 28
		  Const ASC_KEY_RIGHT = 29
		  Const ASC_KEY_TAB = 9
		  Const ASC_KEY_INSERT = 5
		  Const ASC_KEY_DEL = 127
		  Const ASC_KEY_F1 = 200
		  Const ASC_KEY_F12 = 211
		  
		  Dim i As Integer
		  Dim SearchedEntry, SearchText As String
		  Dim found As Boolean
		  Dim reSearch As RegEx
		  Dim reoSearch As RegExOptions
		  '++JRC
		  If Keyboard.AsyncControlKey Then
		    If Keyboard.AsyncKeyDown(&h03) Then 'Ctrl+F
		      Find
		      Return True
		    ElseIf Keyboard.AsyncKeyDown(&h05) Then 'Ctrl+G
		      FindNext
		      Return True
		    End If
		  End If
		  '--
		  If Keyboard.CommandKey Or Keyboard.ControlKey Or Keyboard.OptionKey Then Return False
		  
		  Select Case Asc(key)
		  Case ASC_KEY_INSERT
		    Return True
		  Case ASC_KEY_BACKSPACE
		    If Me.SelLength = 0 And Me.SelStart = 0 Then
		      Return True
		    End If
		    
		    If Me.SelLength = 0 Then
		      Me.SelStart = Me.SelStart - 1
		      Me.SelLength = 1
		      Me.SelText = ""
		    Else
		      Me.SelText = ""
		    End If
		  Case ASC_KEY_TAB
		    Return False
		  Case 13, 10 'Enter, Return
		    AddSong = True
		    Close
		    Return True
		  Case ASC_KEY_ESCAPE 'Escape
		    Return False 'Close dialog, no search in progress
		  Case ASC_KEY_UP
		    Return False
		  Case ASC_KEY_DOWN
		    Return False
		  Case ASC_KEY_LEFT
		    Return False
		  Case ASC_KEY_RIGHT
		    Return False
		  Case ASC_KEY_HOME
		    Return False
		  Case ASC_KEY_END
		    Return False
		  Case ASC_KEY_DEL
		    If Me.SelLength = 0 Then
		      Me.SelLength = 1
		      Me.SelText = ""
		    Else
		      Me.SelText = ""
		    End If
		  Case ASC_KEY_F1 To ASC_KEY_F12
		    Return False
		  Else
		    Me.SelText = "" + Key
		    Me.SelStart = Me.SelStart+1
		  End Select
		  
		  Found = False
		  lst_all_songs.ListIndex = -1
		  
		  'Try to find the first song that starts with the search text
		  For i = 0 To lst_all_songs.ListCount - 1
		    SearchedEntry = ConvertEncoding(Left(lst_all_songs.List(i), Len(Me.Text)), Encodings.UTF8)
		    If SearchedEntry = Me.Text Then
		      lst_all_songs.ListIndex = i
		      found = True
		      Exit
		    End If
		  Next i
		  
		  'If no matches were found, try to find the first song that contains the search text
		  If Not found Then
		    For i = 0 To lst_all_songs.ListCount - 1
		      SearchedEntry = ConvertEncoding(lst_all_songs.List(i), Encodings.UTF8)
		      If SearchedEntry.Contains(Me.Text) Then
		        lst_all_songs.ListIndex = i
		        found = True
		        Exit
		      End If
		    Next i
		  End If
		  
		  'If no matches were found, try to find the first song that has a part that 'is like' the search text (skipping punctuation, spaces and others)
		  If Not found Then
		    //++
		    // Set up regular expression to delete all non-alphanumeric characters for 'is like' search
		    //--
		    reSearch = New RegEx
		    reoSearch = New RegExOptions
		    reoSearch.ReplaceAllMatches = True
		    reoSearch.CaseSensitive = False
		    reSearch.Options = reoSearch
		    reSearch.ReplacementPattern = ""
		    reSearch.SearchPattern = "[^[:alnum:]]"
		    SearchText = reSearch.Replace(Me.Text)
		    
		    For i = 0 To lst_all_songs.ListCount - 1
		      SearchedEntry = reSearch.Replace(ConvertEncoding(lst_all_songs.List(i),Encodings.UTF8))
		      If InStr(SearchedEntry, SearchText) > 0 Then
		        lst_all_songs.ListIndex = i
		        found = True
		        Exit
		      End If
		    Next i
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events lst_all_songs
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 0 Then
		    '++JRC
		    If Me.ListIndex  = CurrentSel Then Return
		    '--
		    App.DebugWriter.Write("SongPickerWindow.lst_all_songs.Change: New selection is '" +_
		    Me.CellTag(Me.ListIndex, 0).StringValue + Me.List(Me.ListIndex), 4)
		    f = MainWindow.Songs.GetFile(Me.CellTag(Me.ListIndex, 0).StringValue + Me.List(Me.ListIndex))
		    '++JRC Add Song Preview text
		    CurrentSong = SmartML.XDocFromFile(f)
		    If Not (CurrentSong Is Nil) Then
		      If App.MainPreferences.GetValueB(prefs.kSongsPreviewWithChords, True) Then
		        edt_preview.Text = SmartML.GetValue(CurrentSong.DocumentElement, "lyrics", True).FormatLocalEndOfLine
		      Else
		        edt_preview.Text = SongML.LyricText(CurrentSong.DocumentElement).FormatLocalEndOfLine
		      End If
		      edt_order.Text = ""
		      edt_origorder.Text = SmartML.GetValue(CurrentSong.DocumentElement, "presentation", False)
		      '--
		      edt_order.Enabled = True
		      btn_add.Enabled = True
		      btn_add.Default = True
		    Else
		      edt_preview.Text = App.T.Translate("errors/bad_format", Me.CellTag(Me.ListIndex, 0).StringValue + Me.List(Me.ListIndex))
		      edt_order.Enabled = False
		      btn_add.Enabled = False
		    End If
		    edt_preview.ScrollPosition = 0
		    edt_preview.ScrollPositionX = 0
		    
		  Else
		    btn_add.Enabled = False
		    edt_preview.Text = ""
		    edt_order.Text = ""
		    edt_origorder.Text = ""
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If lst_all_songs.ListIndex >= 0 Then
		    AddSong = True
		    Close
		  Else
		    InputBox.Message App.T.Translate("song_lookup/no_selection")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Const ASC_KEY_PGDN=12
		  Const ASC_KEY_PGUP =11
		  Const ASC_KEY_HOME=1
		  Const ASC_KEY_END=4
		  Const ASC_KEY_DOWN = 31
		  Const ASC_KEY_UP = 30
		  Const ASC_KEY_ESCAPE = 27
		  Const ASC_KEY_BACKSPACE = 8
		  
		  Select Case Asc(key)
		    '++JRC Make Num-pad Enter work again (bug #1803093)
		  Case 3, 13, 10 'Enter, Return
		    AddSong = True
		    Close
		    Return True
		  Case ASC_KEY_DOWN ' Down
		    KeyedSearch = ""
		    edt_quick_lookup.Text = ""
		    Return False
		  Case ASC_KEY_UP ' Up
		    KeyedSearch = ""
		    edt_quick_lookup.Text = ""
		    Return False
		  Case ASC_KEY_ESCAPE 'Escape
		    If KeyedSearch = "" Then Return False 'Close dialog, no search in progress
		    KeyedSearch = ""
		    edt_quick_lookup.Text = ""
		    Return True 'Keep dialog box from closing
		  Case ASC_KEY_PGDN
		    Me.PageDown
		    edt_quick_lookup.Text = ""
		    Return True
		  Case ASC_KEY_PGUP
		    Me.PageUp
		    edt_quick_lookup.Text = ""
		    Return True
		  Case ASC_KEY_HOME
		    If Me.ListCount > 0 Then
		      Me.ScrollPosition = 0
		      Me.ListIndex = 0
		      edt_quick_lookup.Text = ""
		      Return True
		    Else
		      edt_quick_lookup.Text = ""
		      Return False
		    End If
		  Case ASC_KEY_END
		    If Me.ListCount > 0 Then
		      Me.ScrollPosition = Me.ListCount - 1
		      Me.ListIndex = Me.ListCount - 1
		      edt_quick_lookup.Text = ""
		      Return True
		    Else
		      edt_quick_lookup.Text = ""
		      Return False
		    End If
		  End Select
		  
		  Dim i, l As Integer
		  Dim NewKey As String
		  Dim SearchedEntry As String
		  
		  If Keyboard.CommandKey Or Keyboard.ControlKey Or Keyboard.OptionKey Then Return False
		  
		  App.DebugWriter.Write "SongPickerWindow.lst_all_songs.KeyDown: key = '" + key + "'", 5
		  If Asc(Key) = ASC_KEY_BACKSPACE Then
		    NewKey = StringUtils.Chop(KeyedSearch, 1)
		    If NewKey.Len = 0 Then // Do nothing if the string is now empty
		      KeyedSearch = ""
		      edt_quick_lookup.Text = ""
		      Return True
		    End If
		  Else
		    Key = ConvertEncoding(key, Encodings.UTF8)
		    NewKey = ConvertEncoding(KeyedSearch + key, Encodings.UTF8)
		    App.DebugWriter.Write "SongPickerWindow.lst_all_songs.KeyDown: NewKey = " + NewKey, 5
		  End If
		  l = Len(NewKey)
		  
		  timerLookup.Reset
		  For i = 0 To Me.ListCount - 1
		    SearchedEntry = ConvertEncoding(Left(Me.List(i), l), Encodings.UTF8)
		    If SearchedEntry = NewKey Then
		      Me.ListIndex = i
		      App.DebugWriter.Write "SongPickerWindow.lst_all_songs.KeyDown: Found match index, value: " + str(i) + " " + Me.List(i), 5
		      edt_quick_lookup.Text = NewKey
		      KeyedSearch = NewKey
		      Return True
		    End If
		  Next i
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  'Me.SetFocus
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  '++JRC Fix issue where songs were not listed in numerical order
		  
		  If column <> 0 Then Return False // Protection for the future: don't use this except for the song name column
		  
		  result = CompareHymnBookOrder(Me.Cell(row1, column), Me.Cell(row2, column))
		  
		  If result = 0 Then //Names are equal, sort by folder
		    result = Compare(Me.CellTag(row1, column).StringValue, Me.CellTag(row2, column).StringValue)
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SmartSplitter1
	#tag Event
		Sub Open()
		  Me.attach(lst_all_songs)
		  Me.attach(lbl_song_preview)
		  Me.attach(edt_preview)
		  '++JRC
		  Me.attach(lbl_found_text)
		  Me.setAttachedControlShouldMove(lbl_found_text, True)
		  Me.setAttachedControlShouldResize(lbl_found_text, False)
		  '--
		  Me.setAttachedControlShouldMove(lbl_song_preview, True)
		  Me.setAttachedControlShouldResize(lbl_song_preview, False)
		  Me.setAttachedControlShouldResize(lst_all_songs, True)
		  Me.setAttachedControlShouldResize(edt_preview, True)
		  Me.MinLimitOffset = ((edt_preview.Top + edt_preview.Height) - lst_all_songs.Top) \ 5
		  Me.StopAtMinOffset = True
		  Me.StopAtMaxOffset = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_preview
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Keyboard.AsyncControlKey Then
		    If Keyboard.AsyncKeyDown(&h03) Then 'Ctrl+F
		      Find
		      Return True
		    ElseIf Keyboard.AsyncKeyDown(&h05) Then 'Ctrl+G
		      FindNext
		      Return True
		    End If
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_add
	#tag Event
		Sub Action()
		  'BuildScripture
		  
		  If lst_all_songs.ListIndex >= 0 Then
		    AddSong = True
		    Close
		  Else
		    InputBox.Message App.T.Translate("song_lookup/no_selection")
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_done
	#tag Event
		Sub Action()
		  f = Nil
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timerLookup
	#tag Event
		Sub Action()
		  KeyedSearch = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_search
	#tag Event
		Sub Action()
		  Find
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FindStartSong"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
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
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
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
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
