#tag Window
Begin Window MainSettingsWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   482
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
   Title           =   "General Settings"
   Visible         =   True
   Width           =   663
   Begin PushButton btn_ok
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   445
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   449
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin PushButton btn_cancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   553
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   449
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin TabPanel tab_general_general
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   430
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Basic configuration\rFile locations\rImage handling\rSystem\rAppearance"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   7
      Transparent     =   True
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   623
      Begin GroupBox grp_settings_general
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "General"
         Enabled         =   True
         Height          =   156
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   250
         Begin Label lbl_general_ccli
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_general"
            Italic          =   False
            Left            =   51
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Church CCLI License"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   64
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   215
         End
         Begin SEditField edt_general_ccli
            AcceptTabs      =   False
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
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
            InitialParent   =   "grp_settings_general"
            Italic          =   False
            Left            =   51
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Multiline       =   ""
            ReadOnly        =   False
            Scope           =   0
            ScrollbarHorizontal=   ""
            ScrollbarVertical=   True
            Styled          =   ""
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   86
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   120
         End
         Begin CheckBox chk_general_version_check
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Check for newer versions on startup"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_general"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   110
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   229
         End
         Begin Label lbl_general_language
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_general"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Language:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   132
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   200
         End
         Begin PopupMenu pop_general_language
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_general"
            InitialValue    =   ""
            Italic          =   False
            Left            =   51
            ListIndex       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   154
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   216
         End
      End
      Begin GroupBox grp_settings_user_defined
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "User Defined Field Names"
         Enabled         =   True
         Height          =   193
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   327
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   45
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   296
         Begin Label lbl_define_user1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "User Defined 1:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   64
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   269
         End
         Begin SEditField edt_define_user1
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
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   86
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   271
         End
         Begin Label lbl_define_user2
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "User Defined 2:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   108
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   268
         End
         Begin SEditField edt_define_user2
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
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   130
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   271
         End
         Begin Label lbl_define_user3
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "User Defined 3:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   152
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   270
         End
         Begin SEditField edt_define_user3
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
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabIndex        =   5
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   174
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   271
         End
         Begin PushButton btn_define_load
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   "0"
            Cancel          =   False
            Caption         =   "Load Language Defaults"
            Default         =   False
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   208
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   241
         End
      End
      Begin GroupBox grp_settings_startmode
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Start Mode"
         Enabled         =   True
         Height          =   46
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   208
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   250
         Begin RadioButton rad_start_songs
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Songs"
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_startmode"
            Italic          =   False
            Left            =   46
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   228
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   110
         End
         Begin RadioButton rad_start_sets
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Sets"
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_startmode"
            Italic          =   False
            Left            =   165
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   228
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   110
         End
      End
      Begin GroupBox grp_settings_logging
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Logging"
         Enabled         =   True
         Height          =   118
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   279
         Begin Label lbl_logging_level
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_logging"
            Italic          =   False
            Left            =   49
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Log level (0-10)"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   65
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   206
         End
         Begin Checkbox chk_logging_console
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Log to system console"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_logging"
            Italic          =   False
            Left            =   49
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   116
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   250
         End
         Begin PopupMenu pop_logging_level
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_logging"
            InitialValue    =   "Disabled\r1 (Info)\r2\r3 (Warn)\r4 (Debug)\r5\r6\r7\r8\r9 (Detailed)\r10"
            Italic          =   False
            Left            =   49
            ListIndex       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   87
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   206
         End
         Begin Checkbox chk_logging_append
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Append to logfile"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_logging"
            Italic          =   False
            Left            =   49
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   136
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   250
         End
      End
      Begin GroupBox grp_settings_proxy
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "HTTP Proxy"
         Enabled         =   True
         Height          =   76
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   343
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   45
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_proxy_host
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_proxy"
            Italic          =   False
            Left            =   357
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Server:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   66
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   193
         End
         Begin Label lbl_proxy_port
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_proxy"
            Italic          =   False
            Left            =   562
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Port:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   66
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   50
         End
         Begin SEditField edt_proxy_host
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
            InitialParent   =   "grp_settings_proxy"
            Italic          =   False
            Left            =   357
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   88
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   194
         End
         Begin SEditField edt_proxy_port
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
            InitialParent   =   "grp_settings_proxy"
            Italic          =   False
            Left            =   562
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   88
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   47
         End
      End
      Begin GroupBox grp_activity_log
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Activity Log Settings"
         Enabled         =   True
         Height          =   69
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   170
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   279
         Begin CheckBox chk_logging_enable
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Enable Logging"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_activity_log"
            Italic          =   False
            Left            =   45
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   188
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   249
         End
         Begin CheckBox chk_logging_prompt
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Prompt Before Presenting"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_activity_log"
            Italic          =   False
            Left            =   45
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   212
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   249
         End
      End
      Begin GroupBox grp_settings_documents_folder
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Documents Folder"
         Enabled         =   True
         Height          =   244
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin RadioButton rad_documents_default
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Default"
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   89
            Transparent     =   True
            Underline       =   False
            Value           =   True
            Visible         =   True
            Width           =   205
         End
         Begin RadioButton rad_documents_custom
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Custom:"
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   109
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   205
         End
         Begin TextArea nte_folder_folder
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   False
            Border          =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   62
            HelpTag         =   ""
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   50
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Multiline       =   True
            ReadOnly        =   True
            Scope           =   0
            ScrollbarHorizontal=   ""
            ScrollbarVertical=   False
            Styled          =   False
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "\\"
            TextColor       =   "&c00000000"
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   137
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   211
         End
         Begin PushButton btn_browse
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   "0"
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   False
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   95
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   211
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin Label nte_documents_warning
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   27
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "(use with caution; forces restart)"
            TextAlign       =   0
            TextColor       =   &cFF000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   62
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   205
         End
         Begin Checkbox chk_documents_oldfolderdb
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Use Pre-V1.1 FolderDB cache"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   False
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   249
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   251
         End
      End
      Begin GroupBox grp_settings_applications
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "External applications"
         Enabled         =   True
         Height          =   368
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   345
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   45
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   278
         Begin Label lbl_applications_pptview
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   359
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Location of Powerpoint Viewer"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   66
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   246
         End
         Begin TextField edt_applications_pptview
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
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   359
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   88
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   251
         End
         Begin PushButton btn_applications_pptview_browse
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   "0"
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   416
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   122
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin PushButton btn_applications_videolan_browse
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   "0"
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   416
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   215
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin Label lbl_applications_videolan
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   359
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Location of Videolan client"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   159
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   246
         End
         Begin TextField edt_applications_videolan
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
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   359
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   181
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   251
         End
      End
      Begin GroupBox grp_settings_fonts
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Fonts"
         Enabled         =   True
         Height          =   373
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   250
         Begin Label lbl_fonts_headings
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Headings:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   62
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin Label lbl_fonts_labels
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Labels:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   114
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin Label lbl_fonts_text_fields
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Text Fields:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   166
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin Label lbl_fonts_fixed_width
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Fixed-width Text:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   218
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_headings
            AcceptFocus     =   False
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   30
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   84
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   220
         End
         Begin Label lbl_fonts_buttons
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   8
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Buttons:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   270
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_labels
            AcceptFocus     =   False
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   30
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   136
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   220
         End
         Begin Label lbl_fonts_large_headings
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   10
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Large Headings:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   322
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_text_fields
            AcceptFocus     =   False
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   30
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   188
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   220
         End
         Begin CheckBox chk_general_newpaint
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Use new control design"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   12
            TabPanelIndex   =   5
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   395
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_fixed_width
            AcceptFocus     =   False
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   30
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   240
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_buttons
            AcceptFocus     =   False
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   30
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   9
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   292
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_large_headings
            AcceptFocus     =   False
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   45
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_fonts"
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   11
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   344
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   220
         End
      End
      Begin GroupBox grp_settings_slidetype_coloring
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Slide type coloring"
         Enabled         =   True
         Height          =   373
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   340
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   45
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   283
         Begin SColorCanvas can_style_color_verse
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   86
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_verse
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Song, verse"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   87
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_bridge
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Song, bridge"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   117
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_bridge
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   116
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_prechorus
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Song, pre-chorus"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   147
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_prechorus
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   146
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_chorus
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Song, chorus"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   177
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_chorus
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   176
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_tag
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   9
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Song, tag"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   207
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_tag
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   10
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   206
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_scripture
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   11
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Scripture"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   237
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_scripture
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   12
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   236
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_custom
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   13
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Custom slide"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   267
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_custom
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   14
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   266
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_style
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   15
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Style change"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   297
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_style
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   16
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   296
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_image
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   17
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Image"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   327
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_image
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   18
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   326
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_application
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   19
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "External application"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   357
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_application
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   20
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   356
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin Label lbl_slidetype_blank
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   21
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Blank (inserted)"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   387
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin SColorCanvas can_style_color_blank
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   580
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   22
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   386
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin CheckBox chk_slidetype_coloring
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Apply background colors"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   355
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   0
            TabPanelIndex   =   5
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   63
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   220
         End
      End
      Begin GroupBox grp_settings_rcserver
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Remote Control"
         Enabled         =   True
         Height          =   103
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   343
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   136
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_rcserver_key
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   357
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Authentication key:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   181
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   193
         End
         Begin Label lbl_rcserver_port
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   562
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Port:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   180
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   50
         End
         Begin SEditField edt_rcserver_port
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
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   562
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabIndex        =   4
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   203
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   50
         End
         Begin CheckBox chk_rcserver_enable
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Enable remote control server"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   357
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   155
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   255
         End
         Begin SEditField edt_rcserver_key
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
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   357
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   203
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   193
         End
      End
      Begin GroupBox grp_settings_imagequality
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Set Image Quality"
         Enabled         =   True
         Height          =   183
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   234
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   587
         Begin Label txt_imagequality_note
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   91
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagequality"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "OpenSong tries to store the images that are used in a set in JPEG format. The items below control the quality and behaviour of image storage. The quality slider below will be disabled if QuickTime is not installed as OpenSong depends on that for storing JPEG images in user selectable quality."
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   255
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   497
         End
         Begin Label lbl_imagequality_compression
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagequality"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Image compression:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   358
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   497
         End
         Begin PopupMenu pop_imagequality_compression
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagequality"
            InitialValue    =   "Full, minimum quality\r\nHigh, low quality\r\nMedium, normal quality\r\nLittle, high quality\r\nLow, maximum quality\r\nNone, lossless"
            Italic          =   False
            Left            =   50
            ListIndex       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   382
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   497
         End
      End
      Begin GroupBox grp_settings_imagedefaults
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Image Processing Defaults"
         Enabled         =   True
         Height          =   178
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   587
         Begin CheckBox chk_imagedefaults_fit_to_screen
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Resize images to fit the screen"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   67
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   547
         End
         Begin CheckBox chk_imagedefaults_fit_to_body
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Resize images to fit the body area"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   2
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   91
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   547
         End
         Begin CheckBox chk_imagedefaults_keepaspect
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Keep aspect ratio when resizing images"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   3
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   115
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   547
         End
         Begin CheckBox chk_imagedefaults_store_as_link
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Do not embed images from backgrounds, use a link"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   4
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   139
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   547
         End
         Begin CheckBox chk_imagedefaults_background_as_text
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Show the background instead of the body text"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   5
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   163
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   547
         End
      End
      Begin GroupBox grp_settings_linked
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Linked Songs"
         Enabled         =   True
         Height          =   58
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   327
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   256
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   296
         Begin CheckBox chk_linked_prompt
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Prompt when adding linked songs"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_linked"
            Italic          =   False
            Left            =   339
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   277
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   275
         End
      End
      Begin GroupBox grp_settings_extrender
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "External Renderer"
         Enabled         =   True
         Height          =   151
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   343
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   250
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin CheckBox chk_extrender_enable
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Enable external renderer"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   357
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   269
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   255
         End
         Begin Label lbl_extrender_port
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   562
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Port:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   296
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   50
         End
         Begin Label lbl_extrender_server
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   357
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Server:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   296
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   193
         End
         Begin SEditField edt_extrender_port
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
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   562
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabIndex        =   4
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   318
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   50
         End
         Begin SEditField edt_extrender_server
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
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   357
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   318
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   193
         End
         Begin SEditField edt_extrender_timeout
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
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   357
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
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
            TabIndex        =   6
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   366
            Transparent     =   True
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   50
         End
         Begin Label lbl_extrender_timeout
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   357
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Timeout (in ms):"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   344
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   193
         End
      End
      Begin GroupBox grp_settings_reload
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Reload On Starup"
         Enabled         =   True
         Height          =   72
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   267
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   250
         Begin CheckBox chk_reload_songfolder
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Song Folder"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_reload"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   290
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   230
         End
         Begin CheckBox chk_reload_set
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Set"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_settings_reload"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   314
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   230
         End
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub EnableMenuItems()
		  //btn_documents_change.Enabled = NewDocsFolder <> Nil
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim s As String
		  
		  Init = True
		  edt_general_ccli.Text = SmartML.GetValue(App.MyMainSettings.DocumentElement, "ccli/@number")
		  chk_general_version_check.Value = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "version/@check", False)
		  edt_proxy_host.Text = SmartML.GetValue(App.MyMainSettings.DocumentElement, "proxy/@host")
		  edt_proxy_port.Text = SmartML.GetValue(App.MyMainSettings.DocumentElement, "proxy/@port")
		  
		  chk_linked_prompt.Value = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "linked_songs/@prompt", False)
		  
		  chk_rcserver_enable.Value = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "rcserver/@enable", False, False)
		  edt_rcserver_key.Text = SmartML.GetValue(App.MyMainSettings.DocumentElement, "rcserver/key", False)
		  edt_rcserver_port.Text = SmartML.GetValue(App.MyMainSettings.DocumentElement, "rcserver/@port", False)
		  If edt_rcserver_port.Text = "" Or edt_rcserver_port.Text = "0" Then
		    edt_rcserver_port.Text = "8082"
		  End If
		  
		  chk_extrender_enable.Value = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "extrender/@enable", False, False)
		  edt_extrender_server.Text = SmartML.GetValue(App.MyMainSettings.DocumentElement, "extrender/server", False)
		  If edt_extrender_server.Text = "" Then
		    edt_extrender_server.Text = "localhost"
		  End If
		  edt_extrender_port.Text = SmartML.GetValue(App.MyMainSettings.DocumentElement, "extrender/@port", False)
		  If edt_extrender_port.Text = "" Or edt_extrender_port.Text = "0" Then
		    edt_extrender_port.Text = "8083"
		  End If
		  edt_extrender_timeout.Text = SmartML.GetValue(App.MyMainSettings.DocumentElement, "extrender/@timeout", False)
		  If edt_extrender_timeout.Text = "" Or edt_extrender_timeout.Text = "0" Then
		    edt_extrender_timeout.Text = "3000"
		  End If
		  
		  //++
		  // EMP, July 2007
		  // Simplified this logic a little since there is now a way to return FolderItem from preferences
		  //--
		  DocsFolder = App.MainPreferences.GetValueFI(Prefs.kDocumentsFolder, DefaultDocsFolder, True)
		  rad_documents_default.Value = (DocsFolder.URLPath = DefaultDocsFolder.URLPath)
		  rad_documents_custom.Value = Not rad_documents_default.Value
		  btn_browse.Enabled = rad_documents_custom.Value
		  
		  PPTViewLocation = App.MainPreferences.GetValueFI(Prefs.kPPTViewLocation, Nil, False)
		  If Not IsNull( PPTViewLocation ) Then
		    edt_applications_pptview.Text = PPTViewLocation.NativePath()
		  End If
		  
		  VideolanLocation = App.MainPreferences.GetValueFI(Prefs.kVideolanLocation, Nil, False)
		  If Not IsNull( VideolanLocation ) Then
		    edt_applications_videolan.Text = VideolanLocation.NativePath()
		  End If
		  
		  s = App.MainPreferences.GetValue(Prefs.kLanguage, "English")
		  Dim f As FolderItem
		  f = App.AppFolder.Child("OpenSong Languages")
		  //++EMP add a couple of variables for troubleshooting and correct
		  // error that would set the ListIndex to the wrong value
		  Dim i As Integer
		  Dim currlang As Integer = -1
		  Dim langfile As FolderItem
		  pop_general_language.DeleteAllRows
		  Try
		    For i = 1 To f.Count
		      langfile = f.Item(i)
		      If Not langfile.Directory And langfile.IsFileVisible Then
		        pop_general_language.AddRow langfile.Name
		        If langfile.Name = s Then currlang = pop_general_language.ListCount - 1
		      End If
		    Next i
		  Catch
		    InputBox.Message "No languages available; please check the directory " + f.NativePath
		  End Try
		  
		  pop_general_language.ListIndex = currlang
		  
		  can_fonts_headings.SetFont SmartML.GetValueF(App.MyMainSettings.DocumentElement, "fonts/headings")
		  can_fonts_labels.SetFont SmartML.GetValueF(App.MyMainSettings.DocumentElement, "fonts/labels")
		  can_fonts_text_fields.SetFont SmartML.GetValueF(App.MyMainSettings.DocumentElement, "fonts/text_fields")
		  can_fonts_fixed_width.SetFont SmartML.GetValueF(App.MyMainSettings.DocumentElement, "fonts/fixed_width")
		  can_fonts_buttons.SetFont SmartML.GetValueF(App.MyMainSettings.DocumentElement, "fonts/buttons")
		  can_fonts_large_headings.SetFont SmartML.GetValueF(App.MyMainSettings.DocumentElement, "fonts/large_headings")
		  
		  App.T.TranslateWindow Me, "general_settings", App.TranslationFonts
		  
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user1")
		  If s.Len = 0 Then s = App.T.Translate("advanced_editor/user1/@caption")
		  edt_define_user1.Text = s
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user2")
		  If s.Len = 0 Then s = App.T.Translate("advanced_editor/user2/@caption")
		  edt_define_user2.Text = s
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user3")
		  If s.Len = 0 Then s = App.T.Translate("advanced_editor/user3/@caption")
		  edt_define_user3.Text = s
		  
		  // Code for supporting the Start Mode selection
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "startmode/@sets", True)
		  if s = "1" then rad_start_sets.Value = True Else rad_start_songs.Value = True
		  
		  chk_reload_songfolder.Value = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "reload/@songfolder", True, True)
		  chk_reload_set.Value = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "reload/@set", True, True)
		  
		  // Select which SButton.Paint to use
		  chk_general_newpaint.Value = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "paint/@new", True, False)
		  
		  App.CenterInControlScreen Me
		  
		  // Display DocsFolder Location
		  dim lblFont as FontFace = App.TranslationFonts(2)
		  nte_folder_folder.TextFont = lblFont.Name
		  nte_folder_folder.TextSize = nte_documents_warning.TextSize
		  nte_folder_folder.Bold = lblFont.Bold
		  nte_folder_folder.Italic = lblFont.Italic
		  nte_folder_folder.Underline = lblFont.Underline
		  If App.IsPortable Then
		    nte_folder_folder.Text = "Portable Installation"
		  Else
		    nte_folder_folder.Text = DocsFolder.FormatFolderName
		  End If
		  
		  // Add FolderDB flag
		  chk_documents_oldfolderdb.Value = App.MainPreferences.GetValueB(Prefs.kUseOldFolderDB)
		  
		  chk_imagedefaults_fit_to_screen.Value = ImageDefaults.ResizeToScreenArea()
		  chk_imagedefaults_fit_to_body.Value = ImageDefaults.ResizeToBodyArea()
		  chk_imagedefaults_keepaspect.Value = ImageDefaults.KeepAspectRatio()
		  chk_imagedefaults_store_as_link.Value = ImageDefaults.LinkToBackgroundsFolder()
		  chk_imagedefaults_background_as_text.Value = ImageDefaults.UseBackgroundsAsText()
		  
		  pop_imagequality_compression.Enabled = True
		  pop_imagequality_compression.DeleteAllRows
		  For i = 0 To UBound(App.ImageQualityList)
		    pop_imagequality_compression.AddRow App.ImageQualityList(i)
		  Next i
		  pop_imagequality_compression.ListIndex = Int32(ImageDefaults.ImageQuality())-1
		  
		  chk_slidetype_coloring.Value = App.SlideStyleColorEnabled()
		  can_style_color_verse.SetColor App.SlideStyleColor("verse")
		  can_style_color_bridge.SetColor App.SlideStyleColor("bridge")
		  can_style_color_prechorus.SetColor App.SlideStyleColor("pre-chorus")
		  can_style_color_chorus.SetColor App.SlideStyleColor("chorus")
		  can_style_color_tag.SetColor App.SlideStyleColor("tag")
		  can_style_color_scripture.SetColor App.SlideStyleColor("scripture")
		  can_style_color_custom.SetColor App.SlideStyleColor("custom")
		  can_style_color_style.SetColor App.SlideStyleColor("style")
		  can_style_color_image.SetColor App.SlideStyleColor("image")
		  can_style_color_application.SetColor App.SlideStyleColor("external")
		  can_style_color_blank.SetColor App.SlideStyleColor("blank")
		  
		  SetupLogfileSettings
		  Init = False
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  If App.IsPortable Then
		    rad_documents_default.Enabled = false
		    rad_documents_custom.Enabled = false
		    btn_browse.Enabled = false
		  End If
		  DefaultDocsFolder = App.AppDocumentsFolderForOpenSong
		  
		  // call the Window constructor, or Open events will not fire
		  Super.Window()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveDocsFolder()
		  //++
		  // Since this only modifies the preferences file and not App.DocsFolder,
		  // a forced restart is no longer necessary.  Still need to warn the user
		  // that a restart is needed to apply the changes.
		  //
		  // TODO: With a little cleaning up in App and MainWindow, it should be
		  // possible to update the location of the documents folder without
		  // a restart.  Have the appropriate objects/windows register for notifications.
		  //--
		  
		  If NewDocsFolder = Nil Then Return // No changes
		  
		  App.MainPreferences.SetValueFI(Prefs.kDocumentsFolder, NewDocsFolder)
		  
		  InputBox.Message App.T.Translate("general_settings/documents_folder/message")
		  
		  App.MainPreferences.NotifyReceivers
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveLogfileSettings()
		  Dim needReInit As Boolean = False
		  
		  If chk_logging_append.Value <> logAppend Then
		    App.MainPreferences.SetValueB(App.kLogOutput + App.kLogAppend, chk_logging_append.Value)
		  End If
		  
		  If chk_logging_console.Value <> logToConsoleSaved Then
		    App.MainPreferences.SetValueB(App.kLogOutput + App.kLogConsole, chk_logging_console.Value)
		    needReInit = True
		    If chk_logging_console.Value Then
		      App.MainPreferences.SetValueFI(App.kLogOutput, Nil)
		    End If
		  End If
		  
		  If logFileNew <> logFileSaved Then
		    App.MainPreferences.SetValueFI(App.kLogOutput, logFileNew)
		    needReInit = True
		  End If
		  
		  If logLevelSaved <> CDbl(pop_logging_level.Text) Then
		    App.MainPreferences.SetValueN(App.kLogLevel, CDbl(pop_logging_level.Text))
		  End If
		  
		  If needReInit Then
		    App.DebugWriter.SetOutput(logFileNew, chk_logging_append.Value)
		  End If
		  
		  Dim logLevelNew As Integer
		  If pop_logging_level.ListIndex = 0 Then
		    logLevelNew = App.DebugWriter.MINDEBUGLEVEL - 1
		  Else
		    logLevelNew = pop_logging_level.Text.CDbl
		  End If
		  
		  '++JRC Lets save the new log level (Sleepy time Ed ;)
		  App.MainPreferences.SetValueN(App.kLogLevel, logLevelNew)
		  
		  App.DebugWriter.Level = logLevelNew
		  
		  '++JRC This looks like a good place to save the song activity logging settings as well
		  If chk_logging_enable.Value <> ActivityLogEnabled Then
		    App.MainPreferences.SetValueB(App.kActivityLog, chk_logging_enable.Value)
		  End If
		  If chk_logging_prompt.Value <> PromptBeforePresenting Then
		    App.MainPreferences.SetValueB(App.kPromptBeforePresenting, chk_logging_prompt.Value)
		  End If
		  
		  '++JRC
		  'Load in the Song Activity Log if not already loaded
		  'This eliminates the the need for a restart
		  '++JRC Load Song Activity Log so the user can view the log
		  'reguardless of whether logging is enabled or not
		  If Globals.SongActivityLog = Nil Then
		    Globals.SongActivityLog = New ActivityLog
		    If App.CheckDocumentFolders(App.SETTINGS_FOLDER) <> App.NO_FOLDER Then
		      '+++EMP Use FolderItem and .Child instead of NativePath
		      If NOT Globals.SongActivityLog.Load(App.DocsFolder.Child("Settings").Child("ActivityLog.xml")) Then
		        MsgBox  App.T.Translate("errors/activity_disabled", App.DocsFolder.Child("Settings").Child("ActivityLog.xml").NativePath)
		        Globals.SongActivityLog = Nil
		      End If
		    Else
		      If App.DocsFolder <> Nil Then
		        MsgBox  App.T.Translate("errors/activity_disabled", FileUtils.JoinNativePath(App.DocsFolder.NativePath, "Settings", "ActivityLog.xml"))
		      Else
		        MsgBox App.T.Translate("errors/no_docs_folder", "")
		      End If
		      Globals.SongActivityLog = Nil
		    End If
		  End If
		  '--
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetupLogfileSettings()
		  logFileSaved = App.MainPreferences.GetValueFI(App.kLogOutput)
		  logLevelSaved = App.MainPreferences.GetValueN(App.kLogLevel)
		  logToConsoleSaved = App.MainPreferences.GetValueB(App.kLogOutput + App.kLogConsole, True)
		  logAppend = App.MainPreferences.GetValueB(App.kLogOutput + App.kLogAppend, False)
		  
		  '++JRC Comatibilty with RB 2009
		  chk_logging_console.Value = logToConsoleSaved
		  chk_logging_append.Value = logAppend
		  
		  pop_logging_level.DeleteAllRows
		  
		  pop_logging_level.AddRow(App.T.Translate("general_settings/logging/level/@disabled"))
		  
		  For i As Integer = App.DebugWriter.MINDEBUGLEVEL To App.DebugWriter.MAXDEBUGLEVEL
		    pop_logging_level.AddRow CStr(i)
		  Next
		  
		  If App.DebugWriter.Enabled Then
		    pop_logging_level.ListIndex = logLevelSaved - App.DebugWriter.MINDEBUGLEVEL + 1
		  Else
		    pop_logging_level.ListIndex = 0
		  End If
		  
		  '++JRC This looks like a good place to load the song activity settings as well
		  'Lets set logging to enabled by default
		  ActivityLogEnabled =  App.MainPreferences.GetValueB(App.kActivityLog, True)
		  'Lets set Prompting to disabled by default
		  PromptBeforePresenting =  App.MainPreferences.GetValueB(App.kPromptBeforePresenting, False)
		  
		  '++JRC Comatibilty with RB 2009
		  chk_logging_enable.Value = ActivityLogEnabled
		  chk_logging_prompt.Value = PromptBeforePresenting
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ActivityLogEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DefaultDocsFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DocsFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Init As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected logAppend As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected logFileNew As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected logFileSaved As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected logLevelSaved As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected logToConsoleSaved As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected NewDocsFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PPTViewLocation As FolderItem = Nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PromptBeforePresenting As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected VideolanLocation As FolderItem = Nil
	#tag EndProperty


