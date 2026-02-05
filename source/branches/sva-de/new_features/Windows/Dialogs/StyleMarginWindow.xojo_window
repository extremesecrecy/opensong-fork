#tag Window
Begin Window StyleMarginWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   360
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   360
   MaximizeButton  =   False
   MaxWidth        =   500
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   360
   MinimizeButton  =   True
   MinWidth        =   500
   Placement       =   0
   Resizeable      =   False
   Title           =   "Margins Editor"
   Visible         =   True
   Width           =   500
   Begin PushButton btn_ok
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   288
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
      Top             =   320
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
      FontName        =   "Arial"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   390
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
      Top             =   320
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin Label lbl_margins_left
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Left:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   134
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   72
   End
   Begin SEditFieldNumeric edt_margins_left
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
      HasVerticalScrollbar=   True
      Height          =   22
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   0.0
      MaximumCharactersAllowed=   0
      Minimum         =   0.0
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      SignalRangeErrors=   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   159
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   38
   End
   Begin UpDownArrows ud_margins_left
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      Enabled         =   True
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   63
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   159
      Transparent     =   False
      Visible         =   True
      Width           =   13
   End
   Begin Label lbl_margins_right
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
      Left            =   395
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Right:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   135
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   76
   End
   Begin SEditFieldNumeric edt_margins_right
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
      HasVerticalScrollbar=   True
      Height          =   22
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   395
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0.0
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
      Top             =   159
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   38
   End
   Begin UpDownArrows ud_margins_right
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      Enabled         =   True
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   438
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
      Top             =   159
      Transparent     =   False
      Visible         =   True
      Width           =   13
   End
   Begin Label lbl_margins_top
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
      Left            =   103
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Top:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   107
   End
   Begin SEditFieldNumeric edt_margins_top
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
      HasVerticalScrollbar=   True
      Height          =   22
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   213
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   0.0
      MaximumCharactersAllowed=   0
      Minimum         =   0.0
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      SignalRangeErrors=   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   38
   End
   Begin UpDownArrows ud_margins_top
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      Enabled         =   True
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   256
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Visible         =   True
      Width           =   13
   End
   Begin Label txt_right_pixels
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
      Left            =   456
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
      Text            =   "px"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   159
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin Label txt_top_pixels
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
      Left            =   273
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "px"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin Label lbl_margins_bottom
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
      Left            =   103
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Bottom:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   282
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   107
   End
   Begin SEditFieldNumeric edt_margins_bottom
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
      HasVerticalScrollbar=   True
      Height          =   22
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   213
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   0.0
      MaximumCharactersAllowed=   0
      Minimum         =   0.0
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      SignalRangeErrors=   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   282
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   38
   End
   Begin UpDownArrows ud_margins_bottom
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      Enabled         =   True
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   256
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   282
      Transparent     =   False
      Visible         =   True
      Width           =   13
   End
   Begin Label lbl_style_preview
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
      Left            =   103
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Preview:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   42
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   280
   End
   Begin SBufferedCanvas can_style_preview
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   210
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   103
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   65
      Transparent     =   True
      Visible         =   True
      Width           =   280
   End
   Begin Label txt_left_pixels
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
      Left            =   80
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "px"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   159
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin Label txt_bottom_pixels
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
      Left            =   274
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "px"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   282
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
		  Self.editType = sectionType
		  Self.editStyle = style
		  Self.previewSlideNode = slide
		  
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
		  Select Case Self.editType
		  Case StyleSectionEnum.Title
		    margins = Self.editStyle.TitleMargins()
		  Case StyleSectionEnum.Subtitle
		    margins = Self.editStyle.SubtitleMargins()
		  Case StyleSectionEnum.Body
		    margins = Self.editStyle.BodyMargins()
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
		  If Not isUpdatingPreview Then
		    isUpdatingPreview = True
		    
		    'MsgBox "Update!"
		    can_style_preview.Repaint()
		    
		    isUpdatingPreview = False
		  End If
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
		    Self.editStyle.BodyMargins(margins)
		  Case StyleSectionEnum.Subtitle
		    Self.editStyle.SubtitleMargins(margins)
		  Case StyleSectionEnum.Title
		    Self.editStyle.TitleMargins(margins)
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
		Sub LostFocus()
		  If Me.Value <> margins.Left Then
		    margins.Left = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Me.Value <> margins.Left Then
		    margins.Left = Me.Value
		    UpdatePreview
		  End If
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
#tag EndEvents
#tag Events ud_margins_left
	#tag Event
		Sub Down()
		  Dim i As Integer
		  
		  i = edt_margins_left.Value
		  If Not edt_margins_left.EnforceRange Or i > edt_margins_left.Minimum Then
		    i = i - 1
		  End If
		  edt_margins_left.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim i As Integer
		  
		  i = edt_margins_left.Value
		  If Not edt_margins_left.EnforceRange Or i < edt_margins_left.Maximum Then
		    i = i + 1
		  End If
		  edt_margins_left.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_margins_right
	#tag Event
		Sub LostFocus()
		  If Me.Value <> margins.Right Then
		    margins.Right = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Me.Value <> margins.Right Then
		    margins.Right = Me.Value
		    UpdatePreview
		  End If
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
#tag EndEvents
#tag Events ud_margins_right
	#tag Event
		Sub Down()
		  Dim i As Integer
		  
		  i = edt_margins_right.Value
		  If Not edt_margins_right.EnforceRange Or i > edt_margins_right.Minimum Then
		    i = i - 1
		  End If
		  edt_margins_right.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim i As Integer
		  
		  i = edt_margins_right.Value
		  If Not edt_margins_right.EnforceRange Or i < edt_margins_right.Maximum Then
		    i = i + 1
		  End If
		  edt_margins_right.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_margins_top
	#tag Event
		Sub LostFocus()
		  If Me.Value <> margins.Top Then
		    margins.Top = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Me.Value <> margins.Top Then
		    margins.Top = Me.Value
		    UpdatePreview
		  End If
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
#tag EndEvents
#tag Events ud_margins_top
	#tag Event
		Sub Down()
		  Dim i As Integer
		  
		  i = edt_margins_top.Value
		  If Not edt_margins_top.EnforceRange Or i > edt_margins_top.Minimum Then
		    i = i - 1
		  End If
		  edt_margins_top.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim i As Integer
		  
		  i = edt_margins_top.Value
		  If Not edt_margins_top.EnforceRange Or i < edt_margins_top.Maximum Then
		    i = i + 1
		  End If
		  edt_margins_top.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_margins_bottom
	#tag Event
		Sub LostFocus()
		  If Me.Value <> margins.Bottom Then
		    margins.Bottom = Me.Value
		    UpdatePreview
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Me.Value <> margins.Bottom Then
		    margins.Bottom = Me.Value
		    UpdatePreview
		  End If
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
#tag EndEvents
#tag Events ud_margins_bottom
	#tag Event
		Sub Down()
		  Dim i As Integer
		  
		  i = edt_margins_bottom.Value
		  If Not edt_margins_bottom.EnforceRange Or i > edt_margins_bottom.Minimum Then
		    i = i - 1
		  End If
		  edt_margins_bottom.SetValue(i)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Dim i As Integer
		  
		  i = edt_margins_bottom.Value
		  If Not edt_margins_bottom.EnforceRange Or i < edt_margins_bottom.Maximum Then
		    i = i + 1
		  End If
		  edt_margins_bottom.SetValue(i)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_style_preview
	#tag Event
		Sub Paint(g As Graphics)
		  Dim zoom As Double
		  Dim realBorder As Double
		  
		  Select Case Self.editType
		  Case StyleSectionEnum.Body
		    Self.editStyle.BodyMargins(margins)
		  Case StyleSectionEnum.Subtitle
		    Self.editStyle.SubtitleMargins(margins)
		  Case StyleSectionEnum.Title
		    Self.editStyle.TitleMargins(margins)
		  Case Else
		    Dim e As New OutOfBoundsException
		    e.Message = "StyleMarginWindow.can_style_preview.Paint, unhandled StyleMargin type"
		    Raise e
		  End Select
		  
		  SetML.DrawSlide g, _
		  Self.previewSlideNode, _
		  Self.editStyle
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
