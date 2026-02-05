#tag Window
Begin Window MainSettingsWindow Implements ColorPaletteBroker.ColorPaletteSource
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   482
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   482
   MaximizeButton  =   False
   MaxWidth        =   663
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   482
   MinimizeButton  =   False
   MinWidth        =   663
   Placement       =   0
   Resizeable      =   False
   Title           =   "General Settings"
   Visible         =   True
   Width           =   663
   Begin PushButton btn_ok
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   451
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   449
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin PushButton btn_cancel
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   553
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   449
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin TabPanel tab_general_general
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   430
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Basic configuration\rFile locations\rImage handling\rIntegrations\rSystem\rAppearance"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   623
      Begin GroupBox grp_settings_general
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "General"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   156
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
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   269
         Begin Label lbl_general_ccli
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
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   64
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   233
         End
         Begin SEditField edt_general_ccli
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
            HasVerticalScrollbar=   False
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "grp_settings_general"
            Italic          =   False
            Left            =   55
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
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   87
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   120
         End
         Begin CheckBox chk_general_version_check
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Check for newer versions on startup"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   111
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   252
         End
         Begin Label lbl_general_language
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
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   134
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   200
         End
         Begin PopupMenu pop_general_language
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_general"
            InitialValue    =   ""
            Italic          =   False
            Left            =   51
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   4
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   156
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   233
         End
      End
      Begin GroupBox grp_settings_user_defined
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "User Defined Field Names"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   210
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
         Tooltip         =   ""
         Top             =   45
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   296
         Begin Label lbl_define_user1
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
            Text            =   "User defined 1:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   66
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   269
         End
         Begin SEditField edt_define_user1
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
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
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
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   88
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   271
         End
         Begin Label lbl_define_user2
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
            Text            =   "User defined 2:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   112
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   268
         End
         Begin SEditField edt_define_user2
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
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
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
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   134
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   271
         End
         Begin Label lbl_define_user3
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
            Text            =   "User defined 3:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   158
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   270
         End
         Begin SEditField edt_define_user3
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
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
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
            TabIndex        =   5
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   180
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   271
         End
         Begin PushButton btn_define_load
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Load language defaults"
            Default         =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_user_defined"
            Italic          =   False
            Left            =   342
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   214
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   241
         End
      End
      Begin GroupBox grp_settings_startmode
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Start Mode"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   58
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
         Tooltip         =   ""
         Top             =   208
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   269
         Begin RadioButton rad_start_songs
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Songs"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            Tooltip         =   ""
            Top             =   232
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   110
         End
         Begin RadioButton rad_start_sets
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Sets"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            Tooltip         =   ""
            Top             =   232
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   119
         End
      End
      Begin GroupBox grp_settings_logging
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Logging"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   128
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
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   279
         Begin Label lbl_logging_level
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
            InitialParent   =   "grp_settings_logging"
            Italic          =   False
            Left            =   45
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
            Text            =   "Log level (0-10)"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   65
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   206
         End
         Begin CheckBox chk_logging_console
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Log to system console"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_logging"
            Italic          =   False
            Left            =   45
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   116
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   250
         End
         Begin PopupMenu pop_logging_level
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_logging"
            InitialValue    =   "Disabled\r1 (Info)\r2\r3 (Warn)\r4 (Debug)\r5\r6\r7\r8\r9 (Detailed)\r10"
            Italic          =   False
            Left            =   45
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   87
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   206
         End
         Begin CheckBox chk_logging_append
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Append to logfile"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_logging"
            Italic          =   False
            Left            =   45
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   140
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   250
         End
      End
      Begin GroupBox grp_settings_proxy
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "HTTP Proxy"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   78
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
         TabIndex        =   3
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_proxy_host
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
            InitialParent   =   "grp_settings_proxy"
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
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Server:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   65
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   193
         End
         Begin Label lbl_proxy_port
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
            InitialParent   =   "grp_settings_proxy"
            Italic          =   False
            Left            =   564
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
            Text            =   "Port:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   65
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   50
         End
         Begin SEditField edt_proxy_host
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
            InitialParent   =   "grp_settings_proxy"
            Italic          =   False
            Left            =   359
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
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   87
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   194
         End
         Begin SEditField edt_proxy_port
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
            InitialParent   =   "grp_settings_proxy"
            Italic          =   False
            Left            =   564
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
            TabIndex        =   3
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   87
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   47
         End
      End
      Begin GroupBox grp_activity_log
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Activity Log Settings"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   82
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
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   186
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   279
         Begin CheckBox chk_logging_enable
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Enable logging"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            TabIndex        =   0
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   212
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   249
         End
         Begin CheckBox chk_logging_prompt
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Prompt before presenting"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   236
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   249
         End
      End
      Begin GroupBox grp_settings_documents_folder
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Documents Folder"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   258
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
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin RadioButton rad_documents_default
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Default"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   49
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   116
            Transparent     =   False
            Underline       =   False
            Value           =   True
            Visible         =   True
            Width           =   205
         End
         Begin RadioButton rad_documents_custom
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Custom:"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   49
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   136
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   205
         End
         Begin SEditField txt_folder_folder
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
            HasVerticalScrollbar=   False
            Height          =   53
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   49
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   167
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   252
         End
         Begin PushButton btn_browse
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   115
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   232
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin Label nte_documents_warning
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   48
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   49
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "(use with caution; forces restart)"
            TextAlignment   =   0
            TextColor       =   &cFF000000
            Tooltip         =   ""
            Top             =   66
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   252
         End
         Begin CheckBox chk_documents_oldfolderdb
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Use pre-V1.1 FolderDB cache"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_documents_folder"
            Italic          =   False
            Left            =   49
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   270
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   252
         End
      End
      Begin GroupBox grp_settings_applications
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "External applications"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   204
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
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_applications_pptview
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
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   65
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   246
         End
         Begin SEditField edt_applications_pptview
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
            HasVerticalScrollbar=   False
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   359
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   87
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   250
         End
         Begin PushButton btn_applications_pptview_browse
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   424
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   121
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin PushButton btn_applications_videolan_browse
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   424
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   214
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin Label lbl_applications_videolan
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
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   158
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   246
         End
         Begin SEditField edt_applications_videolan
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
            HasVerticalScrollbar=   False
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "grp_settings_applications"
            Italic          =   False
            Left            =   359
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   180
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   250
         End
      End
      Begin GroupBox grp_settings_fonts
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Fonts"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   378
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
         TabPanelIndex   =   6
         TabStop         =   True
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   279
         Begin Label lbl_fonts_headings
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
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Headings:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   62
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin Label lbl_fonts_labels
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
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Labels:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   114
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin Label lbl_fonts_text_fields
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
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Text fields:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   166
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin Label lbl_fonts_fixed_width
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
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Fixed-width text:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   218
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_headings
            AcceptMouseDown =   True
            AdvancedOptions =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   30
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
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   84
            Transparent     =   True
            Visible         =   True
            Width           =   245
         End
         Begin Label lbl_fonts_buttons
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
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Buttons:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   270
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_labels
            AcceptMouseDown =   True
            AdvancedOptions =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   30
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
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   136
            Transparent     =   True
            Visible         =   True
            Width           =   245
         End
         Begin Label lbl_fonts_large_headings
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
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Large headings:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   322
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin SFontCanvas can_fonts_text_fields
            AcceptMouseDown =   True
            AdvancedOptions =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   30
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
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   188
            Transparent     =   True
            Visible         =   True
            Width           =   245
         End
         Begin CheckBox chk_general_newpaint
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Use new control design"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            TabIndex        =   12
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   395
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   220
         End
         Begin SFontCanvas can_fonts_fixed_width
            AcceptMouseDown =   True
            AdvancedOptions =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   30
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
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   240
            Transparent     =   True
            Visible         =   True
            Width           =   245
         End
         Begin SFontCanvas can_fonts_buttons
            AcceptMouseDown =   True
            AdvancedOptions =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   30
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
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   292
            Transparent     =   True
            Visible         =   True
            Width           =   245
         End
         Begin SFontCanvas can_fonts_large_headings
            AcceptMouseDown =   True
            AdvancedOptions =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   45
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
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   344
            Transparent     =   True
            Visible         =   True
            Width           =   245
         End
      End
      Begin GroupBox grp_settings_slidetype_coloring
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Slide type coloring"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   378
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   345
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   6
         TabStop         =   True
         Tooltip         =   ""
         Top             =   45
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_slidetype_verse
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Song, verse"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   87
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_bridge
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Song, bridge"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   117
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_prechorus
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Song, pre-chorus"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   147
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_chorus
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Song, chorus"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   177
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_tag
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   9
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Song, tag"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   207
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_scripture
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   11
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Scripture"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   237
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_custom
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   13
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Custom slide"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   267
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_style
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   15
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Style change"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   297
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_image
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   17
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Image"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   327
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_application
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   19
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "External application"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   357
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin Label lbl_slidetype_blank
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
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   21
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Blank (inserted)"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   387
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   210
         End
         Begin CheckBox chk_slidetype_coloring
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Apply background colors"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   63
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   220
         End
         Begin SColorCanvas can_style_color_verse
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   86
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_bridge
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   116
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_prechorus
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   146
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_chorus
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   176
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_tag
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   10
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   206
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_scripture
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   12
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   236
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_custom
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   14
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   266
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_style
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   16
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   296
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_image
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   18
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   326
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_application
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   20
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   356
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
         Begin SColorCanvas can_style_color_blank
            AllowAlpha      =   False
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_slidetype_coloring"
            IsColorSet      =   False
            Left            =   582
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MyColor         =   &c00000000
            Scope           =   0
            TabIndex        =   22
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   386
            Transparent     =   True
            Visible         =   True
            Width           =   25
         End
      End
      Begin GroupBox grp_settings_rcserver
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Remote Control"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   107
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
         TabIndex        =   4
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   134
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_rcserver_key
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
            InitialParent   =   "grp_settings_rcserver"
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
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Authentication key:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   184
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   193
         End
         Begin Label lbl_rcserver_port
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
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   564
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Port:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   184
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   50
         End
         Begin SEditField edt_rcserver_port
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
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   564
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
            TabIndex        =   4
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   206
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   50
         End
         Begin CheckBox chk_rcserver_enable
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Enable remote control server"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   359
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   158
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   255
         End
         Begin SEditField edt_rcserver_key
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
            InitialParent   =   "grp_settings_rcserver"
            Italic          =   False
            Left            =   359
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
            TabIndex        =   2
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   206
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   193
         End
      End
      Begin GroupBox grp_settings_imagequality
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Set Image Quality"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   184
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
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   210
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   587
         Begin Label txt_imagequality_note
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   91
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
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   234
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   497
         End
         Begin Label lbl_imagequality_compression
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
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   334
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   497
         End
         Begin PopupMenu pop_imagequality_compression
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagequality"
            InitialValue    =   "Full, minimum quality\r\nHigh, low quality\r\nMedium, normal quality\r\nLittle, high quality\r\nLow, maximum quality\r\nNone, lossless"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   3
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   358
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   497
         End
      End
      Begin GroupBox grp_settings_imagedefaults
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Image Processing Defaults"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   154
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
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   587
         Begin CheckBox chk_imagedefaults_fit_to_screen
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Resize images to fit the screen"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   68
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   547
         End
         Begin CheckBox chk_imagedefaults_fit_to_body
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Resize images to fit the body area"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   92
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   547
         End
         Begin CheckBox chk_imagedefaults_keepaspect
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Keep aspect ratio when resizing images"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   116
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   547
         End
         Begin CheckBox chk_imagedefaults_store_as_link
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Do not embed images from backgrounds, use a link"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   140
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   547
         End
         Begin CheckBox chk_imagedefaults_background_as_text
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Show the background instead of the body text"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_imagedefaults"
            Italic          =   False
            Left            =   55
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   164
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   547
         End
      End
      Begin GroupBox grp_settings_linked
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Linked Songs"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   56
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
         Tooltip         =   ""
         Top             =   262
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   296
         Begin CheckBox chk_linked_prompt
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Prompt when adding linked songs"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   286
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   275
         End
      End
      Begin GroupBox grp_settings_reload
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Reload On Startup"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   80
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
         Tooltip         =   ""
         Top             =   279
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   269
         Begin CheckBox chk_reload_songfolder
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Song folder"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   303
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   230
         End
         Begin CheckBox chk_reload_set
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Set"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
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
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   327
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   230
         End
      End
      Begin GroupBox grp_settings_backgrounds
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Backgrounds"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   156
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   345
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   260
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_backgrounds_folder
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "grp_settings_backgrounds"
            Italic          =   False
            Left            =   365
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   2
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Top folder for backgrounds"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   329
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   252
         End
         Begin SEditField edt_backgrounds_folder
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
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
            Index           =   -2147483648
            InitialParent   =   "grp_settings_backgrounds"
            Italic          =   False
            Left            =   365
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   2
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   352
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   240
         End
         Begin PushButton btn_backgrounds_browse
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_backgrounds"
            Italic          =   False
            Left            =   431
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   382
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin CheckBox chk_backgrounds_separate
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Backgrounds in separate folder"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "grp_settings_backgrounds"
            Italic          =   False
            Left            =   365
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   296
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   240
         End
      End
      Begin GroupBox grp_settings_ndi
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "NDI®"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   56
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
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin CheckBox chk_ndi_enable
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Enable NDI source"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_ndi"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   68
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   247
         End
      End
      Begin GroupBox grp_settings_vmix
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "vMix Integration"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   150
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
         TabPanelIndex   =   4
         TabStop         =   True
         Tooltip         =   ""
         Top             =   108
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_vmx_vmix
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "grp_settings_vmix"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Location to save vMix XML"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   173
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   246
         End
         Begin SEditField edt_applications_vmix
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
            HasVerticalScrollbar=   False
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "grp_settings_vmix"
            Italic          =   False
            Left            =   50
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   196
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   250
         End
         Begin PushButton btn_applications_vmix_browse
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_vmix"
            Italic          =   False
            Left            =   115
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   226
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin CheckBox chk_application_vmix_enable
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Enable vMix integration"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_vmix"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   132
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   252
         End
      End
      Begin GroupBox grp_settings_text
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Text File Output (OBS)"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   341
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   345
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin Label lbl_applications_text_location
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "grp_settings_text"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Location to save text file"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   100
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   246
         End
         Begin SEditField edt_applications_text
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
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
            Index           =   -2147483648
            InitialParent   =   "grp_settings_text"
            Italic          =   False
            Left            =   360
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   124
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   250
         End
         Begin PushButton btn_applications_text_browse
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Browse..."
            Default         =   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_text"
            Italic          =   False
            Left            =   424
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   156
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin CheckBox chk_application_text_enable
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Update text file on slide change"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_text"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   68
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   252
         End
         Begin GroupBox grp_applications_text_fields
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Include Fields"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   104
            Index           =   -2147483648
            InitialParent   =   "grp_settings_text"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   202
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   252
            Begin CheckBox chk_applications_text_lyrics
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "Lyrics"
               Enabled         =   False
               FontName        =   "System"
               FontSize        =   0.0
               FontUnit        =   0
               Height          =   22
               Index           =   -2147483648
               InitialParent   =   "grp_applications_text_fields"
               Italic          =   False
               Left            =   375
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Scope           =   0
               TabIndex        =   0
               TabPanelIndex   =   4
               TabStop         =   True
               Tooltip         =   ""
               Top             =   226
               Transparent     =   False
               Underline       =   False
               Value           =   False
               Visible         =   True
               VisualState     =   0
               Width           =   200
            End
            Begin CheckBox chk_applications_text_title
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "Title"
               Enabled         =   False
               FontName        =   "System"
               FontSize        =   0.0
               FontUnit        =   0
               Height          =   22
               Index           =   -2147483648
               InitialParent   =   "grp_applications_text_fields"
               Italic          =   False
               Left            =   375
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Scope           =   0
               TabIndex        =   1
               TabPanelIndex   =   4
               TabStop         =   True
               Tooltip         =   ""
               Top             =   250
               Transparent     =   False
               Underline       =   False
               Value           =   False
               Visible         =   True
               VisualState     =   0
               Width           =   200
            End
            Begin CheckBox chk_applications_text_subtitle
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "Subtitle"
               Enabled         =   False
               FontName        =   "System"
               FontSize        =   0.0
               FontUnit        =   0
               Height          =   22
               Index           =   -2147483648
               InitialParent   =   "grp_applications_text_fields"
               Italic          =   False
               Left            =   375
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Scope           =   0
               TabIndex        =   2
               TabPanelIndex   =   4
               TabStop         =   True
               Tooltip         =   ""
               Top             =   274
               Transparent     =   False
               Underline       =   False
               Value           =   False
               Visible         =   True
               VisualState     =   0
               Width           =   200
            End
         End
         Begin PopupMenu pop_applications_text_separator
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_text"
            InitialValue    =   "RETURN\n;\n,\nNone"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   6
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   349
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   158
         End
         Begin Label lbl_applications_separator
            AllowAutoDeactivate=   False
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "grp_settings_text"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Separate fields with"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   318
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   252
         End
      End
      Begin GroupBox grp_settings_locale
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Locale Settings"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   126
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
         TabIndex        =   2
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   280
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   279
         Begin Label lbl_locale_search
            AllowAutoDeactivate=   False
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_locale"
            Italic          =   False
            Left            =   45
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Locale for searching"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   301
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   249
         End
         Begin SEditField edt_locale_search
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
            InitialParent   =   "grp_settings_locale"
            Italic          =   False
            Left            =   45
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   323
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   249
         End
         Begin Label lbl_locale_sort
            AllowAutoDeactivate=   False
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_locale"
            Italic          =   False
            Left            =   45
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
            Text            =   "Locale for sorting"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   349
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   249
         End
         Begin SEditField edt_locale_sort
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
            InitialParent   =   "grp_settings_locale"
            Italic          =   False
            Left            =   45
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   371
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   249
         End
      End
      Begin GroupBox grp_settings_extrender
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "External Renderer"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   156
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
         TabPanelIndex   =   4
         TabStop         =   True
         Tooltip         =   ""
         Top             =   266
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin CheckBox chk_extrender_enable
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Enable external renderer"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   290
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   250
         End
         Begin Label lbl_extrender_port
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
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   250
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
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   317
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   50
         End
         Begin Label lbl_extrender_server
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
            InitialParent   =   "grp_settings_extrender"
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
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Server:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   317
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   193
         End
         Begin SEditField edt_extrender_port
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
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   250
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
            TabIndex        =   4
            TabPanelIndex   =   4
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
            Width           =   50
         End
         Begin SEditField edt_extrender_server
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
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   50
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
            TabIndex        =   2
            TabPanelIndex   =   4
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
            Width           =   189
         End
         Begin SEditField edt_extrender_timeout
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
            InitialParent   =   "grp_settings_extrender"
            Italic          =   False
            Left            =   50
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
            TabIndex        =   6
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   387
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   50
         End
         Begin Label lbl_extrender_timeout
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
            InitialParent   =   "grp_settings_extrender"
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
            TabIndex        =   5
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Timeout (in ms):"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   365
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   204
         End
      End
      Begin GroupBox grp_settings_color_dialog
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Color Selection Dialog"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   108
         Index           =   -2147483648
         InitialParent   =   "tab_general_general"
         Italic          =   False
         Left            =   345
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   253
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
         Begin CheckBox chk_custom_colordlg_enable
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Use custom color selection dialog"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "grp_settings_color_dialog"
            Italic          =   False
            Left            =   359
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   278
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   240
         End
         Begin PopupMenu pop_palette
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_color_dialog"
            InitialValue    =   ""
            Italic          =   False
            Left            =   359
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   2
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   325
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   255
         End
         Begin Label lbl_palette
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
            InitialParent   =   "grp_settings_color_dialog"
            Italic          =   False
            Left            =   359
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Default palette"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   303
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   255
         End
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  ColorPaletteBroker.ClearContextTag()
		  ColorPaletteBroker.UnregisterColorPaletteSource(self)
		End Sub
	#tag EndEvent

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
		    edt_applications_videolan.Text = VideolanLocation.NativePath
		  End If
		  
		  // VmixLocation = App.MainPreferences.GetValueFI(Prefs.kVmixLocation, App.DocsFolder, True)
		  chk_application_vmix_enable.Value = App.MainPreferences.GetValueB(prefs.kvMixEnable, False, True)
		  If chk_application_vmix_enable.Value Then
		    VmixLocation = App.MainPreferences.GetValueFI(prefs.kvMixFolder, App.DocsFolder, True)
		  Else
		    VmixLocation = App.MainPreferences.GetValueFI(prefs.kvMixFolder, Nil, False)
		  End If
		  If Not IsNull(VmixLocation) Then
		    edt_applications_vmix.Text = VmixLocation.NativePath
		  End If
		  
		  // NDI Integration
		  chk_ndi_enable.Value = App.MainPreferences.GetValueB(prefs.kNDIEnableSender, False, True)
		  
		  // Slide Text Output Integration
		  TextOutputLocation = App.MainPreferences.GetValueFI(prefs.kSlideTextOutputFile, Nil, False)
		  If TextOutputLocation <> Nil Then
		    edt_applications_text.Text = TextOutputLocation.NativePath
		  End If
		  Dim v As Boolean
		  v = App.MainPreferences.GetValueB(Prefs.kSlideTextOutputOptionsEnabled, False, False)
		  chk_application_text_enable.Value = v
		  'v = App.MainPreferences.GetValueB(Prefs.kSlideTextOutputOptionsBody, False, False)
		  'chk_applications_text_lyrics.Value = v
		  'v = App.MainPreferences.GetValueB(Prefs.kSlideTextOutputOptionsTitle, False, False)
		  'chk_applications_text_lyrics.Value = v
		  'v = App.MainPreferences.GetValueB(Prefs.kSlideTextOutputOptionsSubTitle, False, False)
		  'chk_applications_text_lyrics.Value = v
		  Dim textSeparator As String = DecodeHex(App.MainPreferences.GetValue(Prefs.kSlideTextOutputOptionsSeparator, EncodeHex(EndOfLine.UNIX), False))
		  
		  For i As Integer = 0 To pop_applications_text_separator.LastRowIndex
		    If pop_applications_text_separator.RowTag(i) = textSeparator Then
		      pop_applications_text_separator.ListIndex = i
		      Exit For
		    End If
		  Next i
		  
		  // locales
		  InitialBackgroundColor = edt_locale_search.BackgroundColor
		  edt_locale_search.Text = app.LocaleForSearch.Identifier
		  edt_locale_sort.Text = app.LocaleForSort.Identifier
		  
		  // color dialog
		  Dim useSystemDlg As Boolean = TargetMacOS
		  chk_custom_colordlg_enable.Value = Not (App.MainPreferences.GetValue(prefs.kColorSelectorDialog, If(useSystemDlg, "system", "custom")) = "system")
		  Dim paletteSetting As String = App.MainPreferences.GetValue(prefs.kColorPaletteSetting, "open_song")
		  Dim paletteName As String
		  Dim popValue As Integer = 1
		  palettename = "standard"
		  For Each palettename in Array(palettename, "cga", "matching_colors", "open_song", "last_used")
		    pop_palette.AddRow(ColorSelectorWindow.TranslatePaletteCaption(palettename))
		    pop_palette.RowTagAt(pop_palette.LastAddedRowIndex) = palettename
		    If paletteName = paletteSetting Then popValue = pop_palette.LastAddedRowIndex
		  Next palettename
		  pop_palette.ListIndex = popValue
		  
		  s = App.MainPreferences.GetValue(Prefs.kLanguage, "English")
		  Dim f As FolderItem
		  f = App.AppFolder.Child("OpenSong Languages")
		  //++EMP add a couple of variables for troubleshooting and correct
		  // error that would set the ListIndex to the wrong value
		  Dim i As Integer
		  Dim currlang As Integer = -1
		  Dim langfile As FolderItem
		  Dim languages() As String
		  pop_general_language.DeleteAllRows
		  Try
		    For i = 1 To f.Count
		      langfile = f.Item(i)
		      If Not langfile.Directory And langfile.IsFileVisible Then
		        languages.Append langfile.Name
		      End If
		    Next
		    languages.Sort
		    For i = 0 To languages.Ubound
		      pop_general_language.AddRow languages(i)
		      If languages(i) = s Then currlang = pop_general_language.ListCount - 1
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
		  oldSButtonNewPaint = chk_general_newpaint.Value
		  
		  App.CenterInControlScreen Me
		  
		  // Display DocsFolder Location
		  If App.IsPortable Then
		    txt_folder_folder.Text = "Portable Installation"
		  Else
		    txt_folder_folder.Text = DocsFolder.FormatFolderName
		  End If
		  
		  // Add FolderDB flag
		  chk_documents_oldfolderdb.Value = App.MainPreferences.GetValueB(Prefs.kUseOldFolderDB)
		  
		  chk_imagedefaults_fit_to_screen.Value = ImageDefaults.ResizeToScreenArea
		  chk_imagedefaults_fit_to_body.Value = ImageDefaults.ResizeToBodyArea
		  chk_imagedefaults_keepaspect.Value = ImageDefaults.KeepAspectRatio
		  chk_imagedefaults_store_as_link.Value = ImageDefaults.LinkToBackgroundsFolder
		  chk_imagedefaults_background_as_text.Value = ImageDefaults.UseBackgroundsAsText
		  
		  pop_imagequality_compression.Enabled = True
		  pop_imagequality_compression.DeleteAllRows
		  For i = 0 To UBound(App.ImageQualityList)
		    pop_imagequality_compression.AddRow App.ImageQualityList(i)
		  Next i
		  pop_imagequality_compression.ListIndex = Integer(ImageDefaults.ImageQuality) - 1
		  
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
		  
		  //
		  // Backgrounds folder settings
		  // Do not allow the backgrounds folder to relocate in a portable situation
		  // Use checkbox to control this in non-portable settings
		  //
		  If App.IsPortable Then
		    grp_settings_backgrounds.Visible = False
		    App.MainPreferences.SetValueB(Prefs.kUseSeparateBackgrounds, False)
		  Else
		    BackgroundsFolder = App.MainPreferences.GetValueFI(Prefs.kBackgroundsFolder, Nil, False)
		  End If
		  
		  If BackgroundsFolder Is Nil Then
		    BackgroundsFolder = App.DocsFolder.Child(App.STR_BACKGROUNDS)
		    App.MainPreferences.SetValueB(Prefs.kUseSeparateBackgrounds, False)
		  Else
		    App.MainPreferences.SetValueB(Prefs.kUseSeparateBackgrounds, BackgroundsFolder.NativePath <> App.DocsFolder.Child(App.STR_BACKGROUNDS).NativePath)
		  End If
		  
		  chk_backgrounds_separate.Value = App.MainPreferences.GetValueB(Prefs.kUseSeparateBackgrounds, False, True)
		  Timer.CallLater(50, AddressOf FixLinuxLayout)
		  
		  ColorPaletteBroker.SetContextTag("main.settings")
		  ColorPaletteBroker.RegisterColorPaletteSource(self)
		  Init = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  FixLinuxLayout()
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

	#tag Method, Flags = &h21
		Private Sub FixLinuxLayout()
		  // This code fixes an issue on Linux where the OK & Cancel buttons end up underneath the tab panel
		  #If TargetLinux
		    Dim tabTop As Integer = tab_general_general.Top
		    Dim tabHeight As Integer = tab_general_general.Height
		    
		    If tabTop + tabHeight > btn_ok.top Then
		      tab_general_general.LockBottom = False
		      Self.Height = tabTop + tabHeight + btn_ok.Height + 40
		      tab_general_general.LockBottom = True
		    End If
		  #EndIf
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
		        MsgBox App.T.Translate("errors/activity_disabled", App.DocsFolder.Child("Settings").Child("ActivityLog.xml").NativePath)
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

	#tag Method, Flags = &h0
		Function SupplyColorPalette(tag As String) As ColorPaletteBroker.ColorPalette()
		  // Part of the ColorPaletteBroker.ColorPaletteSource interface.
		  
		  Dim pal, pals() As ColorPaletteBroker.ColorPalette
		  Dim fontColrs(), styleTypeColrs() As Color
		  Dim c As Color
		  Dim txFound As Boolean
		  Dim xl As XmlNodeList
		  Dim xnode, xDocNode As XmlNode
		  Dim captionStr As String
		  
		  If ColorPaletteBroker.Included(tag, "main.settings") Then
		    
		    // the current window
		    For i As Integer = 0 To App.WindowCount
		      If App.Window(i) IsA FontChooser Then
		        ColorPaletteBroker.AddFontColors(FontChooser(App.Window(i)).MyFont, fontColrs)
		      End If
		      If App.Window(i) IsA StyleWindow Then
		        Dim styleWin As StyleWindow = StyleWindow(App.Window(i))
		        xNode = styleWin.StyleNode
		        If xNode <> Nil And xNode.OwnerDocument.DocumentElement.Name = "main_settings" Then
		          ColorPaletteBroker.AddStyleColors(styleWin.PeekStyle(), fontColrs)
		        End If
		      End If
		    Next i
		    
		    // the fonts in the MainSettingsWindow
		    For i As Integer = 0 To ControlCount - 1
		      If Control(i) IsA SFontCanvas Then
		        ColorPaletteBroker.AddFontColors(SFontCanvas(Control(i)).GetFont, fontColrs)
		      ElseIf Control(i) IsA SColorCanvas Then
		        If SColorCanvas(Control(i)).GetColor(c) Then
		          styleTypeColrs.Add(c)
		        End If
		      End If
		    Next i
		    
		    // the fonts in the settings xml beeing edited
		    If App.MyMainSettings <> Nil Then
		      xDocNode = App.MyMainSettings.DocumentElement
		      xl = xDocNode.Xql("fonts/*[@font]")
		      If xl <> Nil And xl.Length > 0 Then
		        For i As Integer = 0 To xl.Length - 1
		          xnode = xl.Item(i)
		          If xnode <> Nil Then
		            ColorPaletteBroker.AddFontColors(xNode, fontColrs)
		          End If
		        Next i
		      End If
		      xl = xDocNode.Xql("slide_style_color/*[@color]")
		      If xl <> Nil And xl.Length > 0 Then
		        For i As Integer = 0 To xl.Length - 1
		          xnode = xl.Item(i)
		          If xnode <> Nil Then
		            If SmartML.GetValueC(xNode, "@color", c, false) Then
		              styleTypeColrs.Add(c)
		            End If
		          End If
		        Next i
		      End If
		    End If
		    
		    If fontColrs.Ubound >= 0 Then
		      fontColrs = SortUniqueColors(fontColrs)
		      captionStr = App.T.Translate("color_selector/color_palette/main_settings_fonts/@caption", txFound)
		      If not txFound Then captionStr = "GUI Text Colors"
		      pal = New ColorPaletteBroker.ColorPalette("main.settings.fonts", captionStr, fontColrs)
		      pals.Add(pal)
		    End If
		    
		    If styleTypeColrs.Ubound >= 0 Then
		      styleTypeColrs = SortUniqueColors(styleTypeColrs)
		      captionStr = App.T.Translate("color_selector/color_palette/main_settings_slidestyle/@caption", txFound)
		      If not txFound Then captionStr = "Slide Type Colors"
		      pal = New ColorPaletteBroker.ColorPalette("main.settings.slidestyle", captionStr, styleTypeColrs)
		      pals.Add(pal)
		    End If
		  End If
		  
		  If pals.Ubound = -1 Then Return pals
		  captionStr = App.T.Translate("color_selector/color_palette/open_song/@caption", txFound)
		  If not txFound Then captionStr = "OpenSong"
		  pal = New ColorPaletteBroker.ColorPalette("OpenSong", captionStr, pals)
		  Redim pals(0)
		  pals(0) = pal
		  Return pals
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ActivityLogEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private BackgroundsFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private BackgroundsFolderChanged As Boolean
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

	#tag Property, Flags = &h21
		Private InitialBackgroundColor As Color
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

	#tag Property, Flags = &h21
		Private oldSButtonNewPaint As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PPTViewLocation As FolderItem = Nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PromptBeforePresenting As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TextOutputLocation As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected VideolanLocation As FolderItem = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private VmixLocation As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events btn_ok
	#tag Event
		Sub Action()
		  // User selected custom DocsFolder, but didn't click change button
		  If NewDocsFolder <> Nil Then SaveDocsFolder
		  
		  // Try to read language file, if we can't return to MainSettingsWindow without saving
		  Dim T As Translator
		  
		  T = New Translator(App.AppFolder.Child("OpenSong Languages").Child(pop_general_language.Text))
		  If Not T.IsLoaded Then
		    T = Nil
		  End If
		  If T <> Nil Then
		    App.T = T
		    App.MainPreferences.SetValue(Prefs.kLanguage, pop_general_language.Text)
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
		  
		  // VMix Integration
		  App.MainPreferences.SetValueFI(Prefs.kVideolanLocation, VideolanLocation)
		  App.MainPreferences.SetValueB(prefs.kvMixEnable, chk_application_vmix_enable.Value)
		  App.MainPreferences.SetValueFI(prefs.kvMixFolder, VmixLocation)
		  
		  // NDI Integration
		  App.MainPreferences.SetValueB(prefs.kNDIEnableSender, chk_ndi_enable.Value)
		  
		  // Text Output Integration
		  App.MainPreferences.SetValueFI(Prefs.kSlideTextOutputFile, TextOutputLocation)
		  App.MainPreferences.SetValueB(Prefs.kSlideTextOutputOptionsEnabled, chk_application_text_enable.Value)
		  App.MainPreferences.SetValueB(Prefs.kSlideTextOutputOptionsBody, chk_applications_text_lyrics.Value)
		  App.MainPreferences.SetValueB(Prefs.kSlideTextOutputOptionsTitle, chk_applications_text_title.Value)
		  App.MainPreferences.SetValueB(Prefs.kSlideTextOutputOptionsSubTitle, chk_applications_text_subtitle.Value)
		  // Hexencode this to avoid any issues with special characters being properly saved/restored from preferences
		  App.MainPreferences.SetValue(Prefs.kSlideTextOutputOptionsSeparator, _
		  EncodeHex(pop_applications_text_separator.RowTag(pop_applications_text_separator.ListIndex)))
		  
		  // Locales
		  Try
		    If edt_locale_search.Text.Trim.IsEmpty Or edt_locale_search.BackgroundColor <> InitialBackgroundColor Then
		      App.MainPreferences.Remove(prefs.kLocaleForSearch)
		      app.LocaleForSearch = Nil  // force default recalculation
		      edt_locale_search.Text = App.LocaleForSearch.Identifier
		    End If
		    App.LocaleForSearch = New Locale(edt_locale_search.Text)
		    App.MainPreferences.SetValue(prefs.kLocaleForSearch, edt_locale_search.Text)
		  Catch
		  End Try
		  Try
		    If edt_locale_sort.Text.Trim.IsEmpty Or edt_locale_sort.BackgroundColor <> InitialBackgroundColor Then
		      App.MainPreferences.Remove(prefs.kLocaleForSort)
		      app.LocaleForSort = Nil  // force default recalculation
		      edt_locale_sort.Text = App.LocaleForSort.Identifier
		    End If
		    App.LocaleForSort = New Locale(edt_locale_sort.Text)
		    App.MainPreferences.SetValue(prefs.kLocaleForSort, edt_locale_sort.Text)
		  Catch
		  End Try
		  
		  // color dialog
		  App.MainPreferences.SetValue(prefs.kColorSelectorDialog, If(chk_custom_colordlg_enable.Value, "custom", "system"))
		  If pop_palette.ListIndex >= 0 Then
		    Dim paletteName As String = pop_palette.RowTagAt(pop_palette.ListIndex)
		    App.MainPreferences.SetValue(prefs.kColorPaletteSetting, paletteName)
		    If paletteName <> "last_used" then
		      App.MainPreferences.SetValue(prefs.kColorPaletteLoad, paletteName)
		    End If
		  End If
		  
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
		  
		  // Backgrounds
		  
		  // Account for a possible change in the default folder which
		  // would affect the backgrounds folder
		  Dim newDefaultBGFolder As FolderItem
		  Dim oldDefaultBGFolder As FolderItem
		  oldDefaultBGFolder = App.DocsFolder.Child(App.STR_BACKGROUNDS)
		  
		  If NewDocsFolder = Nil Then
		    newDefaultBGFolder = oldDefaultBGFolder
		  Else // Only write the Backgrounds Folder location if the user did not manually change it
		    If Not BackgroundsFolderChanged Then
		      newDefaultBGFolder = NewDocsFolder.Child(App.STR_BACKGROUNDS)
		    End If
		  End If
		  
		  If Not App.IsPortable Then
		    // If the selected folder is the default, store that one and set SeparateBackgrounds to false
		    If BackgroundsFolder.NativePath = oldDefaultBGFolder.NativePath Then
		      App.MainPreferences.SetValueFI(Prefs.kBackgroundsFolder, newDefaultBGFolder)
		      App.MainPreferences.SetValueB(Prefs.kUseSeparateBackgrounds, False)
		    Else
		      // This check may be redundant but should ensure consistency between
		      // the SeparateBackgrounds setting and the BackgroundsFolder setting.
		      If chk_backgrounds_separate.Value Then
		        App.MainPreferences.SetValueFI(Prefs.kBackgroundsFolder, BackgroundsFolder)
		        App.MainPreferences.SetValueB(Prefs.kUseSeparateBackgrounds, chk_backgrounds_separate.Value)
		      Else
		        App.MainPreferences.SetValueFI(Prefs.kBackgroundsFolder, newDefaultBGFolder)
		        App.MainPreferences.SetValueB(Prefs.kUseSeparateBackgrounds, False)
		      End If
		    End If
		  Else
		    App.MainPreferences.SetValueFI(Prefs.kBackgroundsFolder, newDefaultBGFolder)
		    App.MainPreferences.SetValueB(Prefs.kUseSeparateBackgrounds, False)
		  End If
		  
		  // Can't write to MyGlobals if non-admin user
		  'If Not SmartML.XDocToFile(App.MyGlobals, App.AppFolder.Child("OpenSong Settings").Child("Globals")) Then SmartML.DisplayError
		  Call App.MainPreferences.Save
		  
		  App.TranslateMe
		  MainWindow.TranslateMe
		  
		  If oldSButtonNewPaint <> SmartML.GetValueB(App.MyMainSettings.DocumentElement, "paint/@new", True, False) Then
		    App.UpdateButtonPaint(Not oldSButtonNewPaint)
		  End If
		  
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
		      txt_folder_folder.Text = NewDocsFolder.FormatFolderName
		    End If
		  Else
		    NewDocsFolder = DefaultDocsFolder
		    txt_folder_folder.Text = NewDocsFolder.FormatFolderName
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
		  
		  Dim DocFolderSelectWin As New DocFolderSelectWindow
		  NewDocsFolder = DocFolderSelectWin.SelectDocFolder(Nil)
		  
		  If NewDocsFolder = Nil Then Return // User cancelled
		  
		  // Is the selected folder the same as previous?
		  If NewDocsFolder.NativePath = DocsFolder.NativePath Then
		    NewDocsFolder = Nil
		    Return
		  End If
		  
		  txt_folder_folder.Text = NewDocsFolder.FormatFolderName
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
		  #If TargetMacOS And RBVersion >= 2013
		    edt_applications_videolan.Text = VideolanLocation.NativePath()
		    
		  #Else
		    edt_applications_videolan.Text = VideolanLocation.NativePath()
		  #EndIf
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
#tag Events btn_backgrounds_browse
	#tag Event
		Sub Action()
		  Dim dlg As New SelectFolderDialog
		  Dim targetFolder As FolderItem
		  
		  dlg.InitialDirectory = BackgroundsFolder
		  
		  targetFolder = dlg.ShowModalWithin(Self)
		  
		  If targetFolder <> Nil Then
		    BackgroundsFolderChanged = True
		    edt_backgrounds_folder.Text = targetFolder.NativePath
		    BackgroundsFolder = targetFolder
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_backgrounds_separate
	#tag Event
		Sub Action()
		  BackgroundsFolderChanged = True
		  edt_backgrounds_folder.Enabled = Me.Value
		  edt_backgrounds_folder.ReadOnly = True
		  btn_backgrounds_browse.Enabled = Me.Value
		  
		  If Me.Value Then
		    Try
		      edt_backgrounds_folder.Value = BackgroundsFolder.NativePath
		    Catch
		      BackgroundsFolder = App.DocsFolder.Child(App.STR_BACKGROUNDS)
		      edt_backgrounds_folder.Value = BackgroundsFolder.NativePath
		    End Try
		  Else
		    BackgroundsFolder = App.DocsFolder.Child(App.STR_BACKGROUNDS)
		    edt_backgrounds_folder.Value = ""
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_applications_vmix_browse
	#tag Event
		Sub Action()
		  Dim dlg As New SelectFolderDialog
		  
		  dlg.InitialDirectory = VmixLocation
		  
		  Dim NewVmixLocation As FolderItem = dlg.ShowModal
		  If NewVmixLocation = Nil Then Return // User cancelled
		  
		  VmixLocation = NewVmixLocation
		  edt_applications_vmix.Text = NewVmixLocation.NativePath
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_applications_text_browse
	#tag Event
		Sub Action()
		  Dim dlg As New SaveFileDialog
		  Dim found As Boolean
		  
		  If TextOutputLocation <> Nil Then
		    dlg.InitialDirectory = TextOutputLocation.Parent
		  ElseIf DocsFolder <> Nil Then
		    dlg.InitialDirectory = DocsFolder
		  Else
		    dlg.InitialDirectory = SpecialFolder.Documents
		  End If
		  
		  dlg.SuggestedFileName = App.T.Translate("general_settings/text/text_browse/@default", found)
		  If Not found Then dlg.SuggestedFileName = "NotFoundOpenSongText.txt"
		  dlg.Filter = FileTypes.Text
		  
		  Dim newTextLocation As FolderItem = dlg.ShowModal
		  If newTextLocation = Nil Then Return // User cancelled
		  
		  TextOutputLocation = NewTextLocation
		  edt_applications_text.Text = newTextLocation.NativePath
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_application_text_enable
	#tag Event
		Sub Action()
		  Dim enable As Boolean = Me.Value
		  edt_applications_text.Enabled = enable
		  btn_applications_text_browse.Enabled = enable
		  grp_applications_text_fields.Enabled = enable
		  chk_applications_text_lyrics.Enabled = enable
		  chk_applications_text_subtitle.Enabled = enable
		  chk_applications_text_title.Enabled = enable
		  pop_applications_text_separator.Enabled = enable
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Value = App.MainPreferences.GetValueB(Prefs.kSlideTextOutputOptionsEnabled, False, False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_applications_text_lyrics
	#tag Event
		Sub Open()
		  Me.Value = App.MainPreferences.GetValueB(Prefs.kSlideTextOutputOptionsBody, False, False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_applications_text_title
	#tag Event
		Sub Open()
		  Me.Value = App.MainPreferences.GetValueB(Prefs.kSlideTextOutputOptionsTitle, False, False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_applications_text_subtitle
	#tag Event
		Sub Open()
		  Me.Value = App.MainPreferences.GetValueB(Prefs.kSlideTextOutputOptionsSubTitle, False, False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_applications_text_separator
	#tag Event
		Sub Open()
		  App.T.LoadPopup("general_settings/text/separator", Me, True)
		  If Me.ListCount > 0 Then
		    Me.ListIndex = 0
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_locale_search
	#tag Event
		Sub TextChange()
		  Dim ok As Boolean
		  If Me.Text.Trim.IsEmpty Then
		    ok = True
		  Else
		    Dim locl As Locale
		    Try
		      locl = New Locale(Me.Text)
		    Catch
		      locl = Nil
		    End Try
		    ok = Not IsNull(locl)
		  End If
		  If ok Then
		    Me.BackgroundColor = InitialBackgroundColor
		  Else
		    Dim c As Color = InitialBackgroundColor
		    Dim val As Double = c.Value
		    If c.Red > 255 - 32 Then
		      c = Color.HSV(c.Hue, c.Saturation, c.Value / 2)
		      c = Color.RGB(Min(c.Red + 32, 255), c.Green, c.Blue)
		    Else
		      c = Color.RGB(c.Red + 32, c.Green, c.Blue)
		    End If
		    Me.BackgroundColor = Color.HSV(c.Hue, c.Saturation, val)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_locale_sort
	#tag Event
		Sub TextChange()
		  Dim ok As Boolean
		  If Me.Text.Trim.IsEmpty Then
		    ok = True
		  Else
		    Dim locl As Locale
		    Try
		      locl = New Locale(Me.Text)
		    Catch
		      locl = Nil
		    End Try
		    ok = Not IsNull(locl)
		  End If
		  If ok Then
		    Me.BackgroundColor = InitialBackgroundColor
		  Else
		    Dim c As Color = InitialBackgroundColor
		    Dim val As Double = c.Value
		    If c.Red > 255 - 32 Then
		      c = Color.HSV(c.Hue, c.Saturation, c.Value / 2)
		      c = Color.RGB(Min(c.Red + 32, 255), c.Green, c.Blue)
		    Else
		      c = Color.RGB(c.Red + 32, c.Green, c.Blue)
		    End If
		    Me.BackgroundColor = Color.HSV(c.Hue, c.Saturation, val)
		  End If
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
		Visible=false
		Group="Behavior"
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
