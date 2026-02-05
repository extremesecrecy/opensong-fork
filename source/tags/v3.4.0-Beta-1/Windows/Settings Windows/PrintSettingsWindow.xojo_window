#tag Window
Begin Window PrintSettingsWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
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
   Title           =   "Print Settings"
   Visible         =   True
   Width           =   676
   Begin PushButton btn_ok
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
      Left            =   508
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   364
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton btn_cancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "&Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   588
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   364
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin TabPanel tab_main_tabs
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   342
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
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Fonts\rLayout\rMargins"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   647
      Begin Canvas can_print_fonts
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   310
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_main_tabs"
         Left            =   15
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   36
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   635
         Begin Label lbl_font_title
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   26
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
            Text            =   "Title:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   81
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   60
         End
         Begin SFontCanvas can_font_title
            AcceptFocus     =   True
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   50
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Left            =   91
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   66
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label lbl_font_author
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   26
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
            Text            =   "Author:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   136
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   60
         End
         Begin SFontCanvas can_font_author
            AcceptFocus     =   True
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   50
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Left            =   91
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   121
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label lbl_font_sections
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   260
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Sections:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   81
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   95
         End
         Begin SFontCanvas can_font_sections
            AcceptFocus     =   True
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   50
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   66
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label lbl_font_lyrics
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   260
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   12
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Lyrics:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   244
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   95
         End
         Begin SFontCanvas can_font_lyrics
            AcceptFocus     =   True
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   50
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   13
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   229
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label lbl_font_chords
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   260
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   8
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Chords:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   134
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   95
         End
         Begin SFontCanvas can_font_chords
            AcceptFocus     =   True
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   50
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   9
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   119
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label lbl_font_capo
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   260
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   10
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Capo Chords:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   189
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   95
         End
         Begin SFontCanvas can_font_capo
            AcceptFocus     =   True
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   50
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   11
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   174
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin SFontCanvas can_font_copyright
            AcceptFocus     =   True
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   50
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Left            =   91
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   174
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label lbl_font_copyright
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   26
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
            Text            =   "Copyright:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   182
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   60
         End
         Begin TextField edt_font_chords_before
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   22
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   118
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin TextField edt_font_chords_after
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   24
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   144
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin TextField edt_font_capo_after
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   28
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   199
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin TextField edt_font_capo_before
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   26
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   173
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin TextField edt_font_lyrics_after
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   32
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   255
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin TextField edt_font_lyrics_before
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   30
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   229
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin TextField edt_font_sections_after
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   20
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   92
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin TextField edt_font_sections_before
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   18
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   66
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin Label lbl_font_spacing
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   16
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Spacing:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   42
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   112
         End
         Begin Label lbl_font_sections_before
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   17
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "before:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   69
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_chords_before
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   21
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "before:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   121
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_capo_before
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   25
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "before:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   176
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_lyrics_before
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   29
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "before:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   232
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_sections_after
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   19
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "after:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   95
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_chords_after
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   23
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "after:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   147
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_capo_after
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   27
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "after:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   202
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_lyrics_after
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   31
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "after:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   258
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_lyrics2
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   33
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   260
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   14
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Lyrics\r\n2nd Language:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   300
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   95
         End
         Begin SFontCanvas can_font_lyrics2
            AcceptFocus     =   True
            AcceptMouseDown =   True
            AcceptTabs      =   False
            AdvancedOptions =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   50
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   15
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   285
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin Label lbl_font_lyrics2_before
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   33
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "before:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   288
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin Label lbl_font_lyrics2_after
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   527
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   35
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "after:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   314
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin TextField edt_font_lyrics2_before
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   34
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   285
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
         Begin TextField edt_font_lyrics2_after
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "can_print_fonts"
            Italic          =   False
            Left            =   604
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   36
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   311
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   35
         End
      End
      Begin Canvas can_print_layout
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   310
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_main_tabs"
         Left            =   15
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   36
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   635
         Begin Label lbl_layout_heading_border_thickness
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
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
            Text            =   "Heading Border Thickness:"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   49
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   300
         End
         Begin TextField edt_layout_heading_border_thickness
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
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LimitText       =   4
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   71
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   50
         End
         Begin CheckBox chk_layout_title_in_caps
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Title in CAPS"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            State           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   100
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   300
         End
         Begin CheckBox chk_layout_highlight_chorus
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Highlight choruses"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   123
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   209
         End
         Begin CheckBox chk_layout_header_adornment
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Adorn section titles drawing boxes"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   145
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   300
         End
         Begin CheckBox chk_layout_presentation
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Print presentation order"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   6
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   168
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   300
         End
         Begin CheckBox chk_layout_chords
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Print chords"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   7
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   191
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   300
         End
         Begin CheckBox chk_layout_capo
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Print capo chords"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   8
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   214
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   300
         End
         Begin CheckBox chk_layout_language2
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Print 2nd language lyrics"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   10
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Aral"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   255
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   300
         End
         Begin CheckBox chk_layout_capo_hide_regular_chords
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Hide regular chords"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   46
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   9
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   232
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   284
         End
         Begin CheckBox chk_layout_language2_hide_primary
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Hide primary language lyrics"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   46
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   11
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   273
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   284
         End
         Begin CheckBox chk_layout_hide_sections
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Hide sections not in presentation order"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_layout"
            Italic          =   False
            Left            =   30
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   12
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   296
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   300
         End
      End
      Begin GroupBox grp_page_units
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Units"
         Enabled         =   True
         Height          =   78
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_main_tabs"
         Italic          =   False
         Left            =   38
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   46
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
         Begin RadioButton rad_page_inches
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Inches"
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_page_units"
            Italic          =   False
            Left            =   54
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   12.0
            TextUnit        =   0
            Top             =   70
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   118
         End
         Begin RadioButton rad_page_cm
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "cm"
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_page_units"
            Italic          =   False
            Left            =   54
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   12.0
            TextUnit        =   0
            Top             =   94
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   118
         End
      End
      Begin Canvas can_print_margins
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   310
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tab_main_tabs"
         Left            =   15
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   36
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   635
         Begin Label lbl_page_bottom
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   280
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Bottom:"
            TextAlign       =   1
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   240
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   105
         End
         Begin Label lbl_page_right
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   395
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
            Text            =   "Right:"
            TextAlign       =   1
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   135
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   95
         End
         Begin Label lbl_page_top
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   280
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Top:"
            TextAlign       =   1
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   45
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   105
         End
         Begin Label lbl_page_left
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   175
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Left:"
            TextAlign       =   1
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   135
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   95
         End
         Begin SEditFieldNumeric edt_page_right
            AcceptTabs      =   False
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   True
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            DataField       =   ""
            DataSource      =   ""
            dirty           =   False
            DisplayFormat   =   ""
            Enabled         =   True
            EnforceRange    =   False
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   420
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Maximum         =   4310000.0
            Minimum         =   4310000.0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollbarVertical=   True
            SignalRangeErrors=   False
            Styled          =   False
            TabIndex        =   3
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   152
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            UseFocusRing    =   True
            Visible         =   True
            Width           =   45
         End
         Begin SEditFieldNumeric edt_page_bottom
            AcceptTabs      =   False
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   True
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            DataField       =   ""
            DataSource      =   ""
            dirty           =   False
            DisplayFormat   =   ""
            Enabled         =   True
            EnforceRange    =   False
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   310
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Maximum         =   4310000.0
            Minimum         =   4310000.0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollbarVertical=   True
            SignalRangeErrors=   False
            Styled          =   False
            TabIndex        =   7
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   257
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            UseFocusRing    =   True
            Visible         =   True
            Width           =   45
         End
         Begin Rectangle nil_page
            AutoDeactivate  =   True
            BorderWidth     =   1.0
            BottomRightColor=   &c00000000
            Enabled         =   True
            FillColor       =   &cFFFFFF00
            Height          =   141
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Left            =   275
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   3
            TabStop         =   "True"
            Top             =   87
            TopLeftColor    =   &c00000000
            Transparent     =   False
            Visible         =   True
            Width           =   115
            Begin Label lbl_page_width
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   22
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "nil_page"
               Italic          =   False
               Left            =   280
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   False
               LockTop         =   False
               Multiline       =   False
               Scope           =   0
               Selectable      =   False
               TabIndex        =   0
               TabPanelIndex   =   3
               TabStop         =   True
               Text            =   "Width:"
               TextAlign       =   1
               TextColor       =   &c00000000
               TextFont        =   "Arial"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   120
               Transparent     =   False
               Underline       =   False
               Visible         =   True
               Width           =   105
            End
            Begin SEditFieldNumeric edt_page_width
               AcceptTabs      =   False
               Alignment       =   0
               AutoDeactivate  =   True
               AutomaticallyCheckSpelling=   True
               BackColor       =   &cFFFFFF00
               Bold            =   False
               Border          =   True
               DataField       =   ""
               DataSource      =   ""
               dirty           =   False
               DisplayFormat   =   ""
               Enabled         =   True
               EnforceRange    =   False
               Format          =   ""
               Height          =   22
               HelpTag         =   ""
               HideSelection   =   True
               Index           =   -2147483648
               InitialParent   =   "nil_page"
               Italic          =   False
               Left            =   310
               LimitText       =   0
               LineHeight      =   0.0
               LineSpacing     =   1.0
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   False
               LockTop         =   False
               Mask            =   ""
               Maximum         =   4310000.0
               Minimum         =   4310000.0
               Multiline       =   False
               ReadOnly        =   False
               Scope           =   0
               ScrollbarHorizontal=   False
               ScrollbarVertical=   True
               SignalRangeErrors=   False
               Styled          =   False
               TabIndex        =   1
               TabPanelIndex   =   3
               TabStop         =   True
               Text            =   ""
               TextColor       =   &c00000000
               TextFont        =   "Arial"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   137
               Transparent     =   False
               Underline       =   False
               UnicodeMode     =   0
               UseFocusRing    =   True
               Visible         =   True
               Width           =   45
            End
            Begin Label lbl_page_height
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   22
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "nil_page"
               Italic          =   False
               Left            =   280
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
               Text            =   "Height:"
               TextAlign       =   1
               TextColor       =   &c00000000
               TextFont        =   "Arial"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   165
               Transparent     =   False
               Underline       =   False
               Visible         =   True
               Width           =   105
            End
            Begin SEditFieldNumeric edt_page_height
               AcceptTabs      =   False
               Alignment       =   0
               AutoDeactivate  =   True
               AutomaticallyCheckSpelling=   True
               BackColor       =   &cFFFFFF00
               Bold            =   False
               Border          =   True
               DataField       =   ""
               DataSource      =   ""
               dirty           =   False
               DisplayFormat   =   ""
               Enabled         =   True
               EnforceRange    =   False
               Format          =   ""
               Height          =   22
               HelpTag         =   ""
               HideSelection   =   True
               Index           =   -2147483648
               InitialParent   =   "nil_page"
               Italic          =   False
               Left            =   310
               LimitText       =   0
               LineHeight      =   0.0
               LineSpacing     =   1.0
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   False
               LockTop         =   False
               Mask            =   ""
               Maximum         =   4310000.0
               Minimum         =   4310000.0
               Multiline       =   False
               ReadOnly        =   False
               Scope           =   0
               ScrollbarHorizontal=   False
               ScrollbarVertical=   True
               SignalRangeErrors=   False
               Styled          =   False
               TabIndex        =   3
               TabPanelIndex   =   3
               TabStop         =   True
               Text            =   ""
               TextColor       =   &c00000000
               TextFont        =   "Arial"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   182
               Transparent     =   False
               Underline       =   False
               UnicodeMode     =   0
               UseFocusRing    =   True
               Visible         =   True
               Width           =   45
            End
         End
         Begin SEditFieldNumeric edt_page_left
            AcceptTabs      =   False
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   True
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            DataField       =   ""
            DataSource      =   ""
            dirty           =   False
            DisplayFormat   =   ""
            Enabled         =   True
            EnforceRange    =   False
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   200
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Maximum         =   4310000.0
            Minimum         =   4310000.0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollbarVertical=   True
            SignalRangeErrors=   False
            Styled          =   False
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   152
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            UseFocusRing    =   True
            Visible         =   True
            Width           =   45
         End
         Begin SEditFieldNumeric edt_page_top
            AcceptTabs      =   False
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   True
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            DataField       =   ""
            DataSource      =   ""
            dirty           =   False
            DisplayFormat   =   ""
            Enabled         =   True
            EnforceRange    =   False
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   310
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Maximum         =   431.0
            Minimum         =   4310000.0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollbarVertical=   True
            SignalRangeErrors=   False
            Styled          =   False
            TabIndex        =   5
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "Arial"
            TextSize        =   10.0
            TextUnit        =   0
            Top             =   62
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            UseFocusRing    =   True
            Visible         =   True
            Width           =   45
         End
         Begin PushButton btn_page_page_setup
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   0
            Cancel          =   False
            Caption         =   "Page Setup..."
            Default         =   False
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "can_print_margins"
            Italic          =   False
            Left            =   540
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   9
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   11.0
            TextUnit        =   0
            Top             =   314
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   100
         End
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Nil)
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim PS As XmlElement
		  
		  SetupChanged = False
		  
		  If PrintSettings = Nil Then
		    PrintSettings = New XmlDocument
		    PrintSettings.AppendChild(PrintSettings.CreateElement("print_settings"))
		  End If
		  PS = PrintSettings.DocumentElement
		  If PageSetup = Nil Then
		    PageSetup = App.GetPrinterSetup(False, Nil)
		  End If
		  
		  ValuesInPoints = SmartML.GetValueB(PS, "page/@points", False)
		  
		  edt_page_top.DisplayFormat = "-#,###.##"
		  edt_page_bottom.DisplayFormat = "-#,###.##"
		  edt_page_left.DisplayFormat = "-#,###.##"
		  edt_page_right.DisplayFormat = "-#,###.##"
		  edt_page_height.DisplayFormat = "-#,###.##"
		  edt_page_width.DisplayFormat = "-#,###.##"
		  
		  rad_page_inches.Value = SmartML.GetValueB(PS, "page/@inches", True, True)
		  rad_page_cm.Value = Not rad_page_inches.Value
		  SetupMarginMinimums(PageSetup, rad_page_inches.Value)
		  
		  If ValuesInPoints Then
		    If rad_page_inches.Value Then
		      edt_page_top.SetValue  Max(PointsToInches(SmartML.GetValueN(PS, "page/@top")), edt_page_top.Minimum)
		      edt_page_bottom.SetValue  Max(PointsToInches(SmartML.GetValueN(PS, "page/@bottom")), edt_page_bottom.Minimum)
		      edt_page_left.SetValue  Max(PointsToInches(SmartML.GetValueN(PS, "page/@left")), edt_page_left.Minimum)
		      edt_page_right.SetValue  Max(PointsToInches(SmartML.GetValueN(PS, "page/@right")), edt_page_right.Minimum)
		      
		      If PageSetup <> Nil Then
		        edt_page_width.SetValue PageSetup.PageWidth / PageSetup.HorizontalResolution
		        edt_page_height.SetValue PageSetup.PageHeight / PageSetup.VerticalResolution
		      Else
		        edt_page_width.SetValue PointsToInches(SmartML.GetValueN(PS, "page/@width"))
		        edt_page_height.SetValue PointsToInches(SmartML.GetValueN(PS, "page/@height"))
		      End If
		      
		    Else
		      edt_page_top.SetValue  Max(PointsToCM(SmartML.GetValueN(PS, "page/@top")), edt_page_top.Minimum)
		      edt_page_bottom.SetValue  Max(PointsToCM(SmartML.GetValueN(PS, "page/@bottom")), edt_page_bottom.Minimum)
		      edt_page_left.SetValue  Max(PointsToCM(SmartML.GetValueN(PS, "page/@left")), edt_page_left.Minimum)
		      edt_page_right.SetValue  Max(PointsToCM(SmartML.GetValueN(PS, "page/@right")), edt_page_right.Minimum)
		      
		      If PageSetup <> Nil Then
		        edt_page_width.SetValue PointsToCM(InchesToPoints(PageSetup.PageWidth / PageSetup.HorizontalResolution))
		        edt_page_height.SetValue PointsToCM(InchesToPoints(PageSetup.PageHeight / PageSetup.VerticalResolution))
		      Else
		        edt_page_width.SetValue PointsToCM(SmartML.GetValueN(PS, "page/@width"))
		        edt_page_height.SetValue PointsToCM(SmartML.GetValueN(PS, "page/@height"))
		      End If
		    End If
		  Else
		    edt_page_top.SetValue  SmartML.GetValueN(PS, "page/@top")
		    edt_page_bottom.SetValue  SmartML.GetValueN(PS, "page/@bottom")
		    edt_page_left.SetValue  SmartML.GetValueN(PS, "page/@left")
		    edt_page_right.SetValue  SmartML.GetValueN(PS, "page/@right")
		    If PageSetup <> Nil Then
		      edt_page_width.SetValue PageSetup.PageWidth / PageSetup.HorizontalResolution
		      edt_page_height.SetValue PageSetup.PageHeight / PageSetup.VerticalResolution
		    Else
		      edt_page_width.SetValue SmartML.GetValueN(PS, "page/@width")
		      edt_page_height.SetValue SmartML.GetValueN(PS, "page/@height")
		    End If
		    rad_page_inches.Value = True
		  End If
		  edt_page_top.EnforceRange = True
		  edt_page_left.EnforceRange = True
		  edt_page_right.EnforceRange = True
		  edt_page_bottom.EnforceRange = True
		  Initializing = False
		  
		  // As long as it is not really possible to populate the PageSetupDialog with margins provided here
		  // we use that dialog to set up margins
		  edt_page_top.ReadOnly = True
		  edt_page_left.ReadOnly = True
		  edt_page_right.ReadOnly = True
		  edt_page_bottom.ReadOnly = True
		  edt_page_top.TabStop = False
		  edt_page_left.TabStop = False
		  edt_page_right.TabStop = False
		  edt_page_bottom.TabStop = False
		  
		  // Mac and Windows use PrinterSetup for page size.
		  #If TargetMacOS Or TargetWin32
		    edt_page_width.ReadOnly = True
		    edt_page_height.ReadOnly = True
		    edt_page_width.TabStop = False
		    edt_page_height.TabStop = False
		  #Else
		    edt_page_width.ReadOnly = False
		    edt_page_height.ReadOnly = False
		  #Endif
		  
		  can_font_title.SetFont SmartML.GetValueF(PS, "title")
		  can_font_author.SetFont SmartML.GetValueF(PS, "author")
		  can_font_sections.SetFont SmartML.GetValueF(PS, "heading")
		  can_font_lyrics.SetFont SmartML.GetValueF(PS, "lyrics")
		  can_font_lyrics2.SetFont SmartML.GetValueF(PS, "lyrics_language2")
		  can_font_chords.SetFont SmartML.GetValueF(PS, "chords")
		  can_font_capo.SetFont SmartML.GetValueF(PS, "capo_chords")
		  can_font_copyright.SetFont SmartML.GetValueF(PS, "copyright")
		  
		  chk_layout_title_in_caps.Value = SmartML.GetValueB(PS, "style/@caps_song_title")
		  edt_layout_heading_border_thickness.Text = SmartML.GetValue(PS, "style/@border_thickness")
		  chk_layout_highlight_chorus.Value = SmartML.GetValueB(PS, "style/@highlight_chorus", False, True)
		  chk_layout_header_adornment.Value = SmartML.GetValueB(PS, "style/@header_adornment", True, True)
		  chk_layout_presentation.Value = SmartML.GetValueB(PS, "leadsheet/@presentation", True, False)
		  chk_layout_chords.Value = SmartML.GetValueB(PS, "layout/chords/@print", True, True)
		  chk_layout_capo.Value = SmartML.GetValueB(PS, "layout/capo/@print", True, True)
		  chk_layout_capo_hide_regular_chords.Value = SmartML.GetValueB(PS, "layout/capo/@hideregularchords", True, False)
		  chk_layout_language2.Value = SmartML.GetValueB(PS, "layout/lyrics_language2/@print", True, True)
		  chk_layout_language2_hide_primary.Value = SmartML.GetValueB(PS, "layout/lyrics_language2/@hideprimary", True, False)
		  chk_layout_hide_sections.Value = SmartML.GetValueB(PS, "leadsheet/@hide_unused_sections", True, False)
		  
		  chk_layout_capo.Enabled = chk_layout_chords.Value
		  chk_layout_capo_hide_regular_chords.Enabled = chk_layout_capo.Enabled And chk_layout_capo.Value
		  chk_layout_language2_hide_primary.Enabled = chk_layout_language2.Value
		  
		  edt_font_lyrics_before.Text = CStr(SmartML.GetValueN(PS, "layout/lyrics/@space_before"))
		  edt_font_lyrics_after.Text = CStr(SmartML.GetValueN(PS, "layout/lyrics/@space_after"))
		  edt_font_lyrics2_before.Text = CStr(SmartML.GetValueN(PS, "layout/lyrics_language2/@space_before"))
		  edt_font_lyrics2_after.Text = CStr(SmartML.GetValueN(PS, "layout/lyrics_language2/@space_after"))
		  edt_font_chords_before.Text = CStr(SmartML.GetValueN(PS, "layout/chords/@space_before"))
		  edt_font_chords_after.Text = CStr(SmartML.GetValueN(PS, "layout/chords/@space_after"))
		  edt_font_capo_before.Text = CStr(SmartML.GetValueN(PS, "layout/capo/@space_before"))
		  edt_font_capo_after.Text = CStr(SmartML.GetValueN(PS, "layout/capo/@space_after"))
		  edt_font_sections_before.Text = CStr(SmartML.GetValueN(PS, "layout/sections/@space_before"))
		  edt_font_sections_after.Text = CStr(SmartML.GetValueN(PS, "layout/sections/@space_after"))
		  
		  App.T.TranslateWindow Me, "print_settings", App.TranslationFonts
		  App.CenterInControlScreen Me
		  Timer.CallLater(100, AddressOf FixLinuxLayout)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  FixLinuxLayout()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(xPrintSettings As XmlDocument = Nil, PgSetup As PrinterSetup = Nil)
		  Initializing = True // This needs to happen before the Open event EMP 06 Feb 06
		  If xPrintSettings <> Nil Then
		    PrintSettings = xPrintSettings
		  Else
		    PrintSettings = App.MyPrintSettings
		  End If
		  If PgSetup <> Nil Then
		    PageSetup = PgSetup
		    SetPageMetrics
		    GlobalPageSetup = False
		  Else
		    PageSetup = New PrinterSetup
		    If App.MyPrinterSetup = Nil Then
		      PageSetup.MaxHorizontalResolution = -1
		      PageSetup.MaxVerticalResolution = -1
		    Else
		      PageSetup.SetupString = App.MyPrinterSetup.SetupString
		    End If
		    GlobalPageSetup = True
		  End If
		  // call the Window constructor, or Open events will not fire
		  Super.Window()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FixLinuxLayout()
		  // This code fixes an issue on Linux where the OK & Cancel buttons end up underneath the tab panel
		  #If TargetLinux
		    Dim tabTop As Integer = tab_main_tabs.Top
		    Dim tabHeight As Integer = tab_main_tabs.Height
		    
		    If tabTop + tabHeight > btn_ok.top Then
		      tab_main_tabs.LockBottom = False
		      Self.Height = tabTop + tabHeight + btn_ok.Height + 40
		      tab_main_tabs.LockBottom = True
		    End If
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPageSetup() As PrinterSetup
		  Return PageSetup
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetPageMetrics()
		  If PageSetup = Nil Then Return
		  
		  edt_page_top.EnforceRange = False
		  edt_page_left.EnforceRange = False
		  edt_page_right.EnforceRange = False
		  edt_page_bottom.EnforceRange = False
		  
		  If rad_page_inches.Value Then
		    edt_page_top.SetValue(-PageSetup.PageTop / PageSetup.VerticalResolution)
		    edt_page_left.SetValue(-PageSetup.PageLeft / PageSetup.HorizontalResolution)
		    edt_page_right.SetValue((PageSetup.PageLeft + PageSetup.PageWidth - PageSetup.Width) / PageSetup.HorizontalResolution)
		    edt_page_bottom.SetValue((PageSetup.PageTop + PageSetup.PageHeight - PageSetup.Height) / PageSetup.VerticalResolution)
		    edt_page_height.SetValue(PageSetup.PageHeight / PageSetup.VerticalResolution)
		    edt_page_width.SetValue(PageSetup.PageWidth / PageSetup.HorizontalResolution)
		  Else
		    edt_page_top.SetValue(-PageSetup.PageTop / PageSetup.VerticalResolution * 2.54)
		    edt_page_left.SetValue(-PageSetup.PageLeft / PageSetup.HorizontalResolution * 2.54)
		    edt_page_right.SetValue((PageSetup.PageLeft + PageSetup.PageWidth - PageSetup.Width) / PageSetup.HorizontalResolution * 2.54)
		    edt_page_bottom.SetValue((PageSetup.PageTop + PageSetup.PageHeight - PageSetup.Height) / PageSetup.VerticalResolution * 2.54)
		    edt_page_height.SetValue(PageSetup.PageHeight / PageSetup.VerticalResolution * 2.54)
		    edt_page_width.SetValue(PageSetup.PageWidth / PageSetup.HorizontalResolution * 2.54)
		  End If
		  
		  edt_page_top.EnforceRange = edt_page_top.Enabled
		  edt_page_left.EnforceRange = edt_page_left.Enabled
		  edt_page_right.EnforceRange = edt_page_right.Enabled
		  edt_page_bottom.EnforceRange = edt_page_bottom.Enabled
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetupMarginMinimums(Setup As PrinterSetup, UseInches As Boolean)
		  If Setup <> Nil Then
		    // would need to find non-printable margins of printer represented in Setup
		    // However, there is no Xojo-way of doing this.
		    // I therefore assume that the printer represented by Setup is the default printer,
		    // and also that non-printable margins are preset in a newly created setup on all platforms
		    // The rounding error is rather large, as the setup initializes to 72 DPI and margins are integers
		    // furthermore, with my test printer, right and bottom margins are ignored
		    Dim ps As New PrinterSetup
		    Dim convFactH, convFactV As Double
		    Dim top, bottom, left, right, height, width As Double
		    
		    If UseInches Then
		      convFactH = 1 / ps.HorizontalResolution
		      convFactV = 1 / ps.VerticalResolution
		    Else
		      // cm
		      convFactH = 2.54 / ps.HorizontalResolution
		      convFactV = 2.54 / ps.VerticalResolution
		    End If
		    
		    ps.Landscape = Setup.Landscape
		    top = -ps.PageTop * convFactV
		    height = ps.Height * convFactV
		    bottom = (ps.PageHeight + ps.PageTop - ps.Height) * convFactV
		    left = -ps.PageLeft * convFactH
		    width = ps.Width * convFactH
		    right = (ps.PageWidth + ps.PageLeft - ps.Width) * convFactH
		    
		    edt_page_top.Minimum = top
		    edt_page_bottom.Minimum = bottom
		    edt_page_left.Minimum = left
		    edt_page_right.Minimum = right
		    
		    edt_page_top.Maximum = top + height
		    edt_page_bottom.Maximum = bottom + height
		    edt_page_left.Maximum = left + width
		    edt_page_right.Maximum = right + width
		  Else // Setup = Nil
		    edt_page_top.Minimum = 0
		    edt_page_bottom.Minimum = 0
		    edt_page_left.Minimum = 0
		    edt_page_right.Minimum = 0
		    
		    edt_page_top.Maximum = 1.0e100
		    edt_page_left.Maximum = 1.0e100
		    edt_page_bottom.Maximum = 1.0e100
		    edt_page_right.Maximum = 1.0e100
		  End If
		  
		  edt_page_top.EnforceRange = True
		  edt_page_right.EnforceRange = True
		  edt_page_bottom.EnforceRange = True
		  edt_page_left.EnforceRange = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ToCM(e As SEditFieldNumeric)
		  e.SetValue PointsToCM(InchesToPoints(e.Value))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ToInches(e As SEditFieldNumeric)
		  e.SetValue PointsToInches(CMtoPoints(e.Value))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function winKeyDown(Key As String, Ctrl As RectControl) As Boolean
		  If Ctrl Isa TextEdit Then
		    If Key = &u0A Or Key = &u0D Then
		      // consume it in order to not trigger the default Ok button, but advance to the next control
		      Focus = Ctrl
		      FocusNext
		      Return True
		    End If
		  End If
		  
		  If Keyboard.ControlKey And Not Keyboard.ShiftKey And Not Keyboard.AltKey And Not Keyboard.OSKey Then
		    Select Case Asc(Key)
		    Case ASC_KEY_PGDN
		      If tab_main_tabs.Value < tab_main_tabs.PanelCount - 1 Then
		        tab_main_tabs.Value = tab_main_tabs.Value + 1
		      End If
		      Return True
		    Case ASC_KEY_PGUP
		      If tab_main_tabs.Value > 0 Then
		        tab_main_tabs.Value = tab_main_tabs.Value - 1
		      End If
		      Return True
		    End Select
		  End If
		  
		  Return False
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected GlobalPageSetup As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Initializing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PageSetup As PrinterSetup
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrintSettings As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		SetupChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			This flag indicates if the margin values in the PrintSettings XML are in points.
			
			This allows for a smooth transition from storing in inches or cm to storing in
			points, and therefore being somewhat more precise and in line with the rest
			of the page calculations since the base unit of measure for the Graphics object
			is a point.
			
			See documentation in the OpenSongUtils module for the conversion factors used.
		#tag EndNote
		Protected ValuesInPoints As Boolean
	#tag EndProperty


	#tag Constant, Name = ASC_KEY_PGDN, Type = Double, Dynamic = False, Default = \"12", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ASC_KEY_PGUP, Type = Double, Dynamic = False, Default = \"11", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events btn_ok
	#tag Event
		Sub Action()
		  Dim PS As XmlElement
		  
		  PS = PrintSettings.DocumentElement
		  
		  SmartML.SetValueF(PS, "title", can_font_title.GetFont)
		  SmartML.SetValueF(PS, "author", can_font_author.GetFont)
		  SmartML.SetValueF(PS, "heading", can_font_sections.GetFont)
		  SmartML.SetValueF(PS, "lyrics", can_font_lyrics.GetFont)
		  SmartML.SetValueF(PS, "lyrics_language2", can_font_lyrics2.GetFont)
		  SmartML.SetValueF(PS, "chords", can_font_chords.GetFont)
		  SmartML.SetValueF(PS, "capo_chords", can_font_capo.GetFont)
		  SmartML.SetValueF(PS, "copyright", can_font_copyright.GetFont)
		  
		  SmartML.SetValueB(PS, "page/@inches", rad_page_inches.Value)
		  SmartML.SetValueB(PS, "page/@points", True) // Flags unit values in the settings as being in points rather than in/cm
		  
		  If rad_page_inches.Value Then
		    
		    SmartML.SetValueN(PS, "page/@top", InchesToPoints(edt_page_top.Value))
		    SmartML.SetValueN(PS, "page/@bottom", InchesToPoints(edt_page_bottom.Value))
		    SmartML.SetValueN(PS, "page/@left", InchesToPoints(edt_page_left.Value))
		    SmartML.SetValueN(PS, "page/@right", InchesToPoints(edt_page_right.Value))
		    
		    SmartML.SetValueN(PS, "page/@width", InchesToPoints(edt_page_width.Value))
		    SmartML.SetValueN(PS, "page/@height", InchesToPoints(edt_page_height.Value))
		    
		  Else
		    
		    SmartML.SetValueN(PS, "page/@top", CMtoPoints(edt_page_top.Value))
		    SmartML.SetValueN(PS, "page/@bottom", CMtoPoints(edt_page_bottom.Value))
		    SmartML.SetValueN(PS, "page/@left", CMtoPoints(edt_page_left.Value))
		    SmartML.SetValueN(PS, "page/@right", CMtoPoints(edt_page_right.Value))
		    
		    SmartML.SetValueN(PS, "page/@width", CMtoPoints(edt_page_width.Value))
		    SmartML.SetValueN(PS, "page/@height", CMtoPoints(edt_page_height.Value))
		    
		  End If
		  
		  SmartML.SetValueB(PS, "style/@caps_song_title", chk_layout_title_in_caps.Value)
		  SmartML.SetValue(PS, "style/@border_thickness", edt_layout_heading_border_thickness.Text)
		  SmartML.SetValueB(PS, "style/@highlight_chorus", chk_layout_highlight_chorus.Value)
		  SmartML.SetValueB(PS, "style/@header_adornment", chk_layout_header_adornment.Value)
		  SmartML.SetValueB(PS, "leadsheet/@presentation", chk_layout_presentation.Value)
		  SmartML.SetValueB(PS, "layout/chords/@print", chk_layout_chords.Value)
		  SmartML.SetValueB(PS, "layout/capo/@print", chk_layout_capo.Value)
		  SmartML.SetValueB(PS, "layout/capo/@hideregularchords", chk_layout_capo_hide_regular_chords.Value)
		  SmartML.SetValueB(PS, "layout/lyrics_language2/@print", chk_layout_language2.Value)
		  SmartML.SetValueB(PS, "layout/lyrics_language2/@hideprimary", chk_layout_language2_hide_primary.Value)
		  SmartML.SetValueB(PS, "leadsheet/@hide_unused_sections", chk_layout_hide_sections.Value)
		  
		  SmartML.SetValueN(PS, "layout/lyrics/@space_before", CDbl(edt_font_lyrics_before.Text))
		  SmartML.SetValueN(PS, "layout/lyrics/@space_after", CDbl(edt_font_lyrics_after.Text))
		  SmartML.SetValueN(PS, "layout/lyrics_language2/@space_before", CDbl(edt_font_lyrics2_before.Text))
		  SmartML.SetValueN(PS, "layout/lyrics_language2/@space_after", CDbl(edt_font_lyrics2_after.Text))
		  SmartML.SetValueN(PS, "layout/chords/@space_before", CDbl(edt_font_chords_before.Text))
		  SmartML.SetValueN(PS, "layout/chords/@space_after", CDbl(edt_font_chords_after.Text))
		  SmartML.SetValueN(PS, "layout/capo/@space_before", CDbl(edt_font_capo_before.Text))
		  SmartML.SetValueN(PS, "layout/capo/@space_after", CDbl(edt_font_capo_after.Text))
		  SmartML.SetValueN(PS, "layout/sections/@space_before", CDbl(edt_font_sections_before.Text))
		  SmartML.SetValueN(PS, "layout/sections/@space_after", CDbl(edt_font_sections_after.Text))
		  
		  //++
		  // Bug 1462055: Save settings on dialog exit
		  //
		  If PrintSettings Is App.MyPrintSettings Then
		    If App.CheckDocumentFolders(App.SETTINGS_FOLDER) <> App.NO_FOLDER Then
		      If Not SmartML.XDocToFile(App.MyPrintSettings, App.DocsFolder.Child(App.STR_SETTINGS).Child("PrintSettings")) Then SmartML.DisplayError
		    Else
		      If App.DocsFolder <> Nil Then
		        MsgBox App.T.Translate("errors/create_settings_folder", App.DocsFolder.Child(App.STR_SETTINGS).NativePath)
		      Else
		        MsgBox App.T.Translate("errors/no_docs_folder", "")
		      End If
		    End If
		  End If
		  //--
		  
		  SetupChanged = True
		  If GlobalPageSetup Then
		    App.MyPrinterSetup.SetupString = PageSetup.SetupString
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
#tag Events tab_main_tabs
	#tag Event
		Sub Change()
		  Me.SetFocus
		  FocusNext
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_chords_before
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_chords_after
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_capo_after
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_capo_before
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_lyrics_after
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_lyrics_before
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_sections_after
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_sections_before
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_lyrics2_before
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_lyrics2_after
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_layout_heading_border_thickness
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return winKeyDown(Key, Me)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chk_layout_chords
	#tag Event
		Sub Action()
		  chk_layout_capo.Enabled = Me.Value
		  chk_layout_capo_hide_regular_chords.Enabled = chk_layout_capo.Enabled And chk_layout_capo.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_layout_capo
	#tag Event
		Sub Action()
		  chk_layout_capo_hide_regular_chords.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_layout_language2
	#tag Event
		Sub Action()
		  chk_layout_language2_hide_primary.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_page_inches
	#tag Event
		Sub Action()
		  //
		  // Switch to inches.  Use 2.54cm to the inch as the conversion factor
		  //
		  // Ed Palmer, 6 Feb 2006
		  //
		  If Initializing Then Return
		  ToInches(edt_page_top)
		  ToInches(edt_page_left)
		  ToInches(edt_page_right)
		  ToInches(edt_page_bottom)
		  ToInches(edt_page_height)
		  ToInches(edt_page_width)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_page_cm
	#tag Event
		Sub Action()
		  //
		  // Switch displayed measurements to centimeters
		  //
		  If Initializing Then Return // wait until everything is set up
		  ToCM(edt_page_top)
		  ToCM(edt_page_left)
		  ToCM(edt_page_right)
		  ToCM(edt_page_bottom)
		  ToCM(edt_page_height)
		  ToCM(edt_page_width)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_page_right
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If winKeyDown(Key, Me) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_page_bottom
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If winKeyDown(Key, Me) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_page_width
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If winKeyDown(Key, Me) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_page_height
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If winKeyDown(Key, Me) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_page_left
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If winKeyDown(Key, Me) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_page_top
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If winKeyDown(Key, Me) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_page_page_setup
	#tag Event
		Sub Action()
		  Dim success As Boolean
		  If PageSetup = Nil Then
		    PageSetup = New PrinterSetup
		    InitPageSetupFromSettings(PageSetup, PrintSettings)
		  End If
		  If Globals.UseSheetDialogs Then
		    success = PageSetup.PageSetupDialog(Self)
		  Else
		    success = PageSetup.PageSetupDialog
		  End If
		  If success Then
		    SetPageMetrics
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
