#tag Window
Begin Window FontChooser
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   343
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
   Placement       =   1
   Resizeable      =   False
   Title           =   "Font Selection"
   Visible         =   True
   Width           =   425
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
      Left            =   218
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
      Top             =   301
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
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   320
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
      Top             =   301
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin Label lbl_font_face
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
      Left            =   15
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Font:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin SEditField edt_font_face
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   15
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Times New Roman"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   32
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   186
   End
   Begin ListBox lst_font_faces
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
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   0
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   137
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   15
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   55
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   186
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label lbl_font_size
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
      Left            =   213
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Size:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   9
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
   Begin SEditField edt_font_size
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   213
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaximumCharactersAllowed=   3
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "12"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   31
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   "##9"
      Visible         =   True
      Width           =   60
   End
   Begin ListBox lst_font_size
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
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   0
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   138
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "8\r9\r10\r11\r12\r14\r16\r18\r20\r22\r24\r26\r28\r36\r48\r72"
      Italic          =   False
      Left            =   213
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   54
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   60
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label lbl_font_color
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
      Left            =   285
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Color:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
   Begin SColorCanvas can_font_color
      AllowAlpha      =   True
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      IsColorSet      =   False
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MyColor         =   &c00000000
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   32
      Transparent     =   True
      Visible         =   True
      Width           =   35
   End
   Begin CheckBox chk_font_bold
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Bold"
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
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   60
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   127
   End
   Begin CheckBox chk_font_italic
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Italic"
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
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   85
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   127
   End
   Begin CheckBox chk_font_underline
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Underline"
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
      Left            =   283
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
      Top             =   110
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   127
   End
   Begin CheckBox chk_font_border
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Border"
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
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   143
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   127
   End
   Begin SColorCanvas can_font_border
      AllowAlpha      =   True
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      IsColorSet      =   False
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MyColor         =   &c00000000
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   165
      Transparent     =   True
      Visible         =   True
      Width           =   35
   End
   Begin CheckBox chk_font_shadow
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Shadow"
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
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   194
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   127
   End
   Begin SColorCanvas can_font_shadow
      AllowAlpha      =   True
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      IsColorSet      =   False
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MyColor         =   &c00000000
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   216
      Transparent     =   True
      Visible         =   True
      Width           =   35
   End
   Begin CheckBox chk_font_fill
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Fill"
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
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   245
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   127
   End
   Begin SColorCanvas can_font_fill
      AllowAlpha      =   True
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      IsColorSet      =   False
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MyColor         =   &c00000000
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   267
      Transparent     =   True
      Visible         =   True
      Width           =   35
   End
   Begin SFontCanvas can_font_preview
      AcceptMouseDown =   False
      AdvancedOptions =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   85
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   15
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   204
      Transparent     =   True
      Visible         =   True
      Width           =   258
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  BorderFraction = 15
		  
		  App.T.TranslateWindow Me, "font_selection", App.TranslationFonts
		  App.CenterInControlScreen Me
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Ask(fromFont As FontFace, advancedOptions As Boolean = True) As FontFace
		  Dim fontFace As FontFace = fromFont.Clone
		  If Not advancedOptions Then
		    fontFace.Border = False
		    fontFace.Shadow = False
		    fontFace.Fill = False
		  End If
		  MyFont = fontFace
		  
		  App.UpdateFontList
		  Dim x, y As Integer
		  y = App.FontList.LastIndex
		  For x = 0 To y
		    lst_font_faces.AddRow App.FontList(x)
		    If MyFont <> Nil And MyFont.Name = App.FontList(x) Then
		      lst_font_faces.Selected(lst_font_faces.LastIndex) = True
		      lst_font_faces.ScrollPosition = lst_font_faces.LastIndex
		    End If
		  Next x
		  
		  If Not advancedOptions Then
		    chk_font_border.Visible = False
		    can_font_border.Visible = False
		    chk_font_shadow.Visible = False
		    can_font_shadow.Visible = False
		    chk_font_fill.Visible = False
		    can_font_fill.Visible = False
		  End If
		  UpdateMenuItems
		  
		  ShowModalWithin(MainWindow)
		  
		  Return MyFont
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMenuItems()
		  btn_ok.Enabled = (lst_font_faces.SelectedRowCount = 1) Or edt_font_face.Text = "System" Or edt_font_face.Text = "SmallSystem"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected BorderFraction As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMyFont As FontFace
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMyFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMyFont = value
			  
			  Dim c As Color
			  
			  If MyFont <> Nil Then
			    edt_font_face.Text = MyFont.Name
			    edt_font_size.Text = Str(MyFont.Size)
			    chk_font_bold.Value = MyFont.Bold
			    chk_font_italic.Value = MyFont.Italic
			    chk_font_underline.Value = MyFont.Underline
			    c = MyFont.ForeColor
			    can_font_color.SetColor c
			    c = MyFont.BorderColor
			    can_font_border.SetColor c
			    c = MyFont.ShadowColor
			    can_font_shadow.SetColor c
			    c = MyFont.FillColor
			    can_font_fill.SetColor c
			    chk_font_border.Value = MyFont.Border
			    chk_font_shadow.Value = MyFont.Shadow
			    chk_font_fill.Value = MyFont.Fill
			    can_font_preview.SetFont MyFont
			  End If
			End Set
		#tag EndSetter
		MyFont As FontFace
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events btn_ok
	#tag Event
		Sub Action()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_cancel
	#tag Event
		Sub Action()
		  MyFont = Nil
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_face
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim i As Integer
		  If Asc(Key) = ASC_KEY_ENTER Or Asc(Key) = ASC_KEY_RETURN Then
		    For i = 0 To lst_font_faces.LastRowIndex
		      If Me.Text = lst_font_faces.Cell(i, 0) Then
		        lst_font_faces.Selected(i) = True
		        Return False
		      End If
		    Next
		  End If
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  Dim i As Integer
		  Dim pos As Integer = -1
		  If Me.Text.Length > 0 Then
		    If Me.Text = "System" Or Me.Text = "SmallSystem" Then
		      MyFont.Name = Me.Text
		      can_font_preview.SetFont MyFont
		    Else
		      For i = 0 To lst_font_faces.RowCount - 1
		        If lst_font_faces.CellValueAt(i, 0).BeginsWith(Me.Text) Then
		          If Pos < 0 Then Pos = i
		        ElseIf Pos >= 0 Then
		          Exit
		        End If
		      Next
		    End If
		  End If
		  If Pos >= 0 Then
		    If lst_font_faces.CellValueAt(Pos, 0) = Me.Text Then
		      lst_font_faces.Selected(Pos) = True
		    Else
		      App.DebugWriter.Write(CurrentMethodName + " deselecting row " + Str(lst_font_faces.SelectedRowIndex) + " " + lst_font_faces.SelectedRowValue, 7)
		      // what I actually wanted to do is mark the row pos with something like a focus ring
		      lst_font_faces.Selected(lst_font_faces.SelectedRowIndex) = False
		    End If
		    Dim height As Integer
		    height = lst_font_faces.Height
		    If lst_font_faces.HasHeader Then height = height - lst_font_faces.HeaderHeight
		    If lst_font_faces.HasHorizontalScrollbar Then height = height - 16
		    height = height \ lst_font_faces.RowHeight // = number of rows in listbox
		    height = (height - 1) \ 2 // that is now the number of rows above the one in focus
		    lst_font_faces.ScrollPosition = Max(pos - height, 0)
		  Else
		    App.DebugWriter.Write(CurrentMethodName + " deselecting row " + Str(lst_font_faces.SelectedRowIndex) + " " + lst_font_faces.SelectedRowValue, 7)
		    lst_font_faces.Selected(lst_font_faces.SelectedRowIndex) = False
		  End If
		  UpdateMenuItems
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_font_faces
	#tag Event
		Sub Change()
		  Dim carretPos As Integer
		  If Me.Text.Len > 0 Then
		    If edt_font_face.Active Then
		      carretPos = edt_font_face.SelectionStart
		    End If
		    edt_font_face.Text = Me.Text
		    If edt_font_face.SelectionStart <> carretPos Then
		      edt_font_face.SelectionStart = carretPos
		    End If
		    MyFont.Name = Me.Text
		    can_font_preview.SetFont MyFont
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_font_size
	#tag Event
		Sub TextChange()
		  MyFont.Size = Val(Me.Text)
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_font_size
	#tag Event
		Sub Change()
		  edt_font_size.Text = lst_font_size.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_font_color
	#tag Event
		Sub Action()
		  Dim c As Color
		  If can_font_color.GetColor(c) Then
		    MyFont.ForeColor = c
		  Else
		    MyFont.ForeColor = RGB(0,0,0)
		  End If
		  
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_font_bold
	#tag Event
		Sub Action()
		  MyFont.Bold = Me.Value
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_font_italic
	#tag Event
		Sub Action()
		  MyFont.Italic = Me.Value
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_font_underline
	#tag Event
		Sub Action()
		  MyFont.Underline = Me.Value
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_font_border
	#tag Event
		Sub Action()
		  MyFont.Border = Me.Value
		  If Me.Value Then
		    can_font_border.Enabled = True
		    can_font_border.SetColor MyFont.BorderColor
		  Else
		    can_font_border.Enabled = False
		    can_font_border.ClearColor
		  End If
		  UpdateMenuItems
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_font_border
	#tag Event
		Sub Action()
		  Dim c As Color
		  If Me.GetColor(c) Then
		    MyFont.BorderColor = c
		  Else
		    MyFont.BorderColor = RGB(0,0,0)
		  End If
		  
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_font_shadow
	#tag Event
		Sub Action()
		  MyFont.Shadow = Me.Value
		  If Me.Value Then
		    can_font_shadow.Enabled = True
		    can_font_shadow.SetColor MyFont.ShadowColor
		  Else
		    can_font_shadow.Enabled = False
		    can_font_shadow.ClearColor
		  End If
		  UpdateMenuItems
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_font_shadow
	#tag Event
		Sub Action()
		  Dim c As Color
		  If can_font_shadow.GetColor(c) Then
		    MyFont.ShadowColor = c
		  Else
		    MyFont.ShadowColor = RGB(0,0,0)
		  End If
		  
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_font_fill
	#tag Event
		Sub Action()
		  MyFont.Fill = Me.Value
		  If Me.Value Then
		    can_font_fill.Enabled = True
		    can_font_fill.SetColor MyFont.FillColor
		  Else
		    can_font_fill.Enabled = False
		    can_font_fill.ClearColor
		  End If
		  can_font_preview.SetFont MyFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_font_fill
	#tag Event
		Sub Action()
		  Dim c As Color
		  If can_font_fill.GetColor(c) Then
		    MyFont.FillColor = c
		  Else
		    MyFont.FillColor = RGB(255,255,255)
		  End If
		  
		  can_font_preview.SetFont MyFont
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
