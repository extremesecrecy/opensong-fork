#tag Window
Begin Window StyleTabsWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   310
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Tabulators Editor"
   Visible         =   True
   Width           =   680
   Begin GroupBox grp_tabs
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Tabulators"
      Enabled         =   True
      Height          =   276
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   358
      Begin HighlightList lst_tabs
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   3
         ColumnsResizable=   False
         ColumnWidths    =   "25, 85, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   203
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "grp_tabs"
         InitialValue    =   ""
         Italic          =   False
         Left            =   24
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SecondarySelection=   -1
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   39
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   110
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin GroupBox grp_tabs_properties
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Properties"
         Enabled         =   True
         Height          =   203
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_tabs"
         Italic          =   False
         Left            =   156
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   39
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   192
         Begin Label lbl_position
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   164
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
            Text            =   "Position"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   58
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   85
         End
         Begin SEditFieldNumeric edt_position
            AcceptTabs      =   False
            Alignment       =   3
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
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   251
            LimitText       =   0
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Maximum         =   0.0
            Minimum         =   0.0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollbarVertical=   True
            SignalRangeErrors=   False
            Styled          =   False
            TabIndex        =   1
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   58
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   38
         End
         Begin UpDownArrows ud_tabs_position
            AcceptFocus     =   False
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   23
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Left            =   289
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   0
            TabStop         =   True
            Top             =   58
            Transparent     =   False
            Visible         =   True
            Width           =   13
         End
         Begin Label txt_props_pixels
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   306
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "px"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   58
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   40
         End
         Begin Label lbl_align
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   164
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Alignment"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   84
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   142
         End
         Begin RadioButton edt_left
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Left"
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   164
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
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   108
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   85
         End
         Begin RadioButton edt_middle
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Middle"
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   164
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
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   131
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   85
         End
         Begin RadioButton edt_right
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Right"
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   164
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   0
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   154
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   85
         End
         Begin RadioButton edt_char
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "At character"
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   164
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   0
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   177
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   106
         End
         Begin SEditField edt_alignchar
            AcceptTabs      =   False
            Alignment       =   2
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
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   281
            LimitText       =   1
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollbarVertical=   True
            Styled          =   False
            TabIndex        =   9
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   177
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   25
         End
         Begin PushButton btn_apply
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   "0"
            Cancel          =   False
            Caption         =   "Appl&y"
            Default         =   False
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grp_tabs_properties"
            Italic          =   False
            Left            =   164
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   10
            TabPanelIndex   =   0
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   203
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   90
         End
      End
      Begin PushButton btn_new
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "&New"
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_tabs"
         Italic          =   False
         Left            =   24
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   254
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btn_remove
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "&Remove"
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_tabs"
         Italic          =   False
         Left            =   121
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   254
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushButton btn_removeall
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Remove &All"
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_tabs"
         Italic          =   False
         Left            =   238
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   254
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   110
      End
   End
   Begin Label lbl_style_preview
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   380
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Preview:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   280
   End
   Begin SBufferedCanvas can_style_preview
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   220
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   380
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   36
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   280
   End
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
      Left            =   468
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   268
      Transparent     =   False
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
      Left            =   570
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   268
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  App.T.TranslateWindow Me, "style_tabs", App.TranslationFonts
		  App.CenterInControlScreen Me
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AlignmentDescription(tab As StyleTabsType) As String
		  Dim descr As String
		  
		  descr = ""
		  
		  Select Case tab.align
		  Case StyleHAlignEnum.Left
		    descr = App.T.Translate("/style_tabs/properties/left/@caption")
		  Case StyleHAlignEnum.Middle
		    descr = App.T.Translate("/style_tabs/properties/middle/@caption")
		  Case StyleHAlignEnum.Right
		    descr = App.T.Translate("/style_tabs/properties/right/@caption")
		  Case StyleHAlignEnum.Char
		    descr = App.T.Translate("/style_tabs/properties/char/@caption")
		    descr = descr + " " + self.currentTab.alignChar
		  End Select
		  
		  return descr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DisableEditControls()
		  self.currentTab.Position = 0
		  self.currentTab.align = StyleHAlignEnum.Left
		  self.currentTab.alignChar = ""
		  
		  grp_tabs_properties.Enabled = False
		  edt_position.setString("")
		  edt_alignchar.Text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Edit(style As SlideStyle, slide As XmlNode) As Boolean
		  self.editStyle = style
		  self.previewSlideNode = slide
		  
		  lst_tabs.SortedColumn = 0
		  lst_tabs.ColumnSortDirection(0) = ListBox.SortAscending
		  DisableEditControls()
		  
		  self.isUpdatingUI = True
		  self.isUpdatingPreview = True
		  LoadValues
		  self.isUpdatingPreview = False
		  self.isUpdatingUI = False
		  UpdatePreview
		  
		  
		  self.ReturnValue = False
		  ShowModalWithin(MainWindow)
		  Return self.ReturnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadValues()
		  Dim i As Integer
		  Dim tab As StyleTabsType
		  
		  lst_tabs.DeleteAllRows()
		  For i = 0 to self.editStyle.BodyTabCount()-1
		    tab = self.editStyle.BodyTabGet(i)
		    
		    lst_tabs.AddRow cStr(tab.Position)
		    lst_tabs.Cell(lst_tabs.LastIndex, 1) = AlignmentDescription(tab)
		    lst_tabs.Cell(lst_tabs.LastIndex, 2) = tab.StringValue(true)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdatePreview()
		  Dim i As Integer
		  Dim tab As StyleTabsType
		  
		  if not isUpdatingPreview then
		    isUpdatingPreview = True
		    
		    self.editStyle.BodyTabClear()
		    
		    For i = 0 To lst_tabs.ListCount()-1
		      tab.StringValue(true) = lst_tabs.Cell(i, 2)
		      self.editStyle.BodyTabAdd(tab)
		    Next
		    
		    can_style_preview.Repaint()
		    
		    isUpdatingPreview = False
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private currentTab As StyleTabsType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private editStyle As SlideStyle
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isUpdatingPreview As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isUpdatingUI As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private previewSlideNode As XmlNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ReturnValue As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events lst_tabs
	#tag Event
		Sub Change()
		  self.isUpdatingUI = True
		  
		  If Me.ListIndex > -1 Then
		    grp_tabs_properties.Enabled = True
		    self.currentTab.StringValue(true) = Me.Cell(Me.ListIndex, 2)
		    
		    edt_alignchar.Enabled = False
		    edt_alignchar.Text = ""
		    edt_position.SetValue(self.currentTab.Position)
		    Select Case self.currentTab.align
		    Case StyleHAlignEnum.Left
		      edt_left.Value = True
		    Case StyleHAlignEnum.Middle
		      edt_middle.Value = True
		    Case StyleHAlignEnum.Right
		      edt_right.Value = True
		    Case StyleHAlignEnum.Char
		      edt_alignchar.Enabled = True
		      edt_char.Value = True
		      edt_alignchar.Text = self.currentTab.alignChar
		    End Select
		  Else
		    DisableEditControls()
		  End If
		  UpdatePreview()
		  
		  self.isUpdatingUI = False
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  Dim resultType As Boolean
		  Dim tab1, tab2 As StyleTabsType
		  
		  If column = 0 Then
		    resultType = True
		    tab1.StringValue(true) = Me.Cell(row1, 2)
		    tab2.StringValue(true) = Me.Cell(row2, 2)
		    
		    If tab1.Position > tab2.Position Then
		      result = 1
		    ElseIf tab1.Position < tab2.Position Then
		      result = -1
		    Else
		      result = 0
		    End If
		  Else
		    resultType = False
		  End If
		  
		  return resultType
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_position
	#tag Event
		Sub TextChange()
		  If edt_position.Value < 0 Then edt_position.SetValue(0)
		  
		  If Not self.isUpdatingUI And edt_position.Value <> self.currentTab.Position Then
		    self.currentTab.Position = edt_position.Value
		    
		    lst_tabs.Cell(lst_tabs.ListIndex, 0) = cStr(self.currentTab.Position)
		    lst_tabs.Cell(lst_tabs.ListIndex, 2) = self.currentTab.StringValue(true)
		    
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ud_tabs_position
	#tag Event
		Sub Up()
		  dim i as Integer
		  
		  i = edt_position.Value
		  if not edt_position.EnforceRange or  i<edt_position.Maximum then
		    i = i + 1
		  end if
		  edt_position.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  dim i as Integer
		  
		  i = edt_position.Value
		  if not edt_position.EnforceRange or  i>edt_position.Minimum then
		    i = i - 1
		  end if
		  edt_position.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_left
	#tag Event
		Sub Action()
		  If Not self.isUpdatingUI And Me.Active Then
		    edt_alignchar.Enabled = False
		    
		    If self.currentTab.align <> StyleHAlignEnum.Left Then
		      self.currentTab.align = StyleHAlignEnum.Left
		      
		      lst_tabs.Cell(lst_tabs.ListIndex, 1) = AlignmentDescription(self.currentTab)
		      lst_tabs.Cell(lst_tabs.ListIndex, 2) = self.currentTab.StringValue(true)
		      
		      UpdatePreview
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_middle
	#tag Event
		Sub Action()
		  If Not self.isUpdatingUI And Me.Active Then
		    edt_alignchar.Enabled = False
		    
		    If self.currentTab.align <> StyleHAlignEnum.Middle Then
		      self.currentTab.align = StyleHAlignEnum.Middle
		      
		      lst_tabs.Cell(lst_tabs.ListIndex, 1) = AlignmentDescription(self.currentTab)
		      lst_tabs.Cell(lst_tabs.ListIndex, 2) = self.currentTab.StringValue(true)
		      
		      UpdatePreview
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_right
	#tag Event
		Sub Action()
		  If Not self.isUpdatingUI And Me.Active Then
		    edt_alignchar.Enabled = False
		    
		    If self.currentTab.align <> StyleHAlignEnum.Right Then
		      self.currentTab.align = StyleHAlignEnum.Right
		      
		      lst_tabs.Cell(lst_tabs.ListIndex, 1) = AlignmentDescription(self.currentTab)
		      lst_tabs.Cell(lst_tabs.ListIndex, 2) = self.currentTab.StringValue(true)
		      
		      UpdatePreview
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_char
	#tag Event
		Sub Action()
		  If Not self.isUpdatingUI And Me.Active Then
		    edt_alignchar.Enabled = True
		    
		    If self.currentTab.align <> StyleHAlignEnum.Char Then
		      self.currentTab.align = StyleHAlignEnum.Char
		      
		      lst_tabs.Cell(lst_tabs.ListIndex, 1) = AlignmentDescription(self.currentTab)
		      lst_tabs.Cell(lst_tabs.ListIndex, 2) = self.currentTab.StringValue(true)
		      
		      UpdatePreview
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_alignchar
	#tag Event
		Sub TextChange()
		  If Not self.isUpdatingUI And self.currentTab.alignChar <> Me.Text Then
		    self.currentTab.alignChar = Me.Text
		    
		    lst_tabs.Cell(lst_tabs.ListIndex, 1) = AlignmentDescription(self.currentTab)
		    lst_tabs.Cell(lst_tabs.ListIndex, 2) = self.currentTab.StringValue(true)
		    
		    UpdatePreview
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_apply
	#tag Event
		Sub Action()
		  If Not self.isUpdatingUI Then
		    self.currentTab.Position = edt_position.Value
		    If edt_left.Value Then
		      self.currentTab.align = StyleHAlignEnum.Left
		    ElseIf edt_middle.Value Then
		      self.currentTab.align = StyleHAlignEnum.Middle
		    ElseIf edt_right.Value Then
		      self.currentTab.align = StyleHAlignEnum.Right
		    ElseIf edt_char.Value Then
		      self.currentTab.align = StyleHAlignEnum.Char
		    End If
		    self.currentTab.alignChar = edt_alignchar.Text
		    
		    lst_tabs.Cell(lst_tabs.ListIndex, 0) = cStr(self.currentTab.Position)
		    lst_tabs.Cell(lst_tabs.ListIndex, 2) = self.currentTab.StringValue(true)
		    
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_new
	#tag Event
		Sub Action()
		  Dim tab As StyleTabsType
		  
		  tab.Position = 0
		  tab.align = StyleHAlignEnum.Left
		  tab.alignChar = ""
		  
		  lst_tabs.AddRow cStr(tab.Position)
		  lst_tabs.Cell(lst_tabs.LastIndex, 1) = AlignmentDescription(tab)
		  lst_tabs.Cell(lst_tabs.LastIndex, 2) = tab.StringValue(true)
		  
		  lst_tabs.ListIndex = lst_tabs.LastIndex
		  edt_position.SetFocus()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_remove
	#tag Event
		Sub Action()
		  If lst_tabs.ListIndex > -1 Then
		    lst_tabs.RemoveRow lst_tabs.ListIndex
		    
		    UpdatePreview()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_removeall
	#tag Event
		Sub Action()
		  lst_tabs.DeleteAllRows
		  DisableEditControls()
		  UpdatePreview()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_style_preview
	#tag Event
		Sub Paint(g As Graphics)
		  Dim zoom as Double
		  Dim realBorder as Double
		  Dim i as Integer
		  Dim tab As StyleTabsType
		  Dim margins As StyleMarginType
		  
		  SetML.DrawSlide g, _
		  self.previewSlideNode, _
		  self.editStyle
		  g.ForeColor = DarkBevelColor
		  g.DrawRect 0, 0, g.Width, g.Height
		  
		  zoom = g.Width / 640.0
		  RealBorder = g.Width / 50
		  
		  margins = self.editStyle.BodyMargins()
		  
		  'draw lines indicating the tabstops
		  For i = 0 to self.editStyle.BodyTabCount() - 1
		    tab = self.editStyle.BodyTabGet(i)
		    If tab.Position = self.currentTab.Position Then
		      g.ForeColor = RGB(0, 255, 0) 'Bright Green - a color that is not likely to be used in a background...
		    Else
		      g.ForeColor = RGB(255, 0, 255) 'Magenta - a color that is not likely to be used in a background...
		    End If
		    
		    g.DrawLine(((margins.Left + tab.Position) * zoom) + RealBorder, _
		    (margins.Top * zoom) + RealBorder, _
		    ((margins.Left + tab.Position) * Zoom) + RealBorder, _
		    g.Height - (margins.Bottom * zoom) - RealBorder)
		  Next
		  
		  
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
#tag Events btn_cancel
	#tag Event
		Sub Action()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
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
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
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
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
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
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
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
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
