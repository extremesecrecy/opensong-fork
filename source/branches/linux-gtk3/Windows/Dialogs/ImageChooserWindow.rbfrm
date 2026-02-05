#tag Window
Begin Window ImageChooserWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   390
   ImplicitInstance=   True
   LiveResize      =   False
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
   Title           =   "Find Image"
   Visible         =   True
   Width           =   475
   Begin PushButton btn_browse
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   156
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   340
      Underline       =   False
      Visible         =   True
      Width           =   75
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
      Left            =   241
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   340
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
   Begin Label txt_path
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   ""
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   365
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   455
   End
   Begin Separator sep_1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   328
      Visible         =   True
      Width           =   475
   End
   Begin ScrollBar scr_vertical
      AcceptFocus     =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   328
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   458
      LineStep        =   1
      LiveScroll      =   False
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0
      Minimum         =   0
      PageStep        =   3
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   1
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   10
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   10
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   10
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   10
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   10
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   90
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   90
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   7
      InitialParent   =   ""
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   90
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   8
      InitialParent   =   ""
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   90
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   9
      InitialParent   =   ""
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   90
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   10
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   170
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   11
      InitialParent   =   ""
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   170
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   12
      InitialParent   =   ""
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   170
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   13
      InitialParent   =   ""
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   170
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   14
      InitialParent   =   ""
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   170
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   15
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   250
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   16
      InitialParent   =   ""
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   250
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   17
      InitialParent   =   ""
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   250
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   18
      InitialParent   =   ""
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   250
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Canvas can
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   19
      InitialParent   =   ""
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   250
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   25
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   26
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   27
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   28
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   29
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   150
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   150
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   7
      InitialParent   =   ""
      Italic          =   False
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   32
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   150
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   8
      InitialParent   =   ""
      Italic          =   False
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   33
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   150
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   9
      InitialParent   =   ""
      Italic          =   False
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   34
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   150
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   10
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   35
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   230
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   11
      InitialParent   =   ""
      Italic          =   False
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   36
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   230
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   12
      InitialParent   =   ""
      Italic          =   False
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   37
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   230
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   13
      InitialParent   =   ""
      Italic          =   False
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   38
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   230
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   14
      InitialParent   =   ""
      Italic          =   False
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   39
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   230
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   15
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   40
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   310
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   16
      InitialParent   =   ""
      Italic          =   False
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   41
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   310
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   17
      InitialParent   =   ""
      Italic          =   False
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   42
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   310
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   18
      InitialParent   =   ""
      Italic          =   False
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   43
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   310
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label nte_name
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   19
      InitialParent   =   ""
      Italic          =   False
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   44
      TabPanelIndex   =   0
      Text            =   "file name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   310
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Keyboard.AsyncKeyDown(&h35) Or Asc(Key) = 27 Then ' Escape
		    Close
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  ImageThumbs = New Dictionary
		  
		  '++JRC Added check here for backgrounds folder
		  'if it doesn't exist then switch to the Op System documents folder
		  If App.LastImageFolder <> Nil Then
		    BackgroundFolder = App.LastImageFolder
		  Else
		    If App.CheckDocumentFolders(App.BACKGROUNDS_FOLDER) <> App.NO_FOLDER Then
		      BackgroundFolder = App.DocsFolder.Child(App.STR_BACKGROUNDS)
		    Else
		      #If TargetWin32
		        BackgroundFolder = SpecialFolder.Documents
		      #ElseIf TargetMacOS
		        BackgroundFolder = SpecialFolder.Documents
		      #ElseIf TargetLinux
		        BackgroundFolder = Nil
		      #EndIf
		    End If
		  End If
		  '--
		  App.T.TranslateWindow Me, "find_image", App.TranslationFonts
		  m_parentName = App.T.Translate("find_image/parent/@caption")
		  
		  ReloadDirectory
		  App.CenterInControlScreen Me
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Lookup() As FolderItem
		  ShowModalWithin MainWindow
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReloadDirectory()
		  // JDL 2/01/2006  Modified formula used to calculate scr_vertical.Maximum
		  // JDL 2/01/2006  Added some OpSys specific code for the txt_path.Caption
		  Dim path As String
		  Dim imgidx, folderIndex, i, j, TotImg, jd, jd2 As Integer
		  '++JRC If BackgroundFolder is Nil do nothing
		  If BackgroundFolder = Nil Then Return
		  
		  path = BackgroundFolder.AbsolutePath
		  #If TargetWin32                                                                            // JDL 2/01/2006
		    If InStr(path, "My Documents") > 0 Then path = Mid(path, InStr(path, "My Documents"))
		  #ElseIf TargetMacOS                                                                     // JDL 2/01/2006
		    If InStr(path, "Documents") > 0 Then path = Mid(path, InStr(path, "Documents"))    // JDL 2/01/2006
		  #ElseIf TargetLinux                                                                       // JDL 2/01/2006
		    //Linux code goes right here.                                                    // JDL 2/01/2006
		  #EndIf                                                                                           // JDL 2/01/2006
		  
		  txt_path.Caption = path
		  
		  ImageThumbs.Clear()
		  ReDim ImageFiles(0)
		  
		  If BackgroundFolder.AbsolutePath <> App.DocsFolder.Child("Backgrounds").AbsolutePath Then
		    ImageFiles.Append New FolderItem(m_parentName)
		    folderIndex = 1
		  End If
		  
		  App.MouseCursor = System.Cursors.Wait
		  For i = 1 To BackgroundFolder.Count
		    If BackgroundFolder.Item(i).Name <> "thumbs.db" _
		      And BackgroundFolder.Item(i).IsFileVisible Then
		      If BackgroundFolder.Item(i).Directory Then
		        folderIndex = folderIndex + 1
		        ImageFiles.Insert folderIndex, BackgroundFolder.Item(i)
		      Else
		        ' Do an insertion sort
		        For imgidx = 1 To UBound(ImageFiles) + 1
		          If imgidx > UBound(ImageFiles) or not ImageFiles(imgidx).Directory and ImageFiles(imgidx).Name() > BackgroundFolder.Item(i).Name() Then
		            ImageFiles.Insert imgidx, BackgroundFolder.Item(i)
		            Exit For
		          End If
		        Next imgidx
		      End If
		      j = j + 1
		    End If
		  Next i
		  
		  App.MouseCursor = Nil
		  
		  'scr_vertical.Maximum = Ceil(j/COLS) - ROWS                               // JDL 2/01/2006
		  TotImg = folderIndex + j                                                              // JDL 2/01/2006
		  If TotImg > 20 Then                                                                      // JDL 2/01/2006
		    scr_vertical.Maximum = Ceil((TotImg - (COLS * ROWS))/COLS)   // JDL 2/01/2006
		  Else                                                                                               // JDL 2/01/2006
		    scr_vertical.Maximum = 0                                                          // JDL 2/01/2006
		  End If                                                                                            // JDL 2/01/2006
		Catch ex
		  App.DebugWriter.Write("ImageChooserWindow.ReloadDirectory: caught " + ex.ToString)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected BackgroundFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected f As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ImageFiles(0) As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ImageThumbs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_parentName As String
	#tag EndProperty


	#tag Constant, Name = COLS, Type = Integer, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ROWS, Type = Integer, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events btn_browse
	#tag Event
		Sub Action()
		  // 2 December 2006 EMP
		  // Changed local variable f to fi to prevent future confusion
		  // Added a list of picture file types to the GetOpenFolderItem call
		  // to clear up an issue with Mac in particular not allowing the browse to work
		  // [Bug 1495745]
		  Dim dlg As OpenDialog
		  Dim fi As FolderItem
		  dlg = New OpenDialog
		  dlg.InitialDirectory = Self.f
		  dlg.Filter = "JPG Files;BMP Files;GIF Files;PNG Files;TIFF Files"
		  fi = dlg.ShowModal
		  If fi <> Nil Then
		    Self.f = fi
		    App.LastImageFolder = fi.Parent
		    Close
		  End If
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
#tag Events scr_vertical
	#tag Event
		Sub ValueChanged()
		  Refresh False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can
	#tag Event
		Function MouseDown(index as Integer, X As Integer, Y As Integer) As Boolean
		  // JDL 2/01/2006  Created ImgNdx to use as index in the ImageFiles array.
		  // JDL 2/01/2006  Also replaced (and modified) hard coded argument with variable.
		  Dim ImgNdx as Integer
		  ImgNdx = scr_vertical.Value * COLS + Index + 1
		  ' If scr_vertical.Value + Index + 1 <= UBound(ImageFiles) Then     // JDL 2/01/2006
		  If ImgNdx <= UBound(ImageFiles) Then                 // JDL 2/01/2006
		    If ImageFiles(ImgNdx).Name = m_parentName Then    // JDL 2/01/2006
		      If BackgroundFolder.Parent <> Nil Then BackgroundFolder = BackgroundFolder.Parent
		      ReloadDirectory
		      Refresh False
		    ElseIf ImageFiles(ImgNdx).Directory Then           // JDL 2/01/2006
		      BackgroundFolder = ImageFiles(ImgNdx)        // JDL 2/01/2006
		      ReloadDirectory
		      Refresh False
		    Else
		      f = ImageFiles(ImgNdx)                                   // JDL 2/01/2006
		      Close
		    End If
		  End If
		Catch ex
		  ex.message = ex.message + " Index = " + CStr(Index) + ", ImgNdx = " + CStr(ImgNdx)
		  App.DebugWriter.Write("ImageChooserWindow.MouseDown: caught " + ex.ToString, 1)
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(index as Integer, g As Graphics, areas() As REALbasic.Rect)
		  // JDL 2/01/2006  Created ImgNdx to use as index in the ImageFiles array.
		  // JDL 2/01/2006  Replaced (and modified) hard coded argument with variable.
		  // JDL 2/01/2006  Replaced pic.Depth with variable picDepth
		  // EMP 2 December 2006 Fixed attempt to access pic before validating as non-Nil
		  // EMP 2 December 2006 Added code to ignore non-picture files
		  Dim ImgNdx As Integer = scr_vertical.Value * COLS + Index + 1                    // JDL 2/01/2006
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  If ImgNdx <= UBound(ImageFiles) Then
		    g.TextSize = 8
		    
		    Dim name As String = ImageFiles(ImgNdx).Name
		    Dim cacheName As String = name + ".bmp"
		    
		    If name = m_parentName Then
		      g.DrawPicture fileopen, 0, 0, g.Width, g.Height, 0, 0, fileopen.Width, fileopen.Height
		    ElseIf ImageFiles(ImgNdx).Directory Then
		      g.DrawPicture fileopen, 0, 0, g.Width, g.Height, 0, 0, fileopen.Width, fileopen.Height
		    Else
		      Dim cacheFolder As FolderItem = ImageFiles(ImgNdx).Parent.Child("_cache")
		      Dim thumb As Picture = Nil
		      
		      If ImageThumbs.HasKey(ImageFiles(ImgNdx).AbsolutePath) Then
		        thumb = ImageThumbs.Value(ImageFiles(ImgNdx).AbsolutePath)
		      End If
		      
		      If IsNull(thumb) And _
		        cacheFolder <> Nil And cacheFolder.Exists And cacheFolder.Child(name).Exists And _
		        ImageFiles(ImgNdx).ModificationDate <= cacheFolder.Child(name).ModificationDate Then
		        
		        Try
		          thumb = Picture.Open(cacheFolder.Child(name))
		        Catch
		          thumb = Nil
		        End Try
		      End If
		      
		      '++JRC Fix issue where two files with the same name but different Extensions would get
		      'the same thumbnail image. We'll add an extra Extension for the thumbnail's filename
		      'e.g. 1.jpg.bmp .
		      If IsNull(thumb) And _
		        cacheFolder <> Nil And cacheFolder.Exists And cacheFolder.Child(cacheName).Exists And _
		        ImageFiles(ImgNdx).ModificationDate <= cacheFolder.Child(cacheName).ModificationDate Then
		        
		        Try
		          thumb = Picture.Open(cacheFolder.Child(cacheName))
		        Catch
		          thumb = Nil
		        End Try
		      End If
		      
		      If IsNull(thumb) Then
		        Dim pic As Picture = Picture.Open(ImageFiles(ImgNdx))
		        If pic <> Nil Then
		          Dim picDepth As Integer = pic.Depth
		          If picDepth = 0 then picDepth = 24
		          
		          If cacheFolder <> Nil Then ' create the cache
		            If Not cacheFolder.Exists Then cacheFolder.CreateAsFolder
		            
		            thumb = New Picture(80, 60, picDepth)
		            thumb.Graphics.DrawPicture pic, 0, 0, thumb.Width, thumb.Height, 0, 0, pic.Width, pic.Height
		            
		            Dim stored As Boolean = False
		            If Not stored Then
		              Try
		                thumb.Save(cacheFolder.Child(cacheName), Picture.SaveAsJPEG)
		                stored = True
		              Catch
		                //JPEG not supported
		              End Try
		            End If
		            
		            If Not stored Then
		              Try
		                thumb.Save(cacheFolder.Child(cacheName), Picture.SaveAsDefault)
		                stored = True
		              Catch
		                //That did not work ...
		              End Try
		            End If
		            
		          End If
		        Else
		          // Let's not display anything that isn't a picture or a folder.
		          ImageFiles.Remove ImgNdx
		          Can(Index).Refresh
		          Return
		        End If
		      End If
		      
		      If Not IsNull(thumb) Then
		        g.DrawPicture thumb, 0, 0, g.Width, g.Height, 0, 0, thumb.Width, thumb.Height
		        
		        If Not ImageThumbs.HasKey(ImageFiles(ImgNdx).AbsolutePath) Then
		          ImageThumbs.Value(ImageFiles(ImgNdx).AbsolutePath) = thumb
		        End If
		      Else
		        g.ForeColor = FillColor
		        g.FillRect 0, 0, g.Width, g.Height
		      End If
		    End If
		    
		    nte_name(Index).Text = ImageFiles(ImgNdx).DisplayName
		    g.ForeColor = DarkBevelColor
		    g.DrawRect 0, 0, g.Width, g.Height
		    
		  Else
		    nte_name(Index).Text = ""
		    g.ForeColor = FillColor
		    g.FillRect 0, 0, g.Width, g.Height
		  End If
		  
		  App.MouseCursor = Nil
		  
		Catch ex
		  ex.Message = ex.Message + " Index = " + CStr(Index) + ", ImgNdx = " + CStr(ImgNdx)
		  App.DebugWriter.Write("ImageChooserWindow.can().Paint: caught " + ex.ToString, 1)
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
