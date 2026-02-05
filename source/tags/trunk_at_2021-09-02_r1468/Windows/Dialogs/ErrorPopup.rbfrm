#tag Window
Begin Window ErrorPopup
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   414
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "#kError"
   Visible         =   False
   Width           =   729
   Begin PushButton btn_error_close
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "#kErrorClose"
      ControlOrder    =   0
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   609
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   366
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label lbl_error_description
      AutoDeactivate  =   True
      Bold            =   ""
      ControlOrder    =   1
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kErrorDescription"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   689
   End
   Begin TextArea ErrorDescription
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      ControlOrder    =   2
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   282
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      Password        =   ""
      ReadOnly        =   True
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   41
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   689
   End
   Begin Label lbl_error_instructions
      AutoDeactivate  =   True
      Bold            =   ""
      ControlOrder    =   3
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Multiline       =   True
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Please include this error description and the stack trace in your bug report."
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   332
      Underline       =   ""
      Visible         =   True
      Width           =   689
   End
   Begin Label lbl_error_copy_clipboard
      AutoDeactivate  =   True
      Bold            =   ""
      ControlOrder    =   4
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Multiline       =   True
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Copy to clipboard"
      TextAlign       =   0
      TextColor       =   &h000000FF
      TextFont        =   "System"
      TextSize        =   0
      Top             =   352
      Underline       =   False
      Visible         =   True
      Width           =   577
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  lbl_error_copy_clipboard.TabStop = True
		  App.MouseCursor = Nil
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub ActionCopyText()
		  Dim c As New Clipboard
		  
		  c.SetText(ErrorDescription.Text.FormatLocalEndOfLine)
		  c.Close
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kError, Type = String, Dynamic = True, Default = \"Error", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kErrorClose, Type = String, Dynamic = True, Default = \"C&lose", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kErrorDescription, Type = String, Dynamic = True, Default = \"An unhandled &exception has been raised with the following error description:", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events btn_error_close
	#tag Event
		Sub Action()
		  Me.Window.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbl_error_copy_clipboard
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Key = " " Or Asc(Key) = 3 Or Asc(Key) = 10 Then
		    ActionCopyText
		    Me.TextColor = RGB(192,0,255)
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If X >= 0 And X <= Me.Width And Y >= 0 And Y <= Me.Height Then
		    ActionCopyText
		    Me.TextColor = RGB(192,0,255)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.Underline = True
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.Underline = False
		  Me.MouseCursor = Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  Me.Underline = X >= 0 And X <= Me.Width And Y >= 0 And Y <= Me.Height
		  
		End Sub
	#tag EndEvent
#tag EndEvents
