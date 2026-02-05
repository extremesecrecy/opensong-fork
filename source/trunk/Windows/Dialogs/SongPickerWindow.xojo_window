#tag Window
Begin Window SongPickerWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   1046
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   876984319
   MenuBarVisible  =   True
   MinHeight       =   600
   MinimizeButton  =   True
   MinWidth        =   440
   Placement       =   0
   Resizeable      =   True
   Title           =   "Song Lookup"
   Visible         =   True
   Width           =   440
   Begin Label txt_explanation_header
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   90
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
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
      TabStop         =   True
      Text            =   "To add a song, click the song title below and click the ""Add"" button. If you know the name of the song you can type it into the Quick Lookup field, and click ""Add"" or press Enter. Or you can click Search(Ctrl+F) to search song, Ctrl+G to repeat search . You can also double-click on the song name to add it."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   5
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   407
   End
   Begin Label lbl_select_folder
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
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
      TabStop         =   True
      Text            =   "Select Folder:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   98
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   197
   End
   Begin SPopupMenu pop_select_folder
      AllowAutoDeactivate=   True
      Bold            =   False
      Changing        =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   25
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   121
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   206
   End
   Begin Label lbl_quick_lookup
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
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
      TabStop         =   True
      Text            =   "Quick Lookup:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   98
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   190
   End
   Begin SSearchField sch_quick_lookup
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowRecentItems=   False
      ClearMenuItemValue=   ""
      Enabled         =   True
      Height          =   25
      Hint            =   "Search"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   228
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumRecentItems=   0
      RecentItemsValue=   ""
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      Tooltip         =   ""
      Top             =   121
      Transparent     =   False
      Value           =   ""
      Visible         =   True
      Width           =   192
   End
   Begin ListBox lst_all_songs
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   "66%,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   0
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   134
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
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   158
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   410
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin SmartSplitter SmartSplitter1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DisableLiveDrag =   False
      doNotAttachEmbeddedControls=   False
      DoubleBuffer    =   False
      Enabled         =   True
      handleCount     =   0
      handleDimple    =   False
      handleLarge     =   False
      Height          =   9
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
      Tooltip         =   ""
      Top             =   296
      Transparent     =   True
      Visible         =   True
      Width           =   410
   End
   Begin Label lbl_song_preview
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
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
      TabStop         =   True
      Text            =   "Preview:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   315
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin SEditFieldLyrics edt_preview
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bilingual       =   False
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      Height          =   156
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   339
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   412
   End
   Begin Label lbl_presentation
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
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
      TabStop         =   True
      Text            =   "Custom Presentation Order:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   503
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin SEditField edt_order
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      Height          =   22
      HideSelection   =   True
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Multiline       =   False
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   527
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ">CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
      Visible         =   True
      Width           =   201
   End
   Begin Label lbl_origorder
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   225
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
      TabStop         =   True
      Text            =   "Original Presentation Order:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   503
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   199
   End
   Begin SEditField edt_origorder
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      Height          =   22
      HideSelection   =   True
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   225
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Multiline       =   False
      Password        =   False
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   527
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   199
   End
   Begin PushButton btn_add
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Add"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   230
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   560
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin PushButton btn_done
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Done"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   334
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   560
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin Timer timerLookup
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   1500
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin PushButton btn_search
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Search"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   560
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin Label lbl_found_text
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
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
      TabStop         =   True
      Text            =   "Found text in:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   315
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   197
   End
   Begin SButton btn_search_back
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      HasFocus        =   False
      Height          =   23
      Icon            =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   "<"
      LabelAlign      =   0
      Left            =   106
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuItem        =   ""
      NewPaint        =   False
      Outline         =   True
      Scope           =   0
      StickyBevel     =   False
      Stuck           =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Toggle          =   False
      Tooltip         =   "Search backwards"
      Top             =   560
      Transparent     =   True
      Visible         =   True
      Width           =   23
   End
   Begin SButton btn_search_next
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      HasFocus        =   False
      Height          =   23
      Icon            =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   ">"
      LabelAlign      =   0
      Left            =   131
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuItem        =   ""
      NewPaint        =   False
      Outline         =   True
      Scope           =   0
      StickyBevel     =   False
      Stuck           =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Toggle          =   False
      Tooltip         =   "Search forwards"
      Top             =   560
      Transparent     =   True
      Visible         =   True
      Width           =   23
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
		Sub EnableMenuItems()
		  mnu_edit_find.Enabled = True
		  mnu_edit_find_next.Enabled = True
		  mnu_file_close.Enabled = True
		  
		  btn_search_next.Enabled = Not ((Find Is Nil) Or (Find.FindString.IsEmpty And Not Find.FindChord))
		  btn_search_back.Enabled = Not ((Find Is Nil) Or (Find.FindString.IsEmpty And Not Find.FindChord))
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleShortcutKey(Nil, Key)
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  CurrentSel = -1
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
		  
		  SongFolderSel = pop_select_folder.ListIndex
		  
		  Find = New FindClass
		  App.T.TranslateWindow Me, "song_lookup", App.TranslationFonts
		  App.CenterInControlScreen Me
		  lst_all_songs.ListIndex = 0
		  sch_quick_lookup.SetFocus()
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


	#tag MenuHandler
		Function mnu_edit_find() As Boolean Handles mnu_edit_find.Action
		  Find
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_edit_find_next() As Boolean Handles mnu_edit_find_next.Action
		  FindNext
		  
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_close() As Boolean Handles mnu_file_close.Action
		  Close
		  
		  Return True
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub AddSelectedSong()
		  AddSong = True
		  If SelectSingleSong Or Receiver Is Nil Then 
		    Close
		  Else
		    PresentationOrder = Uppercase(Trim(edt_order.Text))
		    Receiver.SongSelected(f, PresentationOrder)
		    PresentationOrder = ""
		    edt_order.Value = ""
		    btn_add.Enabled = False
		  End If
		End Sub
	#tag EndMethod

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
		  HSizer.AddTop sch_quick_lookup, .5
		  HSizer.AddLeftWidth sch_quick_lookup, 0, 1.0
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
		    App.DebugWriter.Write "SongPickerWindow.Find: FindStartSong = " + Str(lst_all_songs.SelectedRowIndex)
		    Find.ResetSearchState
		    Find.ResetCoverage(lst_all_songs.RowCount)
		    Find.ConstructFieldsToSearch
		    FindNext
		  End If
		  EnableMenuItems
		  App.DebugWriter.Write "SongPickerWindow.Find: Exit"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindInFields(xSong As XmlNode, Forward As Boolean = True) As Boolean
		  Dim textToSearch, tag As String
		  Dim fromI, toI, stepI, i As Integer
		  Dim prevousPos, pos, len As Integer
		  
		  If Find.FieldsToSearch.Count = 0 Then
		    Find.ResetSearchState
		    Return False
		  End If
		  
		  If Forward Then
		    fromI = 0
		    toI = Find.fieldsToSearch.LastIndex
		    stepI = 1
		  Else
		    fromI = Find.fieldsToSearch.LastIndex
		    toI = 0
		    stepI = -1
		  End If
		  
		  If Find.PassStartTagIdx <> -1 Then FromI = Find.PassStartTagIdx
		  
		  For i = fromI To toI Step stepI
		    tag = Find.fieldsToSearch(i)
		    If tag = "chord" Then
		      Dim foundChord As String
		      If Forward Then
		        If Find.PassStartTagIdx = fromI Then
		          pos = Max(0,Find.PassStartPos + 1)
		        Else
		          pos = 0
		        End If
		        pos = SongML.FindChord(xSong,Find.ChordKey,Find.ChordForm,pos,foundChord)
		        If pos > 0 Then
		          Find.FoundPos = pos - 1
		          Find.FoundFieldTag = tag
		          Find.FoundLen = foundChord.Length
		          Return True
		        Else
		          Find.FoundPos = -1
		          Find.FoundFieldTag = ""
		          Find.FoundLen = 0
		        End If
		      ElseIf Find.PassStartPos = -1 Then  // search for the last occurence within the field
		        Find.FoundPos = -1
		        Find.FoundLen = 0
		        Find.FoundFieldTag = ""
		        pos = 0
		        Do
		          pos = SongML.FindChord(xSong,Find.ChordKey,Find.ChordForm,pos,foundChord)
		          len = foundChord.Length
		          If pos = 0 Then Exit
		          Find.FoundPos = pos - 1
		          Find.FoundLen = len
		          pos = pos + len
		        Loop
		        If Find.FoundPos = -1 Then
		          Continue For i
		        Else
		          Find.FoundFieldTag = tag
		          Return True
		        End If
		      Else  // search for an occurence before the one in the Find state
		        prevousPos = Find.PassStartPos
		        Find.PassStartPos = -1
		        Find.FoundPos = -1
		        Find.FoundLen = 0
		        Find.FoundFieldTag = ""
		        pos = 0
		        Do
		          pos = SongML.FindChord(xSong,Find.ChordKey,Find.ChordForm,pos,foundChord)
		          len = foundChord.Length
		          If pos > 0 And pos < prevousPos Then
		            Find.FoundPos = pos - 1
		            Find.FoundLen = len
		            pos = pos + len
		          Else
		            Exit
		          End If
		        Loop
		        If Find.FoundPos = -1 Then
		          Continue For i
		        Else
		          Find.FoundFieldTag = tag
		          Return True
		        End If
		      End If
		    Else
		      textToSearch = SmartML.GetValue(xSong, tag)
		      
		      // if we search forward, IsMatch handles the previously found position
		      // if we search backwards, we handle this by searching repeatedly from the start of the field until we hit the ending condition,
		      // then return the occurnce before that. The ending condition changes depending on whether we have searched the field before.
		      // In a new field we search until there is no more match.
		      // In a field we already have a found position, we search until we reach that position again.
		      // We could create a list of positions for a new field and then just pop them off the end 
		      If Forward Then
		        If Find.IsMatch(textToSearch, tag) Then
		          Return True
		        End If
		      ElseIf Find.PassStartPos = -1 Then  // search for the last occurence within the field
		        pos = -1
		        While Find.IsMatch(textToSearch, tag)
		          len = Find.FoundLen
		          pos = Find.FoundPos
		          Find.PassStartPos = pos + len
		          Find.PassStartTagIdx = i
		        Wend
		        If pos = -1 Then
		          Continue For i
		        Else  // restore the previously found state
		          Find.FoundPos = pos
		          Find.FoundLen = len
		          Find.FoundFieldTag = tag
		          Return True
		        End If
		      Else  // search for an occurence before the one in the Find state
		        prevousPos = Find.PassStartPos
		        Find.PassStartPos = -1
		        pos = -1
		        While Find.IsMatch(textToSearch, tag)
		          If Find.FoundPos < prevousPos Then
		            pos = Find.FoundPos
		            len = Find.FoundLen
		            Find.PassStartPos = pos + len
		            Find.PassStartTagIdx = i
		          Else
		            Exit
		          End If
		        Wend
		        If pos = -1 Then
		          Find.FoundPos = -1
		          Find.FoundLen = 0
		          Find.FoundFieldTag = ""
		          Continue For i
		        Else  // restore the previously found state
		          Find.FoundPos = pos
		          Find.FoundLen = len
		          Find.FoundFieldTag = tag
		          Return True
		        End If
		      End If
		    End If
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FindNext(Forward As Boolean = True)
		  App.DebugWriter.Write CurrentMethodName + ": Enter"
		  
		  If Find.FindString.IsEmpty And Not Find.FindChord Then
		    Find
		    Return
		  End If
		  
		  Dim xSongDoc As XmlDocument
		  Dim i As Integer
		  Dim f As FolderItem
		  Dim found As Boolean = False
		  Dim findAborted As Boolean = False
		  Dim startIdx, startTagIdx, startPos As Integer
		  Dim startTag As  String
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  If Find.ItemCount <> lst_all_songs.RowCount Then Find.ResetCoverage(lst_all_songs.RowCount)
		  
		  If lst_all_songs.RowCount > 0 Then
		    startIdx = lst_all_songs.SelectedRowIndex
		    If startIdx < 0 Or startIdx > lst_all_songs.RowCount Then
		      Find.ResetSearchState
		      If Forward Then
		        startIdx = 0
		      Else
		        startIdx = lst_all_songs.LastRowIndex
		      End If
		    End If
		    
		    // The following condition cannot be detected reliably (after all we moved away by clicking on the btn_search_next or btn_search_back),
		    // causing the same position to be found several times in a row. So I amend it, abusing Find.Found<Position>
		    startTag = find.FoundFieldTag  // for now. We might change that later
		    startPos = edt_preview.SelStart + edt_preview.SelLength
		    If edt_preview Is self.Focus Then
		      Find.FoundIdx = lst_all_songs.SelectedRowIndex
		      If Find.FoundFieldTag <> "chord" Then
		        startTag = "lyrics"
		      End If
		    End If
		    If lst_all_songs.SelectedRowIndex = Find.FoundIdx Then
		      If startTag = "lyrics" Or startTag = "chords" Then
		        If startPos >= Find.FoundPos And startPos <= Find.FoundPos + Find.FoundLen Then
		          If Forward Then
		            startPos = Find.FoundPos + Find.FoundLen
		          Else
		            startPos = Find.FoundPos
		          End If
		        End If
		      End If
		    Else
		      startTag = ""
		      startPos = -1
		    End If
		    startTagIdx = Find.GetTagIndex(startTag)
		    If startTagIdx = -1 Then startPos = -1
		    
		    Find.RegisterStartOfSearch(startIdx,startTagIdx,startPos,Forward)
		    
		    i = Find.PassStartIdx
		    App.DebugWriter.Write(CurrentMethodName + ": Open " + str(i) + " " +  lst_all_songs.CellTag(i, 0).StringValue + lst_all_songs.List(i))
		    If i = lst_all_songs.SelectedRowIndex And Not (CurrentSong Is Nil) Then
		      xSongDoc = CurrentSong
		    Else
		      f = MainWindow.Songs.GetFile(lst_all_songs.CellTag(i, 0).StringValue, lst_all_songs.List(i))
		      If f Is Nil Or Not f.Exists Then
		        App.MouseCursor = Nil
		        InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(MainWindow.Songs.ErrorCode)+"']", lst_all_songs.List(i))
		        Return
		      End If
		      xSongDoc = SmartML.XDocFromFile(f)
		    End If
		    
		    //++
		    // Bug 1089442: Catch s = Nil.  Unlikely to happen, but possible if i < 0 and the first document isn't valid
		    //
		    // For the moment, just error and return.  Could be avoided by splitting out the code that opens the song
		    // files and determines when done (i.e., XmlDocument = GetNextSong( ByRef i, FindStartSong ))
		    //--
		    If xSongDoc = Nil Then
		      App.MouseCursor = Nil
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(MainWindow.Songs.ErrorCode)+"']", lst_all_songs.List(i))
		      Return
		    End If
		    
		    ProgressWindow.SetProgress(Find.ItemSeenCount * 100 \ Find.ItemCount)
		    ProgressWindow.lbl_status.Text =  App.T.Translate("progress_status/song_search") + "…"
		    ProgressWindow.CanCancel(True)
		    ProgressWindow.Show()
		    
		    While found = False And i < lst_all_songs.ListCount
		      ProgressWindow.SetProgress(Find.ItemSeenCount * 100 \ Find.ItemCount)
		      ProgressWindow.SetStatus lst_all_songs.List(i)
		      
		      found = FindInFields(xSongDoc.DocumentElement, Forward)
		      
		      If found Then
		        Find.RegisterFoundPosition(i, Forward)
		        If lst_all_songs.SelectedRowIndex <> i Then lst_all_songs.SelectedRowIndex = i
		        
		        SetFoundInText
		        
		        If Find.FoundFieldTag = "lyrics" Or Find.FoundFieldTag = "chord" Then
		          edt_preview.SelStart = Find.FoundPos
		          edt_preview.SelLength = Find.FoundLen
		        Else
		          edt_preview.SelLength = 0
		        End If
		      Else
		        Do
		          Find.RegisterItemCompleted(i, Forward)
		          // Check if finished
		          If Find.CoveredAllItems Then
		            If lst_all_songs.SelectedRowIndex <> Find.StartIdx And Find.StartIdx > 0 Then
		              Try
		                lst_all_songs.SelectedRowIndex = Find.StartIdx
		              Catch
		              End Try
		            End If
		            Find.ResetCoverage(lst_all_songs.RowCount)
		            Exit While
		          End If
		          
		          findAborted = ProgressWindow.QueryCancel
		          If findAborted Then Exit While
		          
		          If Forward Then
		            i = i + 1
		          Else
		            i = i - 1
		          End If
		          i = AbsMod(i, Find.ItemCount)
		          
		          If i < lst_all_songs.RowCount Then
		            f = MainWindow.Songs.GetFile(lst_all_songs.CellTag(i, 0).StringValue, lst_all_songs.List(i))
		            If f = Nil Or Not f.Exists Then
		              App.MouseCursor = Nil
		              InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(MainWindow.Songs.ErrorCode)+"']", lst_all_songs.List(i))
		              ProgressWindow.Close()
		              Return
		            End If
		            xSongDoc = SmartML.XDocFromFile(f)
		            If xSongDoc = Nil Then
		              App.DebugWriter.Write(CurrentMethodName + ": Error converting file to XML String: " + lst_all_songs.CellTag(i, 0).StringValue + lst_all_songs.list(i), 1)
		              App.MouseCursor = Nil
		              InputBox.Message App.T.Translate("errors/bad_format", lst_all_songs.List(i), SmartML.ErrorString)
		              App.MouseCursor = System.Cursors.Wait
		            End If
		          End If
		          
		          Find.PassStartIdx = i
		          If Forward Then
		            Find.PassStartTagIdx = 0
		          Else
		            Find.PassStartTagIdx = Find.FieldsToSearch.LastIndex
		          End If
		          Find.PassStartPos = -1
		        Loop Until xSongDoc <> Nil
		        
		        edt_preview.SelectionLength = 0
		        edt_preview.SelectionStart = 0
		        Find.ResetSearchState
		      End If
		    Wend
		    
		    If found Then
		      Find.FoundIdx = i
		      Find.RegisterStopOfSearch(Find.FoundIdx,Find.GetTagIndex(Find.FoundFieldTag),Find.FoundPos,Forward,False)
		    Else
		      If findAborted Then
		        // indicate i has been searched completely
		        Find.RegisterStopOfSearch(i,-1,-1,Forward,True)
		      Else
		        // full cycle
		        Find.ResetCoverage(lst_all_songs.RowCount)
		      End If
		    End If
		    
		    ProgressWindow.Close()
		  End If
		  
		  If Not found Then
		    lbl_found_text.Text = ""
		    If Not findAborted Then
		      App.MouseCursor = Nil
		      InputBox.Message App.T.Translate("errors/end_of_songs")
		    End If
		    If findAborted Then
		      If lst_all_songs.SelectedRowIndex <> i Then lst_all_songs.SelectedRowIndex = i
		    End If
		  End If
		  
		  App.MouseCursor = Nil
		  App.DebugWriter.Write(CurrentMethodName + ": Exit" + " State: " + If(found,"found in item "+Str(i),If(findAborted,"aborted","not found")))
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FindPrevious()
		  FindNext(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleShortcutKey(Ctrl As Control, Key As String) As Boolean
		  #Pragma Unused Ctrl
		  
		  #if TargetMacOs
		    If Keyboard.CommandKey Then
		      Select Case Key
		      Case "F"
		        Find
		        Return True
		      Case "G"
		        FindNext
		        Return True
		      End Select
		    End If
		  #else
		    If Keyboard.ControlKey And Not (Keyboard.AltKey Or Keyboard.ShiftKey Or Keyboard.OSKey) Then
		      Select Case Key
		      Case Chr(6) 'Crtl+F
		        Find
		        Return True
		      Case Chr(7) 'Ctrl+G
		        FindNext
		        Return True
		      End Select
		    End If
		  #endif
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PickMultipleSongs(callingObject As SongPickerReceiver, ShowPresentationOrder As Boolean = True)
		  Dim found As Boolean
		  Globals.Status_SongPickerOpen = True
		  
		  lbl_presentation.Enabled = ShowPresentationOrder
		  edt_order.Enabled = ShowPresentationOrder
		  edt_order.ReadOnly = Not ShowPresentationOrder
		  btn_done.Caption = App.T.Translate("shared/done/@caption", found)
		  If Not found Then btn_done.Caption = "*Done"
		  
		  PresentationOrder = ""
		  SelectSingleSong = False
		  Receiver = callingObject
		  
		  ShowModalWithin(MainWindow)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Popup(ByRef presentation As String, ShowPresentationOrder As Boolean = True) As FolderItem
		  Dim found As Boolean
		  Globals.Status_SongPickerOpen = True
		  
		  lbl_presentation.Enabled = ShowPresentationOrder
		  edt_order.Enabled = ShowPresentationOrder
		  edt_order.ReadOnly = Not ShowPresentationOrder
		  btn_done.Caption = App.T.Translate("shared/cancel/@caption", found)
		  If Not found Then btn_done.Caption = "*Cancel"
		  Receiver = Nil
		  
		  PresentationOrder = ""
		  
		  SelectSingleSong = True
		  
		  ShowModalWithin(MainWindow)
		  
		  presentation = PresentationOrder
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetFoundInText()
		  Dim str As String
		  
		  Select Case Find.FoundFieldTag
		  Case "lyrics"
		    str = App.T.Translate("shared/lyrics/@caption")
		  Case "title"
		    str = App.T.Translate("shared/title/@caption")
		  Case "author"
		    str = App.T.Translate("shared/author/@caption")
		  Case "copyright"
		    str = App.T.Translate("shared/copyright/@caption")
		  Case "ccli"
		    str = App.T.Translate("shared/ccli/@caption")
		  Case "presentation"
		    str = App.T.Translate("shared/presentation/@caption")
		  Case "chord"
		    str = App.T.Translate("shared/chord/@caption")
		  Case "hymn_number"
		    str = App.T.Translate("shared/hymn_number/@caption")
		  Case "key"
		    str = App.T.Translate("shared/key/@caption")
		  Case "key_line"
		    str = App.T.Translate("shared/key_line/@caption")
		  Case "aka"
		    str = App.T.Translate("shared/aka/@caption")
		  Case "capo"
		    str = App.T.Translate("shared/capo/@caption")
		  Case "theme"
		    str = App.T.Translate("shared/theme/@caption")
		  Case "tempo"
		    str = App.T.Translate("shared/tempo/@caption")
		  Case "time_sig"
		    str = App.T.Translate("shared/time_sig/@caption")
		  Case "user1"
		    str = App.T.Translate("shared/user1/@caption")
		  Case "user2"
		    str = App.T.Translate("shared/user2/@caption")
		  Case "user3"
		    str = App.T.Translate("shared/user3/@caption")
		  Case ""
		    str = ""
		  Case Else
		    Break  //Missing Case
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

	#tag Property, Flags = &h1
		Protected HSizer As HalfSizer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected KeyedSearch As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PresentationOrder As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Receiver As SongPickerReceiver
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectSingleSong As Boolean
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
		            InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.Child(App.STR_SONGS).NativePath)
		            Me.ListIndex = -1
		            SongFolderSel = -1
		          End If
		        Else
		          InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.Child(App.STR_SONGS).NativePath)
		          Me.ListIndex = -1
		          SongFolderSel = -1
		        End If
		      End If
		      '--
		      
		    Else
		      If InputBox.AskYN(App.T.Translate("questions/no_folder/@caption", App.DocsFolder.Child(App.STR_SONGS).NativePath + "\" + ReplaceAll(Me.Text, "/", "\"))) Then
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
#tag Events sch_quick_lookup
	#tag Event
		Sub TextChanged()
		  App.DebugWriter.Write(CurrentMethodName + " '" + Me.Text + "'")
		  Dim i As Integer
		  Dim SearchedEntry, SearchText As String
		  Dim found As Boolean
		  Dim reSearch As RegEx
		  Dim reoSearch As RegExOptions
		  
		  SearchText = Me.Value
		  #If TargetMacOS
		    SearchText = SearchText.NormalizeStringEncoding(StringUtils.NormalizationForms.NFD)
		  #EndIf
		  
		  If SearchText = "" Then
		    found = True
		    If lst_all_songs.RowCount = 0 Then
		      lst_all_songs.ListIndex = -1
		    ElseIf lst_all_songs.ListIndex < 0 Then
		      lst_all_songs.ListIndex = 0
		    ElseIf lst_all_songs.ListIndex >= lst_all_songs.RowCount Then
		      lst_all_songs.ListIndex = lst_all_songs.RowCount - 1
		    End If
		  End If
		  
		  'Try to find the first song that starts with the search text
		  If Not found Then
		    For i = 0 To lst_all_songs.ListCount - 1
		      SearchedEntry = lst_all_songs.List(i)
		      If SearchedEntry.BeginsWith(SearchText, ComparisonOptions.CaseInsensitive, App.LocaleForSearch) Then
		        lst_all_songs.ListIndex = i
		        lst_all_songs.ScrollPosition = Max(i - 2, 0)
		        found = True
		        Exit
		      End If
		    Next i
		  End If
		  
		  'If no matches were found, try to find the first song that contains the search text
		  If Not found Then
		    For i = 0 To lst_all_songs.ListCount - 1
		      SearchedEntry = lst_all_songs.List(i)
		      If SearchedEntry.IndexOf(SearchText, ComparisonOptions.CaseInsensitive, App.LocaleForSearch) >= 0 Then
		        lst_all_songs.ListIndex = i
		        lst_all_songs.ScrollPosition = Max(i - 2, 0)
		        found = True
		        Exit
		      End If
		    Next i
		  End If
		  
		  'If no matches were found, try to find the first song that has a part that 'is like' the search text (skipping punctuation, spaces and others)
		  If Not found Then
		    // Set up regular expression to delete all non-alphanumeric characters for 'is like' search
		    reSearch = New RegEx
		    reoSearch = New RegExOptions
		    reoSearch.ReplaceAllMatches = True
		    reoSearch.CaseSensitive = False
		    reSearch.Options = reoSearch
		    reSearch.ReplacementPattern = ""
		    reSearch.SearchPattern = "[^[:alnum:]]"
		    SearchText = reSearch.Replace(SearchText)
		    
		    For i = 0 To lst_all_songs.ListCount - 1
		      SearchedEntry = reSearch.Replace(ConvertEncoding(lst_all_songs.List(i), Encodings.UTF8))
		      If SearchedEntry.IndexOf(SearchText, ComparisonOptions.CaseInsensitive, App.LocaleForSearch) > 0 Then
		        lst_all_songs.ListIndex = i
		        lst_all_songs.ScrollPosition = Max(i - 2, 0)
		        found = True
		        Exit
		      End If
		    Next i
		  End If
		  
		  If Not found Then
		    lst_all_songs.ListIndex = -1
		  End If
		  
		  Return
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed()
		  App.DebugWriter.Write(CurrentMethodName + " '" + Me.Text + "'")
		  
		  If lst_all_songs.ListIndex > -1 And Me.Text.Length > 0 Then
		    btn_add.Push
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_all_songs
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 0 Then
		    If Me.ListIndex = CurrentSel Then Return
		    App.DebugWriter.Write("SongPickerWindow.lst_all_songs.Change: New selection is '" + _
		    Me.CellTag(Me.ListIndex, 0).StringValue + Me.List(Me.ListIndex), 4)
		    f = MainWindow.Songs.GetFile(Me.CellTag(Me.ListIndex, 0).StringValue, Me.List(Me.ListIndex))
		    CurrentSong = SmartML.XDocFromFile(f)
		    If Not (CurrentSong Is Nil) Then
		      If App.MainPreferences.GetValueB(prefs.kSongsPreviewWithChords, True) Then
		        edt_preview.Text = SmartML.GetValue(CurrentSong.DocumentElement, "lyrics", True).FormatLocalEndOfLine
		      Else
		        edt_preview.Text = SongML.LyricText(CurrentSong.DocumentElement).FormatLocalEndOfLine
		      End If
		      edt_order.Text = ""
		      edt_origorder.Text = SmartML.GetValue(CurrentSong.DocumentElement, "presentation", False)
		      edt_order.Enabled = True
		      btn_add.Enabled = True
		      btn_add.Default = True
		    Else
		      edt_preview.Text = App.T.Translate("errors/bad_format", MainWindow.Songs.CombinePath(Me.CellTag(Me.ListIndex, 0).StringValue, Me.List(Me.ListIndex)), SmartML.ErrorString)
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
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column <> 0 Then Return False // Protection for the future: don't use this except for the song name column
		  
		  result = MainWindow.SortSongCmp(Me.CellValueAt(row1, column), Me.CellTagAt(row1, column).StringValue, _
		  Me.CellValueAt(row2, column), Me.CellTagAt(row2, column).StringValue)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If lst_all_songs.ListIndex >= 0 Then
		    AddSelectedSong
		  Else
		    InputBox.Message App.T.Translate("song_lookup/no_selection")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Const ASC_KEY_PGDN = 12
		  Const ASC_KEY_PGUP = 11
		  Const ASC_KEY_HOME = 1
		  Const ASC_KEY_END = 4
		  Const ASC_KEY_DOWN = 31
		  Const ASC_KEY_UP = 30
		  Const ASC_KEY_ESCAPE = 27
		  Const ASC_KEY_BACKSPACE = 8
		  
		  Select Case Asc(key)
		    '++JRC Make Num-pad Enter work again (bug #1803093)
		  Case 3, 13, 10 'Enter, Return
		    AddSelectedSong
		    Return True
		  Case ASC_KEY_DOWN ' Down
		    KeyedSearch = ""
		    sch_quick_lookup.Text = ""
		    Return False
		  Case ASC_KEY_UP ' Up
		    KeyedSearch = ""
		    sch_quick_lookup.Text = ""
		    Return False
		  Case ASC_KEY_ESCAPE 'Escape
		    If KeyedSearch = "" Then Return False 'Close dialog, no search in progress
		    KeyedSearch = ""
		    sch_quick_lookup.Text = ""
		    Return True 'Keep dialog box from closing
		  Case ASC_KEY_PGDN
		    Me.PageDown
		    sch_quick_lookup.Text = ""
		    Return True
		  Case ASC_KEY_PGUP
		    Me.PageUp
		    sch_quick_lookup.Text = ""
		    Return True
		  Case ASC_KEY_HOME
		    If Me.ListCount > 0 Then
		      Me.ScrollPosition = 0
		      Me.ListIndex = 0
		      sch_quick_lookup.Text = ""
		      Return True
		    Else
		      sch_quick_lookup.Text = ""
		      Return False
		    End If
		  Case ASC_KEY_END
		    If Me.ListCount > 0 Then
		      Me.ScrollPosition = Me.ListCount - 1
		      Me.ListIndex = Me.ListCount - 1
		      sch_quick_lookup.Text = ""
		      Return True
		    Else
		      sch_quick_lookup.Text = ""
		      Return False
		    End If
		  End Select
		  
		  Dim i As Integer
		  Dim NewKey As String
		  Dim SearchedEntry As String
		  
		  If Keyboard.CommandKey Or Keyboard.ControlKey Or Keyboard.OptionKey Then Return False
		  
		  App.DebugWriter.Write "SongPickerWindow.lst_all_songs.KeyDown: key = '" + key + "'", 5
		  If Asc(Key) = ASC_KEY_BACKSPACE Then
		    NewKey = StringUtils.Chop(KeyedSearch, 1)
		    If NewKey.Length = 0 Then // Do nothing if the string is now empty
		      KeyedSearch = ""
		      sch_quick_lookup.Text = ""
		      Return True
		    End If
		  Else
		    NewKey = KeyedSearch + Key
		    App.DebugWriter.Write "SongPickerWindow.lst_all_songs.KeyDown: NewKey = " + NewKey, 5
		  End If
		  
		  timerLookup.Reset
		  For i = 0 To Me.ListCount - 1
		    SearchedEntry = Me.List(i)
		    If SearchedEntry.BeginsWith(NewKey,ComparisonOptions.CaseInsensitive,App.LocaleForSearch) Then
		      Me.ListIndex = i
		      App.DebugWriter.Write "SongPickerWindow.lst_all_songs.KeyDown: Found match index, value: " + str(i) + " " + Me.List(i), 5
		      sch_quick_lookup.Text = NewKey
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
		  Return HandleShortcutKey(Control(Me), Key)
		End Function
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  Me.ColorizeBilingual
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_order
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleShortcutKey(Control(Me), Key)
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Mask = "" // fix for non-working Mask ">CCCCCCC": this accepted control characters into the Text
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  // fix for non-working Mask ">CCCCCCC"
		  Dim selStart As Integer
		  selStart = Me.SelStart
		  Me.Text = Uppercase(Me.Text)
		  Me.SelStart = selStart
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_add
	#tag Event
		Sub Action()
		  If lst_all_songs.ListIndex >= 0 Then
		    AddSelectedSong
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
#tag Events btn_search_back
	#tag Event
		Sub Action()
		  FindPrevious
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon left_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_search_next
	#tag Event
		Sub Action()
		  FindNext
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon right_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
