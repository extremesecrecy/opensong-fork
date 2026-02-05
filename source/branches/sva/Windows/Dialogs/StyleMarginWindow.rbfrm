#tag Window
Begin Window StyleMarginWindow
   BackColor       =   "&cFFFFFF00"
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   346
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   346
   MinimizeButton  =   True
   MinWidth        =   500
   Placement       =   0
   Resizeable      =   False
   Title           =   "Margins Editor"
   Visible         =   True
   Width           =   500
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
      Left            =   330
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   304
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin PushButton btn_cancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   410
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
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   304
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin Label lbl_margins_left
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
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Left:"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   125
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   72
   End
   Begin SEditFieldNumeric edt_margins_left
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      EnforceRange    =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   146
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   38
   End
   Begin UpDownArrows ud_margins_left
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   63
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   146
      Visible         =   True
      Width           =   13
   End
   Begin Label lbl_margins_right
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
      Left            =   395
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
      Text            =   "Right:"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   125
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   76
   End
   Begin SEditFieldNumeric edt_margins_right
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      EnforceRange    =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   395
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   149
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   38
   End
   Begin UpDownArrows ud_margins_right
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   149
      Visible         =   True
      Width           =   13
   End
   Begin Label lbl_margins_top
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
      Left            =   103
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
      Text            =   "Top:"
      TextAlign       =   2
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   107
   End
   Begin SEditFieldNumeric edt_margins_top
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      EnforceRange    =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   213
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
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   38
   End
   Begin UpDownArrows ud_margins_top
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   256
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Visible         =   True
      Width           =   13
   End
   Begin Label txt_right_pixels
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
      Left            =   456
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "px"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   149
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin Label txt_top_pixels
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
      Left            =   273
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "px"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin Label lbl_margins_bottom
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
      Left            =   103
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Bottom:"
      TextAlign       =   2
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   272
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   107
   End
   Begin SEditFieldNumeric edt_margins_bottom
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      EnforceRange    =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   213
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
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
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   272
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   38
   End
   Begin UpDownArrows ud_margins_bottom
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   256
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   271
      Visible         =   True
      Width           =   13
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
      Left            =   103
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Preview:"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   38
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   240
   End
   Begin SBufferedCanvas can_style_preview
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   210
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   103
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   55
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   280
   End
   Begin Label txt_left_pixels
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
      Left            =   80
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "px"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   146
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin Label txt_bottom_pixels
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
      Left            =   274
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "px"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   272
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  App.T.TranslateWindow Me, "style_margins", App.TranslationFonts
		  App.CenterInControlScreen Me
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Edit(style As SlideStyle, slide as XmlNode, sectionType As StyleSectionEnum) As Boolean
		  self.editType = sectionType
		  self.editStyle = style
		  self.previewSlideNode = slide
		  
		  isUpdatingPreview = True
		  LoadValues
		  isUpdatingPreview = False
		  UpdatePreview
		  
		  ReturnValue = False
		  ShowModalWithin(MainWindow)
		  
		  Return ReturnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadValues()
		  Select Case self.editType
		  Case StyleSectionEnum.Title
		    margins = self.editStyle.TitleMargins()
		  Case StyleSectionEnum.Subtitle
		    margins = self.editStyle.SubtitleMargins()
		  Case StyleSectionEnum.Body
		    margins = self.editStyle.BodyMargins()
		  End Select
		  
		  'Initialise the edit controls with the margin values
		  edt_margins_left.SetValue(margins.Left)
		  edt_margins_right.SetValue(margins.Right)
		  edt_margins_top.SetValue(margins.Top)
		  edt_margins_bottom.SetValue(margins.Bottom)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdatePreview()
		  'Todo...
		  if not isUpdatingPreview then
		    isUpdatingPreview = True
		    
		    'MsgBox "Update!"
		    can_style_preview.Repaint()
		    
		    isUpdatingPreview = False
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private editStyle As SlideStyle
	#tag EndProperty

	#tag Property, Flags = &h21
		Private editType As StyleSectionEnum
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isUpdatingPreview As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private margins As StyleMarginType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private previewSlideNode As XmlNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ReturnValue As boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events btn_ok
	#tag Event
		Sub Action()
		  Select Case self.editType
		  Case StyleSectionEnum.Body
		    self.editStyle.BodyMargins(margins)
		  Case StyleSectionEnum.Subtitle
		    self.editStyle.SubtitleMargins(margins)
		  Case StyleSectionEnum.Title
		    self.editStyle.TitleMargins(margins)
		  Case Else
		    Dim e As New OutOfBoundsException
		    e.Message = "StyleMarginWindow.can_style_preview.Paint, unhandled StyleMargin type"
		    Raise e
		  End Select
		  
		  Dim RealBorder As Integer
		  Dim Width16x9px As Integer
		  Dim Height16x9px As Integer
		  
		  Width16x9px = 640
		  Height16x9px = Width16x9px * 9 \ 16
		  RealBorder = Ceil(Width16x9px / 50)
		  If Width16x9px - margins.Left - 2 * RealBorder - margins.Right < Width16x9px \ 10 Or _
		    Height16x9px - margins.Top - 2 * RealBorder - margins.Bottom < Height16x9px \ 10 Then
		    Dim questionTxt As String
		    Dim txFound As Boolean
		    questionTxt = App.T.Translate("questions/large_margins/@caption", txFound)
		    If txFound Then
		      If Not InputBox.AskYN(questionTxt) Then
		        Return
		      End If
		    End If
		  End If
		  
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
#tag Events edt_margins_left
	#tag Event
		Sub TextChange()
		  if Me.Value <> margins.Left then
		    margins.Left = Me.Value
		    UpdatePreview
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChange()
		  If Me.Value <> margins.Left Then
		    margins.Left = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  If Me.Value <> margins.Left Then
		    margins.Left = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ud_margins_left
	#tag Event
		Sub Up()
		  dim i as Integer
		  
		  i = edt_margins_left.Value
		  if not edt_margins_left.EnforceRange or  i<edt_margins_left.Maximum then
		    i = i + 1
		  end if
		  edt_margins_left.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  dim i as Integer
		  
		  i = edt_margins_left.Value
		  if not edt_margins_left.EnforceRange or  i>edt_margins_left.Minimum then
		    i = i - 1
		  end if
		  edt_margins_left.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_margins_right
	#tag Event
		Sub TextChange()
		  if Me.Value <> margins.Right then
		    margins.Right = Me.Value
		    UpdatePreview
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChange()
		  If Me.Value <> margins.Right Then
		    margins.Right = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  If Me.Value <> margins.Right Then
		    margins.Right = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ud_margins_right
	#tag Event
		Sub Down()
		  dim i as Integer
		  
		  i = edt_margins_right.Value
		  if not edt_margins_right.EnforceRange or  i>edt_margins_right.Minimum then
		    i = i - 1
		  end if
		  edt_margins_right.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  dim i as Integer
		  
		  i = edt_margins_right.Value
		  if not edt_margins_right.EnforceRange or  i<edt_margins_right.Maximum then
		    i = i + 1
		  end if
		  edt_margins_right.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_margins_top
	#tag Event
		Sub TextChange()
		  if Me.Value <> margins.Top then
		    margins.Top = Me.Value
		    UpdatePreview
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChange()
		  If Me.Value <> margins.Top Then
		    margins.Top = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  If Me.Value <> margins.Top Then
		    margins.Top = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ud_margins_top
	#tag Event
		Sub Down()
		  dim i as Integer
		  
		  i = edt_margins_top.Value
		  if not edt_margins_top.EnforceRange or  i>edt_margins_top.Minimum then
		    i = i - 1
		  end if
		  edt_margins_top.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  dim i as Integer
		  
		  i = edt_margins_top.Value
		  if not edt_margins_top.EnforceRange or  i<edt_margins_top.Maximum then
		    i = i + 1
		  end if
		  edt_margins_top.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_margins_bottom
	#tag Event
		Sub TextChange()
		  if Me.Value <> margins.Bottom then
		    margins.Bottom = Me.Value
		    UpdatePreview
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChange()
		  If Me.Value <> margins.Bottom Then
		    margins.Bottom = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  If Me.Value <> margins.Bottom Then
		    margins.Bottom = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ud_margins_bottom
	#tag Event
		Sub Up()
		  dim i as Integer
		  
		  i = edt_margins_bottom.Value
		  if not edt_margins_bottom.EnforceRange or  i<edt_margins_bottom.Maximum then
		    i = i + 1
		  end if
		  edt_margins_bottom.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  dim i as Integer
		  
		  i = edt_margins_bottom.Value
		  if not edt_margins_bottom.EnforceRange or  i>edt_margins_bottom.Minimum then
		    i = i - 1
		  end if
		  edt_margins_bottom.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_style_preview
	#tag Event
		Sub Paint(g As Graphics)
		  Dim zoom as Double
		  Dim realBorder as Double
		  
		  Select Case self.editType
		  Case StyleSectionEnum.Body
		    self.editStyle.BodyMargins(margins)
		  Case StyleSectionEnum.Subtitle
		    self.editStyle.SubtitleMargins(margins)
		  Case StyleSectionEnum.Title
		    self.editStyle.TitleMargins(margins)
		  Case Else
		    Dim e As New OutOfBoundsException
		    e.Message = "StyleMarginWindow.can_style_preview.Paint, unhandled StyleMargin type"
		    Raise e
		  End Select
		  
		  SetML.DrawSlide g, _
		  self.previewSlideNode, _
		  self.editStyle
		  g.ForeColor = DarkBevelColor
		  g.DrawRect 0, 0, g.Width, g.Height
		  
		  zoom = g.Width / 640.0
		  RealBorder = g.Width / 50
		  
		  'draw a rectangle indicating the margin area
		  g.ForeColor = RGB(255, 0, 255) 'Magenta - a color that is not likely to be used in a background...
		  g.DrawRect margins.Left * zoom, _
		  margins.Top * zoom, _
		  g.Width - (margins.Left + margins.Right) * zoom, _
		  g.Height - (margins.Top + margins.Bottom) * zoom
		  
		  'draw a rectangle indicating the actual writing area
		  g.ForeColor = RGB(0, 255, 0) 'Bright Green - a color that is not likely to be used in a background...
		  g.DrawRect (margins.Left * zoom) + RealBorder, _
		  (margins.Top * zoom) + RealBorder, _
		  g.Width - ((margins.Left + margins.Right) * zoom) - (RealBorder * 2), _
		  g.Height - ((margins.Top + margins.Bottom) * zoom) - (RealBorder * 2)
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
