#tag Window
Begin Window PresentSettingsWindow Implements ColorPaletteBroker.ColorPaletteSource
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   488
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Presentation Settings"
   Visible         =   True
   Width           =   796
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
      Left            =   638
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
      Top             =   457
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   70
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
      Left            =   718
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
      Top             =   457
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin TabPanel tab_present_settings
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   437
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Styles\rOptions\rSnapshots"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   776
      Begin Label lbl_style_default_slides
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
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Default Slide Style:"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   200
      End
      Begin SStyleCanvas can_style_default
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   150
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SongStyle       =   True
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   80
         Transparent     =   True
         Visible         =   True
         Width           =   200
      End
      Begin Label nte_style_click_to_change_1
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
         InitialParent   =   "tab_present_settings"
         Italic          =   True
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "(click to change)"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   235
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   200
      End
      Begin Label lbl_style_scripture_slides
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
         InitialParent   =   "tab_present_settings"
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
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Scripture Slide Style:"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   200
      End
      Begin SStyleCanvas can_style_scripture
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   150
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Left            =   255
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SongStyle       =   False
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   80
         Transparent     =   True
         Visible         =   True
         Width           =   200
      End
      Begin Label nte_style_click_to_change_2
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
         InitialParent   =   "tab_present_settings"
         Italic          =   True
         Left            =   255
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "(click to change)"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   235
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   200
      End
      Begin GroupBox grp_settings_alerts
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Alerts"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   130
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   308
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   400
         Begin Label lbl_alerts_align
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
            InitialParent   =   "grp_settings_alerts"
            Italic          =   False
            Left            =   38
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Align:"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   341
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   90
         End
         Begin SAlignCanvas sal_alerts
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   44
            Index           =   -2147483648
            InitialParent   =   "grp_settings_alerts"
            Left            =   62
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
            Top             =   363
            Transparent     =   True
            Visible         =   True
            Width           =   44
         End
         Begin Label lbl_alerts_font
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
            InitialParent   =   "grp_settings_alerts"
            Italic          =   False
            Left            =   132
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Font:"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   321
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   250
         End
         Begin SFontCanvas can_alerts_font
            AcceptMouseDown =   True
            AdvancedOptions =   True
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   80
            Index           =   -2147483648
            InitialParent   =   "grp_settings_alerts"
            Left            =   132
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   343
            Transparent     =   True
            Visible         =   True
            Width           =   250
         End
      End
      Begin GroupBox grp_option_logo
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Logo"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   386
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   566
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   52
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   200
         Begin SImageCanvas can_logo
            AllowAutoDeactivate=   True
            AllowChange     =   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            bgColor         =   &c00000000
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   120
            Index           =   -2147483648
            InitialParent   =   "grp_option_logo"
            Left            =   586
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
            Top             =   76
            Transparent     =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label nte_logo_click_to_change_1
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
            InitialParent   =   "grp_option_logo"
            Italic          =   True
            Left            =   586
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "(click to change)"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   200
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   160
         End
         Begin Label nte_logo_right_click_to_clear_1
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
            InitialParent   =   "grp_option_logo"
            Italic          =   True
            Left            =   586
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "(right-click to clear)"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   222
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   160
         End
         Begin Label lbl_logo_mask
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
            InitialParent   =   "grp_option_logo"
            Italic          =   False
            Left            =   586
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Mask:"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   246
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   160
         End
         Begin SImageCanvas can_logo_mask
            AllowAutoDeactivate=   True
            AllowChange     =   True
            AllowFocus      =   False
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            bgColor         =   &c00000000
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   120
            Index           =   -2147483648
            InitialParent   =   "grp_option_logo"
            Left            =   586
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
            Top             =   268
            Transparent     =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label nte_logo_click_to_change_2
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
            InitialParent   =   "grp_option_logo"
            Italic          =   True
            Left            =   586
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "(click to change)"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   392
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   160
         End
         Begin Label nte_logo_right_click_to_clear_2
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
            InitialParent   =   "grp_option_logo"
            Italic          =   True
            Left            =   586
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "(right-click to clear)"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   414
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   160
         End
      End
      Begin GroupBox grp_settings_transitions
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Transitions"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   169
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
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
         Top             =   52
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   430
         Begin CheckBox chk_style_use_transitions
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Use transitions by default"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_transitions"
            Italic          =   False
            Left            =   39
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
            Top             =   81
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   189
         End
         Begin Label lbl_style_frames
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
            InitialParent   =   "grp_settings_transitions"
            Italic          =   False
            Left            =   38
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Frames"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   107
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   183
         End
         Begin Slider sld_style_frames
            AllowAutoDeactivate=   True
            AllowLiveScrolling=   True
            Enabled         =   True
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_transitions"
            Left            =   38
            LineStep        =   1
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumValue    =   60
            MinimumValue    =   1
            PageStep        =   1
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            TickMarkStyle   =   0
            Tooltip         =   ""
            Top             =   129
            Transparent     =   True
            Value           =   5
            Visible         =   True
            Width           =   133
         End
         Begin SEditFieldNumeric edt_style_frames
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   True
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            dirty           =   False
            DisplayFormat   =   ""
            Enabled         =   True
            EnforceRange    =   True
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
            InitialParent   =   "grp_settings_transitions"
            Italic          =   False
            Left            =   194
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Maximum         =   60.0
            MaximumCharactersAllowed=   2
            Minimum         =   1.0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            SignalRangeErrors=   False
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   129
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   "9#"
            Visible         =   True
            Width           =   27
         End
         Begin Label lbl_style_time
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
            InitialParent   =   "grp_settings_transitions"
            Italic          =   False
            Left            =   39
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Time:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   154
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin Slider sld_style_time
            AllowAutoDeactivate=   True
            AllowLiveScrolling=   True
            Enabled         =   True
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_transitions"
            Left            =   39
            LineStep        =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumValue    =   1000
            MinimumValue    =   50
            PageStep        =   20
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            TickMarkStyle   =   0
            Tooltip         =   ""
            Top             =   177
            Transparent     =   True
            Value           =   100
            Visible         =   True
            Width           =   132
         End
         Begin SEditFieldNumeric edt_style_time
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   True
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            dirty           =   False
            DisplayFormat   =   ""
            Enabled         =   True
            EnforceRange    =   True
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
            InitialParent   =   "grp_settings_transitions"
            Italic          =   False
            Left            =   183
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Maximum         =   1000.0
            MaximumCharactersAllowed=   4
            Minimum         =   50.0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            SignalRangeErrors=   False
            TabIndex        =   6
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   177
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   "99##"
            Visible         =   True
            Width           =   38
         End
         Begin Label txt_style_transition_note
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   131
            Index           =   -2147483648
            InitialParent   =   "grp_settings_transitions"
            Italic          =   False
            Left            =   233
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "*Transitions are greatly affected by screen resolution. If you are experiencing slow transitions, consider decreasing the resolution of the monitor that the presentation resides on. Also, if you notice that transitions are not showing up, it may be because your color levels are too low on the presentation monitor."
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   81
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   217
         End
      End
      Begin GroupBox grp_settings_style
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Style"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   205
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   233
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   430
         Begin Label lbl_style_border_thickness
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
            InitialParent   =   "grp_settings_style"
            Italic          =   False
            Left            =   39
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Border Thickness:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   257
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin SEditFieldNumeric edt_style_border_thickness
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   True
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            dirty           =   False
            DisplayFormat   =   ""
            Enabled         =   True
            EnforceRange    =   False
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
            InitialParent   =   "grp_settings_style"
            Italic          =   False
            Left            =   39
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Maximum         =   0.0
            MaximumCharactersAllowed=   4
            Minimum         =   0.0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            SignalRangeErrors=   False
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   281
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   "999#"
            Visible         =   True
            Width           =   50
         End
         Begin Label lbl_style_initial_mode
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
            InitialParent   =   "grp_settings_style"
            Italic          =   False
            Left            =   39
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Initial Mode:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   306
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin PopupMenu pop_style_initial_mode
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_style"
            InitialValue    =   ""
            Italic          =   False
            Left            =   39
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   328
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin Label lbl_style_mouse_cursor
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
            InitialParent   =   "grp_settings_style"
            Italic          =   False
            Left            =   39
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Mouse Cursor:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   350
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin CheckBox chk_style_blanks
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Insert blank slides"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_style"
            Italic          =   False
            Left            =   240
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   259
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   210
         End
         Begin PopupMenu pop_style_mouse_cursor
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_style"
            InitialValue    =   ""
            Italic          =   False
            Left            =   39
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   372
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin Label txt_style_blanks_between
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
            InitialParent   =   "grp_settings_style"
            Italic          =   False
            Left            =   260
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "between set items"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   280
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   190
         End
         Begin Canvas nil_blanks
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   False
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   78
            Index           =   -2147483648
            InitialParent   =   "grp_settings_style"
            Left            =   233
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   306
            Transparent     =   True
            Visible         =   True
            Width           =   217
            Begin Label lbl_style_blank_style
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
               InitialParent   =   "nil_blanks"
               Italic          =   False
               Left            =   243
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Multiline       =   False
               Scope           =   0
               Selectable      =   False
               TabIndex        =   0
               TabPanelIndex   =   2
               TabStop         =   True
               Text            =   "Blanks take style of:"
               TextAlignment   =   0
               TextColor       =   &c00000000
               Tooltip         =   ""
               Top             =   313
               Transparent     =   False
               Underline       =   False
               Visible         =   True
               Width           =   198
            End
            Begin RadioButton rad_style_blank_prev
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "Previous slide"
               Enabled         =   True
               FontName        =   "System"
               FontSize        =   0.0
               FontUnit        =   0
               Height          =   22
               Index           =   -2147483648
               InitialParent   =   "nil_blanks"
               Italic          =   False
               Left            =   244
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Scope           =   0
               TabIndex        =   1
               TabPanelIndex   =   2
               TabStop         =   True
               Tooltip         =   ""
               Top             =   334
               Transparent     =   True
               Underline       =   False
               Value           =   False
               Visible         =   True
               Width           =   198
            End
            Begin RadioButton rad_style_blank_next
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "Next slide"
               Enabled         =   True
               FontName        =   "System"
               FontSize        =   0.0
               FontUnit        =   0
               Height          =   22
               Index           =   -2147483648
               InitialParent   =   "nil_blanks"
               Italic          =   False
               Left            =   244
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Scope           =   0
               TabIndex        =   2
               TabPanelIndex   =   2
               TabStop         =   True
               Tooltip         =   ""
               Top             =   356
               Transparent     =   True
               Underline       =   False
               Value           =   False
               Visible         =   True
               Width           =   198
            End
         End
         Begin CheckBox chk_style_blank_is_slide_change
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Empty lyric line indicates slide change"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_style"
            Italic          =   False
            Left            =   39
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   9
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   "If checked, an empty line in the lyrics (no text) indicates a slide change. Acts like using ""||"" on the line. Simulates EasyWorship-style behavior."
            Top             =   408
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   411
         End
      End
      Begin GroupBox grp_settings_monitor
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Monitor Settings"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   268
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   472
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   52
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   294
         Begin Label lbl_monitor_presentation
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
            InitialParent   =   "grp_settings_monitor"
            Italic          =   False
            Left            =   481
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Presentation Monitor:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   119
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   181
         End
         Begin PopupMenu pop_monitor_presentation
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_monitor"
            InitialValue    =   "1\n2"
            Italic          =   False
            Left            =   482
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   1
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   141
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   40
         End
         Begin Label nte_monitor_detected
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
            InitialParent   =   "grp_settings_monitor"
            Italic          =   True
            Left            =   481
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "(1 monitor(s) detected.)"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   167
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   197
         End
         Begin PopupMenu pop_monitor_control
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_monitor"
            InitialValue    =   "1\r\n2"
            Italic          =   False
            Left            =   481
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   95
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   40
         End
         Begin Label lbl_monitor_control
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
            InitialParent   =   "grp_settings_monitor"
            Italic          =   False
            Left            =   481
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Control Monitor:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   73
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   181
         End
         Begin Label lbl_monitor_default_mode
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
            InitialParent   =   "grp_settings_monitor"
            Italic          =   False
            Left            =   481
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Default Mode:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   201
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin PopupMenu pop_monitor_mode
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "grp_settings_monitor"
            InitialValue    =   ""
            Italic          =   False
            Left            =   481
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   6
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   225
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   200
         End
         Begin CheckBox chk_monitor_force_4_3_preview
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Force 4:3 preview"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_monitor"
            Italic          =   False
            Left            =   481
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   262
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   197
         End
         Begin CheckBox chk_monitor_force_16_9_preview
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Force 16:9 preview"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_monitor"
            Italic          =   False
            Left            =   481
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   286
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   197
         End
      End
      Begin TextField edt_settings_snapshot_filename
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
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
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   79
         Transparent     =   True
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   702
      End
      Begin SButton btn_settings_snapshot_file
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         HasFocus        =   False
         Height          =   22
         Icon            =   0
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Label           =   ""
         LabelAlign      =   0
         Left            =   744
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         NewPaint        =   False
         Outline         =   True
         Scope           =   0
         StickyBevel     =   False
         Stuck           =   False
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         Toggle          =   False
         Tooltip         =   ""
         Top             =   79
         Transparent     =   True
         Visible         =   True
         Width           =   22
      End
      Begin CheckBox chk_settings_export_preview
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Export snapshots during set preview"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
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
         Top             =   111
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   722
      End
      Begin CheckBox chk_settings_export_live_insertions
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Export snapshots of slides inserted during a live presentation"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
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
         Top             =   133
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   722
      End
      Begin CheckBox chk_settings_export_metadata
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Export slide details in a similarly named xml file"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
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
         Top             =   155
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   722
      End
      Begin Label txt_settings_snapshot_parameters
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   257
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "The following parameters can be used in the file name or path:\r\n- %d: The day of the current month (01-31)\r\n- %H: The hour from the current time of day in 24-hour format (00-23)\r\n- %i: The minutes from the current time (00-59)\r\n- %m: The current month (01-12)\r\n- %n: The number of the slide in the current set (with leading zeroes)\r\n- %N: The name of the current slide\r\n- %P: Presentation index for slides during presentation (with leading zeroes)\r\n- %s: The seconds from the current time (00-59)\r\n- %S: The name of the current set\r\n- %T: The title of the current slide\r\n- %V: The verse indicator of the current slide (for songs, empty for other slides)\r\n- %Y: The current year (4 digits)\r\n"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   181
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   736
      End
      Begin CheckBox chk_settings_export_snapshot
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Export a snapshot of each presented slide to the following file"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   57
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   736
      End
      Begin GroupBox grp_settings_presentation_control
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Presentation Control"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   78
         Index           =   -2147483648
         InitialParent   =   "tab_present_settings"
         Italic          =   False
         Left            =   472
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   360
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   294
         Begin CheckBox chk_style_exit_doubleclick
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Exit on double-click"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_presentation_control"
            Italic          =   False
            Left            =   482
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
            Top             =   384
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   196
         End
         Begin CheckBox chk_style_exit_prompt
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Prompt when exiting"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "grp_settings_presentation_control"
            Italic          =   False
            Left            =   482
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   408
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   196
         End
      End
   End
   Begin Timer AudioTimer
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   500
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin GroupBox grp_settings_audio
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Audio"
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   75
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   576
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   514
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   200
      Begin PushButton btn_audio_browse
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Browse"
         Default         =   False
         Enabled         =   True
         FontName        =   "Arial"
         FontSize        =   11.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_settings_audio"
         Italic          =   False
         Left            =   697
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   531
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   69
      End
      Begin PushButton btn_audio_play
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Play"
         Default         =   False
         Enabled         =   True
         FontName        =   "Arial"
         FontSize        =   11.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_settings_audio"
         Italic          =   False
         Left            =   666
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   559
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin PushButton btn_audio_stop
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Stop"
         Default         =   False
         Enabled         =   True
         FontName        =   "Arial"
         FontSize        =   11.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_settings_audio"
         Italic          =   False
         Left            =   584
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   559
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin Label lbl_audio_file_to_play
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "Arial"
         FontSize        =   11.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_settings_audio"
         Italic          =   False
         Left            =   585
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "File to Play:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   532
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   109
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
		Function KeyDown(Key As String) As Boolean
		  If Keyboard.AsyncKeyDown(&h35) Or Asc(Key) = 27 Then ' Escape
		    Close
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim s As String
		  Dim n As Integer 'EMP 09/05
		  Dim Settings As XmlNode = App.MyPresentSettings.DocumentElement
		  
		  App.MouseCursor = System.Cursors.Wait
		  App.DebugWriter.Write("Opening PresentSettingsWindow")
		  Me.BackColor = FillColor
		  
		  edt_style_border_thickness.Text = SmartML.GetValue(Settings, "style/@thickness")
		  chk_style_use_transitions.Value = SmartML.GetValueB(Settings, "style/@transition")
		  chk_style_blanks.Value = SmartML.GetValueB(Settings, "style/@blanks")
		  chk_style_blank_is_slide_change.Value = SmartML.GetValueB(Settings, "style/@blank_is_slide_change")
		  
		  chk_style_exit_prompt.Value = SmartML.GetValueB(Settings, "style/@exit_prompt")
		  chk_style_exit_doubleclick.Value = SmartML.GetValueB(Settings, "style/@exit_doubleclick")
		  '++JRC
		  Dim file As String
		  file = SmartML.GetValue(Settings, "style/@default_audio")
		  CurrAudioFile = GetFolderItem(file)
		  If CurrAudioFile <> Nil Then
		    CurrAudio = CurrAudioFile.OpenAsSound
		  end if
		  if CurrAudio = Nil then
		    CurrAudioFile = Nil
		    btn_audio_play.Enabled = false
		    btn_audio_stop.Enabled = false
		  else
		    btn_audio_play.Enabled = true
		    'btn_audio_stop.Enabled = true
		  end if
		  
		  IsAudioPlaying = false
		  AudioTimer.Enabled = false
		  '--
		  //++
		  // Bug 1554999: Update list of monitors to accomodate systems with more than two monitors
		  //--
		  pop_monitor_control.DeleteAllRows
		  pop_monitor_presentation.DeleteAllRows
		  For n = 1 To Max(2, OSScreenCount()) // Permit dual-monitor configuration even if on single-monitor system.
		    pop_monitor_control.AddRow CStr(n)
		    pop_monitor_presentation.AddRow CStr(n)
		  Next
		  
		  pop_monitor_control.ListIndex = SmartML.GetValueN(Settings, "monitors/@control") - 1
		  If pop_monitor_control.ListIndex < 0 Then pop_monitor_control.ListIndex = 0
		  pop_monitor_presentation.ListIndex = SmartML.GetValueN(Settings, "monitors/@present") - 1
		  If pop_monitor_presentation.ListIndex < 0 Then pop_monitor_presentation.ListIndex = 1
		  chk_monitor_force_4_3_preview.Value = SmartML.GetValueB(Settings, "monitors/@force_4_3_preview", True, False)
		  chk_monitor_force_16_9_preview.Value = SmartML.GetValueB(Settings, "monitors/@force_16_9_preview", True, False)
		  
		  can_style_default.SetStyleNode SmartML.GetNode(Settings, "default_style")
		  DefaultStyle = New SlideStyle(can_style_default.GetStyleNode)
		  can_style_scripture.SetStyleNode SmartML.GetNode(Settings, "scripture_style")
		  ScriptureStyle = New SlideStyle(can_style_scripture.GetStyleNode)
		  
		  sal_alerts.SetVAlign SmartML.GetValue(Settings, "alert/@valign")
		  sal_alerts.SetHAlign SmartML.GetValue(Settings, "alert/@align")
		  can_alerts_font.SetFont SmartML.GetValueF(Settings, "alert")
		  
		  can_logo.SetImageFromString SmartML.GetValue(Settings, "logo")
		  can_logo_mask.SetImageFromString SmartML.GetValue(Settings, "logo_mask")
		  
		  Call CheckLogoAndMask(20) // if invalid set mask from logo alpha channel or warn if that is not possible 
		  
		  pop_style_initial_mode.AddRow App.T.Translate("presentation_settings/style/modes/normal/@caption")
		  pop_style_initial_mode.AddRow App.T.Translate("presentation_settings/style/modes/black/@caption")
		  pop_style_initial_mode.AddRow App.T.Translate("presentation_settings/style/modes/white/@caption")
		  pop_style_initial_mode.AddRow App.T.Translate("presentation_settings/style/modes/logo/@caption")
		  pop_style_initial_mode.AddRow App.T.Translate("presentation_settings/style/modes/hidden/@caption")
		  pop_style_initial_mode.AddRow App.T.Translate("presentation_settings/style/modes/frozen/@caption")
		  
		  pop_style_mouse_cursor.AddRow App.T.Translate("presentation_settings/style/mouse_cursor/arrow/@caption")
		  pop_style_mouse_cursor.AddRow App.T.Translate("presentation_settings/style/mouse_cursor/cross/@caption")
		  pop_style_mouse_cursor.AddRow App.T.Translate("presentation_settings/style/mouse_cursor/hidden/@caption")
		  pop_style_mouse_cursor.AddRow App.T.Translate("presentation_settings/style/mouse_cursor/hourglass/@caption")
		  pop_style_mouse_cursor.AddRow App.T.Translate("presentation_settings/style/mouse_cursor/ibeam/@caption")
		  
		  pop_monitor_mode.AddRow App.T.Translate("songs_mode/selected_song/present/single_screen/@caption")
		  pop_monitor_mode.AddRow App.T.Translate("songs_mode/selected_song/present/dual_screen/@caption")
		  pop_monitor_mode.AddRow App.T.Translate("songs_mode/selected_song/present/preview_dual_screen/@caption")
		  
		  pop_monitor_mode.Listindex = SmartML.GetValueN(Settings, "presentation_mode/@code", True) - 1
		  
		  Dim temp As String
		  temp = SmartML.GetValue(Settings, "style/@initial_mode")
		  Select Case temp
		  Case "B"
		    pop_style_initial_mode.ListIndex = 1
		  Case "W"
		    pop_style_initial_mode.ListIndex = 2
		  Case "L"
		    pop_style_initial_mode.ListIndex = 3
		  Case "H"
		    pop_style_initial_mode.ListIndex = 4
		  Case "F"
		    pop_style_initial_mode.ListIndex = 5
		  Else
		    pop_style_initial_mode.ListIndex = 0
		  End Select
		  
		  'Josh
		  temp = SmartML.GetValue(Settings, "style/@mouse_cursor")
		  Select Case temp
		  Case "arrow"
		    pop_style_mouse_cursor.ListIndex = 0
		  Case "cross"
		    pop_style_mouse_cursor.ListIndex = 1
		  Case "hidden"
		    pop_style_mouse_cursor.ListIndex = 2
		  Case "hourglass"
		    pop_style_mouse_cursor.ListIndex = 3
		  Case "ibeam"
		    pop_style_mouse_cursor.ListIndex = 4
		  Else
		    pop_style_mouse_cursor.ListIndex = 0
		  End Select
		  
		  App.MouseCursor = Nil
		  
		  App.T.TranslateWindow Me, "presentation_settings", App.TranslationFonts
		  s = App.T.Translate("presentation_settings/style/initial_mode/@caption")
		  nte_monitor_detected.Caption = Replace(nte_monitor_detected.Caption, "%1", Str(OSScreenCount()))
		  
		  //++EMP 09/05
		  // Code for user-selectable transitions
		  
		  n = SmartML.GetValueN(Settings, "style/@transition_frames", False)
		  If n = 0 Then n = 5
		  sld_style_frames.Value = n
		  edt_style_frames.SetValue(n)
		  edt_style_frames.Minimum = sld_style_frames.Minimum
		  edt_style_frames.Maximum = sld_style_frames.Maximum
		  edt_style_frames.EnforceRange = True
		  
		  n = SmartML.GetValueN(Settings, "style/@transition_time", False)
		  If n = 0 Then n = 100
		  sld_style_time.Value = n
		  edt_style_time.SetValue(n)
		  edt_style_time.Minimum = sld_style_time.Minimum
		  edt_style_time.Maximum = sld_style_time.Maximum
		  edt_style_time.EnforceRange = True
		  
		  'sld_style_frames.Enabled = chk_style_use_transitions.Value
		  'sld_style_time.Enabled = chk_style_use_transitions.Value
		  'edt_style_frames.Enabled = chk_style_use_transitions.Value
		  'edt_style_time.Enabled = chk_style_use_transitions.Value
		  'lbl_style_time.Enabled = chk_style_use_transitions.Value
		  'lbl_style_frames.Enabled = chk_style_use_transitions.Value
		  //--
		  
		  //++EMP, 11/05
		  // Determine if blanks use the previous or next slide's style
		  
		  rad_style_blank_next.Value = SmartML.GetValueB(Settings, _
		  "style/@blank_uses_next", True, True)
		  rad_style_blank_prev.Value = Not rad_style_blank_next.Value
		  //--
		  
		  chk_settings_export_snapshot.Value = SmartML.GetValueB(Settings, "snapshot/@enable", False, False)
		  edt_settings_snapshot_filename.Text = SmartML.GetValue(Settings, "snapshot/filename", False)
		  chk_settings_export_preview.Value = SmartML.GetValueB(Settings, "snapshot/@export_preview", False, False)
		  chk_settings_export_live_insertions.Value = SmartML.GetValueB(Settings, "snapshot/@export_live_insertions", False, True)
		  chk_settings_export_metadata.Value = SmartML.GetValueB(Settings, "snapshot/@export_metadata", False, True)
		  App.CenterInControlScreen Me
		  Timer.CallLater(50, AddressOf FixLinuxLayout)
		  
		  
		  ColorPaletteBroker.RegisterColorPaletteSource(self)
		  ColorPaletteBroker.SetContextTag("present.settings")
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  FixLinuxLayout()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CheckLogoAndMask(flags As Integer = 15) As Boolean
		  // if both logo and mask is set, warn if they have different size
		  // if the logo has non-trivial data in it's alpha channel, silently replace the mask with it
		  
		  Dim SetMaskFromAlpha As Boolean = Bitwise.BitAnd(flags, 1) <> 0
		  Dim SetMaskFromAlphaIfInvalid As Boolean = Bitwise.BitAnd(flags, 16) <> 0
		  Dim ClearMaskIfInvalid As Boolean = Bitwise.BitAnd(flags, 2) <> 0
		  Dim ShowWarningIfMaskInvalid As Boolean = Bitwise.BitAnd(flags, 4) <> 0 // after having executed other options
		  Dim ClearMaskIfNoLogo As Boolean = Bitwise.BitAnd(flags, 8) <> 0
		  
		  Dim logoPic As Picture = can_logo.GetImage.GetImage
		  Dim maskPic As Picture = can_logo_mask.GetImage.GetImage
		  
		  If ClearMaskIfNoLogo Then
		    If logoPic = Nil And maskPic <> Nil Then
		      can_logo_mask.GetImage.Clear
		      can_logo_mask.Repaint
		    End If
		  End If
		  
		  If logoPic <> Nil And SetMaskFromAlpha And can_logo.GetImage.HasUsableAlpha Then
		    can_logo_mask.GetImage.SetImage(logoPic.CopyMask)
		    can_logo_mask.Repaint
		  ElseIf maskPic <> Nil Then
		    If logoPic <> Nil Then
		      If logoPic.Width <> maskPic.Width Or logoPic.Height <> maskPic.Height Then
		        If SetMaskFromAlphaIfInvalid And can_logo.GetImage.HasUsableAlpha Then
		          // silently relplace with alpha channel
		          can_logo_mask.GetImage.SetImage(logoPic.CopyMask)
		          can_logo_mask.Repaint
		        ElseIf ClearMaskIfInvalid Then
		          can_logo_mask.GetImage.Clear
		          can_logo_mask.Repaint
		        Else
		          If ShowWarningIfMaskInvalid Then
		            // warn the user
		            Dim dimensionMessage, logoDimension, maskDimension As String
		            logoDimension = CStr(logoPic.Width) + "x" + CStr(logoPic.Height)
		            maskDimension = CStr(maskPic.Width) + "x" + CStr(maskPic.Height)
		            dimensionMessage = App.T.Translate("errors/presentations/picture_dimensions", logoDimension, maskDimension)
		            InputBox.Message(dimensionMessage)
		          End If
		          Return False
		        End If
		      End If
		    End If
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FixLinuxLayout()
		  // This code fixes an issue on Linux where the OK & Cancel buttons end up underneath the tab panel
		  #If TargetLinux
		    Dim tabTop As Integer = tab_present_settings.Top
		    Dim tabHeight As Integer = tab_present_settings.Height
		    Dim margin As Integer = Self.Height - (btn_ok.top + btn_ok.Height)
		    If tabTop + tabHeight > btn_ok.top Then
		      tab_present_settings.LockBottom = False
		      Self.Height = tabTop + tabHeight + btn_ok.Height + (2 * margin)
		      tab_present_settings.LockBottom = True
		    End If
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PopTo(str As String, pop As PopupMenu)
		  Dim i As Integer
		  For i = 0 To pop.ListCount - 1
		    If Lowercase(str) = Lowercase(pop.List(i)) Then
		      pop.ListIndex = i
		      Return
		    End If
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupplyColorPalette(tag As String) As ColorPaletteBroker.ColorPalette()
		  // Part of the ColorPaletteBroker.ColorPaletteSource interface.
		  
		  // default styles are being supplied by MainWindow.SupplyColorPalette
		  
		  Dim pal, pals() As ColorPaletteBroker.ColorPalette
		  Dim colrs() As Color
		  Dim dlgColors() As Color
		  Dim dlgTag As String
		  Dim txFound As Boolean
		  Dim xnode As XmlNode
		  Dim captionStr As String
		  
		  For i As Integer = 0 To App.WindowCount
		    If App.Window(i) IsA FontChooser Then
		      ColorPaletteBroker.AddFontColors(FontChooser(App.Window(i)).MyFont, dlgColors)
		      If dlgTag = "" Then
		        dlgTag = ColorPaletteBroker.ContextTag
		        dlgTag = dlgTag + ".font"
		      End If
		    End If
		    If App.Window(i) IsA StyleWindow Then
		      Dim styleWin As StyleWindow = StyleWindow(App.Window(i))
		      ColorPaletteBroker.AddStyleColors(StyleWindow(App.Window(i)).PeekStyle(), dlgColors)
		      xNode = styleWin.StyleNode
		      If xNode <> Nil Then
		        dlgTag = ""
		        Select case xNode.OwnerDocument.DocumentElement.Name
		        Case "present_settings"
		          If xNode.Name = "default_style" Then dlgTag = "present.settings.defaultstyle"
		          If xNode.Name = "scripture_style" Then dlgTag = "present.settings.scripturestyle"
		        End Select
		      End If
		      xnode = Nil
		    End If
		  Next i
		  dlgColors = ColorPaletteBroker.SortUniqueColors(dlgColors)
		  
		  If ColorPaletteBroker.Included(tag, "present.settings.font") Then
		    Redim colrs(-1)
		    If ColorPaletteBroker.Included(dlgTag, "present.settings.font") Then
		      For i As Integer = 0 To dlgColors.Ubound
		        colrs.Add(dlgColors(i))
		      Next i
		    End If
		    If App.MyPresentSettings <> Nil Then
		      xnode = SmartML.GetNode(App.MyPresentSettings.DocumentElement, "alert")
		      If xnode <> Nil Then
		        ColorPaletteBroker.AddFontColors(xNode, colrs)
		      End If
		    End If
		    If colrs.Ubound >= 0 Then
		      colrs = SortUniqueColors(colrs)
		      captionStr = App.T.Translate("color_selector/color_palette/alert/@caption", txFound)
		      If not txFound Then captionStr = "Alert"
		      pal = New ColorPaletteBroker.ColorPalette("present.settings.alert", captionStr, colrs)
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


	#tag Property, Flags = &h0
		BGImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		BGImageFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrAudio As Sound
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrAudioFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DefaultStyle As SlideStyle
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected FilterString As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsAudioPlaying As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ScriptureStyle As SlideStyle
	#tag EndProperty


	#tag Constant, Name = ROW_AUTHOR, Type = Integer, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ROW_CCLI_LICENSE, Type = Integer, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ROW_CCLI_NUMBER, Type = Integer, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ROW_COPYRIGHT, Type = Integer, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ROW_HYMN_NUMBER, Type = Integer, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events btn_ok
	#tag Event
		Sub Action()
		  Dim Settings As XmlElement
		  
		  Settings = App.MyPresentSettings.DocumentElement
		  
		  SmartML.SetValue Settings, "@version", "1.0" // Tag this so other parts of the program will know which schema to use.
		  
		  SmartML.SetValue Settings, "alert/@valign", sal_alerts.GetVAlign
		  SmartML.SetValue Settings, "alert/@align", sal_alerts.GetHAlign
		  SmartML.SetValueF Settings, "alert", can_alerts_font.GetFont
		  
		  // If the mask dimensions do not match the image dimensions, warn again
		  Call CheckLogoAndMask(4) // show warning if mask invalid
		  
		  SmartML.SetValue(Settings, "logo", can_logo.GetImageAsString)
		  SmartML.SetValue(Settings, "logo_mask", can_logo_mask.GetImageAsString)
		  
		  //++EMP 09/05
		  SmartML.SetValueN(Settings, "style/@transition_frames", sld_style_frames.Value)
		  SmartML.SetValueN(Settings, "style/@transition_time", sld_style_time.Value)
		  //--
		  
		  //++EMP 11/05
		  // Moved from Action routines for individual controls so cancelling this form will truly cancel.
		  
		  SmartML.SetValueB Settings, "style/@blanks", chk_style_blanks.Value
		  SmartML.SetValueB Settings, "style/@transition", chk_style_use_transitions.Value
		  SmartML.SetValueB Settings, "style/@blank_is_slide_change", chk_style_blank_is_slide_change.Value
		  SmartML.SetValueN Settings, "style/@thickness", Val(edt_style_border_thickness.Text)
		  
		  
		  SmartML.SetValueB Settings, "style/@exit_prompt", chk_style_exit_prompt.Value
		  SmartML.SetValueB Settings, "style/@exit_doubleclick", chk_style_exit_doubleclick.Value
		  
		  If CurrAudioFile <> Nil Then
		    SmartML.SetValueFI(Settings, "style/@default_audio", CurrAudioFile) 'save filename
		  End If
		  
		  SmartML.SetValueN Settings, "monitors/@control", pop_monitor_control.ListIndex+1
		  SmartML.SetValueN Settings, "monitors/@present", pop_monitor_presentation.ListIndex+1
		  SmartML.SetValueB Settings, "monitors/@force_4_3_preview", chk_monitor_force_4_3_preview.Value
		  SmartML.SetValueB Settings, "monitors/@force_16_9_preview", chk_monitor_force_16_9_preview.Value
		  
		  ' pop_pres_mode added EMP, 2005
		  ' Allows user to specify default presentation mode (single screen, dual, preview)
		  ' Eventual goal is to support a hotkey to go to presenter mode
		  '
		  SmartML.SetValueN(Settings, "presentation_mode/@code", pop_monitor_mode.ListIndex + 1)
		  
		  // Initial presentation mode
		  Dim temp As String
		  Select Case pop_style_initial_mode.ListIndex
		  Case 0
		    temp = "N"
		  Case 1
		    temp = "B"
		  Case 2
		    temp = "W"
		  Case 3
		    temp = "L"
		  Case 4
		    temp = "H"
		  Case 5
		    temp = "F"
		  End Select
		  SmartML.SetValue Settings, "style/@initial_mode", temp
		  
		  Select Case pop_style_mouse_cursor.ListIndex
		  Case 0
		    temp = "arrow"
		  Case 1
		    temp = "cross"
		  Case 2
		    temp = "hidden"
		  Case 3
		    temp = "hourglass"
		  Case 4
		    temp = "ibeam"
		  End Select
		  SmartML.SetValue Settings, "style/@mouse_cursor", temp
		  
		  'SmartML.SetValue Settings, "style/@song_subtitles", lst_style_subtitles.GetSelectedOptions
		  '
		  ' Subtitle selection moves to the default style to help address an issue with subtitles not being properly
		  ' overridden.
		  '
		  SmartML.SetValueB Settings, "style/@blank_uses_next", rad_style_blank_next.Value
		  
		  If chk_settings_export_snapshot.Value And edt_settings_snapshot_filename.Text = "" Then
		    MsgBox(App.T.Translate("presentation_settings/errors/snapshot_file"))
		    Return
		  Else
		    SmartML.SetValueB(Settings, "snapshot/@enable", chk_settings_export_snapshot.Value)
		    SmartML.SetValue(Settings, "snapshot/filename", edt_settings_snapshot_filename.Text)
		    SmartML.SetValueB(Settings, "snapshot/@export_preview", chk_settings_export_preview.Value)
		    SmartML.SetValueB(Settings, "snapshot/@export_live_insertions", chk_settings_export_live_insertions.Value)
		    SmartML.SetValueB(Settings, "snapshot/@export_metadata", chk_settings_export_metadata.Value)
		  End If
		  
		  // Stop Audio if its playing
		  If IsAudioPlaying Then
		    //++EMP, 17 Feb 2006
		    //call Globals.SXMSAudio.SXMSWinampStop()
		  End If
		  
		  //++
		  // Bug 1462055: Save settings on dialog close
		  //
		  If App.CheckDocumentFolders(App.SETTINGS_FOLDER) <> App.NO_FOLDER Then
		    If Not SmartML.XDocToFile(App.MyPresentSettings, App.DocsFolder.Child(App.STR_SETTINGS).Child("PresentSettings")) Then SmartML.DisplayError
		  Else
		    If App.DocsFolder <> Nil Then
		      MsgBox App.T.Translate("errors/create_settings_folder", App.DocsFolder.NativePath + App.STR_SETTINGS)
		    Else
		      MsgBox App.T.Translate("errors/no_docs_folder", "")
		    End If
		  End If
		  
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_cancel
	#tag Event
		Sub Action()
		  '++JRC: Stop Audio if its playing
		  //++EMP 17 Feb 2006
		  //if IsAudioPlaying = true then
		  //call Globals.SXMSAudio.SXMSWinampStop()
		  //end if
		  '--
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sal_alerts
	#tag Event
		Sub Open()
		  Me.SetValid "YYYNNNYYY"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_logo
	#tag Event
		Sub Action()
		  Call CheckLogoAndMask(5) // Set mask from alpha, warning if invalid
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_logo_mask
	#tag Event
		Sub Action()
		  Call CheckLogoAndMask(4) // show warning if mask invalid
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_style_use_transitions
	#tag Event
		Sub Action()
		  'Keep the settings active as transitions can be enabled on a per sheet basis
		  
		  'sld_style_frames.Enabled = Me.Value
		  'sld_style_time.Enabled = Me.Value
		  'edt_style_frames.Enabled = Me.Value
		  'edt_style_time.Enabled = Me.Value
		  'lbl_style_time.Enabled = Me.Value
		  'lbl_style_frames.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sld_style_frames
	#tag Event
		Sub ValueChanged()
		  If edt_style_frames.Value <> Me.Value Then
		    edt_style_frames.SetValue(Me.Value)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_style_frames
	#tag Event
		Sub ValueChange()
		  If sld_style_frames.Value <> Me.Value Then
		    sld_style_frames.Value = Me.Value
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sld_style_time
	#tag Event
		Sub ValueChanged()
		  If edt_style_time.Value <> Me.Value Then
		    edt_style_time.SetValue(Me.Value)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_style_time
	#tag Event
		Sub ValueChange()
		  If sld_style_time.Value <> edt_style_time.Value Then
		    sld_style_time.Value = edt_style_time.Value
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_style_border_thickness
	#tag Event
		Sub ValueChange()
		  GraphicsX.ThicknessFactor = edt_style_border_thickness.Value
		  Refresh False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_style_blanks
	#tag Event
		Sub Action()
		  // Disable blanks style radio box if unchecked
		  nil_blanks.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbl_monitor_default_mode
	#tag Event
		Sub Open()
		  Dim s as String
		  s = App.T.Translate("presentation_settings/style/initial_mode/@caption")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_monitor_force_4_3_preview
	#tag Event
		Sub Action()
		  if chk_monitor_force_4_3_preview.Value then
		    chk_monitor_force_16_9_preview.Value = false
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_monitor_force_16_9_preview
	#tag Event
		Sub Action()
		  if chk_monitor_force_16_9_preview.Value then
		    chk_monitor_force_4_3_preview.Value = false
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_settings_snapshot_file
	#tag Event
		Sub Action()
		  Dim dlg As New SaveAsDialog
		  Dim f As FolderItem
		  
		  dlg.ActionButtonCaption = App.T.Translate("shared/select/@caption")
		  dlg.CancelButtonCaption = App.T.Translate("shared/cancel/@caption")
		  dlg.Title = App.T.Translate("presentation_settings/snapshot_file/@caption")
		  dlg.PromptText = App.T.Translate("presentation_settings/snapshot_file")
		  dlg.Filter=ImageFileTypes.JPGFiles
		  
		  f = dlg.ShowModal()
		  If Not IsNull(f) Then
		    edt_settings_snapshot_filename.Text = f.NativePath()
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileopen_img
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_settings_export_snapshot
	#tag Event
		Sub Action()
		  edt_settings_snapshot_filename.Enabled = Me.Value
		  btn_settings_snapshot_file.Enabled = Me.Value
		  chk_settings_export_preview.Enabled = Me.Value
		  chk_settings_export_live_insertions.Enabled = Me.Value
		  chk_settings_export_metadata.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AudioTimer
	#tag Event
		Sub Action()
		  '++JRC
		  //++EMP 17 Feb 2006
		  // Commented out for mainstream version
		  //--
		  ''Just check every few seconds if CurrAudio has finished playing
		  'Dim error As integer
		  '
		  'if IsAudioPlaying = true then
		  'error = 0
		  'error = Globals.SXMSAudio.SXMSWinampIsPlaying
		  'if error  = 0 then
		  'btn_audio_play.Enabled = true
		  'btn_audio_stop.Enabled = false
		  'IsAudioPlaying = false
		  'AudioTimer.Enabled = false
		  'btn_audio_play.Caption = App.T.Translate("presentation_settings/audio/play/@caption")
		  '
		  'end if
		  'else
		  'AudioTimer.Enabled = false
		  'end if
		  '--
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_audio_browse
	#tag Event
		Sub Action()
		  //++EMP, 17 Feb 2006
		  // Joshua's audio module isn't cross-platform ready,
		  // so it is commented out for the mainstream release
		  //--
		  //
		  ''++JRC
		  'Dim FileName As MemoryBlock
		  'Dim FilterIndex As MemoryBlock
		  'Dim Pos As integer
		  'Dim error As integer
		  'Declare Function OpenFileDialog lib "UTILITY.DLL" (Handle as integer, Title as Cstring, FileTypes as Ptr, FilterIndex as Ptr) as Ptr
		  '
		  'FilterIndex = NewMemoryBlock(4)
		  'FileName = OpenFileDialog(Me.Handle, App.T.Translate("open_titles/audio"), Globals.Filters, FilterIndex)
		  'CurrAudioFile = GetFolderItem(FileName.CString(0))
		  'If CurrAudioFile = Nil Then
		  'CurrAudio = Nil
		  'Return
		  'end if
		  'FilterString  = Globals.GetFilterString(FilterIndex.Long(0))
		  'Pos = Instr(FilterString, " (*.")
		  'FilterString = App.AppFolder.Child("Plugins").NativePath + Mid(FilterString, 0, Pos)
		  '
		  'if IsAudioPlaying = true then
		  'call Globals.SXMSAudio.SXMSWinampStop()
		  'IsAudioPlaying = false
		  'btn_audio_play.Enabled = false
		  'btn_audio_stop.Enabled = false
		  'end if
		  '
		  'error = Globals.SXMSAudio.SXMSWinampLoadPlugIn(FilterString)
		  '
		  'if error = 0 then
		  'InputBox.Message App.T.Translate("errors\plugin_load_failed", FilterString)
		  'return
		  'end if
		  ''CurrAudio = Nil
		  ''CurrAudio = CurrAudioFile.OpenAsSound
		  ''if CurrAudio = Nil then
		  ''CurrAudioFile = Nil
		  ''btn_audio_play.Enabled = false
		  ''btn_audio_stop.Enabled = false
		  ''else
		  'btn_audio_play.Enabled = true
		  ''btn_audio_stop.Enabled = true
		  ''end if
		  '
		  'IsAudioPlaying = false
		  ''--
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_audio_play
	#tag Event
		Sub Action()
		  //++EMP, 17 Feb 2006
		  // Joshua's audio add-on isn't cross-platform ready,
		  // so it is commented out for the mainstream release
		  //--
		  ''++JRC
		  'Dim error As integer
		  'Declare Sub delay lib "UTILITY.DLL" (Seconds as integer)
		  '
		  'if IsAudioPlaying = false then
		  'error = Globals.SXMSAudio.SXMSWinampPlay(CurrAudioFile.NativePath)
		  'if error = 1 and Globals.SXMSAudio.SXMSWinampIsPlaying  = 1 then
		  ''btn_audio_play.Enabled = false
		  'btn_audio_play.Caption = App.T.Translate("presentation_settings/audio/pause/@caption")
		  'btn_audio_stop.Enabled = true
		  'IsAudioPlaying = true
		  'end if
		  'else
		  'error = 0
		  'error = Globals.SXMSAudio.SXMSWinampGetPaused()
		  'if error = 0 then
		  'Call Globals.SXMSAudio.SXMSWinampSetPause(1)
		  'btn_audio_play.Caption = App.T.Translate("presentation_settings/audio/play/@caption")
		  ''MsgBox "Paused"
		  ''delay(5)
		  'else
		  'Call Globals.SXMSAudio.SXMSWinampSetPause(0)
		  'btn_audio_play.Caption = App.T.Translate("presentation_settings/audio/pause/@caption")
		  ''MsgBox "UnPaused"
		  ''delay(5)
		  'end if
		  'end if
		  'AudioTimer.Enabled = IsAudioPlaying
		  ''--
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_audio_stop
	#tag Event
		Sub Action()
		  '++JRC
		  //++EMP, 17 Feb 2006
		  'call Globals.SXMSAudio.SXMSWinampStop()
		  'btn_audio_play.Enabled = true
		  'btn_audio_stop.Enabled = false
		  'IsAudioPlaying = false
		  'AudioTimer.Enabled = IsAudioPlaying
		  //--
		  '--
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
		Name="BGImage"
		Visible=false
		Group="Behavior"
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
