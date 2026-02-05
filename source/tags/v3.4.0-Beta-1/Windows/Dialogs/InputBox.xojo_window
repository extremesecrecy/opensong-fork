#tag Window
Begin Window InputBox
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   157
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
   Placement       =   3
   Resizeable      =   True
   Title           =   "OpenSong"
   Visible         =   True
   Width           =   318
   Begin SButton btn_ok
      AcceptFocus     =   True
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      HasFocus        =   False
      Height          =   24
      HelpTag         =   ""
      Icon            =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   "OK"
      LabelAlign      =   1
      Left            =   145
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MenuItem        =   ""
      Outline         =   True
      Scope           =   0
      StickyBevel     =   False
      Stuck           =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Toggle          =   False
      Top             =   125
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   75
   End
   Begin SButton btn_cancel
      AcceptFocus     =   True
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      HasFocus        =   False
      Height          =   24
      HelpTag         =   ""
      Icon            =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   "Cancel"
      LabelAlign      =   1
      Left            =   230
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MenuItem        =   ""
      Outline         =   True
      Scope           =   0
      StickyBevel     =   False
      Stuck           =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Toggle          =   False
      Top             =   125
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   75
   End
   Begin PushButton btn_hidden_hidok
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
      Left            =   145
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   173
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   22
   End
   Begin PushButton btn_hidden_hidcancel
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
      Left            =   230
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   173
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   22
   End
   Begin SEditField lbl_the_question
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   70
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   8
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Label"
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   7
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   297
   End
   Begin PopupMenu pop_the_input
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   9
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   90
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   300
   End
   Begin SEditField edt_the_input
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   25
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   8
      LimitText       =   255
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Arial"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   89
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  BringToFront
		  If edt_the_input.Visible Then edt_the_input.SetFocus
		  If pop_the_input.Visible Then pop_the_input.SetFocus
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  Globals.Status_InputBoxOpen = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  If App.T <> Nil And App.T.IsLoaded Then
		    App.T.TranslateWindow Me, "input_box", App.TranslationFonts
		  End If
		  lbl_the_question.BackColor = FillColor
		  Globals.Status_InputBoxOpen = True
		  '--
		  App.CenterInControlScreen Me
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Ask(question As String) As Boolean
		  lbl_the_question.Text = question
		  lbl_the_question.MultiLine = False
		  lbl_the_question.SelStart = 0
		  lbl_the_question.SelLength = 0
		  lbl_the_question.ScrollPosition = 0
		  lbl_the_question.ScrollPositionX = 0
		  edt_the_input.Visible = False
		  lbl_the_question.Height = 80
		  pop_the_input.Visible = False
		  
		  btn_cancel.Visible = True
		  If App.SplashShowing Then Splash.Visible = False
		  PositionPushButtons
		  ShowModal
		  If App.SplashShowing Then Splash.Visible = True
		  Return OutputB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AskYN(question As String) As Boolean
		  //++
		  // Ask a yes/no question
		  // EMP, July 2006
		  //--
		  Dim status As Boolean
		  Dim ok, cancel As String
		  
		  ok = btn_ok.Label
		  cancel = btn_cancel.Label
		  
		  btn_ok.Label = (App.T.Translate("shared/yes/@caption"))
		  btn_cancel.Label = (App.T.Translate("shared/no/@caption"))
		  
		  status = Ask(question)
		  
		  Return status
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub BringToFront()
		  
		  #If TargetWin32 Then
		    Const SWP_NOSIZE = &H1
		    Const SWP_NOMOVE = &H2
		    Const SWP_FRAMECHANGED = &H20
		    Const SWP_NOOWNERZORDER = &H200
		    Const HWND_TOP = 0
		    Const HWND_TOPMOST = -1
		    Const GWL_STYLE = -16
		    Const WS_POPUPWINDOW = &H80880000
		    
		    Dim styleFlags As Integer
		    
		    Declare Function SetWindowPos Lib "user32" (hwnd as Integer, hWndInsertAfter as Integer, x as Integer, y as Integer, cx as Integer, cy as Integer, flags as Integer) as Integer
		    
		    styleFlags = SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, _
		    SWP_NOSIZE + SWP_NOMOVE + SWP_NOOWNERZORDER)
		    
		  #ElseIf TargetMacOS Then
		    
		    Dim Status As Integer
		    Declare Function SelectWindow Lib "Carbon" (window As Integer) As Integer
		    
		    Status = SelectWindow(Self.Handle)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cancel()
		  Output = ""
		  OutputB = False
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Input(question As String, default As String) As String
		  pop_the_input.Visible = False
		  lbl_the_question.Text = question
		  lbl_the_question.MultiLine = False
		  lbl_the_question.SelStart = 0
		  lbl_the_question.SelLength = 0
		  lbl_the_question.ScrollPosition = 0
		  lbl_the_question.ScrollPositionX = 0
		  lbl_the_question.Height = 40
		  edt_the_input.Visible = True
		  edt_the_input.Text = default
		  edt_the_input.SelStart = 0
		  edt_the_input.SelLength = Len(default)
		  
		  btn_cancel.Visible = True
		  PositionPushButtons
		  If App.SplashShowing Then Splash.Visible = False
		  ShowModal
		  If App.SplashShowing Then Splash.Visible = True
		  Return Output
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Message(message As String)
		  // select, postion, and size controls
		  edt_the_input.Visible = False
		  pop_the_input.Visible = False
		  lbl_the_question.Visible = True
		  
		  lbl_the_question.Height = pop_the_input.Top + pop_the_input.Height - lbl_the_question.Top
		  
		  'lbl_the_question.Enabled = True
		  lbl_the_question.Text = message.FormatLocalEndOfLine
		  'lbl_the_question.MultiLine = False
		  
		  lbl_the_question.SelStart = 0
		  lbl_the_question.SelLength = 0
		  lbl_the_question.ScrollPosition = 0
		  lbl_the_question.ScrollPositionX = 0
		  
		  btn_cancel.Visible = False
		  PositionPushButtons
		  btn_ok.SetFocus
		  If App.SplashShowing Then Splash.Visible = False
		  ShowModal
		  If App.SplashShowing Then Splash.Visible = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Okay()
		  If edt_the_input.Visible Then
		    Output = edt_the_input.Text
		  ElseIf pop_the_input.Visible Then
		    Output = pop_the_input.Text
		  End If
		  OutputB = True
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pick(question As String, choices() As String, default As String = "") As String
		  lbl_the_question.Text = question
		  lbl_the_question.MultiLine = False
		  lbl_the_question.SelStart = 0
		  lbl_the_question.SelLength = 0
		  lbl_the_question.ScrollPosition = 0
		  lbl_the_question.ScrollPositionX = 0
		  
		  edt_the_input.Visible = False
		  
		  pop_the_input.Visible = True
		  pop_the_input.DeleteAllRows
		  Dim i As Integer
		  For i = 1 To UBound(choices)
		    pop_the_input.AddRow choices(i)
		    If choices(i) = default Then pop_the_input.ListIndex = i - 1
		  Next i
		  pop_the_input.ListIndex = 0
		  
		  lbl_the_question.Height = 40
		  
		  btn_cancel.Visible = True
		  PositionPushButtons
		  
		  If App.SplashShowing Then Splash.Visible = False
		  
		  ShowModal
		  
		  If App.SplashShowing Then Splash.Visible = True
		  
		  Return Output
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PositionPushButtons()
		  //++
		  // Position the pushbutton controls taking into account
		  // the OS UI guidelines and visibility
		  //--
		  Dim rightButton As RectControl
		  Dim leftButton As RectControl
		  
		  If btn_cancel.Visible Then
		    #if TargetMacOS Then
		      rightButton = btn_ok
		      leftButton = btn_cancel
		    #else
		      rightButton = btn_cancel
		      leftButton = btn_ok
		    #endif
		  Else
		    leftButton = Nil
		    rightButton = btn_ok
		  End If
		  
		  rightButton.Left = Self.Width - (rightButton.Width + 12)
		  If leftButton <> Nil Then
		    If leftButton.top = rightButton.top Then
		      leftButton.Left = rightButton.Left - (leftButton.Width + 12)
		    End If
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Output As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputB As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events btn_ok
	#tag Event
		Sub Action()
		  Okay
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon button_ok_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_cancel
	#tag Event
		Sub Action()
		  Cancel
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon button_cancel_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_hidden_hidok
	#tag Event
		Sub Action()
		  Okay
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_hidden_hidcancel
	#tag Event
		Sub Action()
		  Cancel
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbl_the_question
	#tag Event
		Sub Close()
		  Tooltip.Hide
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
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
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="OutputB"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
