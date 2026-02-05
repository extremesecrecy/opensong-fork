#tag Window
Begin Window MainWin
   BackColor       =   16777215
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   397
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   348
   Placement       =   0
   Resizeable      =   False
   Title           =   "RB Project Tool ^0"
   Visible         =   False
   Width           =   693
   Begin ShowURLText StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "By Thomas Tempelmann (http://www.tempel.org/rb/#prjtool)\r"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   378
      Transparent     =   False
      Underline       =   False
      URL             =   "http://www.tempel.org/rb/#prjtool"
      Visible         =   True
      Width           =   339
   End
   Begin GroupBox exportXMLBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Export as XML (.xml)"
      Enabled         =   True
      Height          =   106
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   8
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   116
      Underline       =   False
      Visible         =   True
      Width           =   332
      Begin Label StaticText3
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "exportXMLBox"
         Italic          =   False
         Left            =   15
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a project file into this field to export it to an XML file compatible with RB's XML format"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   139
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
      Begin CheckBox xmlIncludeChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Process Externals"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If enabled, external items will be processed as well, otherwise only the main file will be processed"
         Index           =   -2147483648
         InitialParent   =   "exportXMLBox"
         Italic          =   False
         Left            =   15
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
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   176
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   140
      End
      Begin CheckBox xmlRB55Chk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "RB 5.5 compatible"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If enabled, Properties will be exported in an older format understood by RB 5 (and earlier as well). Comments for Properties, added with RB 2005, will be lost then, however."
         Index           =   -2147483648
         InitialParent   =   "exportXMLBox"
         Italic          =   False
         Left            =   15
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
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   198
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   151
      End
      Begin ProgressWheel exportXMLBusy
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "exportXMLBox"
         Left            =   320
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   201
         Visible         =   False
         Width           =   16
      End
      Begin CheckBox xmlMergeChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "merged"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If enabled, externals will included in the main file's export;\rIf disabled, externals will generate their own export files"
         Index           =   -2147483648
         InitialParent   =   "exportXMLBox"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   1
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   176
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   90
      End
   End
   Begin GroupBox exportTextBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Export as Text (.rbvx)"
      Enabled         =   True
      Height          =   106
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   8
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   231
      Underline       =   False
      Visible         =   True
      Width           =   332
      Begin Label StaticText4
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "exportTextBox"
         Italic          =   False
         Left            =   15
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a project file into this field to export it to a more or less lossless text file format"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   254
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
      Begin CheckBox txtIncludeChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Process Externals"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If enabled, external items will be processed as well, otherwise only the main file will be processed"
         Index           =   -2147483648
         InitialParent   =   "exportTextBox"
         Italic          =   False
         Left            =   15
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
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   291
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   140
      End
      Begin CheckBox txtOrderedChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Ordered and simplified (useful for comparisons)"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If enabled, items will be sorted by their names, leaf groups be collected into single lines, and source code nicely formatted for better readability.\r\rIf disabled, items will appear in their original order, one per line."
         Index           =   -2147483648
         InitialParent   =   "exportTextBox"
         Italic          =   False
         Left            =   15
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   313
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   284
      End
      Begin ProgressWheel exportTextBusy
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "exportTextBox"
         Left            =   320
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   316
         Visible         =   False
         Width           =   16
      End
      Begin CheckBox txtMergeChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "merged"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If enabled, externals will included in the main file's export;\rIf disabled, externals will generate their own export files"
         Index           =   -2147483648
         InitialParent   =   "exportTextBox"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   1
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   291
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   90
      End
   End
   Begin GroupBox exportBinaryBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Export as Binary (.rbp)"
      Enabled         =   True
      Height          =   99
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   8
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   8
      Underline       =   False
      Visible         =   True
      Width           =   332
      Begin Label StaticText5
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   46
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "exportBinaryBox"
         Italic          =   False
         Left            =   15
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a project file into this field to export it to an .rbp file compatible with RB's internal binary format. (Adds ""-out"" to file name)"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   28
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
      Begin ProgressWheel exportBinaryBusy
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "exportBinaryBox"
         Left            =   320
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   86
         Visible         =   False
         Width           =   16
      End
      Begin CheckBox expBinIncludeChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Process Externals"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If enabled, external items will be processed as well, otherwise only the main file will be processed"
         Index           =   -2147483648
         InitialParent   =   "exportBinaryBox"
         Italic          =   False
         Left            =   15
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   1
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   81
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   140
      End
      Begin CheckBox expBinMergeChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "merged"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If enabled, externals will included in the main file's export;\rIf disabled, externals will generate their own export files"
         Index           =   -2147483648
         InitialParent   =   "exportBinaryBox"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   1
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   81
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   90
      End
   End
   Begin GroupBox classBrowserBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Class Browser"
      Enabled         =   True
      Height          =   61
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   353
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   150
      Underline       =   False
      Visible         =   True
      Width           =   332
      Begin Label StaticText6
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   29
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "classBrowserBox"
         Italic          =   False
         Left            =   360
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a project file into this field to view it in a Class Browser (Note: still in experimental state)"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   173
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
   End
   Begin GroupBox objsBrowserBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "PrjObjs Browser"
      Enabled         =   True
      Height          =   62
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   353
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   79
      Underline       =   False
      Visible         =   True
      Width           =   332
      Begin Label StaticText7
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   30
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "objsBrowserBox"
         Italic          =   False
         Left            =   360
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a project file into this field to view its PrjObj items in a hierarchical list (Note: still in experimental state)"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   102
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
   End
   Begin GroupBox vaultExportBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Export to Vault"
      Enabled         =   True
      Height          =   99
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   353
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   220
      Underline       =   False
      Visible         =   True
      Width           =   332
      Begin Label StaticText8
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   28
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "vaultExportBox"
         Italic          =   False
         Left            =   360
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a project file (.rbp) into this field to write its items to a ""vault"" directory for use with version control tools."
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   242
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
      Begin ProgressWheel vaultExportBusy
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "vaultExportBox"
         Left            =   665
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   298
         Visible         =   False
         Width           =   16
      End
      Begin ShowURLText StaticText11
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "vaultExportBox"
         Italic          =   False
         Left            =   360
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         Text            =   "http://www.rbwiki.org/doku.php/rbp/scm/rbvexim"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   299
         Transparent     =   False
         Underline       =   False
         URL             =   "http://www.rbwiki.org/doku.php/rbp/scm/rbvexim"
         Visible         =   True
         Width           =   293
      End
      Begin CheckBox vaultExportFoldersChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Adopt Folders in Vault"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If checked, the files in the vault adopt the project's folder hierarchy.\rIf unchecked, all project item files will be stored flat in the vault directory"
         Index           =   -2147483648
         InitialParent   =   "vaultExportBox"
         Italic          =   False
         Left            =   360
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
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   276
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   154
      End
      Begin CheckBox vaultExportSeparateExtsChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Separate Externals"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   "If checked, external files get stored in separate vault folders located next to those files.\rIf unchecked, all external files will be stored inside the project's vault directory."
         Index           =   -2147483648
         InitialParent   =   "vaultExportBox"
         Italic          =   False
         Left            =   523
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
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   276
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   134
      End
   End
   Begin GroupBox vaultImportBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Import from Vault"
      Enabled         =   True
      Height          =   61
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   353
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   328
      Underline       =   False
      Visible         =   True
      Width           =   332
      Begin Label StaticText9
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   29
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "vaultImportBox"
         Italic          =   False
         Left            =   360
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a vault directory into this field to recreate the project file from it"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   351
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
      Begin ProgressWheel vaultImportBusy
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "vaultImportBox"
         Left            =   665
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   369
         Visible         =   False
         Width           =   16
      End
   End
   Begin GroupBox itemsBrowserBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Project Items Browser"
      Enabled         =   True
      Height          =   62
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   353
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   8
      Underline       =   False
      Visible         =   True
      Width           =   332
      Begin Label StaticText10
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   30
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "itemsBrowserBox"
         Italic          =   False
         Left            =   360
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a project file into this field to view all its items in their original structure"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   31
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
   End
   Begin GroupBox exportDoxyBox
      AutoDeactivate  =   False
      Bold            =   ""
      Caption         =   "Export to Doxygen"
      Enabled         =   False
      Height          =   76
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   9
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   450
      Underline       =   ""
      Visible         =   False
      Width           =   332
      Begin Label StaticText12
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   43
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "exportDoxyBox"
         Italic          =   False
         Left            =   16
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Drag a project file into this field to export it to a Java project file for use with Doxygen (converter provided by Andy Dent)"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   475
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   320
      End
      Begin ProgressWheel exportDoxygenBusy
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "exportDoxyBox"
         Left            =   321
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   505
         Visible         =   False
         Width           =   16
      End
   End
   Begin WorkerThreadClass WorkerThread
      Height          =   32
      Index           =   -2147483648
      Left            =   421
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   475
      Width           =   32
   End
   Begin Timer UIUpdateTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   516
      LockedInPosition=   False
      Mode            =   0
      Period          =   130
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   475
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  self.Title = Replace (self.Title, "^0", App.ShortVersion)
		  expBinMergeChk.Enabled = expBinIncludeChk.Value
		  xmlMergeChk.Enabled = xmlIncludeChk.Value
		  txtMergeChk.Enabled = txtIncludeChk.Value
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			me.Close
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function FollowAlias(f as FolderItem) As FolderItem
		  if f.Alias then
		    f = f.Parent.Child(f.Name)
		  end
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function handleVaultAction(inputItem as FolderItem, isExport as Boolean, placeExternalsIntoMainVault as Boolean = False, adoptProjectFolderHierarchy as Boolean = False, includeAllExternals as Boolean = False) As Boolean
		  dim ok as Boolean
		  dim results as RBPrjParseResults
		  
		  if isExport then
		    // export to vault
		    ok = RBPrjSupport.WriteProjectToVault (inputItem, results, placeExternalsIntoMainVault, adoptProjectFolderHierarchy, includeAllExternals)
		    RBPrjSupport.ShowParseResults results, "Vault Export"
		  else
		    // import from vault
		    ok = RBPrjSupport.CreateProjectFromVault (inputItem, results)
		    RBPrjSupport.ShowParseResults results, "Vault Import"
		  end
		  
		  return ok
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProcessFile(prjFile as FolderItem, processExternals as Boolean, insertExternals as Boolean, exportMode as Integer, hideExternalRefs as Boolean = true) As Boolean
		  dim rbp as new RBPrjFileReader
		  dim proc1, postProcessor, processor as RBPrjProcessing
		  dim idents as RBPrjIdents
		  dim results as RBPrjParseResults
		  dim parseOptions as RBPrjItemsTreeParseOptions
		  
		  prjFile = FollowAlias (prjFile)
		  
		  if not rbp.Open (prjFile) then
		    MsgBox "This is not a valid project file: "+prjFile.Name
		    return false
		  end
		  
		  if exportMode = 0 then
		    // text export - original order
		    processor = new RBPrjTextFileWriter (nil, false, false, false)
		  elseif exportMode = 1 then
		    // text export - ordered (sorted) for comparison and optimized for viewing
		    processor = new RBPrjItemsTreeBuilder ()
		    postProcessor = new RBPrjTextFileWriter (nil, true, true, true)
		    parseOptions = new RBPrjItemsTreeParseOptions (RBPrjItemsTreeParseOptions.OptimizeAll)
		  elseif exportMode = 2 then
		    processor = new RBPrjXMLFileWriter ("5.5.5")
		  elseif exportMode = 3 then
		    processor = new RBPrjXMLFileWriter ()
		  elseif exportMode = 4 then
		    processor = new RBPrjObjTreeBuilder ()
		  elseif exportMode = 5 then
		    processor = new RBPrjObjTreeBuilder ()
		  elseif exportMode = 6 then
		    processor = new RBPrjItemsTreeBuilder ()
		  elseif exportMode = 8 then
		    processor = new RBPrjBinaryFileWriter (nil, "-out")
		  elseif exportMode = 11 then
		    processor = new RBPrjXMLBuilder ()
		  else
		    MsgBox "Unknown 'exportMode': "+Str(exportMode)
		    return false
		  end
		  proc1 = processor
		  
		  if processExternals then
		    processor = new RBPrjExternalsIncluder (processor, new RBPrjFileReader, insertExternals, hideExternalRefs, new RBPrjFileLocator (prjFile.Parent, false, true, ""))
		  end
		  
		  try
		    ProgressWin.Show
		    results = new RBPrjParseResults (ProgressWin.ProgressAwareCtrl1)
		    rbp.Parse (processor, results, RBPrjSupport.IgnoreExternals, nil)
		    ProgressWin.Close
		    // post process:
		    if not results.HadFatalErrors() then
		      if proc1 isA RBPrjItemsTreeBuilder and postProcessor <> nil then
		        RBPrjItemsTreeBuilder(proc1).ItemsTree.Parse (postProcessor, results, RBPrjSupport.SeparateExternals, parseOptions)
		      end
		    end
		  exception exc as RuntimeException
		    ProgressWin.Close
		    if exc isA RBPrjException then
		      MsgBox "The process failed: "+exc.Message
		    else
		      MsgBox "The process failed because of an unexpected exception"
		    end
		    return false
		  end
		  
		  if results.hadEncryptedItems then
		    results.warnMsgs.Insert 0, "Warning: Prj file contains encrypted items that were not handled"
		  end
		  
		  if Ubound(results.errMsgs) >= 0 then
		    MsgBox "There were errors:"+EndOfLine+EndOfLine+Join(results.errMsgs,EndOfLine)
		    return false
		  end
		  
		  if Ubound(results.warnMsgs) >= 0 then
		    MsgBox "There were warnings:"+EndOfLine+EndOfLine+Join(results.warnMsgs,EndOfLine)
		  end
		  
		  if exportMode = 4 then
		    // now open a window with a class browser
		    try
		      idents = new RBPrjIdents (RBPrjObjTreeBuilder (proc1).ObjTree)
		    exception exc2 as RBPrjException
		      MsgBox "The class tree could not be built: "+exc2.Message
		      return false
		    end
		    dim w as new ClassBrowserWin
		    w.SetTree idents // this opens the window
		  elseif exportMode = 5 then
		    // now open a window with a objs browser
		    dim w as new RBPrjObjsWin
		    w.ShowTree RBPrjObjTreeBuilder (proc1).ObjTree // this opens the window
		  elseif exportMode = 6 then
		    // now open a window with a items browser
		    dim w as new RBPrjItemsWin
		    w.ShowTree RBPrjItemsTreeBuilder (proc1).ItemsTree // this opens the window
		  elseif exportMode = 11 then
		    // do a xslt transformation with Andy Dent's transformer
		    #if true
		      MsgBox "Doxygen support removed due to apparent lack of interest"
		    #else
		      if not transformXML (RBPrjXMLBuilder(proc1).AsXML, RB2Doxy, RBPrjHelper.AddedBeforeExtension (prjFile, "-trans")) then
		        MsgBox "Doxygen output failed for unknown reason"
		      end
		    #endif
		  end
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function transformXML(xml as XMLDocument, xsltStr as String, outputRef as FolderItem) As Boolean
		  dim s as String
		  dim ts as TextOutputStream
		  
		  try
		    s = xml.Transform (xsltStr)
		    ts = TextOutputStream.Create(outputRef)
		    ts.Delimiter = chr(10) // LF
		    ts.Write s
		    ts.Close
		    return true
		  exception
		    // oops
		  end
		  return false
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		SpinnerActive(13) As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events exportXMLBox
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "RBprj"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  dim mode as Integer
		  
		  if xmlRB55Chk.Value then
		    mode = 2 // RB 5.5 compatible
		  else
		    mode = 3 // RB 2005 format
		  end
		  
		  do
		    if obj.FolderItemAvailable then
		      WorkerThread.AddTask(new ProcessTask(obj.FolderItem, mode, xmlIncludeChk.Value, xmlMergeChk.Value))
		    end
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events xmlIncludeChk
	#tag Event
		Sub Action()
		  xmlMergeChk.Enabled = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events exportTextBox
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "RBprj"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  dim mode as Integer
		  if txtOrderedChk.Value then
		    mode = 1
		  else
		    mode = 0
		  end
		  
		  do
		    if obj.FolderItemAvailable then
		      WorkerThread.AddTask(new ProcessTask(obj.FolderItem, mode, txtIncludeChk.Value, txtMergeChk.Value, false))
		    end
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtIncludeChk
	#tag Event
		Sub Action()
		  txtMergeChk.Enabled = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events exportBinaryBox
	#tag Event
		Sub Open()
		  if me.Enabled then
		    me.AcceptFileDrop "RBprj"
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  do
		    if obj.FolderItemAvailable then
		      WorkerThread.AddTask(new ProcessTask(obj.FolderItem, 8, expBinIncludeChk.Value, expBinMergeChk.Value))
		    end
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events expBinIncludeChk
	#tag Event
		Sub Action()
		  expBinMergeChk.Enabled = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events classBrowserBox
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "RBprj"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  do
		    if obj.FolderItemAvailable then
		      call self.ProcessFile (obj.FolderItem, true, true, 4)
		    end
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events objsBrowserBox
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "RBprj"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  do
		    if obj.FolderItemAvailable then
		      WorkerThread.AddTask(new ProcessTask(obj.FolderItem, 5, false, false, true))
		    end
		  loop until not obj.NextItem
		  System.DebugLog("Leaving " + CurrentMethodName)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events vaultExportBox
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "RBprj"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  'vaultExportBusy.Visible = true
		  'me.Enabled = false
		  'me.Refresh
		  'do
		  'if obj.FolderItemAvailable then
		  'if not handleVaultAction (obj.FolderItem, true, not vaultExportSeparateExtsChk.Value, vaultExportFoldersChk.Value, false) then
		  'exit
		  'end
		  'end
		  'loop until not obj.NextItem
		  'me.Enabled = true
		  'vaultExportBusy.Visible = false
		  
		  do
		    if obj.FolderItemAvailable then
		      WorkerThread.AddTask(new ProcessTask(obj.FolderItem, 9, not vaultExportSeparateExtsChk.Value, vaultExportFoldersChk.Value, false))
		    end
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events vaultImportBox
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "vault"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  vaultImportBusy.Visible = true
		  me.Enabled = false
		  me.Refresh
		  do
		    if obj.FolderItemAvailable then
		      if not handleVaultAction (obj.FolderItem, false) then
		        exit
		      end
		    end
		  loop until not obj.NextItem
		  me.Enabled = true
		  vaultImportBusy.Visible = false
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events itemsBrowserBox
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "RBprj"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  do
		    if obj.FolderItemAvailable then
		      WorkerThread.AddTask(new ProcessTask(obj.FolderItem, 6, true, false))
		    end
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events exportDoxyBox
	#tag Event
		Sub Open()
		  if me.Enabled then
		    me.AcceptFileDrop "RBprj"
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  do
		    if obj.FolderItemAvailable then
		      WorkerThread.AddTask(new ProcessTask(obj.FolderItem, 11, true, true))
		    end
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WorkerThread
	#tag Event
		Sub ExecuteTask(Task As ProcessTask)
		  System.DebugLog(CurrentMethodName + " Mode = " + Str(Task.Mode) + " " + Task.Item.AbsolutePath)  '§
		  Select Case Task.Mode
		  Case 9
		    Dim placeExternalsIntoMainVault As Boolean = False
		    Dim adoptProjectFolderHierarchy As Boolean = False
		    Dim includeAllExternals As Boolean = False
		    If Task.Flags.Ubound >= 0 Then
		      placeExternalsIntoMainVault = Task.Flags(0)
		      If Task.Flags.Ubound >= 1 Then
		        adoptProjectFolderHierarchy = Task.Flags(1)
		        If Task.Flags.Ubound >= 2 Then
		          includeAllExternals = Task.Flags(2)
		        End If
		      End If
		    End If
		    Call handleVaultAction (Task.Item, True, placeExternalsIntoMainVault, adoptProjectFolderHierarchy, includeAllExternals)
		  Case 10
		    Dim placeExternalsIntoMainVault As Boolean = False
		    Dim adoptProjectFolderHierarchy As Boolean = False
		    Dim includeAllExternals As Boolean = False
		    If Task.Flags.Ubound >= 0 Then
		      placeExternalsIntoMainVault = Task.Flags(0)
		      If Task.Flags.Ubound >= 1 Then
		        adoptProjectFolderHierarchy = Task.Flags(1)
		        If Task.Flags.Ubound >= 2 Then
		          includeAllExternals = Task.Flags(2)
		        End If
		      End If
		    End If
		    Call handleVaultAction (Task.Item, False, placeExternalsIntoMainVault, adoptProjectFolderHierarchy, includeAllExternals)
		  Case Else
		    Dim processExternals As Boolean = False
		    Dim insertExternals As Boolean = False
		    Dim hideExternalRefs As Boolean = True
		    If Task.Flags.Ubound >= 0 Then
		      processExternals = Task.Flags(0)
		      If Task.Flags.Ubound >= 1 Then
		        insertExternals = Task.Flags(1)
		        If Task.Flags.Ubound >= 2 Then
		          hideExternalRefs = Task.Flags(2)
		        End If
		      End If
		    End If
		    Call ProcessFile (Task.Item, processExternals, insertExternals, Task.Mode, hideExternalRefs)
		  End Select
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TaskAdded(Task As processtask)
		  SpinnerActive(Task.Mode) = SpinnerActive(Task.Mode) + 1
		  UIUpdateTimer.Enabled = true
		  If UIUpdateTimer.Period <= 0 Then UIUpdateTimer.Period = 130
		  If UIUpdateTimer.Mode = Timer.ModeOff Then
		    System.DebugLog(CurrentMethodName + " starting up Timer")  '§
		    UIUpdateTimer.Mode = Timer.ModeMultiple
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TaskRemoved(Task As ProcessTask)
		  SpinnerActive(Task.Mode) = SpinnerActive(Task.Mode) - 1
		  If SpinnerActive(Task.Mode) = 0 Then
		    For Each i As Integer In SpinnerActive
		      If i > 0 Then Return
		    Next
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UIUpdateTimer
	#tag Event
		Sub Action()
		  System.DebugLog(CurrentMethodName)  '§
		  Dim i, j As Integer
		  // i represents task's Mode property
		  // mapping:
		  // 0, 1 exportTextBusy
		  // 2, 3 exportXMLBusy
		  // 8    exportBinaryBusy
		  // 9    vaultExportBusy
		  // 10   vaultImportBusy
		  // 11   exportDoxyBusy
		  // 12   exportVCPBusy
		  For i = 0 To SpinnerActive.Ubound
		    j = j + SpinnerActive(i)
		    Select Case i
		    Case 0
		      If exportTextBusy.Visible <> ((SpinnerActive(0) + SpinnerActive(1)) > 0) Then
		        exportTextBusy.Visible = Not exportTextBusy.Visible
		      End If
		    Case 2
		      If exportXMLBusy.Visible <> ((SpinnerActive(2) + SpinnerActive(3)) > 0) Then
		        exportXMLBusy.Visible = Not exportXMLBusy.Visible
		      End If
		    Case 8
		      If exportBinaryBusy.Visible <> (SpinnerActive(4) > 0) Then
		        exportBinaryBusy.Visible = Not exportBinaryBusy.Visible
		      End If
		    Case 9
		      If vaultExportBusy.Visible <> (SpinnerActive(4) > 0) Then
		        vaultExportBusy.Visible = Not vaultExportBusy.Visible
		      End If
		    Case 10
		      If vaultImportBusy.Visible <> (SpinnerActive(4) > 0) Then
		        vaultImportBusy.Visible = Not vaultImportBusy.Visible
		      End If
		    Case 11
		      If exportDoxygenBusy.Visible <> (SpinnerActive(4) > 0) Then
		        exportDoxygenBusy.Visible = Not exportDoxygenBusy.Visible
		      End If
		    End Select
		  Next
		  
		  If j = 0 Then
		    Me.Mode = Timer.ModeOff
		    System.DebugLog(CurrentMethodName + " stoped Timer")  '§
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
