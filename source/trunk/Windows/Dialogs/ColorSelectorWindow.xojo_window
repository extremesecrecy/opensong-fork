#tag Window
Begin Window ColorSelectorWindow Implements TranslatableContainer
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   478
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Color"
   Type            =   1
   Visible         =   False
   Width           =   740
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
      Left            =   650
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
      Top             =   436
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin PushButton btn_ok
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "OK"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   574
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
      Top             =   436
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin ColorPickerPlane can_color_plane
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      FixedAxis       =   ""
      FixedValue      =   0.0
      Height          =   341
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   260
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   10
      Transparent     =   True
      Visible         =   True
      Width           =   227
   End
   Begin ColorPickerBar can_color_bar
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Axis            =   ""
      Backdrop        =   0
      BaseColor       =   &c00000000
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   341
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   492
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Position        =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   10
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   32
   End
   Begin Canvas can_color_sample
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   29
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   260
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   398
      Transparent     =   True
      Visible         =   True
      Width           =   132
   End
   Begin GroupBox grp_color_rgb
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "RGB"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   132
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   542
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   188
      Begin RadioButton rad_color_red
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Red"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_rgb"
         Italic          =   False
         Left            =   552
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   29
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_red
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_rgb"
         Italic          =   False
         Left            =   657
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   255.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   29
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_red
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_rgb"
         Left            =   707
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   29
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
      Begin RadioButton rad_color_green
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Green"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_rgb"
         Italic          =   False
         Left            =   552
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   56
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_green
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_rgb"
         Italic          =   False
         Left            =   657
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   255.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   56
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_green
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_rgb"
         Left            =   707
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   56
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
      Begin RadioButton rad_color_blue
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Blue"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_rgb"
         Italic          =   False
         Left            =   552
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   83
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_blue
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_rgb"
         Italic          =   False
         Left            =   657
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   255.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   83
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_blue
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_rgb"
         Left            =   707
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   83
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
      Begin Label lbl_color_rgbhex
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
         InitialParent   =   "grp_color_rgb"
         Italic          =   False
         Left            =   552
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Hex #"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   110
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditField edt_color_rgbhex
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
         InitialParent   =   "grp_color_rgb"
         Italic          =   False
         Left            =   657
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   110
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   63
      End
   End
   Begin GroupBox grp_color_hsv
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "HSV"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   105
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   542
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   146
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   188
      Begin RadioButton rad_color_hue
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Hue"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_hsv"
         Italic          =   False
         Left            =   552
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   165
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_hue
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0\\°"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_hsv"
         Italic          =   False
         Left            =   657
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   360.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   165
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_hue
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_hsv"
         Left            =   707
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   165
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
      Begin RadioButton rad_color_sat
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Saturation"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_hsv"
         Italic          =   False
         Left            =   552
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   192
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_sat
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0%"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_hsv"
         Italic          =   False
         Left            =   657
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   1.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   192
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_sat
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_hsv"
         Left            =   707
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   192
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
      Begin RadioButton rad_color_value
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Brightness"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_hsv"
         Italic          =   False
         Left            =   552
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   219
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_value
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0%"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_hsv"
         Italic          =   False
         Left            =   657
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   1.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   219
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_value
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_hsv"
         Left            =   707
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   219
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
   End
   Begin GroupBox grp_color_cmy
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "CMY"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   105
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   544
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   255
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   188
      Begin RadioButton rad_color_cyan
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Cyan"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_cmy"
         Italic          =   False
         Left            =   554
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   274
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_cyan
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0%"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_cmy"
         Italic          =   False
         Left            =   659
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   1.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   274
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_cyan
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_cmy"
         Left            =   709
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   274
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
      Begin RadioButton rad_color_magenta
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Magenta"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_cmy"
         Italic          =   False
         Left            =   554
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   301
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_magenta
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0%"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_cmy"
         Italic          =   False
         Left            =   659
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   1.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   301
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_magenta
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_cmy"
         Left            =   709
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   301
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
      Begin RadioButton rad_color_yellow
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Yellow"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "grp_color_cmy"
         Italic          =   False
         Left            =   554
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   328
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   103
      End
      Begin SEditFieldNumeric edt_color_yellow
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         dirty           =   False
         DisplayFormat   =   "##0%"
         Enabled         =   True
         EnforceRange    =   True
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
         InitialParent   =   "grp_color_cmy"
         Italic          =   False
         Left            =   659
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   1.0
         MaximumCharactersAllowed=   0
         Minimum         =   0.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   328
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   50
      End
      Begin UpDownArrows ud_color_yellow
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         Enabled         =   True
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "grp_color_cmy"
         Left            =   709
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   328
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
   End
   Begin Slider sld_color_alpha
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   260
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumValue    =   255
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   0
      Tooltip         =   ""
      Top             =   363
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   264
   End
   Begin Label lbl_color_alpha
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   554
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Transparency"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   363
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   103
   End
   Begin SEditFieldNumeric edt_color_alpha
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      dirty           =   False
      DisplayFormat   =   "##0"
      Enabled         =   True
      EnforceRange    =   True
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   659
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   255.0
      MaximumCharactersAllowed=   0
      Minimum         =   0.0
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      SignalRangeErrors=   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   363
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   50
   End
   Begin UpDownArrows ud_color_alpha
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      Enabled         =   True
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   709
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   363
      Transparent     =   False
      Visible         =   True
      Width           =   13
   End
   Begin Canvas can_color_sample_alpha
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   29
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   392
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   398
      Transparent     =   True
      Visible         =   True
      Width           =   132
   End
   Begin ColorPaletteArea cpa_nil_nil_color_palette
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      BaseColor       =   &c00000000
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackgroundColor=   False
      Height          =   341
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   10
      Transparent     =   True
      Visible         =   True
      Width           =   230
   End
   Begin ColorSlots can_color_slots
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   True
      Backdrop        =   0
      Buffer          =   0
      Columns         =   0
      DoubleBuffer    =   False
      Enabled         =   True
      FocusSlot       =   0
      Height          =   60
      HGutter         =   6
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   8
      LeftMargin      =   2
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Rows            =   0
      SampleHeight    =   20
      SampleWidth     =   16
      Scope           =   0
      SelectedSlot    =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   383
      TopMargin       =   2
      Transparent     =   True
      VGutter         =   6
      Visible         =   True
      Width           =   234
   End
   Begin Label lbl_color_slots
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Custom colors"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   361
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  If App.MainPreferences <> Nil And App.MainPreferences.GetValue(prefs.kColorPaletteSetting) = "last_used" Then
		    Dim paletteName As String = cpa_nil_nil_color_palette.GetActivePaletteName
		    If paletteName <> "" Then
		      App.MainPreferences.SetValue(prefs.kColorPaletteLoad, paletteName)
		    End If
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  App.T.TranslateWindow Me, "color_selector", App.TranslationFonts
		  
		  Dim CheckerBoard As Picture = BitmapForCaching(10,10)
		  Dim g As Graphics = CheckerBoard.Graphics
		  
		  g.DrawingColor = HSV(0, 0, 0.85)
		  g.FillRectangle(0, 0, 10, 10)
		  g.DrawingColor = HSV(0, 0, 0.5)
		  g.FillRectangle(0, 0, 5, 5)
		  g.FillRectangle(5, 5, 5, 5)
		  
		  CheckerBoardBrush = New PictureBrush
		  CheckerBoardBrush.Image = CheckerBoard
		  CheckerBoardBrush.Mode = PictureBrush.Modes.Tile
		  
		  UseAlpha = True
		  
		  App.CenterInControlScreen(Self)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddPalette(Name As String, Caption As String, Palette() As Variant)
		  Dim pal() As Color
		  
		  If Caption = "" Then
		    Caption = TranslatePaletteCaption("OpenSong")
		  End If
		  
		  cpa_nil_nil_color_palette.AddPaletteName(Name, Caption)
		  
		  For i As Integer = 0 To Palette.Ubound
		    If Palette(i).IsArray Then
		      pal = Palette(i)
		      cpa_nil_nil_color_palette.AddPaletteColors(pal)
		    Else
		      cpa_nil_nil_color_palette.AddPaletteCaption(Palette(i).StringValue)
		    End If
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FixLinuxLayout()
		  // This code fixes an issue on Linux where the spacing for the controls on the right get all messed up
		  // when applying the control sizes from the CSS theme
		  Dim ValueRowSize As Integer
		  Const TopC As Integer = 19
		  Const GapC As Integer = 5
		  Const BotC As Integer = 9
		  Const GapG As Integer = 5
		  Dim y As Integer
		  
		  ValueRowSize = Max(rad_color_red.Height, edt_color_red.Height, ud_color_red.Height)
		  y = grp_color_rgb.Top + TopC
		  rad_color_red.Top = y + ValueRowSize - rad_color_red.Height
		  edt_color_red.Top = y + ValueRowSize - edt_color_red.Height
		  ud_color_red.Top = y + ValueRowSize - ud_color_red.Height
		  
		  y = y + ValueRowSize + GapC
		  rad_color_green.Top = y + ValueRowSize - rad_color_green.Height
		  edt_color_green.Top = y + ValueRowSize - edt_color_green.Height
		  ud_color_green.Top = y + ValueRowSize - ud_color_green.Height
		  
		  y = y + ValueRowSize + GapC
		  rad_color_blue.Top = y + ValueRowSize - rad_color_blue.Height
		  edt_color_blue.Top = y + ValueRowSize - edt_color_blue.Height
		  ud_color_blue.Top = y + ValueRowSize - ud_color_blue.Height
		  
		  y = y + ValueRowSize + GapC
		  lbl_color_rgbhex.Top = y + ValueRowSize - lbl_color_rgbhex.Height
		  edt_color_rgbhex.Top = y + ValueRowSize - edt_color_rgbhex.Height
		  
		  y = y + ValueRowSize + BotC
		  grp_color_rgb.Height = y - grp_color_rgb.top
		  
		  y = y + GapG
		  
		  grp_color_hsv.Top = y
		  
		  y = y + TopC
		  rad_color_hue.Top = y + ValueRowSize - rad_color_hue.Height
		  edt_color_hue.Top = y + ValueRowSize - edt_color_hue.Height
		  ud_color_hue.Top = y + ValueRowSize - ud_color_hue.Height
		  
		  y = y + ValueRowSize + GapC
		  rad_color_sat.Top = y + ValueRowSize - rad_color_sat.Height
		  edt_color_sat.Top = y + ValueRowSize - edt_color_sat.Height
		  ud_color_sat.Top = y + ValueRowSize - ud_color_sat.Height
		  
		  y = y + ValueRowSize + GapC
		  rad_color_value.Top = y + ValueRowSize - rad_color_value.Height
		  edt_color_value.Top = y + ValueRowSize - edt_color_value.Height
		  ud_color_value.Top = y + ValueRowSize - ud_color_value.Height
		  
		  y = y  + ValueRowSize+ BotC
		  grp_color_hsv.Height = y - grp_color_hsv.top
		  
		  y = y + GapG
		  
		  grp_color_cmy.Top = y
		  
		  y = y + TopC
		  rad_color_cyan.Top = y + ValueRowSize - rad_color_cyan.Height
		  edt_color_cyan.Top = y + ValueRowSize - edt_color_cyan.Height
		  ud_color_cyan.Top = y + ValueRowSize - ud_color_cyan.Height
		  
		  y = y + ValueRowSize + GapC
		  rad_color_magenta.Top = y + ValueRowSize - rad_color_magenta.Height
		  edt_color_magenta.Top = y + ValueRowSize - edt_color_magenta.Height
		  ud_color_magenta.Top = y + ValueRowSize - ud_color_magenta.Height
		  
		  y = y + ValueRowSize + GapC
		  rad_color_yellow.Top = y + ValueRowSize - rad_color_yellow.Height
		  edt_color_yellow.Top = y + ValueRowSize - edt_color_yellow.Height
		  ud_color_yellow.Top = y + ValueRowSize - ud_color_yellow.Height
		  
		  y = y + ValueRowSize + BotC
		  grp_color_cmy.Height = y - grp_color_cmy.top
		  
		  y = y + GapG
		  
		  lbl_color_alpha.Top = y + ValueRowSize - lbl_color_alpha.Height
		  edt_color_alpha.Top = y + ValueRowSize - edt_color_alpha.Height
		  ud_color_alpha.Top = y + ValueRowSize - ud_color_alpha.Height
		  
		  y = y + ValueRowSize + GapG
		  
		  If y > btn_ok.Top Then
		    Height = Height + btn_ok.Top - y
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatHex(c As Color) As String
		  Return c.Red.ToHex(2) + c.Green.ToHex(2) + c.Blue.ToHex(2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContainerControl(Handle As Integer) As ContainerControl
		  // Part of the TranslatableContainer interface.
		  
		  If cpa_nil_nil_color_palette.handle = handle Then
		    Return cpa_nil_nil_color_palette
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSlotColors() As Variant()
		  Dim SlotColors() As Variant
		  
		  If can_color_slots <> Nil Then
		    Redim SlotColors(can_color_slots.Entries.Ubound)
		    For i As Integer = 0 To can_color_slots.Entries.Ubound
		      If can_color_slots.HasColor(i) Then
		        SlotColors(i) = can_color_slots.Entries(i)
		      Else
		        SlotColors(i) = Nil
		      End If
		    Next i
		  Else
		    Redim SlotColors(mSlotColors.Ubound)
		    For i As Integer = 0 To mSlotColors.Ubound
		      SlotColors(i) = mSlotColors(i)
		    Next i
		  End If
		  
		  Return SlotColors
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HasAxis(s As String, c As String) As Boolean
		  Return InStrB(s, c) > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitDialog(c As Color, Axis As String = "H", enableAlpha As Boolean = False)
		  UseAlpha = enableAlpha
		  CurrentAlpha = c.Alpha
		  mColor = RGB(c.Red, c.Green, c.Blue)
		  CurrentHue = c.Hue
		  CurrentSaturation = c.Saturation
		  CurrentBrightness = c.Value
		  
		  SelectedAxis = Axis
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SEditFieldNumericKeyHandler(Key As String) As Boolean
		  If Keyboard.ShiftKey Or Keyboard.ControlKey Or Keyboard.AltKey Or Keyboard.OSKey Then Return False
		  
		  Select Case Asc(Key)
		  Case 13, 3  // Return, Enter
		    Self.FocusNext
		    Return True
		  End Select
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectColorModal(c As Color, Axis As String, enableAlpha As Boolean = False) As Boolean
		  InitDialog(c, Axis, enableAlpha)
		  
		  Timer.CallLater(200, AddressOf FixLinuxLayout)
		  ShowModal
		  Return Returnvalue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetActivePalette(Name As String)
		  cpa_nil_nil_color_palette.SetActivePalette(Name)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetAxisValue(axis As String, value As Double)
		  If SuppressUpdates Then Return
		  
		  Select Case Asc(axis)
		  Case Asc("R")
		    mColor = RGB(Round(value), mColor.Green, mColor.Blue)
		  Case Asc("G")
		    mColor = RGB(mColor.Red, Round(value), mColor.Blue)
		  Case Asc("B")
		    mColor = RGB(mColor.Red, mColor.Green, Round(value))
		    
		  Case Asc("H")
		    mColor = HSV(value, CurrentSaturation, CurrentBrightness)
		  Case Asc("S")
		    mColor = HSV(CurrentHue, value, CurrentBrightness)
		  Case Asc("V")
		    mColor = HSV(CurrentHue, CurrentSaturation, value)
		    
		  Case Asc("C")
		    mColor = CMY(value, mColor.Magenta, mColor.Yellow)
		  Case Asc("M")
		    mColor = CMY(mColor.Cyan, value, mColor.Yellow)
		  Case Asc("Y")
		    mColor = CMY(mColor.Cyan, mColor.Magenta, value)
		    
		  End Select
		  
		  If Axis = "H" Then
		    CurrentHue = value
		  ElseIf Axis = "S" Then
		    CurrentSaturation = value
		  ElseIf Axis = "V" Then
		    CurrentBrightness = value
		  Else
		    CurrentHue = mColor.Hue
		    CurrentSaturation = mColor.Saturation
		    CurrentBrightness = mColor.Value
		  End If
		  
		  UpdateControls(axis)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColor(c As Color)
		  // updates the SelectedColor regardless the SelectedAxis
		  mColor = RGB(c.Red, c.Green, c.Blue)
		  CurrentHue = c.Hue
		  CurrentSaturation = c.Saturation
		  CurrentBrightness = c.Value
		  CurrentAlpha = c.Alpha
		  
		  UpdateControls()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSlotColors(SlotColors() As Variant)
		  Redim SlotColors(can_color_slots.Entries.Ubound)
		  For i As Integer = 0 To can_color_slots.Entries.Ubound
		    If SlotColors(i).IsNull Then
		      can_color_slots.HasColor(i) = False
		    Else
		      can_color_slots.HasColor(i) = True
		      can_color_slots.Entries(i) = SlotColors(i)
		    End If
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateContainerControl(T As Translator, handle As Integer, tag As String, fonts() As FontFace, doCaptions As Boolean, doFonts As Boolean)
		  // Part of the TranslatableContainer interface.
		  
		  Dim cc As ContainerControl = GetContainerControl(handle)
		  
		  If cc <> Nil Then
		    T.TranslateContainerControl(cc, tag, fonts, doCaptions, doFonts)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TranslatePaletteCaption(what As String, default As String = "", ParamArray args As String) As String
		  Dim caption As String
		  Dim tag As String
		  Dim txFound As Boolean
		  Dim re As RegEx
		  Dim reOpt As RegExOptions
		  Const kPalettCaption = "color_selector/color_palette/"
		  
		  reOpt = New RegExOptions
		  reOpt.CaseSensitive = true
		  reOpt.ReplaceAllMatches = true
		  
		  re = New RegEx
		  re.Options = reOpt
		  re.SearchPattern = " "
		  re.ReplacementPattern = "_"
		  tag = re.Replace(what)
		  re = New RegEx
		  re.Options = reOpt
		  re.SearchPattern = "(?<=[a-z0-9])([A-Z])"
		  re.ReplacementPattern = "_$1"
		  tag = re.Replace(tag)
		  re = New RegEx
		  re.Options = reOpt
		  re.SearchPattern = "_+"
		  re.ReplacementPattern = "_"
		  tag = re.Replace(tag)
		  tag = Lowercase(tag)
		  caption = App.T.Translate(kPalettCaption + tag + Translator.kAttributeCaption, txFound, args)
		  If Not txFound Then
		    If default.IsEmpty Then
		      caption = what
		    Else
		      caption = default
		    End If
		    Dim i As Integer
		    For i = 0 To UBound(args)
		      caption = ReplaceAll(caption, "%" + Str(i+1), args(i))
		    Next i
		    caption = Trim(caption)
		  End If
		  Return caption
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateControls(fromAxis As String = " ")
		  If SuppressUpdates Then Return
		  
		  SuppressUpdates = True
		  If fromAxis <> "R" Then edt_color_red.SetValue(mColor.Red)
		  If fromAxis <> "G" Then edt_color_green.SetValue(mColor.Green)
		  If fromAxis <> "B" Then edt_color_blue.SetValue(mColor.Blue)
		  edt_color_hue.SetValue(Round(CurrentHue * 360))
		  edt_color_sat.SetValue(Round(CurrentSaturation * 100) / 100)
		  edt_color_value.SetValue(Round(CurrentBrightness * 100) / 100)
		  If fromAxis <> "C" Then edt_color_cyan.SetValue(Round(mColor.Cyan * 100) / 100)
		  If fromAxis <> "M" Then edt_color_magenta.SetValue(Round(mColor.Magenta * 100) / 100)
		  If fromAxis <> "Y" Then edt_color_yellow.SetValue(Round(mColor.Yellow * 100) / 100)
		  edt_color_rgbhex.Text = FormatHex(mColor)
		  
		  rad_color_red.Value = mAxis = Asc("R")
		  rad_color_green.Value = mAxis = Asc("G")
		  rad_color_blue.Value = mAxis = Asc("B")
		  rad_color_hue.Value = mAxis = Asc("H")
		  rad_color_sat.Value = mAxis = Asc("S")
		  rad_color_value.Value = mAxis = Asc("V")
		  rad_color_cyan.Value = mAxis = Asc("C")
		  rad_color_magenta.Value = mAxis = Asc("M")
		  rad_color_yellow.Value = mAxis = Asc("Y")
		  
		  can_color_sample.Invalidate
		  can_color_bar.BaseColor = mColor
		  can_color_bar.Axis = SelectedAxis
		  
		  can_color_plane.FixedAxis = SelectedAxis
		  can_color_plane.SetColor(mColor, CurrentHue, CurrentSaturation, CurrentBrightness)
		  
		  If HasAxis("RGB",SelectedAxis) Then
		    can_color_bar.Value = Round(SelectedAxisValue)
		    can_color_plane.FixedValue = Round(SelectedAxisValue)
		  Else
		    can_color_bar.Value = SelectedAxisValue
		    can_color_plane.FixedValue = SelectedAxisValue
		  End If
		  
		  If UseAlpha Then
		    sld_color_alpha.Value = CurrentAlpha
		    edt_color_alpha.SetValue(CurrentAlpha)
		    can_color_sample_alpha.Invalidate
		  End If
		  
		  cpa_nil_nil_color_palette.SetColor(mColor)
		  
		  can_color_bar.Invalidate
		  can_color_plane.Invalidate
		  Refresh  // this is needed for updates during mouse drags
		  SuppressUpdates = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseAlpha() As Boolean
		  Return mUseAlpha
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseAlpha(assigns value as Boolean)
		  // implemented as a methode pair because of initialization of a property to its type's default value
		  If value <> mUseAlpha Then
		    If value And sld_color_alpha.Left < 0 Then
		      Height = Height + 39
		      can_color_plane.Height = can_color_plane.Height - 39
		      can_color_bar.Height = can_color_bar.Height - 39
		      sld_color_alpha.Left = sld_color_alpha.Left + 10000
		      sld_color_alpha.Enabled = True
		      sld_color_alpha.Visible = True
		      lbl_color_alpha.Left = lbl_color_alpha.Left + 10000
		      lbl_color_alpha.Enabled = True
		      lbl_color_alpha.Visible = True
		      edt_color_alpha.Left = lbl_color_alpha.Left + 10000
		      edt_color_alpha.Enabled = True
		      edt_color_alpha.Visible = True
		      ud_color_alpha.Left = lbl_color_alpha.Left + 10000
		      ud_color_alpha.Enabled = True
		      ud_color_alpha.Visible = True
		    ElseIf Not value And sld_color_alpha.Left > 0 Then
		      sld_color_alpha.Left = sld_color_alpha.Left - 10000
		      sld_color_alpha.Enabled = False
		      sld_color_alpha.Visible = False
		      lbl_color_alpha.Left = lbl_color_alpha.Left - 10000
		      lbl_color_alpha.Enabled = False
		      lbl_color_alpha.Visible = False
		      edt_color_alpha.Left = lbl_color_alpha.Left - 10000
		      edt_color_alpha.Enabled = False
		      edt_color_alpha.Visible = False
		      ud_color_alpha.Left = lbl_color_alpha.Left - 10000
		      ud_color_alpha.Enabled = False
		      ud_color_alpha.Visible = False
		      Height = Height - 39
		      can_color_plane.Height = can_color_plane.Height + 39
		      can_color_bar.Height = can_color_bar.Height + 39
		    End If
		  End If
		  mUseAlpha = value
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CheckerBoardBrush As PictureBrush
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentAlpha As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentBrightness As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentHue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentSaturation As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAxis As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSlotColors() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUseAlpha As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ReturnValue As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Chr(mAxis)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAxis = Asc(Left(value,1))
			  UpdateControls
			End Set
		#tag EndSetter
		SelectedAxis As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Select Case mAxis
			  Case Asc("R")
			    Return mColor.Red
			  Case Asc("G")
			    Return mColor.Green
			  Case Asc("B")
			    Return mColor.Blue
			  Case Asc("H")
			    Return CurrentHue
			  Case Asc("S")
			    Return CurrentSaturation
			  Case Asc("V")
			    Return CurrentBrightness
			  Case Asc("C")
			    Return mColor.Cyan
			  Case Asc("M")
			    Return mColor.Magenta
			  Case Asc("Y")
			    Return mColor.Yellow
			  End Select
			End Get
		#tag EndGetter
		Private SelectedAxisValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If UseAlpha And CurrentAlpha <> 0 Then
			    Return RGB(mColor.Red, mColor.Green, mColor.Blue, CurrentAlpha)
			  Else
			    Return mColor
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  CurrentAlpha = value.Alpha
			  mColor = RGB(value.Red, value.Green, value.Blue)
			  If SelectedAxis <> "H" Then CurrentHue = mColor.Hue
			  If SelectedAxis <> "S" Then CurrentSaturation = mColor.Saturation
			  If SelectedAxis <> "V" Then CurrentBrightness = mColor.Value
			  UpdateControls()
			End Set
		#tag EndSetter
		SelectedColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SuppressUpdates As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events btn_cancel
	#tag Event
		Sub Action()
		  ReturnValue = False
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_ok
	#tag Event
		Sub Action()
		  ReturnValue = True
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_color_plane
	#tag Event
		Sub Action(c As Color)
		  SelectedColor = RGB(c.Red, c.Green, c.Blue, CurrentAlpha)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_color_bar
	#tag Event
		Sub Action(Value As Double)
		  Select Case SelectedAxis
		  Case "R"
		    edt_color_red.SetValue(Value)
		  Case "G"
		    edt_color_green.SetValue(Value)
		  Case "B"
		    edt_color_blue.SetValue(Value)
		  Case "H"
		    edt_color_hue.SetValue(Round(Value * 360))
		  Case "S"
		    edt_color_sat.SetValue(Value)
		  Case "V"
		    edt_color_value.SetValue(Value)
		  Case "C"
		    edt_color_cyan.SetValue(Value)
		  Case "M"
		    edt_color_magenta.SetValue(Value)
		  Case "Y"
		    edt_color_yellow.SetValue(Value)
		  Case Else
		    Raise New InvalidParameterException("Unsupported axis " + SelectedAxis)
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_color_sample
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  g.DrawingColor = mColor
		  g.FillRectangle(0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  App.DebugWriter.Write(CurrentMethodName + " X=" + Str(x) + ", Y=" + Str(y) + ", obj=" + Introspection.GetType(obj).name + ", action=" + Str(action))
		  If obj <> Nil Then
		    If obj.RawDataAvailable("Colr") Then
		      Return False
		    End If
		  End If
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  App.DebugWriter.Write(CurrentMethodName + " obj=" + Introspection.GetType(obj).name + ", action=" + Str(action))
		  If obj.RawDataAvailable("Colr") Then
		    Dim c As Color
		    Dim DragData() As String = obj.RawData("Colr").Split("|")
		    c = Color.FromString(DragData(0))
		    SetColor(c)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  App.DebugWriter.Write(CurrentMethodName + " X=" + Str(x) + ", Y=" + Str(y))
		  
		  Dim dragColor As DragItem
		  Dim c As Color
		  Dim dragPicture As Picture
		  
		  If Me.Enabled Then
		    dragPicture = New Picture(12, 12)
		    c = mColor
		    dragPicture.Graphics.DrawingColor = c
		    dragPicture.Graphics.FillRectangle(0, 0, dragPicture.Width, dragPicture.Height)
		    dragColor = New DragItem(Me, X, Y, dragPicture.Width, dragPicture.Height, dragPicture)
		    dragColor.RawData("Colr") = c.ToString
		    dragColor.Drag
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  If Not (Keyboard.ShiftKey Or Keyboard.ControlKey Or Keyboard.AltKey Or Keyboard.OSKey) Then
		    ReturnValue = True
		    CurrentAlpha = 0
		    Self.Close
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AcceptRawDataDrop("Colr")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_red
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "R"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_red
	#tag Event
		Sub ValueChange()
		  SetAxisValue("R", Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_red
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_red.Value - 1
		  If newVal < edt_color_red.Minimum Then
		    newVal = edt_color_red.Minimum
		  End If
		  edt_color_red.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_red.Value + 1
		  If newVal > edt_color_red.Maximum Then
		    newVal = edt_color_red.Maximum
		  End If
		  edt_color_red.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_green
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "G"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_green
	#tag Event
		Sub ValueChange()
		  SetAxisValue("G", Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_green
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_green.Value - 1
		  If newVal < edt_color_green.Minimum Then
		    newVal = edt_color_green.Minimum
		  End If
		  edt_color_green.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_green.Value + 1
		  If newVal > edt_color_green.Maximum Then
		    newVal = edt_color_green.Maximum
		  End If
		  edt_color_green.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_blue
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "B"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_blue
	#tag Event
		Sub ValueChange()
		  SetAxisValue("B", Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_blue
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_blue.Value - 1
		  If newVal < edt_color_blue.Minimum Then
		    newVal = edt_color_blue.Minimum
		  End If
		  edt_color_blue.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_blue.Value + 1
		  If newVal > edt_color_blue.Maximum Then
		    newVal = edt_color_blue.Maximum
		  End If
		  edt_color_blue.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_rgbhex
	#tag Event
		Sub LostFocus()
		  Dim h As String = Me.Text
		  Dim i As Integer
		  Dim r, g, b, a As Integer
		  
		  
		  If Me.Text = FormatHex(mColor) Then Return
		  
		  h = Trim(h)
		  If h = "" Then
		    Me.Text = FormatHex(mColor)
		    Return
		  End If
		  If h.BeginsWith("#") Then
		    h = Mid(h, 2)
		  End If
		  If h.Length > 8 Then
		    Me.Text = FormatHex(mColor)
		    Return
		  End If
		  
		  // FromHex does not check if it is realy hex 0x00 gives &h2100
		  Dim hd As String = "0123456789ABCDEFabcdef"
		  Dim ch As String
		  For i = 1 To h.Length
		    ch = h.Mid(i, 1)
		    a = hd.IndexOfBytes(ch)
		    If hd.IndexOfBytes(h.Mid(i, 1)) = -1 Then
		      Me.Text = FormatHex(mColor)
		      Return
		    End If
		  Next i
		  
		  i = Integer.FromHex(h)
		  If h.Length > 6 Then
		    r = ShiftRight(i, 24)
		    g = BitAnd(ShiftRight(i, 16), &hFF)
		    b = BitAnd(ShiftRight(i, 8), &hFF)
		    a = BitAnd(i, &hFF)
		  Else
		    r = ShiftRight(i, 16)
		    g = BitAnd(ShiftRight(i, 8), &hFF)
		    b = BitAnd(i, &hFF)
		    a = CurrentAlpha
		  End If
		  
		  SetColor(RGB(r, g, b, a))
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_hue
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "H"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_hue
	#tag Event
		Sub ValueChange()
		  SetAxisValue("H", Me.Value / 360)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_hue
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_hue.Value - 1
		  If newVal < edt_color_hue.Minimum Then
		    newVal = edt_color_hue.Maximum
		  End If
		  edt_color_hue.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_hue.Value + 1
		  If newVal > edt_color_hue.Maximum Then
		    newVal = edt_color_hue.Minimum
		  End If
		  edt_color_hue.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_sat
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "S"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_sat
	#tag Event
		Sub ValueChange()
		  SetAxisValue("S", Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_sat
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_sat.Value - 0.01
		  If newVal < edt_color_sat.Minimum Then
		    newVal = edt_color_sat.Minimum
		  End If
		  edt_color_sat.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_sat.Value + 0.01
		  If newVal > edt_color_sat.Maximum Then
		    newVal = edt_color_sat.Maximum
		  End If
		  edt_color_sat.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_value
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "V"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_value
	#tag Event
		Sub ValueChange()
		  SetAxisValue("V", Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_value
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_value.Value - 0.01
		  If newVal < edt_color_value.Minimum Then
		    newVal = edt_color_value.Minimum
		  End If
		  edt_color_value.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_value.Value + 0.01
		  If newVal > edt_color_value.Maximum Then
		    newVal = edt_color_value.Maximum
		  End If
		  edt_color_value.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_cyan
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "C"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_cyan
	#tag Event
		Sub ValueChange()
		  SetAxisValue("C", Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_cyan
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_cyan.Value - 0.01
		  If newVal < edt_color_cyan.Minimum Then
		    newVal = edt_color_cyan.Minimum
		  End If
		  edt_color_cyan.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_cyan.Value + 0.01
		  If newVal > edt_color_cyan.Maximum Then
		    newVal = edt_color_cyan.Maximum
		  End If
		  edt_color_cyan.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_magenta
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "M"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_magenta
	#tag Event
		Sub ValueChange()
		  SetAxisValue("M", Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_magenta
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_magenta.Value - 0.01
		  If newVal < edt_color_magenta.Minimum Then
		    newVal = edt_color_magenta.Minimum
		  End If
		  edt_color_magenta.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_magenta.Value + 0.01
		  If newVal > edt_color_magenta.Maximum Then
		    newVal = edt_color_magenta.Maximum
		  End If
		  edt_color_magenta.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_color_yellow
	#tag Event
		Sub Action()
		  If Me.Value Then SelectedAxis = "Y"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_yellow
	#tag Event
		Sub ValueChange()
		  SetAxisValue("Y", Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_yellow
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_yellow.Value - 0.01
		  If newVal < edt_color_yellow.Minimum Then
		    newVal = edt_color_yellow.Minimum
		  End If
		  edt_color_yellow.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_yellow.Value + 0.01
		  If newVal > edt_color_yellow.Maximum Then
		    newVal = edt_color_yellow.Maximum
		  End If
		  edt_color_yellow.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sld_color_alpha
	#tag Event
		Sub ValueChanged()
		  If Me.Enabled And Not SuppressUpdates Then
		    edt_color_alpha.SetValue(Me.Value)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_color_alpha
	#tag Event
		Sub ValueChange()
		  If Me.Enabled and not SuppressUpdates Then
		    CurrentAlpha = Me.Value
		    UpdateControls
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return SEditFieldNumericKeyHandler(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ud_color_alpha
	#tag Event
		Sub Down()
		  Dim newVal As Double = edt_color_alpha.Value - 1
		  If newVal < edt_color_alpha.Minimum Then
		    newVal = edt_color_alpha.Minimum
		  End If
		  edt_color_alpha.SetValue(newVal)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim newVal As Double = edt_color_alpha.Value + 1
		  If newVal > edt_color_alpha.Maximum Then
		    newVal = edt_color_alpha.Maximum
		  End If
		  edt_color_alpha.SetValue(newVal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_color_sample_alpha
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If UseAlpha Then
		    g.Brush = CheckerBoardBrush
		    g.FillRectangle(0, 0, g.Width, g.Height)
		    g.Brush = Nil
		    // using g.Transparency does not give the same result as setting the color's Alpha
		    'g.DrawingColor = SelectedColor
		    'g.Transparency = CurrentAlpha / 255 * 100
		    'g.FillRectangle(0, 0, g.Width \ 2, g.Height)
		    'g.Transparency = 0
		    'g.DrawingColor = RGB(SelectedColor.Red, SelectedColor.Green, SelectedColor.Blue, CurrentAlpha)
		    'g.FillRectangle(g.Width \ 2, 0, g.Width - g.Width \ 2, g.Height)
		    #if TargetLinux
		      Dim c As  Color = RGB(SelectedColor.Red, SelectedColor.Green, SelectedColor.Blue, CurrentAlpha)
		      g.Brush = New LinearGradientBrush(New Point(0, 0), New Point(g.Width, 0), 0.0 : c, 1.0 : c)
		    #else 
		      g.DrawingColor = RGB(SelectedColor.Red, SelectedColor.Green, SelectedColor.Blue, CurrentAlpha)
		    #endif
		    g.FillRectangle(0, 0, g.Width, g.Height)
		  Else
		    g.DrawingColor = SelectedColor
		    g.FillRectangle(0, 0, g.Width, g.Height)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  If Not (Keyboard.ShiftKey Or Keyboard.ControlKey Or Keyboard.AltKey Or Keyboard.OSKey) Then
		    ReturnValue = True
		    Self.Close
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  App.DebugWriter.Write(CurrentMethodName + " X=" + Str(x) + ", Y=" + Str(y) + ", obj=" + Introspection.GetType(obj).name + ", action=" + Str(action))
		  If obj <> Nil Then
		    If obj.RawDataAvailable("Colr") Then Return False
		  End If
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  App.DebugWriter.Write(CurrentMethodName + " obj=" + Introspection.GetType(obj).name + ", action=" + Str(action))
		  If obj.RawDataAvailable("Colr") Then
		    Dim c As Color
		    Dim DragData() As String = obj.RawData("Colr").Split("|")
		    c = Color.FromString(DragData(0))
		    SetColor(c)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  App.DebugWriter.Write(CurrentMethodName + " X=" + Str(x) + ", Y=" + Str(y))
		  
		  Dim dragColor As DragItem
		  Dim c As Color
		  Dim dragPicture As Picture
		  
		  If Me.Enabled Then
		    dragPicture = New Picture(12, 12)
		    c = SelectedColor
		    dragPicture.Graphics.DrawingColor = c
		    dragPicture.Graphics.FillRectangle(0, 0, dragPicture.Width, dragPicture.Height)
		    dragColor = New DragItem(Me, X, Y, dragPicture.Width, dragPicture.Height, dragPicture)
		    dragColor.RawData("Colr") = c.ToString
		    dragColor.Drag
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AcceptRawDataDrop("Colr")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cpa_nil_nil_color_palette
	#tag Event
		Sub Open()
		  Me.AddPaletteByName("Standard", TranslatePaletteCaption("Standard"))
		  Me.AddPaletteByName("CGA", TranslatePaletteCaption("CGA"))
		  Me.AddPaletteByName("MatchingColors", TranslatePaletteCaption("MatchingColors", "Matching Colors"), TranslatePaletteCaption("Complement"), TranslatePaletteCaption("Triadic"), TranslatePaletteCaption("Tetradic"), TranslatePaletteCaption("Analogous"), TranslatePaletteCaption("Neutral"), TranslatePaletteCaption("Shades"), TranslatePaletteCaption("Tintes"), TranslatePaletteCaption("Tones"))
		  
		  Me.SetActivePalette("Standard")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(SelectedColor As Color, Chosen As Boolean)
		  SetColor(SelectedColor)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_color_slots
	#tag Event
		Sub Action(c As Color, doubleClick As Boolean)
		  SetColor(c)
		End Sub
	#tag EndEvent
	#tag Event , Description = 52657475726E205472756520696620796F752070726F7669646564206120636F6C6F72
		Function AskForPaletteColor(ByRef c As Color, source As Integer = 0) As Boolean
		  If source = 0 Then
		    c = SelectedColor
		    Return true
		  ElseIf source = 1 Then
		    Return cpa_nil_nil_color_palette.PaletteColor(c)
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub Close()
		  mSlotColors = GetSlotColors()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
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
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		Group="Background"
		InitialValue=""
		Type="Picture"
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
		Name="SelectedColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SuppressUpdates"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ReturnValue"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelectedAxis"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentAlpha"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
