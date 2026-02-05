#tag Window
Begin Window PresentHelperWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   600
   MinimizeButton  =   True
   MinWidth        =   800
   Placement       =   0
   Resizeable      =   True
   Title           =   "Presentation Helper"
   Visible         =   True
   Width           =   800
   Begin PagePanel pnl_bottom
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   258
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      PanelCount      =   1
      Panels          =   ""
      Scope           =   2
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   343
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   637
      Begin Label lbl_preview
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
         InitialParent   =   "pnl_bottom"
         Italic          =   False
         Left            =   10
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Current slide preview"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   344
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   292
      End
      Begin Label lbl_preview_next
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
         InitialParent   =   "pnl_bottom"
         Italic          =   False
         Left            =   329
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Next slide preview"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   344
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   298
      End
      Begin Canvas cnv_preview
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   True
         Enabled         =   True
         Height          =   208
         Index           =   -2147483648
         InitialParent   =   "pnl_bottom"
         Left            =   10
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   372
         Transparent     =   True
         Visible         =   True
         Width           =   300
      End
      Begin Canvas cnv_preview_next
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   False
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   True
         Enabled         =   True
         Height          =   208
         Index           =   -2147483648
         InitialParent   =   "pnl_bottom"
         Left            =   329
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   372
         Transparent     =   True
         Visible         =   True
         Width           =   298
      End
      Begin SEinhugurSplitter spl_previews
         AutoDeactivate  =   True
         CursorSmoothing =   True
         DockAfter       =   False
         DockAfterSize   =   40
         DockBefore      =   False
         DockBeforeSize  =   40
         DoubleClickAction=   0
         Enabled         =   True
         Height          =   227
         Index           =   -2147483648
         InitialParent   =   "pnl_bottom"
         Left            =   314
         LinuxStyle      =   3
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacStyle        =   3
         MinAfterArea    =   175
         MinBeforeArea   =   200
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   354
         Visible         =   True
         Width           =   10
         WinLiveMove     =   False
         WinStyle        =   1
      End
   End
   Begin PagePanel pnl_top
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   331
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   1
      Panels          =   ""
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   637
      Begin ListBox lst_all_slides
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   False
         AllowResizableColumns=   True
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   3
         ColumnWidths    =   "27%,8%,65%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         DropIndicatorVisible=   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         GridLinesHorizontalStyle=   0
         GridLinesVerticalStyle=   0
         HasBorder       =   True
         HasHeader       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   239
         Index           =   -2147483648
         InitialParent   =   "pnl_top"
         InitialValue    =   ""
         Italic          =   False
         Left            =   10
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         RowSelectionType=   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   11
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   617
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin WindowSplitter spl_slidelist_text
         AutoDeactivate  =   True
         CursorSmoothing =   True
         DockAfter       =   False
         DockAfterSize   =   10
         DockBefore      =   False
         DockBeforeSize  =   40
         DoubleClickAction=   1
         Enabled         =   True
         Height          =   11
         Index           =   -2147483648
         InitialParent   =   "pnl_top"
         Left            =   10
         LinuxStyle      =   3
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         MacStyle        =   3
         MinAfterArea    =   10
         MinBeforeArea   =   75
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   250
         Visible         =   True
         Width           =   617
         WinLiveMove     =   False
         WinStyle        =   1
      End
      Begin TextArea edt_slide_notes
         AllowAutoDeactivate=   True
         AllowFocusRing  =   False
         AllowSpellChecking=   True
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   63
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "pnl_top"
         Italic          =   False
         Left            =   10
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   261
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   617
      End
   End
   Begin GroupBox grp_presentation_modes
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Mode"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   179
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   639
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   5
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
      Begin SButton btn_mode_normal
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_modes"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   25
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_black
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_modes"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   50
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_white
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_modes"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   75
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_hidden
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_modes"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   100
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_logo
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_modes"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   125
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_frozen
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_modes"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   150
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
   End
   Begin Label txt_shortcut_keys
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   228
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   639
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "- Arrows: -\r\nDown: Next Slide\r\nUp: Previous Slide\r\nRight: Next Section\r\nLeft: Previous Section\r\n- Jump To: -\r\n1-9: Verse\r\nC: Chorus\r\nP: Pre-chorus\r\nB: Bridge\r\nT: Tag"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   362
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin GroupBox grp_presentation_actions
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Actions"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   155
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   639
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   200
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
      Begin SButton btn_action_alert
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_actions"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   220
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_action_quick_song
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_actions"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   245
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_action_scripture
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_actions"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   270
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_action_full_screen
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_actions"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   295
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_action_return
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   24
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "grp_presentation_actions"
         Label           =   ""
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   320
         Transparent     =   True
         Visible         =   True
         Width           =   130
      End
   End
   Begin WindowSplitter spl_text_graphics
      AutoDeactivate  =   True
      CursorSmoothing =   True
      DockAfter       =   False
      DockAfterSize   =   40
      DockBefore      =   False
      DockBeforeSize  =   40
      DoubleClickAction=   0
      Enabled         =   True
      Height          =   11
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   10
      LinuxStyle      =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MacStyle        =   3
      MinAfterArea    =   100
      MinBeforeArea   =   100
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   330
      Visible         =   True
      Width           =   617
      WinLiveMove     =   False
      WinStyle        =   1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  App.DebugWriter.Write "Begin PresentHelperWindow.Activate:"
		  Dim i As Integer
		  Dim w As Window
		  If Globals.Status_Presentation And Not PresentWindow.Visible Then PresentWindow.Show
		  If PresentWindow.Visible And Not PresentWindow.ExternalSlideWait Then App.ShowWin(PresentWindow, App.SW_SHOWNA)
		  For i = 0 To WindowCount - 1
		    w = Window(i)
		    If w.Visible Then
		      If w <> PresentWindow Then
		        App.SetForeground(w)
		        App.DebugWriter.Write "SetForeground for window " + Str(i) + " " + w.Title
		        Exit
		      End If
		    End If
		  Next
		  App.DebugWriter.Write "End PresentHelperWindow.Activate:"
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  Dim curBounds As REALbasic.Rect = Self.Bounds.Clone
		  If PresentWindow.PresentationMode = PresentWindow.MODE_DUAL_SCREEN Then
		    App.MainPreferences.SetValueN(prefs.kPresentHelperGeometry + "/@left", curBounds.Left)
		    App.MainPreferences.SetValueN(prefs.kPresentHelperGeometry + "/@top", curBounds.Top)
		    App.MainPreferences.SetValueN(prefs.kPresentHelperGeometry + "/@width", curBounds.Width)
		    App.MainPreferences.SetValueN(prefs.kPresentHelperGeometry + "/@height", curBounds.Height)
		  End If
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return PresentWindow.KeyDownX(Key)
		End Function
	#tag EndEvent

	#tag Event
		Sub Maximize()
		  //++
		  // OSX triggers this on Zoom, which may not be to the full screen if in
		  // preview mode.
		  //--
		  SavePos
		  IsMaximized = True
		  SetFullScreen
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  System.DebugLog CurrentMethodName + " " + DateTime.Now.ToString
		  Dim marginLeft As Integer
		  
		  App.T.TranslateWindow Me, "presentation_helper", App.TranslationFonts
		  txt_shortcut_keys.Caption = App.T.Translate("presentation_helper/keys")
		  
		  
		  Dim screenWidth As Double = OSScreen(PresentWindow.PresentScreen).Width
		  Dim screenHeight As Double =  OSScreen(PresentWindow.PresentScreen).Height
		  m_screenRatio = screenWidth / screenHeight
		  
		  Dim setName As String
		  setName = SmartML.GetValue(PresentWindow.CurrentSet.DocumentElement, "@name", False).Trim
		  If setName <> "" Then
		    Self.Title = Self.Title + " - " + setName
		  End If
		  
		  btn_action_scripture.Enabled = BibleFactory.HasBible
		  
		  If SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "monitors/@force_4_3_preview", False, False) Then
		    If m_screenRatio > 1.0 Then
		      m_screenRatio = 4.0/3.0
		    Else
		      m_screenRatio = 3.0/4.0
		    End If
		  End If
		  
		  If SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "monitors/@force_16_9_preview", False, False) Then
		    If m_screenRatio > 1.0 Then
		      m_screenRatio = 16.0/9.0
		    Else
		      m_screenRatio = 9.0/16.0
		    End If
		  End If
		  
		  'cnv_preview.Width = cnv_preview.Height * m_screenRatio
		  'marginLeft = cnv_preview.Left + cnv_preview.Width + 10
		  'Me.MinWidth = marginLeft + grp_presentation_actions.Width + 10
		  '
		  'cnv_preview_next.Left = marginLeft
		  'lbl_preview_next.Left = marginLeft
		  'txt_shortcut_keys.Left = marginLeft + lbl_preview_next.Width + 10
		  'edt_slide_notes.Left = marginLeft
		  
		  ResizePreview()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  '++JRC: Recalc whenever window is resized
		  RecalcLstAllSlidesColumnWidths
		  ResizePreview()
		  Refresh
		  '--
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  ResizePreview()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  IsMaximized = False
		  SetNormalScreen
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DrawPreviewOverlay(g As Graphics, c As Color, lineWidth As Integer)
		  g.ForeColor = c
		  g.PenSize = lineWidth
		  g.fillRect 0, 0, lineWidth, g.Height ' left
		  g.fillRect 0, 0, g.Width, lineWidth ' top
		  g.fillRect g.Width - lineWidth, 0, lineWidth, g.Height ' right
		  g.fillRect 0, g.Height - lineWidth, g.Width, lineWidth ' bottom
		  g.DrawLine 0, lineWidth / 2.0, g.Width, g.Height - (lineWidth / 2.0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertItem(slide As XmlNode, index As Integer, forceSeparator As Boolean = False)
		  Dim NamesEqual As Boolean = True
		  Dim TagsEqual As Boolean = True //++EMP 15 Jan 06
		  
		  If index >= lst_all_slides.ListCount Then
		    lst_all_slides.AddRow SmartML.GetValue(slide.Parent.Parent, "@name", True)
		    index = lst_all_slides.ListCount - 1
		    'index = index - 1
		  Else
		    lst_all_slides.InsertRow index, SmartML.GetValue(slide.Parent.Parent, "@name", True)
		  End If
		  
		  lst_all_slides.CellTag(index, 0) = SmartML.GetValue(slide.Parent.Parent, "@type", True)  //++EMP 15 Jan 06
		  
		  lst_all_slides.CellBold(index,1) = SmartML.GetValueB(slide, "@emphasize", False) _
		  And SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "default_style/body/@highlight_chorus", True, True) 'EMP 12/05
		  
		  lst_all_slides.Cell(index,1) = SmartML.GetValue(slide, "@id", False)
		  lst_all_slides.CellAlignment(index, 1) = ListBox.AlignCenter
		  Select Case SmartML.GetValue(slide.Parent.Parent, "@type", False)
		  Case "image", "external"
		    lst_all_slides.Cell(index,2) = Trim(SmartML.GetValue(slide, "description", True)).CleanSpaces
		  Case "custom"
		    Dim s As String
		    s = Join(Array(SmartML.GetValue(slide.Parent.Parent, "title", False),SmartML.GetValue(slide.Parent.Parent, "subtitle", False),SmartML.GetValue(slide, "body", True))," ")
		    lst_all_slides.Cell(index,2) = Trim(s).Translate(StringUtils.WhiteSpaces+Chr(9)," ").CleanSpaces
		  Else
		    lst_all_slides.Cell(index,2) = ReplaceAll(ReplaceAll(Trim(SmartML.GetValue(slide, "body", True)), Chr(10), " "), Chr(9), " ").CleanSpaces
		  End Select
		  //++EMP 15 Jan 06
		  // Put in separator lines if either the name and celltags differ
		  If Index > 0 Then
		    NamesEqual = lst_all_slides.Cell(index, 0) = lst_all_slides.Cell(index - 1, 0)
		    TagsEqual = lst_all_slides.CellTag(index, 0) = lst_all_slides.CellTag(index - 1, 0)
		  End If
		  //--
		  If index = 0 Or _
		    (index > 0 And Not (TagsEqual And NamesEqual)) Or _
		    forceSeparator Then
		    lst_all_slides.CellBorderTop(index, 0) = 4
		    lst_all_slides.CellBorderTop(index, 1) = 4
		    lst_all_slides.CellBorderTop(index, 2) = 4
		  End If
		  
		  If slide.NextSibling = Nil And SmartML.GetValueB(slide.Parent.Parent, "@loop") Then
		    lst_all_slides.Cell(index, 2) = "(" + App.T.Translate("presentation_helper/loop/@caption") + ") " + lst_all_slides.Cell(index, 2)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RecalcLstAllSlidesColumnWidths()
		  '
		  ' After a resize event on the screen (i.e. the FullScreen button was pressed),
		  ' rework the column widths to keep the Verse column from growing too big.
		  ' EMP 01/31/05
		  '
		  If lst_all_slides.ListCount < 1 Then Return
		  
		  Dim ControlWidth As Integer
		  Dim pic As New Picture(1, 1, 32)
		  Dim g As Graphics
		  Dim WidthString As String
		  Dim tempWidth As Double
		  Dim tempText As String
		  
		  #If RBVersion > 2016 Then
		    pic.Graphics.ScaleX = Self.ScaleFactor
		    pic.Graphics.ScaleY = Self.ScaleFactor
		    pic.HorizontalResolution = 72 * Self.ScaleFactor
		    pic.VerticalResolution = 72 * Self.ScaleFactor
		  #EndIf
		  g = pic.Graphics
		  g.TextSize = lst_all_slides.TextSize
		  g.TextFont = lst_all_slides.TextFont
		  
		  tempWidth = 0
		  For i As Integer = 0 To lst_all_slides.ListCount - 1
		    If tempText <> lst_all_slides.cell(i, 0) Then
		      tempText = lst_all_slides.cell(i, 0)
		      tempWidth = Max(tempWidth, g.StringWidth(tempText))
		    End If
		  Next i
		  ControlWidth = Ceil((tempwidth / lst_all_slides.Width) * 100) + 2 'Fudge Factor
		  ControlWidth = Min(ControlWidth, 20)
		  WidthString = Str(ControlWidth) + "%, "
		  tempWidth = g.StringWidth("MMMM") 'four-em width should be good
		  ControlWidth = Ceil((tempWidth / lst_all_slides.Width) * 100)
		  WidthString = WidthString + Str(ControlWidth) + " %, *"
		  lst_all_slides.ColumnWidths = WidthString
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizePreview()
		  Return
		  Dim marginLeft As Integer = cnv_preview.Left + cnv_preview.Width + 10
		  Dim marginRight As Integer = grp_presentation_actions.Width + 10
		  Dim prvLargeHeight As Integer = cnv_preview.Height
		  Dim prvSmallHeight As Integer = 120
		  
		  Dim prvLargeWidth As Integer = prvLargeHeight * m_screenRatio
		  Dim prvSmallWidth As Integer = prvSmallHeight * m_screenRatio
		  
		  If Me.Width > (marginLeft + prvLargeWidth + 10 + marginRight) Then
		    
		    cnv_preview_next.Visible = True
		    lbl_preview_next.Visible = True
		    
		    If Me.Width < (marginLeft + prvLargeWidth + 10 + marginRight + 100) Then
		      txt_shortcut_keys.Visible = False
		    Else
		      txt_shortcut_keys.Visible = True
		    End If
		    
		    If cnv_preview_next.Width <> prvLargeWidth Then
		      cnv_preview_next.Width = prvLargeWidth
		      cnv_preview_next.Height = prvLargeHeight
		      txt_shortcut_keys.Left = marginLeft + prvLargeWidth + 10
		      edt_slide_notes.Left = marginLeft + prvLargeWidth + 10
		      edt_slide_notes.Width = Me.Width - edt_slide_notes.Left - 10
		    End If
		    
		  Else
		    
		    If Me.Width >= (marginLeft + prvSmallWidth + 10 + marginRight) And Me.Width < (marginLeft + prvSmallWidth + 10 + marginRight + 100) Then
		      
		      txt_shortcut_keys.Visible = False
		      cnv_preview_next.Visible = True
		      lbl_preview_next.Visible = True
		      
		    ElseIf Me.Width < (marginLeft + prvSmallWidth + 10 + marginRight) Then
		      
		      txt_shortcut_keys.Visible = False
		      cnv_preview_next.Visible = False
		      lbl_preview_next.Visible = False
		    Else
		      cnv_preview_next.Visible = True
		      lbl_preview_next.Visible = True
		      txt_shortcut_keys.Visible = True
		    End If
		    
		    If cnv_preview_next.Width <> prvSmallWidth Then
		      cnv_preview_next.Width = prvSmallWidth
		      cnv_preview_next.Height = prvSmallHeight
		      txt_shortcut_keys.Left = marginLeft + prvSmallWidth + 10
		      edt_slide_notes.Left = marginLeft
		      edt_slide_notes.Width = Me.Width - edt_slide_notes.Left - 10
		    End If
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SavePos()
		  SavedTop = Self.Top
		  SavedLeft = Self.Left
		  SavedWidth = Self.Width
		  SavedHeight = Self.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollTo(index As Integer)
		  lst_all_slides.ListIndex = index - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetFullScreen()
		  btn_action_full_screen.SetIcon window_nofullscreen_img
		  btn_action_full_screen.Label = App.T.Translate("presentation_helper/actions/normal_screen/@caption")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetMaxClientArea()
		  Dim controlScreen As Integer
		  Dim de As XmlElement
		  
		  // having issues with Available... so for the time being use the version that makes estimates
		  // of the dimensions in the App class.  Not exact, but keeps the window from sliding up under
		  // the menu on OSX.
		  
		  App.MaximizeInControlScreen(Self)
		  Return
		  
		  de = App.MyPresentSettings.DocumentElement
		  controlScreen = SmartML.GetValueN(de, "monitors/@control") - 1
		  If controlScreen > OSScreenCount() Then controlScreen = 0
		  
		  Self.Top =  OSScreen(controlScreen).AvailableTop
		  Self.Left =  OSScreen(controlScreen).AvailableLeft
		  Self.Height =  OSScreen(controlScreen).AvailableHeight
		  Self.Width =  OSScreen(controlScreen).AvailableWidth
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMode(mode As String, refresh As Boolean = True)
		  btn_mode_black.Stuck = (mode = "B")
		  btn_mode_white.Stuck = (mode = "W")
		  btn_mode_hidden.Stuck = (mode = "H")
		  btn_mode_logo.Stuck = (mode = "L")
		  btn_mode_frozen.Stuck = (mode = "F")
		  btn_mode_normal.Stuck = (mode = "N")
		  
		  If refresh Then PresentWindow.ResetPaint PresentWindow.XCurrentSlide
		  
		  cnv_preview.Refresh False
		  cnv_preview_next.Refresh False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetNormalClientArea()
		  Self.Top = SavedTop
		  Self.Left = SavedLeft
		  Self.Height = SavedHeight
		  Self.Width = SavedWidth
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetNormalScreen()
		  btn_action_full_screen.SetIcon window_fullscreen_img
		  btn_action_full_screen.Label = App.T.Translate("presentation_helper/actions/full_screen/@caption")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwapFullScreen()
		  
		  #If TargetWin32
		    Dim lparam As New MemoryBlock(4)
		    Dim hwnd As Integer
		    Dim status As Integer
		    Const WM_SYSCOMMAND = 274
		    Const SC_MAXIMIZE = &HF030
		    Const SC_RESTORE = &HF120
		    
		    Declare Function SendMessageA Lib "user32" (ByVal hwnd as Integer, ByVal msg as Integer, ByVal wParam as Integer, ByVal lParam as Ptr) as Integer
		    
		    hwnd = Self.Handle
		  #EndIf
		  
		  If Not IsMaximized Then
		    SavePos
		    SetFullScreen
		    IsMaximized = True
		    
		    #If TargetWin32
		      status = SendMessageA(hwnd, WM_SYSCOMMAND, SC_MAXIMIZE, lparam)
		    #Else
		      SetMaxClientArea
		    #EndIf
		  Else
		    SetNormalScreen
		    IsMaximized = False
		    
		    #If TargetWin32
		      status = SendMessageA(hwnd, WM_SYSCOMMAND, SC_RESTORE, lparam)
		    #Else
		      SetNormalClientArea
		    #EndIf
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected InitialColumnWidths As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsMaximized As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsRightClick As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_screenRatio As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedWidth As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events cnv_preview
	#tag Event
		Sub GotFocus()
		  lst_all_slides.SetFocus 'EMP: Don't allow this control to get focus
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  If Not Globals.Status_Presentation Then Return
		  If IsNull(PresentWindow.XCurrentSlide) Then Return
		  edt_slide_notes.Text = SmartML.GetValue(PresentWindow.XCurrentSlide.Parent.Parent, "notes", True)
		  If edt_slide_notes.Text = "" Then
		    // Load the text of the slide into the notes field for easy reference.
		    If lst_all_slides.ListIndex > -1 Then
		      edt_slide_notes.Text = lst_all_slides.Cell(lst_all_slides.ListIndex, 2)
		    End If
		  End If
		  // Catch a race condition between this Paint event and PresentWindow still initializing
		  Dim x, y As Integer
		  Try
		    Dim scale As Double
		    scale = g.Width / PresentWindow.PreviewPicture.Width
		    y = scale * PresentWindow.PreviewPicture.Height
		    If y > g.Height Then
		      scale = g.Height / PresentWindow.PreviewPicture.Height
		      x = Scale * PresentWindow.PreviewPicture.Width
		      y = g.Height
		    Else
		      x = g.Width
		    End If
		    
		    // This prevents the preview from drawing over the controls to the right when the window height is increased
		    If x > spl_previews.Left - Me.Left Then
		      Dim newX As Integer = spl_previews.Left - Me.Left - (cnv_preview_next.Left - (spl_previews.Left + spl_previews.Width))
		      y = y * (newX / x)
		      x = newX
		    End If
		    
		    g.DrawPicture(PresentWindow.PreviewPicture, 1, 1, x - 2, y - 2, 0, 0, PresentWindow.PreviewPicture.Width, PresentWindow.PreviewPicture.Height)
		  Catch e As NilObjectException
		    // Just make it black for the moment
		    g.ForeColor = RGB(0,0,0)
		    g.FillRect 0, 0, g.Width, g.Height
		    Return
		  End Try
		  
		  Dim RealBorder, w, h As Integer
		  RealBorder = 5
		  
		  If btn_mode_black.Stuck Then
		    DrawPreviewOverlay(g.Clip(0, 0, x, y), Color.Black, RealBorder)
		  ElseIf btn_mode_white.Stuck Then
		    DrawPreviewOverlay(g.Clip(0, 0, x, y), Color.White, RealBorder)
		  ElseIf btn_mode_hidden.Stuck Then
		    DrawPreviewOverlay(g.Clip(0, 0, x, y), RGB(128, 128, 255), RealBorder)
		  ElseIf btn_mode_logo.Stuck Then
		    DrawPreviewOverlay(g.Clip(0, 0, x, y), RGB(128, 255, 128), RealBorder)
		    If PresentWindow.LogoCache <> Nil Then
		      h = PresentWindow.LogoCache.Height
		      w = PresentWindow.LogoCache.Width
		      While h > y / 2 And w > x / 2
		        h = h * .95
		        w = w * .95
		      Wend
		      g.DrawPicture PresentWindow.LogoCache, x - w, y - h, w, h, _
		      0, 0, PresentWindow.LogoCache.Width, PresentWindow.LogoCache.Height
		    End If
		  ElseIf btn_mode_frozen.Stuck Then
		    DrawPreviewOverlay(g.Clip(0, 0, x, y), RGB(255, 128, 128), RealBorder)
		  End If
		  g.ForeColor = DarkBevelColor
		  g.PenHeight = 1
		  g.PenWidth = 1
		  g.DrawRect 0, 0, x, y
		  
		  Catch ex
		    System.DebugLog "PresentHelperWindow.cnv_preview.Paint: Exception caught"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  // Verify within the control...
		  
		  If (X >= 0) And (X <= Me.Width) And _
		    (Y >= 0) And (Y <= Me.Height) Then
		    If IsRightClick Then
		      Call PresentWindow.PerformAction(PresentWindow.ACTION_PREV_SLIDE)
		    Else
		      Call PresentWindow.PerformAction(PresentWindow.ACTION_NEXT_SLIDE)
		    End If
		  End If
		  
		  IsRightClick = False
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  IsRightClick = IsContextualClick
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cnv_preview_next
	#tag Event
		Sub GotFocus()
		  lst_all_slides.SetFocus
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  Dim nextSlide As XmlNode
		  
		  If Not Globals.Status_Presentation Then Return
		  If Not Me.Visible Then Return
		  If IsNull(PresentWindow.XCurrentSlide) Then Return
		  
		  nextSlide = SetML.GetNextSlide(PresentWindow.XCurrentSlide)
		  If IsNull(nextSlide) Then
		    g.ForeColor = RGB(200,200,200)
		    g.FillRect 0, 0, g.Width, g.Height
		  Else
		    // Catch a race condition between this Paint event and PresentWindow still initializing
		    Try
		      Dim x, y As Integer
		      Dim scale As Double
		      scale = g.Width / PresentWindow.PreviewPicture.Width
		      y = scale * PresentWindow.PreviewPicture.Height
		      If y > g.Height Then
		        scale = g.Height / PresentWindow.PreviewPicture.Height
		        x = Scale * PresentWindow.PreviewPicture.Width
		        y = g.Height
		      Else
		        x = g.Width
		      End If
		      Dim g1 As New Picture(PresentWindow.PreviewPicture.Width, PresentWindow.PreviewPicture.Height)
		      
		      Dim external_did_draw As Boolean = PresentWindow.m_ExternalRenderer.Render(g1.Graphics, nextSlide, PresentWindow.CurrentSlide + 1)
		      If Not external_did_draw Then
		        SetML.DrawSlide g1.Graphics, nextSlide, SetML.GetSlideStyle(nextSlide)
		      End If
		      g.DrawPicture(g1, 1, 1, x - 2, y - 2, 0, 0, PresentWindow.PreviewPicture.Width, PresentWindow.PreviewPicture.Height)
		      g.ForeColor = Color.DarkBevelColor
		      g.PenHeight = 1
		      g.PenWidth = 1
		      g.DrawRect(0, 0, x, y)
		      
		    Catch e As NilObjectException
		      // Just make it black for the moment
		      g.ForeColor = RGB(0,0,0)
		      g.FillRect 0, 0, g.Width, g.Height
		      Return
		    End Try
		  End If
		  
		  'g.ForeColor = DarkBevelColor
		  'g.PenHeight = 1
		  'g.PenWidth = 1
		  'g.DrawRect 0, 0, g.Width, g.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events spl_previews
	#tag Event
		Sub Open()
		  Me.AddControl(cnv_preview, True)
		  Me.AddControl(lbl_preview, True)
		  Me.AddControl(cnv_preview_next, False)
		  Me.AddControl(lbl_preview_next, False)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Me.Position = (cnv_preview_next.Left + cnv_preview_next.Width - cnv_preview.Left) / 2 + (Me.Width / 2)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_all_slides
	#tag Event
		Sub Change()
		  Dim midpoint As Integer
		  Dim toListIndex, cnt As Integer
		  If Me.ListIndex >= 0 Then
		    Do
		      toListIndex = Me.ListIndex
		      Call PresentWindow.GoSlide(Me.ListIndex + 1)
		      // GoSlide might indirectly change Me.Listindex again, but does not trigger this event again, when called from within it's handler
		      cnt = cnt + 1
		      If cnt > 50 Then
		        App.DebugWriter.Write CurrentMethodName + ": could not find a stable slide index ...", 3
		        Exit
		      End If
		    Loop Until Me.ListIndex = toListIndex
		    
		    //++
		    // Try to keep the active slide in the center of the visible items
		    //--
		    Dim p As Picture = Window.BitmapForCaching(1, 1)
		    p.Graphics.TextFont = Me.TextFont
		    p.Graphics.TextSize = Me.TextSize
		    p.Graphics.Bold = Me.Bold
		    p.Graphics.Italic = Me.Italic
		    Dim th As Double = p.Graphics.TextHeight
		    midpoint = (Me.Height \ (th + 3)) \ 2
		    Me.ScrollPosition = Max(0, Me.ListIndex - midpoint)
		    App.DebugWriter.Write StringUtils.Sprintf("%s: ListIndex %d, Height %d, Midpoint %d, ScrollPosition %d", CurrentMethodName, Me.ListIndex, Me.Height, midpoint, Me.ScrollPosition), 10
		    Me.Refresh False
		    cnv_preview.Refresh False
		    cnv_preview_next.Refresh False
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function HeaderPressed(column as Integer) As Boolean
		  #Pragma Unused column
		  Me.SetFocus //Take focus off the header to allow keystrokes to properly process
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return PresentWindow.KeyDownX(key)
		End Function
	#tag EndEvent
	#tag Event
		Function SortColumn(column As Integer) As Boolean
		  #Pragma Unused column
		  Me.setFocus 'EMP: If we don't do this, focus stays on the header and keystrokes won't go to the command handler
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma Unused column
		  // Based on a contribution by fmate14
		  // User contributed from https://sourceforge.net/projects/opensong/forums/forum/373378/topic/1679116?message=4171729
		  
		  If App.SlideStyleColorEnabled() Then
		    g.ForeColor=rgb(255,255,255)
		    
		    If row <me.listCount() Then
		      g.ForeColor=App.SlideStyleColor("blank") // Default for inserted blanks
		      
		      Select Case me.CellTag(row,0)
		      Case "song"
		        Select Case me.Cell(row,1).Left(1)
		        Case "V" // Verse
		          g.ForeColor = App.SlideStyleColor("verse")
		        Case "B" // Bridge
		          g.ForeColor = App.SlideStyleColor("bridge")
		        Case "P" // Pre-Chorus
		          g.ForeColor = App.SlideStyleColor("pre-chorus")
		        Case "C" // Chorus
		          g.ForeColor = App.SlideStyleColor("chorus")
		        Case "T" // Tag
		          g.ForeColor = App.SlideStyleColor("tag")
		        End Select
		      Case "custom"
		        g.ForeColor = App.SlideStyleColor("custom")
		      Case "scripture"
		        g.ForeColor = App.SlideStyleColor("scripture")
		      Case "style"
		        g.ForeColor = App.SlideStyleColor("style")
		      Case "image"
		        g.ForeColor = App.SlideStyleColor("image")
		      Case "external"
		        g.ForeColor = App.SlideStyleColor("external")
		      End Select
		    End If
		    
		    g.fillRect(0,0,g.width, g.height)
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events spl_slidelist_text
	#tag Event
		Sub Open()
		  Me.AddControl(lst_all_slides, True)
		  Me.AddControl(edt_slide_notes, False)
		End Sub
	#tag EndEvent
	#tag Event
		Sub SplitterMoved(X as Integer,Y as Integer)
		  #Pragma Unused X
		  #Pragma Unused Y
		  Dim MaxY As Integer = Me.Parent.Top + Me.Parent.Height - Me.Height
		  If Me.Position > MaxY Then
		    Me.Position = MaxY
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_notes
	#tag Event
		Sub GotFocus()
		  lst_all_slides.setFocus 'EMP: Don't allow this control to get focus
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_normal
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("n") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon text_background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_black
	#tag Event
		Sub Action()
		  Call PresentWindow.KeyDownX("k")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon black_background_img
		  Me.Toggle = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_white
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("w") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon white_background_img
		  Me.Toggle = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_hidden
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("h") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		  Me.Toggle = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_logo
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("l") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon logo_background_img
		  Me.Toggle = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_frozen
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("f") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon pause_background_img
		  Me.Toggle = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_alert
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("a") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon bell_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_quick_song
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("q") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon midi_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_scripture
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("s") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon empty_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_full_screen
	#tag Event
		Sub Action()
		  SwapFullScreen
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon window_fullscreen_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_return
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX(Chr(27)) Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon exit_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events spl_text_graphics
	#tag Event
		Sub Open()
		  Me.AddUnmanagedControl(pnl_top, True)
		  Me.AddControl(pnl_bottom, False)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X as Integer,Y as Integer)
		  If (X >= 0) And (X <= Me.Width) And _
		    (Y >= 0) And (Y <= Me.Height) Then
		    If Not IsRightClick Then
		      Call PresentWindow.PerformAction(PresentWindow.ACTION_NEXT_SLIDE)
		    End If
		  End If
		  
		  IsRightClick = False
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X as Integer,Y as Integer) As Boolean
		  IsRightClick = IsContextualClick
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
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
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
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
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
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
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
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
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
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
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
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
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
