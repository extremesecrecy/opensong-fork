#tag Window
Begin Window FindWindow
   BackColor       =   "&cFFFFFF00"
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   320
   ImplicitInstance=   True
   LiveResize      =   False
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
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
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
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin SEditField edt_input
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   "&cFFFFFF00"
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
      Left            =   10
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   12
      TextUnit        =   0
      Top             =   25
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   242
   End
   Begin SButton btn_ok
      AcceptFocus     =   True
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasFocus        =   False
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      LabelAlign      =   0
      Left            =   333
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuItem        =   ""
      Scope           =   0
      StickyBevel     =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   25
      UseFocusRing    =   True
      Visible         =   True
      Width           =   117
   End
   Begin SButton btn_cancel
      AcceptFocus     =   True
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasFocus        =   False
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      LabelAlign      =   0
      Left            =   333
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuItem        =   ""
      Scope           =   0
      StickyBevel     =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   50
      UseFocusRing    =   True
      Visible         =   True
      Width           =   117
   End
   Begin GroupBox grp_search_fields
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Search Fields"
      Enabled         =   True
      Height          =   236
      HelpTag         =   ""
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
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   80
      Underline       =   False
      Visible         =   True
      Width           =   440
      Begin CheckBox chk_search_title
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Title"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
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
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   100
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_author
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Author"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
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
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   120
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_copyright
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Copyright"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
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
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   140
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_ccli
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "CCLI #"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
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
         State           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   160
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_presentation
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Presentation"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
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
         State           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   180
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_lyrics
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Chords/Lyrics"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
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
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   200
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_hymn_number
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hymn Number"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   19
         HelpTag         =   ""
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
         State           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   219
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   123
      End
      Begin CheckBox chk_search_themes
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Themes"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
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
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   238
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_capo
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Capo"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
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
         State           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   258
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_time_sig
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Time Signature"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   100
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_tempo
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Tempo"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   120
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_key
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Key"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   140
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_aka
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "AKA"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   160
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_key_line
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Key Line"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   180
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_user1
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "User Defined 1"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   200
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_user2
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "User Defined 2"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   220
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_search_user3
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "User Defined 3"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   240
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   125
      End
      Begin CheckBox chk_seach_chord
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Chord"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   281
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   86
      End
      Begin PopupMenu pop_search_chord
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         InitialValue    =   ""
         Italic          =   False
         Left            =   251
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   18
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   280
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin PopupMenu pop_search_form
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         InitialValue    =   ""
         Italic          =   False
         Left            =   314
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   19
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   280
         Underline       =   False
         Visible         =   True
         Width           =   126
      End
      Begin Label lbl_search_chord_key
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   253
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
         TextAlign       =   0
         TextColor       =   "&c00000000"
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   258
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin Label lbl_search_chord_form
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_search_fields"
         Italic          =   False
         Left            =   315
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
         TextAlign       =   0
         TextColor       =   "&c00000000"
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   258
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
   End
   Begin PushButton btn_hidden_hidok
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   165
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   365
      Underline       =   False
      Visible         =   True
      Width           =   22
   End
   Begin PushButton btn_hidden_hidcancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   250
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   365
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
		  If strComp(Key, Chr(ENTER), 0) = 0 Then
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
		  Me.SetIcon buttonokpic, buttonokmask
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
		  Me.SetIcon buttoncancepic, buttoncancemask
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
