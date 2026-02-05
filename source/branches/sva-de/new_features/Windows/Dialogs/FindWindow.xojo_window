#tag Window
Begin Window FindWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   342
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Song Search"
   Visible         =   True
   Width           =   460
   Begin Label txt_song_search
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
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Enter search string:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin SEditField edt_input
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   22
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   32
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   242
   End
   Begin SButton btn_ok
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      HasFocus        =   False
      Height          =   24
      Icon            =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   ""
      LabelAlign      =   0
      Left            =   333
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuItem        =   ""
      NewPaint        =   False
      Outline         =   True
      Scope           =   0
      StickyBevel     =   False
      Stuck           =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Toggle          =   False
      Tooltip         =   ""
      Top             =   25
      Transparent     =   True
      Visible         =   True
      Width           =   117
   End
   Begin SButton btn_cancel
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      HasFocus        =   False
      Height          =   24
      Icon            =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   ""
      LabelAlign      =   0
      Left            =   333
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuItem        =   ""
      NewPaint        =   False
      Outline         =   True
      Scope           =   0
      StickyBevel     =   False
      Stuck           =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Toggle          =   False
      Tooltip         =   ""
      Top             =   50
      Transparent     =   True
      Visible         =   True
      Width           =   117
   End
   Begin GroupBox grp_search_fields
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Search Fields"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   242
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   80
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   440
      Begin CheckBox chk_search_title
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Title"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   1
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   100
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chk_search_author
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Author"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   1
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   120
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chk_search_copyright
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Copyright"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   140
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_ccli
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "CCLI #"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   160
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_presentation
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Presentation"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   180
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_lyrics
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Chords/Lyrics"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   1
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   200
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chk_search_hymn_number
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Hymn Number"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   220
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_themes
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Themes"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   1
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   239
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chk_search_capo
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Capo"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   258
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_time_sig
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Time Signature"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   100
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_tempo
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Tempo"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   120
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_key
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Key"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   140
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_aka
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "AKA"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   160
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_key_line
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Key Line"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   180
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_user1
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "User Defined 1"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   200
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_user2
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "User Defined 2"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   220
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_search_user3
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "User Defined 3"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   240
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   190
      End
      Begin CheckBox chk_seach_chord
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Chord"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   62
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   288
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   104
      End
      Begin PopupMenu pop_search_chord
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         InitialValue    =   ""
         Italic          =   False
         Left            =   178
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   0
         TabIndex        =   18
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   288
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   64
      End
      Begin PopupMenu pop_search_form
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         InitialValue    =   ""
         Italic          =   False
         Left            =   255
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   0
         TabIndex        =   19
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   288
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   126
      End
      Begin Label lbl_search_chord_key
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
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   178
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   20
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Key"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   266
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   64
      End
      Begin Label lbl_search_chord_form
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
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   255
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   21
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Form"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   266
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   126
      End
   End
   Begin PushButton btn_hidden_hidok
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   165
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   365
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   22
   End
   Begin PushButton btn_hidden_hidcancel
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   250
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   365
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   22
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  Me.SetFocus
		  edt_input.SetFocus
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  App.T.TranslateWindow Me, "song_search", App.TranslationFonts
		  
		  Dim s As String
		  '++JRC
		  Dim chords() As String
		  Dim forms() As String
		  Dim i As Integer
		  '--
		  
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user1")
		  If s.Len = 0 Then s = App.T.Translate("advanced_editor/user1/@caption")
		  chk_search_user1.Caption = s
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user2")
		  If s.Len = 0 Then s = App.T.Translate("advanced_editor/user2/@caption")
		  chk_search_user2.Caption = s
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user3")
		  If s.Len = 0 Then s = App.T.Translate("advanced_editor/user3/@caption")
		  chk_search_user3.Caption = s
		  
		  '++JRC
		  chords = Split(App.T.Translate("songml/chordkeys"), ",")
		  forms = Split(App.T.Translate("songml/formsdescriptive"), ",")
		  
		  For i = 0 To UBound(chords)
		    pop_search_chord.AddRow(chords(i))
		  Next i
		  
		  For i = 0 To UBound(forms)
		    pop_search_form.AddRow(forms(i))
		  Next i
		  '--
		  
		  App.CenterInControlScreen Me
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Cancel()
		  Output = False
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Okay()
		  Output = True
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Popup(ByRef find As FindClass) As Boolean
		  Me.find = find
		  
		  edt_input.Text = find.FindString
		  chk_search_title.Value = find.FindTitle
		  chk_search_author.Value = find.FindAuthor
		  chk_search_copyright.Value = find.FindCopyright
		  chk_search_ccli.Value = find.FindCCLI
		  chk_search_presentation.Value = find.FindPresentation
		  chk_search_lyrics.Value = find.FindLyrics
		  '++JRC
		  chk_search_hymn_number.Value = find.FindHymnNumber
		  chk_seach_chord.Value = find.FindChord
		  
		  pop_search_chord.ListIndex = 0
		  pop_search_form.ListIndex = 0
		  
		  If chk_seach_chord.Value Then
		    pop_search_chord.Enabled = True
		    pop_search_form.Enabled = True
		    find.ChordKey = "."
		    find.ChordForm = "."
		  Else
		    pop_search_chord.Enabled = False
		    pop_search_form.Enabled = False
		    find.ChordKey = ""
		    find.ChordForm = ""
		  End If
		  '--
		  chk_search_themes.Value = find.FindThemes
		  chk_search_capo.Value = find.FindCapo
		  chk_search_time_sig.Value = find.FindTimeSig
		  chk_search_tempo.Value = find.FindTempo
		  chk_search_key.Value = find.FindKey
		  chk_search_aka.Value = find.FindAKA
		  chk_search_key_line.Value = find.FindKeyLine
		  chk_search_user1.Value = find.FindUser1
		  chk_search_user2.Value = find.FindUser2
		  chk_search_user3.Value = find.FindUser3
		  
		  edt_input.SelStart = 0
		  edt_input.SelLength = edt_input.Text.Len
		  
		  ShowModal
		  Return Output
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		find As FindClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Output As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events edt_input
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(Key) = ASC_KEY_ENTER Then
		    Okay
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  find.FindString = Me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_ok
	#tag Event
		Sub Action()
		  Okay
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon button_ok_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_cancel
	#tag Event
		Sub Action()
		  Cancel
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon button_cancel_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_title
	#tag Event
		Sub Action()
		  find.FindTitle = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_author
	#tag Event
		Sub Action()
		  find.FindAuthor = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_copyright
	#tag Event
		Sub Action()
		  find.FindCopyright = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_ccli
	#tag Event
		Sub Action()
		  find.FindCCLI = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_presentation
	#tag Event
		Sub Action()
		  find.FindPresentation = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_lyrics
	#tag Event
		Sub Action()
		  find.FindLyrics = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_hymn_number
	#tag Event
		Sub Action()
		  find.FindHymnNumber = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_themes
	#tag Event
		Sub Action()
		  find.FindThemes = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_capo
	#tag Event
		Sub Action()
		  find.FindCapo = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_time_sig
	#tag Event
		Sub Action()
		  find.FindTimeSig = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_tempo
	#tag Event
		Sub Action()
		  find.FindTempo = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_key
	#tag Event
		Sub Action()
		  find.FindKey = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_aka
	#tag Event
		Sub Action()
		  find.FindAKA = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_key_line
	#tag Event
		Sub Action()
		  find.FindKeyLine = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_user1
	#tag Event
		Sub Action()
		  find.FindUser1 = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_user2
	#tag Event
		Sub Action()
		  find.FindUser2 = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_search_user3
	#tag Event
		Sub Action()
		  find.FindUser3 = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_seach_chord
	#tag Event
		Sub Action()
		  If chk_seach_chord.Value Then
		    pop_search_chord.Enabled = True
		    pop_search_form.Enabled = True
		    pop_search_chord.ListIndex = 0
		    pop_search_form.ListIndex = 0
		    find.ChordKey = "."
		    find.ChordForm = "."
		  Else
		    pop_search_chord.Enabled = False
		    pop_search_form.Enabled = False
		    find.ChordKey = ""
		    find.ChordForm = ""
		  End If
		  
		  find.FindChord = Me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_search_chord
	#tag Event
		Sub Change()
		  If Me.ListIndex = 0 Then
		    'set "any" chord to a period internally to make it easier for us ;)
		    find.ChordKey = "."
		  Else
		    find.ChordKey = pop_search_chord.Text
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_search_form
	#tag Event
		Sub Change()
		  Dim forms() As String
		  
		  If Me.ListIndex = 0 Then
		    'set "any" chord form to a period internally to make it easier for us ;)
		    find.ChordForm = "."
		  Else
		    'Load in the SYMBOLIC chord forms
		    'Note that "Major" has no symbol associated with it
		    'so just leave it blank
		    forms = Split(App.T.Translate("songml/chordforms"), ",")
		    If UBound(forms)>0 Then
		      find.ChordForm = forms(Me.ListIndex)
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_hidden_hidok
	#tag Event
		Sub Action()
		  Okay
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_hidden_hidcancel
	#tag Event
		Sub Action()
		  Cancel
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
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
		Visible=false
		Group="OS X (Carbon)"
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
		Group="Behavior"
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
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
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
		Visible=false
		Group="OS X (Carbon)"
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
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
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
		Name="Output"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
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
		Group="Frame"
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
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
