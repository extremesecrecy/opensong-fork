#tag Window
Begin Window PresentHelperWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   480
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   480
   MinimizeButton  =   True
   MinWidth        =   530
   Placement       =   0
   Resizeable      =   True
   Title           =   "Presentation Helper"
   Visible         =   True
   Width           =   800
   Begin ListBox lst_all_slides
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   "27%,8%,65%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   194
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   10
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   617
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin GroupBox grp_presentation_modes
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Mode"
      Enabled         =   True
      Height          =   180
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   639
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   5
      Underline       =   False
      Visible         =   True
      Width           =   150
      Begin SButton btn_mode_normal
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_modes"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   25
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_black
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_modes"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   50
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_white
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_modes"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   75
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_hidden
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_modes"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   100
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_logo
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_modes"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   125
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_mode_frozen
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_modes"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   150
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
   End
   Begin Canvas cnv_preview
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      Height          =   249
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   226
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   332
   End
   Begin Label txt_shortcut_keys
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   142
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   526
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "- Arrows: -\r\nDown: Next Slide\r\nUp: Previous Slide\r\nRight: Next Section\r\nLeft: Previous Section\r\n- Jump To: -\r\n1-9: Verse\r\nC: Chorus\r\nP: Pre-chorus\r\nB: Bridge\r\nT: Tag"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   212
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   101
   End
   Begin GroupBox grp_presentation_actions
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Actions"
      Enabled         =   True
      Height          =   155
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   639
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   190
      Underline       =   False
      Visible         =   True
      Width           =   150
      Begin SButton btn_action_alert
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_actions"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   210
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_action_quick_song
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_actions"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   235
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_action_scripture
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_actions"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   260
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_action_full_screen
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_actions"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   285
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin SButton btn_action_return
         AcceptFocus     =   False
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
         InitialParent   =   "grp_presentation_actions"
         LabelAlign      =   0
         Left            =   649
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuItem        =   ""
         Scope           =   0
         StickyBevel     =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   310
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
   End
   Begin TextArea edt_slide_notes
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   True
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   115
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   354
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   358
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   435
   End
   Begin Canvas cnv_preview_next
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      Height          =   120
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   354
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   226
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   160
   End
   Begin Label lbl_preview
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
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Current slide preview"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   204
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   332
   End
   Begin Label lbl_preview_next
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
      Left            =   354
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Next slide preview"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   204
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  App.DebugWriter.Write "Begin PresentHelperWindow.Activate:"
		  Dim i As Integer
		  Dim w As Window
		  If Globals.Status_Presentation And Not PresentWindow.Visible Then PresentWindow.Show
		  If PresentWindow.Visible And Not PresentWindow.ExternalSlideWait Then App.ShowWin(PresentWindow, App.SW_SHOWNA)
		  For i = 0 To WindowCount - 1
		    w = Window(i)
		    If w.Visible Then
		      If Not w IsA PresentWindow Then
		        If Not (w Is self) Then
		          App.DebugWriter.Write "SetForeground for window " + Str(i) + " " + w.Title
		          App.SetForeground(w)
		          If w.Focus = Nil Then
		            App.DebugWriter.Write "Set Focus in Window " + w.Title
		            w.FocusNext
		            If w.Focus = Nil Then
		              App.DebugWriter.Write "... still no control has focus"
		            Else
		              App.DebugWriter.Write "... control " + w.Focus.Name + " has focus now"
		            End If
		          End If
		        End If
		        Exit
		      End If
		    End If
		  Next
		  App.DebugWriter.Write "End PresentHelperWindow.Activate:"
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If MainWindow.Status_Presentation And Not appQuitting Then Return True
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return PresentWindow.KeyDownX(Key)
		End Function
	#tag EndEvent

	#tag Event
		Sub Maximize()
		  //++
		  // OSX triggers this on Zoom, which may not be to the full screen if in
		  // preview mode.
		  //--
		  SavePos
		  IsMaximized = True
		  SetFullScreen
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim marginLeft As Integer
		  
		  App.T.TranslateWindow Me, "presentation_helper", App.TranslationFonts
		  txt_shortcut_keys.Text = App.T.Translate("presentation_helper/keys")
		  
		  
		  Dim screenWidth As Double = OSScreen(PresentWindow.PresentScreen).Width
		  Dim screenHeight As Double =  OSScreen(PresentWindow.PresentScreen).Height
		  m_screenRatio = screenWidth / screenHeight
		  
		  Dim setName As String
		  setName = SmartML.GetValue(PresentWindow.CurrentSet.DocumentElement, "@name", False).Trim
		  If setName <> "" Then
		    Self.Title = Self.Title + " - " + setName
		  End If
		  
		  btn_action_scripture.Enabled = BibleFactory.HasBible
		  
		  If SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "monitors/@force_4_3_preview", False, False) Then
		    If m_screenRatio > 1.0 Then
		      m_screenRatio = 4.0/3.0
		    Else
		      m_screenRatio = 3.0/4.0
		    End If
		  End If
		  
		  If SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "monitors/@force_16_9_preview", False, False) Then
		    If m_screenRatio > 1.0 Then
		      m_screenRatio = 16.0/9.0
		    Else
		      m_screenRatio = 9.0/16.0
		    End If
		  End If
		  
		  cnv_preview.Width = cnv_preview.Height * m_screenRatio
		  marginLeft = cnv_preview.Left + cnv_preview.Width + 10
		  Me.MinWidth = marginLeft + grp_presentation_actions.Width + 10
		  
		  cnv_preview_next.Left = marginLeft
		  lbl_preview_next.Left = marginLeft
		  txt_shortcut_keys.Left = marginLeft + lbl_preview_next.Width + 10
		  edt_slide_notes.Left = marginLeft
		  
		  ResizePreview()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  '++JRC: Recalc whenever window is resized
		  RecalcLstAllSlidesColumnWidths
		  ResizePreview()
		  Refresh
		  '--
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  ResizePreview()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  IsMaximized = False
		  SetNormalScreen
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub InsertItem(slide As XmlNode, index As Integer, forceSeparator As Boolean = False)
		  Dim NamesEqual As Boolean = True
		  Dim TagsEqual As Boolean = True //++EMP 15 Jan 06
		  
		  If index >= lst_all_slides.ListCount Then
		    lst_all_slides.AddRow SmartML.GetValue(slide.Parent.Parent, "@name", True)
		    index = lst_all_slides.ListCount - 1
		    'index = index - 1
		  Else
		    lst_all_slides.InsertRow index, SmartML.GetValue(slide.Parent.Parent, "@name", True)
		  End If
		  
		  lst_all_slides.CellTag(index, 0) = SmartML.GetValue(slide.Parent.Parent, "@type", True)  //++EMP 15 Jan 06
		  
		  lst_all_slides.CellBold(index,1) = SmartML.GetValueB(slide, "@emphasize", False) _
		  And SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "default_style/body/@highlight_chorus", True, True) 'EMP 12/05
		  
		  lst_all_slides.Cell(index,1) = SmartML.GetValue(slide, "@id", False)
		  lst_all_slides.CellAlignment(index, 1) = ListBox.AlignCenter
		  Select Case SmartML.GetValue(slide.Parent.Parent, "@type", False)
		  Case "image", "external"
		    lst_all_slides.Cell(index,2) = Trim(SmartML.GetValue(slide, "description", True)).CleanSpaces
		  Case "custom"
		    Dim s As String
		    s = Join(Array(SmartML.GetValue(slide.Parent.Parent, "title", False),SmartML.GetValue(slide.Parent.Parent, "subtitle", False),SmartML.GetValue(slide, "body", True))," ")
		    lst_all_slides.Cell(index,2) = Trim(s).Translate(StringUtils.WhiteSpaces+Chr(9)," ").CleanSpaces
		  Else
		    lst_all_slides.Cell(index,2) = ReplaceAll(ReplaceAll(Trim(SmartML.GetValue(slide, "body", True)), Chr(10), " "), Chr(9), " ").CleanSpaces
		  End Select
		  //++EMP 15 Jan 06
		  // Put in separator lines if either the name and celltags differ
		  If Index > 0 Then
		    NamesEqual = lst_all_slides.Cell(index, 0) = lst_all_slides.Cell(index - 1, 0)
		    TagsEqual = lst_all_slides.CellTag(index, 0) = lst_all_slides.CellTag(index - 1, 0)
		  End If
		  //--
		  If index = 0 Or _
		    (index > 0 And Not (TagsEqual And NamesEqual)) Or _
		    forceSeparator Then
		    lst_all_slides.CellBorderTop(index, 0) = 4
		    lst_all_slides.CellBorderTop(index, 1) = 4
		    lst_all_slides.CellBorderTop(index, 2) = 4
		  End If
		  
		  If slide.NextSibling = Nil And SmartML.GetValueB(slide.Parent.Parent, "@loop") Then
		    lst_all_slides.Cell(index, 2) = "(" + App.T.Translate("presentation_helper/loop/@caption") + ") " + lst_all_slides.Cell(index, 2)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RecalcLstAllSlidesColumnWidths()
		  '
		  ' After a resize event on the screen (i.e. the FullScreen button was pressed),
		  ' rework the column widths to keep the Verse column from growing too big.
		  ' EMP 01/31/05
		  '
		  If lst_all_slides.ListCount < 1 Then Return
		  
		  Dim ControlWidth As Integer
		  Dim pic As New Picture(1, 1, 32)
		  Dim g As Graphics
		  Dim WidthString As String
		  Dim tempWidth As Double
		  Dim tempText As String
		  
		  #If RBVersion > 2016 Then
		    pic.Graphics.ScaleX = Self.ScaleFactor
		    pic.Graphics.ScaleY = Self.ScaleFactor
		    pic.HorizontalResolution = 72 * Self.ScaleFactor
		    pic.VerticalResolution = 72 * Self.ScaleFactor
		  #EndIf
		  g = pic.Graphics
		  g.TextSize = lst_all_slides.TextSize
		  g.TextFont = lst_all_slides.TextFont
		  
		  tempWidth = 0
		  For i As Integer = 0 To lst_all_slides.ListCount - 1
		    If tempText <> lst_all_slides.cell(i, 0) Then
		      tempText = lst_all_slides.cell(i, 0)
		      tempWidth = Max(tempWidth, g.StringWidth(tempText))
		    End If
		  Next i
		  ControlWidth = Ceil((tempwidth / lst_all_slides.Width) * 100) + 2 'Fudge Factor
		  ControlWidth = Min(ControlWidth, 20)
		  WidthString = Str(ControlWidth) + "%, "
		  tempWidth = g.StringWidth("MMMM") 'four-em width should be good
		  ControlWidth = Ceil((tempWidth / lst_all_slides.Width) * 100)
		  WidthString = WidthString + Str(ControlWidth) + " %, *"
		  lst_all_slides.ColumnWidths = WidthString
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizePreview()
		  Dim marginLeft As Integer = cnv_preview.Left + cnv_preview.Width + 10
		  Dim marginRight As Integer = grp_presentation_actions.Width + 10
		  Dim prvLargeHeight As Integer = cnv_preview.Height
		  Dim prvSmallHeight As Integer = 120
		  
		  Dim prvLargeWidth As Integer = prvLargeHeight * m_screenRatio
		  Dim prvSmallWidth As Integer = prvSmallHeight * m_screenRatio
		  
		  If Me.Width > (marginLeft + prvLargeWidth + 10 + marginRight) Then
		    
		    cnv_preview_next.Visible = True
		    lbl_preview_next.Visible = True
		    
		    If Me.Width < (marginLeft + prvLargeWidth + 10 + marginRight + 100) Then
		      txt_shortcut_keys.Visible = False
		    Else
		      txt_shortcut_keys.Visible = True
		    End If
		    
		    If cnv_preview_next.Width <> prvLargeWidth Then
		      cnv_preview_next.Width = prvLargeWidth
		      cnv_preview_next.Height = prvLargeHeight
		      txt_shortcut_keys.Left = marginLeft + prvLargeWidth + 10
		      edt_slide_notes.Left = marginLeft + prvLargeWidth + 10
		      edt_slide_notes.Width = Me.Width - edt_slide_notes.Left - 10
		    End If
		    
		  Else
		    
		    If Me.Width >= (marginLeft + prvSmallWidth + 10 + marginRight) And Me.Width < (marginLeft + prvSmallWidth + 10 + marginRight + 100) Then
		      
		      txt_shortcut_keys.Visible = False
		      cnv_preview_next.Visible = True
		      lbl_preview_next.Visible = True
		      
		    ElseIf Me.Width < (marginLeft + prvSmallWidth + 10 + marginRight) Then
		      
		      txt_shortcut_keys.Visible = False
		      cnv_preview_next.Visible = False
		      lbl_preview_next.Visible = False
		    Else
		      cnv_preview_next.Visible = True
		      lbl_preview_next.Visible = True
		      txt_shortcut_keys.Visible = True
		    End If
		    
		    If cnv_preview_next.Width <> prvSmallWidth Then
		      cnv_preview_next.Width = prvSmallWidth
		      cnv_preview_next.Height = prvSmallHeight
		      txt_shortcut_keys.Left = marginLeft + prvSmallWidth + 10
		      edt_slide_notes.Left = marginLeft
		      edt_slide_notes.Width = Me.Width - edt_slide_notes.Left - 10
		    End If
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SavePos()
		  SavedTop = Self.Top
		  SavedLeft = Self.Left
		  SavedWidth = Self.Width
		  SavedHeight = Self.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollTo(index As Integer)
		  lst_all_slides.ListIndex = index - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetFullScreen()
		  btn_action_full_screen.SetIcon windownofullscreenpic, windownofullscreenmask
		  btn_action_full_screen.SetLabel App.T.Translate("presentation_helper/actions/normal_screen/@caption")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetMaxClientArea()
		  Dim controlScreen As Integer
		  Dim de As XmlElement
		  
		  // having issues with Available... so for the time being use the version that makes estimates
		  // of the dimensions in the App class.  Not exact, but keeps the window from sliding up under
		  // the menu on OSX.
		  
		  App.MaximizeInControlScreen(Self)
		  Return
		  
		  de = App.MyPresentSettings.DocumentElement
		  controlScreen = SmartML.GetValueN(de, "monitors/@control") - 1
		  If controlScreen > OSScreenCount() Then controlScreen = 0
		  
		  Self.Top =  OSScreen(controlScreen).AvailableTop
		  Self.Left =  OSScreen(controlScreen).AvailableLeft
		  Self.Height =  OSScreen(controlScreen).AvailableHeight
		  Self.Width =  OSScreen(controlScreen).AvailableWidth
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMode(mode As String, refresh As Boolean = True)
		  If mode = "B" Then
		    btn_mode_black.SetStuck True
		  Else
		    btn_mode_black.SetStuck False
		  End If
		  
		  If mode = "W" Then
		    btn_mode_white.SetStuck True
		  Else
		    btn_mode_white.SetStuck False
		  End If
		  
		  If mode = "H" Then
		    btn_mode_hidden.SetStuck True
		  Else
		    btn_mode_hidden.SetStuck False
		  End If
		  
		  If mode = "L" Then
		    btn_mode_logo.SetStuck True
		  Else
		    btn_mode_logo.SetStuck False
		  End If
		  
		  If mode = "F" Then
		    btn_mode_frozen.SetStuck True
		  Else
		    btn_mode_frozen.SetStuck False
		  End If
		  
		  If mode = "N" Then
		    btn_mode_normal.SetStuck True
		  Else
		    btn_mode_normal.SetStuck False
		  End If
		  
		  If refresh Then PresentWindow.ResetPaint PresentWindow.XCurrentSlide
		  
		  cnv_preview.Refresh False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetNormalClientArea()
		  Self.Top = SavedTop
		  Self.Left = SavedLeft
		  Self.Height = SavedHeight
		  Self.Width = SavedWidth
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetNormalScreen()
		  btn_action_full_screen.SetIcon windowfullscreenpic, windowfullscreenmask
		  btn_action_full_screen.SetLabel App.T.Translate("presentation_helper/actions/full_screen/@caption")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwapFullScreen()
		  
		  #If TargetWin32
		    Dim lparam As New MemoryBlock(4)
		    Dim hwnd As Integer
		    Dim status As Integer
		    Const WM_SYSCOMMAND = 274
		    Const SC_MAXIMIZE = &HF030
		    Const SC_RESTORE = &HF120
		    
		    Declare Function SendMessageA Lib "user32" (ByVal hwnd as Integer, ByVal msg as Integer, ByVal wParam as Integer, ByVal lParam as Ptr) as Integer
		    
		    hwnd = Self.Handle
		  #EndIf
		  
		  If Not IsMaximized Then
		    SavePos
		    SetFullScreen
		    IsMaximized = True
		    
		    #If TargetWin32
		      status = SendMessageA(hwnd, WM_SYSCOMMAND, SC_MAXIMIZE, lparam)
		    #Else
		      SetMaxClientArea
		    #EndIf
		  Else
		    SetNormalScreen
		    IsMaximized = False
		    
		    #If TargetWin32
		      status = SendMessageA(hwnd, WM_SYSCOMMAND, SC_RESTORE, lparam)
		    #Else
		      SetNormalClientArea
		    #EndIf
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected InitialColumnWidths As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsMaximized As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsRightClick As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_screenRatio As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SavedWidth As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events lst_all_slides
	#tag Event
		Sub Change()
		  Dim midpoint As Integer
		  Dim toListIndex, cnt As Integer
		  If Me.ListIndex >= 0 Then
		    Do
		      toListIndex = Me.ListIndex
		      Call PresentWindow.GoSlide(Me.ListIndex + 1)
		      // GoSlide might indirectly change Me.Listindex again, but does not trigger this event again, when called from within it's handler
		      cnt = cnt + 1
		      If cnt > 50 Then
		        App.DebugWriter.Write CurrentMethodName + ": could not find a stable slide index ...", 3
		        Exit
		      End If
		    Loop Until Me.ListIndex = toListIndex
		    
		    //++
		    // Try to keep the active slide in the center of the visible items
		    //--
		    midpoint = (Me.Height \ (Me.TextSize + 3)) \ 2
		    Me.ScrollPosition = Max(0, Me.ListIndex - midpoint)
		    
		    Me.Refresh False
		    cnv_preview.Refresh False
		    cnv_preview_next.Refresh False
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function HeaderPressed(column as Integer) As Boolean
		  Me.SetFocus //Take focus off the header to allow keystrokes to properly process
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return PresentWindow.KeyDownX(key)
		End Function
	#tag EndEvent
	#tag Event
		Function SortColumn(column As Integer) As Boolean
		  Me.setFocus 'EMP: If we don't do this, focus stays on the header and keystrokes won't go to the command handler
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  // Based on a contribution by fmate14
		  // User contributed from https://sourceforge.net/projects/opensong/forums/forum/373378/topic/1679116?message=4171729
		  
		  If App.SlideStyleColorEnabled() Then
		    g.ForeColor=rgb(255,255,255)
		    
		    If row <me.listCount() Then
		      g.ForeColor=App.SlideStyleColor("blank") // Default for inserted blanks
		      
		      Select Case me.CellTag(row,0)
		      Case "song"
		        Select Case me.Cell(row,1).Left(1)
		        Case "V" // Verse
		          g.ForeColor = App.SlideStyleColor("verse")
		        Case "B" // Bridge
		          g.ForeColor = App.SlideStyleColor("bridge")
		        Case "P" // Pre-Chorus
		          g.ForeColor = App.SlideStyleColor("pre-chorus")
		        Case "C" // Chorus
		          g.ForeColor = App.SlideStyleColor("chorus")
		        Case "T" // Tag
		          g.ForeColor = App.SlideStyleColor("tag")
		        End Select
		      Case "custom"
		        g.ForeColor = App.SlideStyleColor("custom")
		      Case "scripture"
		        g.ForeColor = App.SlideStyleColor("scripture")
		      Case "style"
		        g.ForeColor = App.SlideStyleColor("style")
		      Case "image"
		        g.ForeColor = App.SlideStyleColor("image")
		      Case "external"
		        g.ForeColor = App.SlideStyleColor("external")
		      End Select
		    End If
		    
		    g.fillRect(0,0,g.width, g.height)
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_normal
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("n") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon textbackgroundpic, textbackgroundmask
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_black
	#tag Event
		Sub Action()
		  Call PresentWindow.KeyDownX("k")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon blackbackgroundpic, blackbackgroundmask
		  Me.SetToggle(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_white
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("w") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon whitebackgroundpic, whitebackgroundmask
		  Me.SetToggle(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_hidden
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("h") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon backgroundpic, backgroundmask
		  Me.SetToggle(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_logo
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("l") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon logobackgroundpic, logobackgroundmask
		  Me.SetToggle(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_frozen
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("f") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon pausebackgroundpic, pausebackgroundmask
		  Me.SetToggle(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnv_preview
	#tag Event
		Sub GotFocus()
		  lst_all_slides.SetFocus 'EMP: Don't allow this control to get focus
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If Not Globals.Status_Presentation Then
		    App.DebugWriter.Write(CurrentMethodName + ": Ignored because not in Status Presentation", 7)
		    Return
		  End If
		  If IsNull(PresentWindow.XCurrentSlide) Then
		    App.DebugWriter.Write(CurrentMethodName + ": Ignored because PresentWindow.XCurrentSlide is Nil", 7)
		    Return
		  End If
		  edt_slide_notes.Text = SmartML.GetValue(PresentWindow.XCurrentSlide.Parent.Parent, "notes", True)
		  If edt_slide_notes.Text = "" Then
		    // Load the text of the slide into the notes field for easy reference.
		    If lst_all_slides.ListIndex > -1 Then
		      edt_slide_notes.Text = lst_all_slides.Cell(lst_all_slides.ListIndex, 2)
		    End If
		  End If
		  // Catch a race condition between this Paint event and PresentWindow still initializing
		  Try
		    Dim x, y As Integer
		    Dim scale As Double
		    scale = g.Width / PresentWindow.PreviewPicture.Width
		    y = scale * PresentWindow.PreviewPicture.Height
		    If y > g.Height Then
		      scale = g.Height / PresentWindow.PreviewPicture.Height
		      x = Scale * PresentWindow.PreviewPicture.Width
		      y = g.Height
		    Else
		      x = g.Width
		    End If
		    g.DrawPicture(PresentWindow.PreviewPicture, (g.Width - x) / 2, (g.Height - y) / 2, x, y, 0, 0, PresentWindow.PreviewPicture.Width, PresentWindow.PreviewPicture.Height)
		  Catch e As NilObjectException
		    // Just make it black for the moment
		    App.DebugWriter.Write("Could not draw PreviewPicture to cnv_preview",3)
		    g.ForeColor = RGB(0,0,0)
		    g.FillRect 0, 0, g.Width, g.Height
		  End Try
		  
		  Dim RealBorder, w, h As Integer
		  RealBorder = 5
		  
		  If btn_mode_black.GetStuck Then
		    g.ForeColor = Rgb(0,0,0)
		    g.fillRect 0, 0, RealBorder, g.Height ' left
		    g.fillRect 0, 0, g.Width, RealBorder ' top
		    g.fillRect g.Width-RealBorder, 0, RealBorder, g.Height ' right
		    g.fillRect 0, g.Height-RealBorder, g.Width, RealBorder ' bottom
		    g.PenHeight = RealBorder
		    g.PenWidth = RealBorder
		    g.DrawLine 0, 0, g.Width, g.Height
		  ElseIf btn_mode_white.GetStuck Then
		    g.ForeColor = Rgb(255,255,255)
		    g.fillRect 0, 0, RealBorder, g.Height ' left
		    g.fillRect 0, 0, g.Width, RealBorder ' top
		    g.fillRect g.Width-RealBorder, 0, RealBorder, g.Height ' right
		    g.fillRect 0, g.Height-RealBorder, g.Width, RealBorder ' bottom
		    g.PenHeight = RealBorder
		    g.PenWidth = RealBorder
		    g.DrawLine 0, 0, g.Width, g.Height
		  ElseIf btn_mode_hidden.GetStuck Then
		    g.ForeColor = Rgb(128, 128, 255)
		    g.fillRect 0, 0, RealBorder, g.Height ' left
		    g.fillRect 0, 0, g.Width, RealBorder ' top
		    g.fillRect g.Width-RealBorder, 0, RealBorder, g.Height ' right
		    g.fillRect 0, g.Height-RealBorder, g.Width, RealBorder ' bottom
		    g.PenHeight = RealBorder
		    g.PenWidth = RealBorder
		    g.DrawLine 0, 0, g.Width, g.Height
		  ElseIf btn_mode_logo.GetStuck Then
		    g.ForeColor = Rgb(128, 255, 128)
		    g.fillRect 0, 0, RealBorder, g.Height ' left
		    g.fillRect 0, 0, g.Width, RealBorder ' top
		    g.fillRect g.Width-RealBorder, 0, RealBorder, g.Height ' right
		    g.fillRect 0, g.Height-RealBorder, g.Width, RealBorder ' bottom
		    g.PenHeight = RealBorder
		    g.PenWidth = RealBorder
		    g.DrawLine 0, 0, g.Width, g.Height
		    If PresentWindow.LogoCache <> Nil Then
		      h = PresentWindow.LogoCache.Height
		      w = PresentWindow.LogoCache.Width
		      While h > g.Height / 2 And w > g.Width / 2
		        h = h * .95
		        w = w * .95
		      Wend
		      g.DrawPicture PresentWindow.LogoCache, g.Width-w, g.Height-h, w, h, _
		      0, 0, PresentWindow.LogoCache.Width, PresentWindow.LogoCache.Height
		    End If
		  ElseIf btn_mode_frozen.GetStuck Then
		    g.ForeColor = Rgb(255, 128, 128)
		    g.fillRect 0, 0, RealBorder, g.Height ' left
		    g.fillRect 0, 0, g.Width, RealBorder ' top
		    g.fillRect g.Width-RealBorder, 0, RealBorder, g.Height ' right
		    g.fillRect 0, g.Height-RealBorder, g.Width, RealBorder ' bottom
		    g.PenHeight = RealBorder
		    g.PenWidth = RealBorder
		    g.DrawLine 0, 0, g.Width, g.Height
		  End If
		  g.ForeColor = DarkBevelColor
		  g.PenHeight = 1
		  g.PenWidth = 1
		  g.DrawRect 0, 0, g.Width, g.Height
		  
		  Catch ex
		    App.DebugWriter.Write("PresentHelperWindow.cnv_preview.Paint: Exception caught",3)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  // Verify within the control...
		  
		  If (X >= 0) And (X <= Me.Width) And _
		    (Y >= 0) And (Y <= Me.Height) Then
		    If IsRightClick Then
		      Call PresentWindow.PerformAction(PresentWindow.ACTION_PREV_SLIDE)
		    Else
		      Call PresentWindow.PerformAction(PresentWindow.ACTION_NEXT_SLIDE)
		    End If
		  End If
		  
		  IsRightClick = False
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  IsRightClick = IsContextualClick
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_alert
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("a") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon bellpic, bellmask
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_quick_song
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("q") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon midipic, midimask
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_scripture
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX("s") Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon emptypic, emptymask
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_full_screen
	#tag Event
		Sub Action()
		  SwapFullScreen
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon windowfullscreenpic, windowfullscreenmask
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_action_return
	#tag Event
		Sub Action()
		  If PresentWindow.KeyDownX(Chr(27)) Then
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon exitpic, exitmask
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_notes
	#tag Event
		Sub GotFocus()
		  lst_all_slides.setFocus 'EMP: Don't allow this control to get focus
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnv_preview_next
	#tag Event
		Sub GotFocus()
		  lst_all_slides.SetFocus
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim nextSlide As XmlNode
		  
		  If Not Globals.Status_Presentation Then Return
		  If Not Me.Visible Then Return
		  If IsNull(PresentWindow.XCurrentSlide) Then Return
		  
		  nextSlide = SetML.GetNextSlide(PresentWindow.XCurrentSlide)
		  If IsNull(nextSlide) Then
		    g.ForeColor = RGB(200,200,200)
		    g.FillRect 0, 0, g.Width, g.Height
		  Else
		    // Catch a race condition between this Paint event and PresentWindow still initializing
		    Try
		      Dim external_did_draw as Boolean = PresentWindow.m_ExternalRenderer.Render(g, nextSlide, PresentWindow.CurrentSlide + 1)
		      if not external_did_draw then
		        SetML.DrawSlide g, nextSlide, SetML.GetSlideStyle(nextSlide)
		      End If
		    Catch e As NilObjectException
		      // Just make it black for the moment
		      g.ForeColor = RGB(0,0,0)
		      g.FillRect 0, 0, g.Width, g.Height
		      Return
		    End Try
		  End If
		  
		  g.ForeColor = DarkBevelColor
		  g.PenHeight = 1
		  g.PenWidth = 1
		  g.DrawRect 0, 0, g.Width, g.Height
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If (X >= 0) And (X <= Me.Width) And _
		    (Y >= 0) And (Y <= Me.Height) Then
		    If Not IsRightClick Then
		      Call PresentWindow.PerformAction(PresentWindow.ACTION_NEXT_SLIDE)
		    End If
		  End If
		  
		  IsRightClick = False
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  IsRightClick = IsContextualClick
		  Return True
		End Function
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
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
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
		EditorType="String"
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
		InitialValue="False"
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
		Visible=true
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
		EditorType="String"
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
		EditorType="String"
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
