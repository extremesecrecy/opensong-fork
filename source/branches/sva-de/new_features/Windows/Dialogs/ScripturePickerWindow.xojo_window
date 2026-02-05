#tag Window
Begin Window ScripturePickerWindow Implements iScripturePicker
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   602
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   1046
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   600
   MinimizeButton  =   True
   MinWidth        =   760
   Placement       =   0
   Resizeable      =   True
   Title           =   "Scripture Lookup"
   Visible         =   False
   Width           =   760
   Begin GroupBox grp_quick_lookup
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Quick Lookup"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   75
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
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
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   540
      Begin SEditField edt_quick_lookup
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
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
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   22
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "grp_quick_lookup"
         Italic          =   False
         Left            =   20
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   50
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   393
      End
      Begin PushButton btn_quick_lookup
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Lookup"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_quick_lookup"
         Italic          =   False
         Left            =   425
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   50
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   110
      End
      Begin Label lbl_quick_reference
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
         InitialParent   =   "grp_quick_lookup"
         Italic          =   False
         Left            =   20
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
         Text            =   "Reference:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   28
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   65
      End
      Begin Label nte_quick_example
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
         InitialParent   =   "grp_quick_lookup"
         Italic          =   True
         Left            =   97
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Ex: ""2Pet 1:1-2"" or ""2Pet 1:1-2 (KJV)"""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   28
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   357
      End
   End
   Begin PushButton btn_add
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Add"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   595
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   505
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
   Begin PushButton btn_done
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Done"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   595
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   563
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
   Begin PushButton btn_insert
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Insert"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   595
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   476
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   110
   End
   Begin PushButton btn_search
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Full text search"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   572
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   50
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   158
   End
   Begin GroupBox grp_books
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Bible book"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   372
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   91
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   298
      Begin HighlightList lst_scr_ot
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   1
         ColumnWidths    =   ""
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
         HasHeader       =   False
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   324
         Index           =   -2147483648
         InitialParent   =   "grp_books"
         InitialValue    =   ""
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         RowSelectionType=   0
         Scope           =   0
         SecondarySelection=   -1
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   129
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   136
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin HighlightList lst_scr_nt
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   1
         ColumnWidths    =   ""
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
         HasHeader       =   False
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   324
         Index           =   -2147483648
         InitialParent   =   "grp_books"
         InitialValue    =   ""
         Italic          =   False
         Left            =   164
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         RowSelectionType=   0
         Scope           =   0
         SecondarySelection=   -1
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   129
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   136
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label lbl_scr_ot
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
         InitialParent   =   "grp_books"
         Italic          =   False
         Left            =   20
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
         Text            =   "Old testament"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   107
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   136
      End
      Begin Label lbl_scr_nt
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
         InitialParent   =   "grp_books"
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "New testament"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   107
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   136
      End
   End
   Begin HighlightList lst_scr_chapter
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
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
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   324
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   318
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      SecondarySelection=   -1
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   129
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin GroupBox grp_options_version
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Version"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   55
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   562
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
      Top             =   128
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   178
      Begin PopupMenu pop_scr_version
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
         InitialParent   =   "grp_options_version"
         InitialValue    =   ""
         Italic          =   False
         Left            =   572
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   148
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   127
      End
   End
   Begin GroupBox grp_options_verses_per_slide
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Verses per slide"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   55
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   562
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   192
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   178
      Begin PopupMenu pop_scr_verses
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
         InitialParent   =   "grp_options_verses_per_slide"
         InitialValue    =   "2"
         Italic          =   False
         Left            =   572
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   1
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   212
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   128
      End
   End
   Begin SVRadioGroupBox grp_options_format
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Format"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   67
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   562
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   321
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   178
      Begin RadioButton rad_format_paragraph
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Paragraph"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_options_format"
         Italic          =   False
         Left            =   572
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   341
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   133
      End
      Begin RadioButton rad_format_verse
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Verse"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_options_format"
         Italic          =   False
         Left            =   572
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   361
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   133
      End
   End
   Begin Checkbox chk_shownumbers
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Display verse numbers"
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
      Left            =   572
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   403
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   168
   End
   Begin HighlightList lst_scr_from_verse
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
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
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   324
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   400
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      SecondarySelection=   -1
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   129
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin HighlightList lst_scr_to_verse
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
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
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   324
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   481
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      SecondarySelection=   -1
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   129
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin SEditField edt_preview
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   False
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
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   102
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   492
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   540
   End
   Begin GroupBox grp_options_chars_per_slide
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Max. characters per slide"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   50
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   562
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   257
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   178
      Begin SEditFieldNumeric edt_scr_characters
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   False
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
         HasVerticalScrollbar=   False
         Height          =   22
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "grp_options_chars_per_slide"
         Italic          =   False
         Left            =   572
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Maximum         =   1000.0
         MaximumCharactersAllowed=   0
         Minimum         =   1.0
         Multiline       =   False
         ReadOnly        =   False
         Scope           =   0
         SignalRangeErrors=   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "500"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   277
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   110
      End
   End
   Begin Label lbl_scr_to_verse
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
      Left            =   481
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
      Text            =   "To verse"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   107
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton btn_copy
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Copy"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   595
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   534
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
   Begin Label lbl_src_preview
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Preview of scripture passage"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   470
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   404
   End
   Begin Label txt_verse_dash
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
      Left            =   470
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   107
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   10
   End
   Begin Label lbl_scr_from_verse
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
      Left            =   399
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "From verse"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   107
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Label lbl_scr_paragraph
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
      Left            =   318
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Chapter"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   107
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton btn_live_forward
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "▶"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   655
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   447
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   50
   End
   Begin SmartSplitter SmartSplitter1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DisableLiveDrag =   False
      doNotAttachEmbeddedControls=   False
      DoubleBuffer    =   False
      Enabled         =   True
      handleCount     =   0
      handleDimple    =   False
      handleLarge     =   False
      Height          =   9
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaxLimit        =   0
      MaxLimitOffset  =   0
      MinLimit        =   0
      MinLimitOffset  =   0
      Scope           =   0
      showWarningsDialogs=   False
      StayProportional=   False
      StopAtMaxOffset =   False
      StopAtMinOffset =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   463
      Transparent     =   True
      Visible         =   True
      Width           =   540
   End
   Begin PushButton btn_live_backward
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "◀"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   2
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   595
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   447
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   50
   End
   Begin Label txt_verse_colon
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
      Left            =   387
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ":"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   107
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   10
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If NOT CanClose Then Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  'App.DebugWriter.Write "ScripturePickerWindow.Close"
		  SPController = Nil
		  Globals.Status_ScripturePickerOpen = False
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  App.DebugWriter.Write CurrentMethodName + ": Key is " + Hex(Asc(Key))
		  Select Case Asc(Key)
		  Case &h0d, &h0a, &h20, &h09, &h03 // Return, ?, Space, Tab, Enter
		    Return False  // pass these on
		  Case Else
		    Return True  // ignore the rest
		  End Select
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  App.T.TranslateWindow Me, "scripture_lookup", App.TranslationFonts
		  App.CenterInControlScreen Me
		  
		  CanClose = true
		  
		  pop_scr_verses.DeleteAllRows()
		  pop_scr_verses.AddRow "1"
		  pop_scr_verses.AddRow "2"
		  pop_scr_verses.AddRow "3"
		  pop_scr_verses.AddRow "4"
		  pop_scr_verses.AddRow "5"
		  pop_scr_verses.ListIndex = 1
		  
		  edt_scr_characters.Text = "500"
		  
		  '++JRC Ensure the scrollbars are enabled if necessary
		  lst_scr_nt.ScrollPosition = 1
		  lst_scr_nt.ScrollPosition = 0
		  lst_scr_ot.ScrollPosition = 1
		  lst_scr_ot.ScrollPosition = 0
		  '--
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  SmartSplitter1.behave
		  ResizeBookLists
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  SmartSplitter1.behave
		  ResizeBookLists
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub BookSelected(newBook As Integer)
		  SendCommand ScripturePickerController.cmdSelectBook, newbook
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChangeBible(newBible As iBible)
		  //++
		  // Part of iScripturePicker Interface
		  //--
		  //
		  // Store the new bible
		  //
		  If newBible = Nil Then Return
		  MyBible = newBible
		  
		  //
		  // Build the version popup
		  //
		  Dim bibles() As String
		  bibles = BibleFactory.BibleList
		  bibles.Sort(AddressOf StringUtils.CompareHymnBookOrder)
		  pop_scr_version.DeleteAllRows
		  pop_scr_version.AddRows(bibles)
		  pop_scr_version.ListIndex = bibles.IndexOf(newBible.Name)
		  
		  //
		  // Load the lists from the new bible
		  //
		  RebuildBooklistListBoxes
		  
		  ActiveBible = newBible.Name
		  
		  ActiveBookNumber = -1
		  lst_scr_ot.ListIndex = -1
		  lst_scr_nt.ListIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChangePassage(bookNumber As Integer, chapterNumber As Integer, fromVerse As Integer, thruVerse As Integer)
		  // Part of the iScripturePicker interface.
		  //
		  // Callback indicating the selected passage has changed.
		  // Update controls accordingly
		  //
		  
		  //
		  // Validate before changing
		  //
		  
		  If MyBible = Nil Then Return
		  'If MyBible.ValidateCitation(bookNumber, chapterNumber, fromVerse, thruVerse) Then
		  SetSelection(bookNumber, chapterNumber, fromVerse, thruVerse)
		  If btn_insert.Visible Then btn_insert.Enabled = True
		  'End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChangeSecondaryPassage(passage As BiblePassage)
		  If passage = Nil Then
		    'Break
		    lst_scr_from_verse.SecondarySelection = -1
		    lst_scr_to_verse.SecondarySelection = -1
		    Return
		  End If
		  'Break
		  lst_scr_from_verse.SecondarySelection = passage.FromVerseNumber - 1
		  lst_scr_to_verse.SecondarySelection = passage.ThruVerseNumber - 1
		  
		  lst_scr_from_verse.Invalidate
		  lst_scr_to_verse.Invalidate
		  
		  UpdatePreview(passage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharsPerSlide() As Integer
		  Return Round(edt_scr_characters.Value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CharsPerSlide(characterCount As Integer)
		  If characterCount < 1 or characterCount > 1000 then Return
		  
		  If edt_scr_characters.Value <> characterCount Then
		    PropertiesUpdating = True
		    
		    edt_scr_characters.SetValue(characterCount)
		    
		    PropertiesUpdating = False
		    UpdatePreview
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseScripturePicker()
		  // Part of the iScripturePicker interface.
		  
		  Self.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(controller As ScripturePickerController, SetIsOpen As Boolean, Presenting As Boolean = False)
		  
		  // call the Window constructor, or Open events will not fire
		  Super.Window()
		  SetOpen = SetIsOpen
		  '++JRC
		  btn_add.Visible = SetOpen
		  btn_insert.Visible = Presenting
		  btn_live_backward.Visible = Presenting
		  btn_live_forward.Visible = Presenting
		  btn_live_backward.Enabled = False
		  btn_live_forward.Enabled = False
		  If SetOpen Then
		    SetDefaultButton(btn_add)
		  Else
		    SetDefaultButton(btn_copy)
		  End If
		  '--
		  
		  Try
		    SPController = controller
		    SPController.registerObserver Self
		  Catch e 
		    App.DebugWriter.Write CurrentMethodName, 1
		    App.DebugWriter.Write "Stack dump: "
		    App.DebugWriter.Write Join(RuntimeException(e).Stack, EndOfLine)
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentBookNumber() As Integer
		  If lst_scr_ot.ListIndex > -1 Then
		    Return lst_scr_ot.CellTag(lst_scr_ot.ListIndex, 0)
		  ElseIf lst_scr_nt.ListIndex > -1 Then
		    Return lst_scr_nt.CellTag(lst_scr_nt.ListIndex, 0)
		  End If
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentChapter() As Integer
		  Return lst_scr_chapter.ListIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentChapterNumber() As Integer
		  // Part of the iScripturePicker interface.
		  
		  Return lst_scr_chapter.ListIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentFromVerseIndex() As Integer
		  'Break
		  Return lst_scr_from_verse.ListIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentThruVerseIndex() As Integer
		  Return lst_scr_to_verse.ListIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  App.DebugWriter.Write "ScripturePickerWindow.Destructor"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableUI()
		  App.DebugWriter.Write "ScripturePickerWindow.DisableUI", 4
		  Return
		  //
		  // Disable all the controls on the window
		  //
		  
		  Dim count As Integer
		  Dim c As RectControl
		  count = Self.ControlCount - 1
		  
		  Self.MouseCursor = System.Cursors.Wait
		  '++JRC Disable the close button while generating scripture index, (bug #1642437)
		  CanClose = false
		  
		  For i As Integer = 0 To count
		    If Not (Self.Control(i) IsA RectControl) Then Continue
		    c = RectControl(Self.Control(i))
		    If c.Enabled Then
		      EnabledControls.Append c
		      c.Enabled = False
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableUI()
		  App.DebugWriter.Write "ScripturePickerWindow.EnableUI", 4
		  Return
		  Dim max As Integer
		  
		  '++JRC Index should now be generated, re-enanble close
		  CanClose = True
		  max = UBound(EnabledControls)
		  
		  For i As Integer = max DownTo 0
		    EnabledControls(i).Enabled = True
		    EnabledControls.Remove i
		  Next
		  Self.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindBookInListbox(bookNumber As Integer, bookControl As ListBox) As Integer
		  //
		  // Look through the listbox to find a matching book number in the CellTag
		  //
		  // Brute force, but simple
		  //
		  
		  Dim i, j As Integer
		  
		  If bookControl = Nil Then Return -1
		  
		  j = bookControl.ListCount - 1
		  For i = 0 To j
		    If bookControl.CellTag(i, 0) = bookNumber Then
		      Return i
		    End If
		  Next
		  
		  Return -1
		  
		  Catch ex
		    App.DebugWriter.Write "ScripturePicker.FindBookInListbox: caught a " + ex.ToString
		    Return -1
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatAsParagraph() As Boolean
		  // Part of the iScripturePicker interface.
		  
		  Return rad_format_paragraph.Value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FormatAsParagraph(useParagraphFormat As Boolean)
		  // Part of the iScripturePicker interface.
		  
		  PropertiesUpdating = True
		  rad_format_paragraph.Value = useParagraphFormat
		  rad_format_verse.Value = Not useParagraphFormat
		  
		  UpdatePreview
		  PropertiesUpdating = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LiveDisplayDone()
		  InLiveDisplay = False
		  If btn_add.Visible Then
		    SetDefaultButton(btn_add)
		  Else
		    SetDefaultButton(btn_copy)
		  End If
		  'Break
		  lst_scr_from_verse.SecondarySelection = -1
		  lst_scr_to_verse.SecondarySelection = -1
		  Self.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LiveMobility(backward As Boolean, forward As Boolean)
		  InLiveDisplay = True
		  btn_live_forward.Enabled = forward
		  btn_live_backward.Enabled = backward
		  SetDefaultButton(Nil)
		  //++
		  // Windows beeps at the user if the Return key is used to trigger default button
		  // and the focus isn't in the right place
		  //--
		  If forward Then
		    #If TargetWindows
		      btn_live_forward.SetFocus
		      'btn_insert.Enabled = False
		    #EndIf
		    SetDefaultButton(btn_live_forward)
		    #If TargetWindows
		      'btn_insert.Enabled = True
		    #EndIf
		  Else
		    #If TargetWindows
		      btn_insert.SetFocus
		    #EndIf
		    SetDefaultButton(btn_insert)
		  End If
		  Return
		  
		  'Dim f As Integer = EnabledControls.IndexOf(btn_live_forward)
		  'Dim b As Integer = EnabledControls.IndexOf(btn_live_backward)
		  'If EnabledControls.Ubound < 0 Then
		  'btn_live_forward.Enabled = forward
		  'btn_live_backward.Enabled = backward
		  'Else
		  'If forward Then
		  'If f < 0 Then
		  'EnabledControls.Append btn_live_forward
		  'End If
		  'Else
		  'If f > 0 Then
		  'EnabledControls.Remove f
		  'End If
		  'End If
		  '
		  'If back Then
		  'if b < 0 Then
		  'EnabledControls.Append btn_live_backward
		  'End If
		  'Else
		  'If b > 0 Then
		  'EnabledControls.Remove b
		  'End If
		  'End If
		  'End If
		  '
		  '
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PassageChanged()
		  Dim book, chap, fromV, toV As Integer
		  book = CurrentBookNumber
		  chap = CurrentChapter
		  fromV = CurrentFromVerseIndex
		  tov = CurrentThruVerseIndex
		  
		  Dim thePassage As New BiblePassage(CurrentBookNumber, CurrentChapter, CurrentFromVerseIndex, CurrentThruVerseIndex)
		  SendCommand ScripturePickerController.cmdSelectionChanged, thePassage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RebuildBooklistListboxes()
		  //
		  // Rebuild the OT & NT listboxes from the current bible
		  //
		  
		  //
		  // Clear old values
		  //
		  lst_scr_ot.DeleteAllRows
		  lst_scr_nt.DeleteAllRows
		  'lst_scr_chapter.DeleteAllRows
		  'lst_scr_from_verse.DeleteAllRows
		  'lst_scr_to_verse.DeleteAllRows
		  
		  Dim s() As String
		  Dim n() As Integer
		  
		  Dim i As Integer
		  Dim cnt As Integer
		  
		  cnt = MyBible.GetOTBooks(s, n) - 1
		  
		  For i = 0 To cnt
		    lst_scr_ot.AddRow s(i)
		    lst_scr_ot.CellTag(i, 0) = n(i)
		  Next
		  
		  ReDim s(-1)
		  ReDim n(-1)
		  
		  cnt = MyBible.GetNTBooks(s, n) - 1
		  
		  For i = 0 To cnt
		    lst_scr_nt.AddRow s(i)
		    lst_scr_nt.CellTag(i, 0) = n(i)
		  Next
		  
		  lst_scr_ot.ListIndex = -1
		  lst_scr_nt.ListIndex = -1
		  OldSel = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RebuildChapterListbox(bookNumber As Integer, chapterNumber As Integer)
		  Dim chapterCount As Integer
		  Dim curBook As Integer = lst_scr_chapter.ColumnTag(0).IntegerValue
		  If lst_scr_chapter.ColumnTag(0).IntegerValue = bookNumber Then Return
		  lst_scr_chapter.DeleteAllRows
		  chapterCount = MyBible.GetChapterCount(bookNumber)
		  For i As Integer = 1 To chapterCount
		    lst_scr_chapter.AddRow CStr(i)
		  Next
		  lst_scr_chapter.ColumnTag(0) = bookNumber
		  curBook = lst_scr_chapter.ColumnTag(0).IntegerValue
		  lst_scr_chapter.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RebuildVerseListboxes(bookNumber As Integer, chapterNumber As Integer)
		  Dim verseList() As String
		  Dim location() As String
		  location = Split(lst_scr_from_verse.ColumnTag(0).StringValue, "|")
		  If location.Ubound = 1 Then
		    If Val(location(0)) = bookNumber And Val(location(1)) = chapterNumber Then
		      Return
		    End If
		  End If
		  lst_scr_from_verse.DeleteAllRows
		  lst_scr_to_verse.DeleteAllRows
		  verseList = MyBible.GetVerseNumbers(bookNumber, chapterNumber)
		  For i As Integer = 0 To UBound(verseList)
		    lst_scr_from_verse.AddRow verseList(i)
		    lst_scr_to_verse.AddRow verseList(i)
		  Next
		  location.RemoveAll
		  location.Append CStr(bookNumber)
		  location.Append CStr(chapterNumber)
		  lst_scr_from_verse.ColumnTag(0) = Join(location, "|")
		  lst_scr_to_verse.ColumnTag(0) = Join(location, "|")
		  lst_scr_from_verse.Invalidate
		  lst_scr_to_verse.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ResizeBookLists()
		  //
		  // Add code to balance book lists
		  // The Lock... attributes for controls don't seem
		  // to be able to deal with two adjacent controls that need to resize equally
		  // when the window size changes
		  //
		  // Ed Palmer, October 2005
		  //
		  Dim listwidth As Integer
		  
		  listwidth = (grp_Books.Width / 2) - 11
		  lst_scr_nt.Left = lst_scr_ot.Left + listwidth + 5
		  lst_scr_ot.Width = listwidth
		  lst_scr_nt.Width = listwidth
		  
		  lbl_scr_nt.Left = lbl_scr_ot.Left + listwidth + 5
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SendCommand(command As String, parameter As Variant = Nil)
		  'App.DebugWriter.Write "ScripturePickerWindow.SendCommand: Sending " + command
		  
		  If Not IsNull(SPController) Then
		    SPController.CommandNotification(command, Self, parameter)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetDefaultButton(btn As PushButton)
		  Dim b As PushButton
		  
		  For i As Integer = 0 To Self.ControlCount - 1
		    If Self.Control(i) IsA PushButton Then
		      b = PushButton(Self.Control(i))
		      b.Default = False
		    End If
		  Next
		  Self.Invalidate
		  DefaultButton = btn
		  If DefaultButton = Nil Then Return
		  
		  //++
		  // If there is a live display in progress, do not allow the default button to
		  // shift out of the live display controls.
		  //--
		  If InLiveDisplay And (DefaultButton <> btn_live_forward And DefaultButton <> btn_Insert) Then
		    If btn_live_forward.Enabled Then
		      DefaultButton = btn_live_forward
		    Else
		      DefaultButton = btn_insert
		    End If
		  End If
		  
		  DefaultButton.Default = True
		  Self.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSearchResult(verse as String)
		  dim parts(), bookName as String
		  Dim book, chap, ver, x as Integer
		  
		  '++JRC Prevent NilObjectException
		  If App.MyBible = Nil Then Return
		  
		  parts= verse.split(" ")
		  
		  'combine all parts of the book name
		  bookName=parts(0)
		  for x=1 to UBound(parts)-1
		    bookName= bookName+" "+parts(x)
		  next x
		  
		  book= Bible(App.MyBible).GetBookNum(bookName)-1
		  
		  parts= parts(UBound(parts)).split(":")
		  chap=Val(parts(0))-1
		  ver=Val(parts(1))-1
		  
		  if (book<lst_scr_ot.ListCount) then
		    lst_scr_ot.ListIndex= book
		    lst_scr_nt.ListIndex=-1
		  else
		    lst_scr_nt.ListIndex= book- lst_scr_ot.ListCount
		    lst_scr_ot.ListIndex=-1
		  end if
		  
		  lst_scr_chapter.ListIndex=chap
		  lst_scr_to_verse.ListIndex = ver
		  'Break
		  lst_scr_from_verse.ListIndex = ver
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetSelection(bookNumber As Integer, chapterNumber As Integer, fromVerse As Integer, toVerse As Integer)
		  Dim bookIndex As Integer = -1
		  Dim bookControl As Listbox = Nil
		  Dim notBookControl As Listbox = Nil
		  
		  PropertiesUpdating = True
		  bookIndex = FindBookInListbox(bookNumber, lst_scr_ot)
		  If bookIndex >= 0 Then
		    bookControl = lst_scr_ot
		    notBookControl = lst_scr_nt
		  Else
		    bookIndex = FindBookInListbox(bookNumber, lst_scr_nt)
		    If bookIndex >= 0 Then bookControl = lst_scr_nt
		    notBookControl = lst_scr_ot
		  End If
		  
		  If bookControl = Nil Then
		    App.DebugWriter.Write "ScripturePickerWindow.SetSelection: couldn't find book " + CStr(bookNumber)
		    Return
		  End If
		  
		  //
		  // Was this a change? If so, rebuild chapter and verse listboxes
		  //
		  
		  RebuildChapterListbox(bookNumber, chapterNumber)
		  RebuildVerseListboxes(bookNumber, chapterNumber)
		  
		  ActiveBookNumber = bookNumber
		  bookControl.ListIndex = bookIndex
		  notBookControl.ListIndex = -1
		  
		  ActiveChapterNumber = chapterNumber - 1
		  ActiveFromVerse = fromVerse - 1
		  ActiveThruVerse = toVerse - 1
		  
		  lst_scr_chapter.ListIndex = ActiveChapterNumber
		  lst_scr_from_verse.ListIndex = ActiveFromVerse
		  lst_scr_to_verse.ListIndex = ActiveThruVerse
		  
		  UpdatePreview
		  PropertiesUpdating = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowVerseNumbers() As Boolean
		  // Part of the iScripturePicker interface.
		  Return chk_shownumbers.Value
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowVerseNumbers(show As Boolean)
		  PropertiesUpdating = True
		  chk_shownumbers.Value = show
		  
		  UpdatePreview
		  PropertiesUpdating = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdatePreview(passage As BiblePassage = Nil)
		  Dim verses() As String
		  Dim sep As String
		  
		  If MyBible Is Nil Then Return
		  If passage = Nil Then
		    passage = New BiblePassage(CurrentBookNumber, CurrentChapter, CurrentFromVerseIndex, CurrentThruVerseIndex)
		  End If
		  
		  verses = MyBible.GetPassage(passage.BookNumber, passage.ChapterNumber, passage.FromVerseNumber, passage.ThruVerseNumber, chk_shownumbers.Value)
		  
		  If rad_format_paragraph.Value Then
		    sep = " "
		  ElseIf rad_format_verse.Value Then
		    sep = EndOfLine
		  End If
		  
		  '++JRC Add support for displaying the same verse from 2 bibles versions (thanks Ovidiu).
		  'edt_preview.Text = Join(verses, sep)
		  edt_preview.Text = ReplaceAll(Join(verses, sep),"|", Chr(10))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VersesPerSlide() As Integer
		  // Part of the iScripturePicker interface.
		  Return pop_scr_verses.ListIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VersesPerSlide(verseCount As Integer)
		  If verseCount < 1 Or verseCount > 5 Then Return
		  PropertiesUpdating = True
		  
		  pop_scr_verses.ListIndex = verseCount - 1
		  
		  UpdatePreview
		  PropertiesUpdating = False
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		#tag Note
			Used by pop_scr_version.Change to determine if a change has occurred.
		#tag EndNote
		Private ActiveBible As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used by Change events of lst_scr_ot and lst_scr_nt to determine if a change has occurred.
		#tag EndNote
		Private ActiveBookNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used by lst_scr_chapter.Change to determine if a change has occurred.
		#tag EndNote
		Private ActiveChapterNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used by lst_scr_from_verse to determine if a value change has occurred
		#tag EndNote
		Private ActiveFromVerse As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used by lst_scr_to_verse to determine if a value change has occurred
		#tag EndNote
		Private ActiveThruVerse As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CanClose As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultButton As PushButton = Nil
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			Used by EnableUI/DisableUI to store the controls affected
		#tag EndNote
		Protected EnabledControls() As RectControl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InLiveDisplay As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			If True, indicates the window is opened from a presentation.
			If False, indicates the window is opened from an editor.
		#tag EndNote
		#tag Getter
			Get
			  Return PresentationIsRunning
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  btn_insert.Visible = value
			  btn_insert.Enabled = value
			  PresentationIsRunning = value
			End Set
		#tag EndSetter
		Live As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected MyBible As iBible
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldSel As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PresentationIsRunning As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PresentMode As String
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			Flag to controls that a programmatic update is in progress,
			not one triggered by direct user interaction
		#tag EndNote
		Protected PropertiesUpdating As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SetOpen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SPController As ScripturePickerController
	#tag EndProperty


#tag EndWindowCode

#tag Events edt_quick_lookup
	#tag Event
		Sub GotFocus()
		  btn_quick_lookup.Enabled = (Me.Text.Len > 0)
		  If Me.Text.Len > 0 Then
		    SetDefaultButton(btn_quick_lookup)
		  Else
		    SetDefaultButton(btn_add)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim c As New Clipboard
		  Dim ret As Boolean = False
		  'If Asc(Key) = 13 Or Asc(Key) = 10 Then
		  'Lookup edt_quick_lookup.Text
		  'Return True
		  'End If
		  
		  if strComp(Key, Chr(CTRL_V), 0) = 0 then 'ctrl-v
		    if c.TextAvailable then
		      edt_quick_lookup.Text = c.Text
		      ret = True
		    end if
		  end if
		  
		  c.close
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  btn_quick_lookup.Default = False
		  SetDefaultButton(btn_add)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  btn_quick_lookup.Enabled = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  btn_quick_lookup.Enabled = (Me.Text.Len > 0)
		  If Me.Text.Len > 0 Then
		    SetDefaultButton(btn_quick_lookup)
		  Else
		    SetDefaultButton(btn_add)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_quick_lookup
	#tag Event
		Sub Action()
		  Try
		    SendCommand(ScripturePickerController.cmdQuickLookup, edt_quick_lookup.Text)
		  Catch e As BibleRefException
		    InputBox.Message e.Message
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_add
	#tag Event
		Sub Action()
		  If Val(edt_scr_characters.Text) < 1 Or Val(edt_scr_characters.Text) > 1000 Then
		    InputBox.Message App.T.Translate("errors/chars_per_slide")
		    CharsPerSlide(500)
		    'TODO: Should we return here or use the default value and add the scripture?
		    Return
		  End If
		  SendCommand ScripturePickerController.cmdFormatChanged
		  
		  SendCommand ScripturePickerController.cmdAddToSet
		  SetDefaultButton(Me)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_done
	#tag Event
		Sub Action()
		  App.DebugWriter.Write "ScripturePickerWindow.btn_done.Action"
		  'TODO: determine if we should  save the values when the user presses the Done button
		  
		  If Val(edt_scr_characters.Text) < 1 Or  Val(edt_scr_characters.Text) > 1000 Then
		    CharsPerSlide(500)
		  End If
		  SendCommand ScripturePickerController.cmdFormatChanged
		  
		  SendCommand ScripturePickerController.cmdDone
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_insert
	#tag Event
		Sub Action()
		  SendCommand ScripturePickerController.cmdLiveDisplay
		  SetDefaultButton(DefaultButton)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_search
	#tag Event
		Sub Action()
		  SendCommand(ScripturePickerController.cmdSearch)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_scr_ot
	#tag Event
		Sub Change()
		  If Me.ListIndex = -1 Then Return
		  If Me.CellTag(Me.ListIndex, 0) = ActiveBookNumber Then Return
		  lst_scr_nt.ListIndex = -1
		  BookSelected(Me.CellTag(Me.ListIndex, 0))
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_scr_nt
	#tag Event
		Sub Change()
		  If Me.ListIndex = -1 Then Return
		  If Me.CellTag(Me.ListIndex, 0) = ActiveBookNumber Then Return
		  lst_scr_ot.ListIndex = -1
		  BookSelected(Me.CellTag(Me.ListIndex, 0))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_scr_chapter
	#tag Event
		Sub Change()
		  If Me.ListIndex = -1 Then Return
		  If Me.ListIndex = ActiveChapterNumber Then Return
		  
		  PassageChanged
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.ColumnCount = Max(Me.ColumnCount, 1)
		  Me.ColumnTag(0) = -1 
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_scr_version
	#tag Event
		Sub Change()
		  If pop_scr_version.Text = ActiveBible Then Return
		  SendCommand "selectbible", pop_scr_version.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_scr_verses
	#tag Event
		Sub Change()
		  If PropertiesUpdating Then Return
		  SendCommand ScripturePickerController.cmdFormatChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_format_paragraph
	#tag Event
		Sub Action()
		  If PropertiesUpdating Then Return
		  SendCommand ScripturePickerController.cmdFormatChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_format_verse
	#tag Event
		Sub Action()
		  If PropertiesUpdating Then Return
		  SendCommand ScripturePickerController.cmdFormatChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_shownumbers
	#tag Event
		Sub Action()
		  If PropertiesUpdating Then Return
		  SendCommand ScripturePickerController.cmdFormatChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_scr_from_verse
	#tag Event
		Sub Change()
		  If PropertiesUpdating Then Return
		  If Me.ListIndex = -1 Then Return
		  
		  Dim newSel As Integer
		  newSel = Me.ListIndex
		  
		  If newSel = ActiveFromVerse Then Return
		  
		  ActiveFromVerse = newSel
		  If newSel > ActiveThruVerse Then
		    ActiveThruVerse = newSel
		    lst_scr_to_verse.ListIndex = newSel
		  End If
		  
		  PassageChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_scr_to_verse
	#tag Event
		Sub Change()
		  If PropertiesUpdating Then Return
		  If Me.ListIndex = -1 Then Return
		  
		  Dim NewSel As Integer
		  NewSel = Me.ListIndex
		  
		  If NewSel = ActiveThruVerse Then Return
		  ActiveThruVerse = NewSel
		  
		  // If a value less than ActiveFromVerse is selected, move it also
		  If NewSel < ActiveFromVerse Then
		    ActiveFromVerse = NewSel // Set first to keep Change from firing
		    'Break
		    lst_scr_from_verse.ListIndex = NewSel
		  End If
		  
		  PassageChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_preview
	#tag Event
		Sub TextChange()
		  If Len(Me.Text) > 0 Then
		    btn_copy.Enabled = true
		  Else
		    btn_copy.Enabled = false
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_scr_characters
	#tag Event
		Sub ValueChange()
		  If PropertiesUpdating Then Return
		  SendCommand ScripturePickerController.cmdFormatChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_copy
	#tag Event
		Sub Action()
		  If Len(edt_preview.Text) > 0 Then
		    Dim c As New Clipboard
		    
		    c.SetText(SPController.BuildCitation() + EndOfLine  + edt_preview.Text.FormatLocalEndOfLine)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_live_forward
	#tag Event
		Sub Action()
		  SendCommand ScripturePickerController.cmdLiveForward
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SmartSplitter1
	#tag Event
		Sub Open()
		  Me.attach(grp_books)
		  Me.attach(lst_scr_chapter)
		  Me.attach(lst_scr_from_verse)
		  Me.attach(lst_scr_to_verse)
		  Me.attach(lbl_src_preview)
		  Me.attach(edt_preview)
		  
		  Me.setAttachedControlShouldResize(edt_preview,True)
		  Me.StopAtMinOffset = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_live_backward
	#tag Event
		Sub Action()
		  SendCommand ScripturePickerController.cmdLiveBackward
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
		Name="CanClose"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		Name="Live"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