#tag EndWindowCode

#tag Events btn_ok
	#tag Event
		Sub Action()
		  '++JRC User selected custom DocsFolder, but didn't click change button
		  If NewDocsFolder <> Nil Then SaveDocsFolder
		  
		  '++JRC Try to read language file, if we can't return to MainSettingsWindow without saving
		  Dim T As Translator
		  
		  T = New Translator(App.AppFolder.Child("OpenSong Languages").Child(pop_general_language.Text))
		  If Not T.IsLoaded Then
		    T = Nil
		  End If
		  If T <> Nil Then
		    App.T = T
		    'save language selection in globals
		    'SmartML.SetValue App.MyGlobals.DocumentElement, "language/@file", pop_general_language.Text
		    App.MainPreferences.SetValue(Prefs.kLanguage, pop_general_language.Text)
		    '++JRC Move translation of MainWindow to end of function so (hopefully) all
		    'settings will reflect the new translation
		    'MainWindow.TranslateMe
		    'App.TranslateMe
		    '--
		  Else
		    InputBox.Message "Error in translation. " + SmartML.GetErrorMessage()
		    Return
		  End If
		  
		  App.MainPreferences.SetValueB(Prefs.kUseOldFolderDB, chk_documents_oldfolderdb.Value)
		  
		  Dim Settings As XmlElement
		  Settings = App.MyMainSettings.DocumentElement
		  
		  SmartML.SetValue Settings, "ccli/@number", edt_general_ccli.Text
		  SmartML.SetValueB Settings, "version/@check", chk_general_version_check.Value
		  SmartML.SetValue Settings, "proxy/@host", edt_proxy_host.Text
		  SmartML.SetValueN Settings, "proxy/@port", Val(edt_proxy_port.Text)
		  
		  SmartML.SetValueB Settings, "linked_songs/@prompt", chk_linked_prompt.Value
		  
		  SmartML.SetValueB Settings, "rcserver/@enable", chk_rcserver_enable.Value
		  SmartML.SetValue Settings, "rcserver/key", edt_rcserver_key.Text
		  SmartML.SetValueN Settings, "rcserver/@port", Val(edt_rcserver_port.Text)
		  
		  SmartML.SetValueB Settings, "extrender/@enable", chk_extrender_enable.Value
		  SmartML.SetValue Settings, "extrender/server", edt_extrender_server.Text
		  SmartML.SetValueN Settings, "extrender/@port", Val(edt_extrender_port.Text)
		  SmartML.SetValueN Settings, "extrender/@timeout", Val(edt_extrender_timeout.Text)
		  
		  SmartML.SetValue Settings, "user_defined/@user1", edt_define_user1.Text
		  SmartML.SetValue Settings, "user_defined/@user2", edt_define_user2.Text
		  SmartML.SetValue Settings, "user_defined/@user3", edt_define_user3.Text
		  
		  SmartML.SetValueF Settings, "fonts/headings", can_fonts_headings.GetFont
		  SmartML.SetValueF Settings, "fonts/labels", can_fonts_labels.GetFont
		  SmartML.SetValueF Settings, "fonts/text_fields", can_fonts_text_fields.GetFont
		  SmartML.SetValueF Settings, "fonts/fixed_width", can_fonts_fixed_width.GetFont
		  SmartML.SetValueF Settings, "fonts/buttons", can_fonts_buttons.GetFont
		  SmartML.SetValueF Settings, "fonts/large_headings", can_fonts_large_headings.GetFont
		  App.UpdateTranslationFonts
		  
		  // Save Start Mode selection
		  if rad_start_songs.Value Then
		    SmartML.SetValueN Settings, "startmode/@sets", 0
		  Else
		    SmartML.SetValueN Settings, "startmode/@sets", 1
		  End If
		  
		  SmartML.SetValueB Settings, "reload/@songfolder", chk_reload_songfolder.Value
		  SmartML.SetValueB Settings, "reload/@set", chk_reload_set.Value
		  
		  // Drawing style...this affects which SButton.Paint routine is used
		  SmartML.SetValueB Settings, "paint/@new", chk_general_newpaint.Value
		  
		  ImageDefaults.ResizeToScreenArea = chk_imagedefaults_fit_to_screen.Value
		  ImageDefaults.ResizeToBodyArea = chk_imagedefaults_fit_to_body.Value
		  ImageDefaults.KeepAspectRatio = chk_imagedefaults_keepaspect.Value
		  ImageDefaults.LinkToBackgroundsFolder = chk_imagedefaults_store_as_link.Value
		  ImageDefaults.UseBackgroundsAsText = chk_imagedefaults_background_as_text.Value
		  ImageDefaults.ImageQuality = ImageDefaults.ImageQualityEnum(pop_imagequality_compression.ListIndex+1)
		  
		  SaveLogfileSettings
		  App.MainPreferences.SetValueFI(Prefs.kPPTViewLocation, PPTViewLocation)
		  Call PresentationFactory.PPTViewAvailable(True) 'Force re-evaluation of PPTView availability
		  App.MainPreferences.SetValueFI(Prefs.kVideolanLocation, VideolanLocation)
		  
		  SmartML.SetValueB(App.MyMainSettings.DocumentElement, "slide_style_color/@enabled", chk_slidetype_coloring.Value)
		  Dim slideColor As color
		  If can_style_color_verse.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/verse/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/verse/@color", "")
		  End If
		  If can_style_color_bridge.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/bridge/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/bridge/@color", "")
		  End If
		  If can_style_color_prechorus.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/pre-chorus/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/pre-chorus/@color", "")
		  End If
		  If can_style_color_chorus.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/chorus/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/chorus/@color", "")
		  End If
		  If can_style_color_tag.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/tag/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/tag/@color", "")
		  End If
		  If can_style_color_scripture.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/scripture/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/scripture/@color", "")
		  End If
		  If can_style_color_custom.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/custom/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/custom/@color", "")
		  End If
		  If can_style_color_style.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/style/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/style/@color", "")
		  End If
		  If can_style_color_image.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/image/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/image/@color", "")
		  End If
		  If can_style_color_application.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/external/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/external/@color", "")
		  End If
		  If can_style_color_blank.GetColor(slideColor) Then
		    SmartML.SetValueC(App.MyMainSettings.DocumentElement, "slide_style_color/blank/@color", slideColor)
		  Else
		    SmartML.SetValue(App.MyMainSettings.DocumentElement, "slide_style_color/blank/@color", "")
		  End If
		  
		  // Save changes on dialog exit instead of program exit
		  If App.CheckDocumentFolders(App.SETTINGS_FOLDER) <> App.NO_FOLDER Then
		    If Not SmartML.XDocToFile(App.MyMainSettings, App.DocsFolder.Child(App.STR_SETTINGS).Child("MainSettings")) Then SmartML.DisplayError
		  Else
		    If App.DocsFolder <> Nil Then
		      MsgBox App.T.Translate("errors/create_settings_folder", App.DocsFolder.Child(App.STR_SETTINGS).NativePath)
		    Else
		      MsgBox App.T.Translate("errors/no_docs_folder", "")
		    End If
		  End If
		  
		  // Can't write to MyGlobals if non-admin user
		  'If Not SmartML.XDocToFile(App.MyGlobals, App.AppFolder.Child("OpenSong Settings").Child("Globals")) Then SmartML.DisplayError
		  Call App.MainPreferences.Save
		  
		  MainWindow.TranslateMe
		  App.TranslateMe
		  
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_cancel
	#tag Event
		Sub Action()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_define_load
	#tag Event
		Sub Action()
		  edt_define_user1.Text = App.T.Translate("advanced_song_editor/user1/@caption")
		  edt_define_user2.Text = App.T.Translate("advanced_song_editor/user2/@caption")
		  edt_define_user3.Text = App.T.Translate("advanced_song_editor/user3/@caption")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_logging_console
	#tag Event
		Sub Action()
		  //++
		  // If the user deselects output to the console,
		  // prompt for the log file using the last logfile
		  // as the default.
		  //--
		  If Init Then Return
		  If Me.Value Then
		    logFileNew = Nil
		    Return
		  End If
		  
		  Dim dlg As New SaveAsDialog
		  Dim logType As New FileType
		  Dim f As FolderItem
		  
		  logType.Name = "Log files"
		  logType.Extensions = "log;txt"
		  
		  dlg.ActionButtonCaption = App.T.Translate("shared/select/@caption")
		  dlg.CancelButtonCaption = App.T.Translate("shared/cancel/@caption")
		  dlg.Filter = logType
		  If Not (logFileSaved Is Nil) Then
		    dlg.InitialDirectory = logFileSaved.Parent
		    dlg.SuggestedFileName = logFileSaved.Name
		  Else
		    dlg.InitialDirectory = App.AppDocumentsFolder
		    dlg.SuggestedFileName = "OpenSong.log"
		  End If
		  
		  dlg.PromptText = App.T.Translate("general_settings/logging/dialog/@caption")
		  dlg.Title = App.T.Translate("general_settings/logging/dialog/@title")
		  
		  f = dlg.ShowModalWithin(Self)
		  
		  If (f Is Nil) Then
		    If (logFileNew Is Nil) Then
		      If (logFileSaved Is Nil) Then
		        Me.Value = True
		      Else
		        logFileNew = logFileSaved
		      End If
		    End If
		  Else
		    logFileNew = f
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_logging_level
	#tag Event
		Sub Change()
		  Dim enabled As Boolean
		  
		  enabled = (Me.ListIndex > 0)
		  
		  chk_logging_append.Enabled = enabled
		  chk_logging_console.Enabled = enabled
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_documents_default
	#tag Event
		Sub Action()
		  btn_browse.Enabled = False
		  
		  If NewDocsFolder = Nil Then
		    If DocsFolder.URLPath <> DefaultDocsFolder.URLPath Then
		      NewDocsFolder = DefaultDocsFolder
		      nte_folder_folder.Text = NewDocsFolder.FormatFolderName
		    End If
		  Else
		    NewDocsFolder = DefaultDocsFolder
		    nte_folder_folder.Text = NewDocsFolder.FormatFolderName
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_documents_custom
	#tag Event
		Sub Action()
		  btn_browse.Enabled = True
		  EnableMenuItems
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_browse
	#tag Event
		Sub Action()
		  
		  Dim dlg As New SelectFolderDialog
		  
		  dlg.InitialDirectory = App.DocsFolder
		  
		  NewDocsFolder = dlg.ShowModal
		  
		  If NewDocsFolder = Nil Then Return // User cancelled
		  
		  // Is the selected folder the same as previous?
		  If NewDocsFolder.NativePath = DocsFolder.NativePath Then
		    NewDocsFolder = Nil
		    Return
		  End If
		  
		  nte_folder_folder.Text = NewDocsFolder.FormatFolderName
		  // Is this the default?
		  rad_documents_default.Value = (NewDocsFolder.URLPath = DefaultDocsFolder.URLPath)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_applications_pptview_browse
	#tag Event
		Sub Action()
		  Dim dlg As New OpenDialog
		  
		  #If TargetLinux
		    dlg.InitialDirectory = SpecialFolder.Bin
		  #Else
		    dlg.InitialDirectory = SpecialFolder.Applications
		  #EndIf
		  
		  Dim NewPPTViewLocation As FolderItem = dlg.ShowModal
		  If NewPPTViewLocation = Nil Then Return // User cancelled
		  
		  PPTViewLocation = NewPPTViewLocation
		  edt_applications_pptview.Text = PPTViewLocation.NativePath()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_applications_videolan_browse
	#tag Event
		Sub Action()
		  Dim dlg As New OpenDialog
		  
		  #If TargetLinux
		    dlg.InitialDirectory = SpecialFolder.Bin
		  #Else
		    dlg.InitialDirectory = SpecialFolder.Applications
		  #EndIf
		  
		  Dim NewVideolanLocation As FolderItem = dlg.ShowModal
		  If NewVideolanLocation = Nil Then Return // User cancelled
		  
		  #If TargetMacOS And RBVersion >= 2013
		    // The user will have selected the application bundle, but we
		    // really need to have the path to the executable image inside the bundle
		    // otherwise command-line arguments will fail
		    Dim ExeLocation As FolderItem = NewVideolanLocation
		    #Pragma BreakOnExceptions False
		    Try
		      If ExeLocation.NativePath.Right(4) = ".app" Then
		        ExeLocation = ExeLocation.Child("Contents").Child("MacOS").Child("VLC")
		        If ExeLocation.exists Then
		          NewVideolanLocation = ExeLocation
		        End If
		      End If
		    Catch ex As NilObjectException
		      // Can safely ignore this error. It means that one of the children of the selected FolderItem
		      // doesn't exist, so we take the original FolderItem at face value. Log it for debug purposes in case
		      // this is a bad assumption.
		      App.DebugWriter.Write "MainSettingsWindow.btn_applications_videolan_browse.Action:" + _
		      " Caught NilObjectException trying to locate VLC executable for " +_
		      NewVideolanLocation.NativePath, 10
		    End Try
		    #Pragma BreakOnExceptions Default
		  #EndIf
		  VideolanLocation = NewVideolanLocation
		  edt_applications_videolan.Text = VideolanLocation.NativePath()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_imagedefaults_fit_to_screen
	#tag Event
		Sub Action()
		  If Me.Value Then
		    chk_imagedefaults_fit_to_body.Value = False
		  End If
		  
		  If Not Me.Value And Not chk_imagedefaults_fit_to_body.Value Then
		    chk_imagedefaults_keepaspect.Enabled = False
		  Else
		    chk_imagedefaults_keepaspect.Enabled = True
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_imagedefaults_fit_to_body
	#tag Event
		Sub Action()
		  If Me.Value Then
		    chk_imagedefaults_fit_to_screen.Value = False
		  End If
		  
		  If Not Me.Value And Not chk_imagedefaults_fit_to_screen.Value Then
		    chk_imagedefaults_keepaspect.Enabled = False
		  Else
		    chk_imagedefaults_keepaspect.Enabled = True
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
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
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
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
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
