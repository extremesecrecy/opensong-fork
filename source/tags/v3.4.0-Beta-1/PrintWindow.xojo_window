#tag Window
Begin Window PrintWindow
   BackColor       =   &c00000000
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   422
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   300
   MinimizeButton  =   True
   MinWidth        =   650
   Placement       =   0
   Resizeable      =   True
   Title           =   "Print Preview"
   Visible         =   True
   Width           =   663
   Begin PagePanel nil_panel
      AutoDeactivate  =   True
      BehaviorIndex   =   0
      ControlOrder    =   "0"
      Enabled         =   True
      Height          =   363
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   43
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   647
      Begin Canvas cnv_page
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         BehaviorIndex   =   1
         ControlOrder    =   "1"
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   "True"
         Height          =   200
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_panel"
         Left            =   10
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   50
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
      End
   End
   Begin ScrollBar scr_vertical
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BehaviorIndex   =   2
      ControlOrder    =   "2"
      Enabled         =   True
      Height          =   406
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Left            =   647
      LineStep        =   20
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   100
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin ScrollBar scr_horizontal
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BehaviorIndex   =   3
      ControlOrder    =   "3"
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Left            =   0
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   406
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   647
   End
   Begin PagePanel nil_header
      AutoDeactivate  =   True
      BehaviorIndex   =   4
      ControlOrder    =   "4"
      Enabled         =   True
      Height          =   40
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   1
      Panels          =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   647
      Begin PushButton btn_page_print
         AutoDeactivate  =   True
         BehaviorIndex   =   5
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Print..."
         ControlOrder    =   "5"
         Default         =   True
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   497
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   65
      End
      Begin PushButton btn_cancel
         AutoDeactivate  =   True
         BehaviorIndex   =   6
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   True
         Caption         =   "Cancel"
         ControlOrder    =   "6"
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   574
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   65
      End
      Begin PushButton btn_page_first
         AutoDeactivate  =   True
         BehaviorIndex   =   7
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "<<"
         ControlOrder    =   "7"
         Default         =   False
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   10
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   34
      End
      Begin PushButton btn_page_previous
         AutoDeactivate  =   True
         BehaviorIndex   =   8
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "<"
         ControlOrder    =   "8"
         Default         =   False
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   52
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   30
      End
      Begin Label txt_page_page
         AutoDeactivate  =   True
         BehaviorIndex   =   9
         Bold            =   False
         ControlOrder    =   "9"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   86
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "888 of 888"
         TextAlign       =   1
         TextColor       =   &c00000000
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   65
      End
      Begin PushButton btn_page_next
         AutoDeactivate  =   True
         BehaviorIndex   =   10
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   ">"
         ControlOrder    =   "10"
         Default         =   False
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   155
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   30
      End
      Begin PushButton btn_page_last
         AutoDeactivate  =   True
         BehaviorIndex   =   11
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   ">>"
         ControlOrder    =   "11"
         Default         =   False
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   193
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   34
      End
      Begin PushButton btn_page_zoom_in
         AutoDeactivate  =   True
         BehaviorIndex   =   12
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "-"
         ControlOrder    =   "12"
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   239
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   30
      End
      Begin TextField edt_page_zoom
         AcceptTabs      =   False
         Alignment       =   3
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         BehaviorIndex   =   13
         Bold            =   False
         Border          =   True
         ControlOrder    =   "13"
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   277
         LimitText       =   3
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "999"
         Multiline       =   "False"
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         ScrollbarHorizontal=   "False"
         ScrollbarVertical=   "True"
         Styled          =   "False"
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "100%"
         TextColor       =   &c00000000
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   43
      End
      Begin PushButton btn_page_zoom_out
         AutoDeactivate  =   True
         BehaviorIndex   =   14
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "+"
         ControlOrder    =   "14"
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   328
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   30
      End
      Begin PushButton btn_page_print_setup
         AutoDeactivate  =   True
         BehaviorIndex   =   15
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Print Setup..."
         ControlOrder    =   "15"
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   2147483648
         InitialParent   =   "nil_header"
         Italic          =   False
         Left            =   370
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   9
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  HSizer.Resize ' linux fix
		  If initialActivation Then // This is the first time the window is activated, size appropriately
		    Self.Width = Min(Self.Width, (cnv_page.Left * 2) + cnv_page.Width + scr_vertical.Width)
		    Self.Height = Min(Self.Height, cnv_page.Top + (cnv_page.Top - nil_header.Height) + cnv_page.Height + scr_horizontal.Height)
		    initialActivation = False
		  End If
		  FixScrollBars
		  Catch ex // Don't die if this fires before HSizer exists
		    Return
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  App.DebugWriter.Write "PrintWindow.Close: Enter"
		  SetReport Nil
		  PageCount = 0
		  PageObj = Nil
		  mCurrentPage = 0
		  HSizer = Nil
		  App.DebugWriter.Write "PrintWindow.Close: Exit"
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If NavigatePreview(15, Key, ModifierMask(Keyboard.ShiftKey, Keyboard.AltKey, Keyboard.ControlKey Or Keyboard.CommandKey, Keyboard.OSKey)) Then
		    Return True
		  End If
		  
		  If Keyboard.AsyncKeyDown(&h35) Then ' Escape
		    Close
		    Return True
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  App.DebugWriter.Write "PrintWindow.Open: Enter"
		  Zoom = 1.0
		  
		  ' This is a fix for a Linux resize bug for modal dialogs
		  HSizer = New HalfSizer(Me)
		  HSizer.AddLeft scr_vertical, 1
		  HSizer.AddHeight scr_vertical, 1
		  HSizer.AddTop scr_horizontal, 1
		  HSizer.AddWidth scr_horizontal, 1
		  HSizer.AddWidth nil_header, 1
		  HSizer.AddLeft btn_cancel, 1
		  
		  App.T.TranslateWindow Me, "print_preview", App.TranslationFonts
		  
		  App.DebugWriter.Write "PrintWindow.Open: Exit"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  FixScrollBars
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  nil_panel.Invalidate
		  FixScrollBars
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ActionZoom(Value As Double)
		  Zoom = Zoom + Value
		  If Zoom < 0.2 Then Zoom = 0.2
		  App.DebugWriter.Write "PrintWindow.ActionZoom: Zoom is " + str(Zoom), 7
		  edt_page_zoom.Text = Str(Zoom * 100) + "%"
		  ChangePage(CurrentPage)
		  App.DebugWriter.Write "PrintWindow.ActionZoom: back from ChangePage", 7
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ChangePage(PageNum As Integer)
		  Dim newpg As Group2D
		  
		  App.DebugWriter.Write "PrintWindow.ChangePage: Enter, page = " + str(PageNum)
		  If PrintReport = Nil Then Return
		  If PageNum > PageCount Or _
		    PageNum < 1 Then
		    Return ' out of bounds
		  End if
		  
		  mCurrentPage = PageNum
		  App.DebugWriter.Write "PrintWindow.ChangePage: Call PrintReport.GetPage"
		  newpg = Group2D(PrintReport.GetPage(PageNum, Zoom))
		  If newpg <> Nil Then
		    App.DebugWriter.Write "PrintWindow.ChangePage: newpg.Count = " + str(newpg.Count) + ", PageObj.Count is " + str(PageObj.Count)
		    App.DebugWriter.Write "PrintWindow.ChangePage: PageObj.Count is now " + str(PageObj.Count)
		  Else
		    App.DebugWriter.Write "PrintWindow.ChangePage: PrintReport.GetPage returned Nil"
		  End If
		  txt_page_page.Text = App.T.Translate("print_preview/pages/@caption", Str(currentPage), Str(PrintReport.GetPageCount))
		  SetupPage
		  FixScrollBars
		  UpdatePageNavigationControls
		  cnv_page.Invalidate
		  App.DebugWriter.Write "PrintWindow.ChangePage: Exit"
		  Catch CPEx
		    App.DebugWriter.Write "PrintWindow.ChangePage: Caught Exception"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // call the Window constructor, or Open events will not fire
		  App.DebugWriter.Write "PrintWindow"
		  Super.Window()
		  PageObj = New Group2D
		  #if TargetMacOS then
		    WindowScale = 72 / 72
		  #else
		    WindowScale = 96 / 72
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  App.DebugWriter.Write "~PrintWindow"
		  PageObj = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FixScrollBars()
		  App.DebugWriter.Write "PrintWindow.FixScrollBars: Enter", 9
		  scr_vertical.Minimum = 0
		  scr_vertical.Value = 0
		  
		  scr_horizontal.Minimum = 0
		  scr_horizontal.Value = 0
		  
		  If cnv_page.Top + cnv_page.Height + 2 > Me.Height - scr_horizontal.Height Then
		    scr_vertical.Enabled = True
		    scr_vertical.Maximum = cnv_page.Height - (Height - 35 - scr_horizontal.Height - 10)
		    scr_vertical.PageStep = (Height - 35 - scr_horizontal.Height - 10)
		    scr_vertical.LineStep = scr_vertical.PageStep / 20
		  Else
		    scr_vertical.Enabled = False
		    scr_vertical.Maximum = 0
		  End If
		  If (cnv_page.Left + cnv_page.Width + 2) > (Self.Width - scr_vertical.Width) Then
		    scr_horizontal.Enabled = True
		    scr_horizontal.Maximum = cnv_page.Width - (Width - 10 - scr_vertical.Width - 10)
		    scr_horizontal.PageStep = (Width - 10 - scr_vertical.Width - 10)
		    scr_horizontal.LineStep = scr_horizontal.PageStep / 20
		  Else
		    scr_horizontal.Enabled = False
		    scr_horizontal.Maximum = 0
		  End If
		  App.DebugWriter.Write "PrintWindow.FixScrollBars: Exit", 9
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ModifierMask(IsShift As Boolean, IsAlt As Boolean, IsCtrl As Boolean, IsOS As Boolean) As Integer
		  Dim Mask As Integer
		  
		  If IsShift Then Mask = 1
		  If IsAlt Then Mask = Mask + 2
		  If IsCtrl Then Mask = Mask + 4
		  If IsOS Then Mask = Mask + 8
		  
		  Return Mask
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NavigatePreview(Direction As Integer, Key As String, ModifierMask As Integer) As Boolean
		  // navigate like this:
		  //
		  // Modifier                                             Ctrl                         Crtl
		  // Condition                       At edge of Pg                                     At edge of Pg
		  // -----------------------------------------------------------------------------------------------------
		  // LEFT/RIGHT  Scroll LineStep     -                    Scroll PageStep              -
		  // UP/DOWN     Scroll LineStep     -                    Scroll PageStep              -
		  // PGUP/PGDN   Scroll PageStep     Next/Prev. Pg. adj.  Next/Prev Pg. same Viewport  (ignore edge cond.)
		  // HOME/END    Top/Bottom of Page  -                    First Pg. TL/Last Pg. BL     (ignore edge cond.)
		  // (- means nothing is to happen, the key is still consumed)
		  
		  // Direction
		  Const DIR_DOWN = 1
		  Const DIR_UP = 2
		  Const DIR_RIGHT = 4
		  Const DIR_LEFT = 8
		  
		  // ModifierMask (Keyboard modifier keys pressed)
		  Const KMOD_NONE = 0
		  Const KMOD_SHIFT = 1
		  Const KMOD_ALT = 2
		  Const KMOD_CTRL = 4
		  Const KMOD_OS = 8
		  
		  // Key as in KeyDown Event
		  Const ASC_KEY_LEFT = 28
		  Const ASC_KEY_RIGHT = 29
		  Const ASC_KEY_UP = 30
		  Const ASC_KEY_DOWN = 31
		  Const ASC_KEY_PGDN=12
		  Const ASC_KEY_PGUP =11
		  Const ASC_KEY_HOME=1
		  Const ASC_KEY_END=4
		  
		  If (ModifierMask And Not KMOD_CTRL) <> 0 Then Return False
		  
		  #pragma BreakOnExceptions Off
		  Dim r as RuntimeException
		  Try
		    r.Message = ""
		  Catch e As RuntimeException
		    If e.Stack <> Nil And e.Stack.Ubound >= 1 Then
		      Dim callerName, st() As String
		      st = e.Stack
		      callerName =st(1)
		      If callerName.InStr("<") <> 0 Then callerName = callerName.Left(callerName.InStr("<")-1)
		      If callerName.InStr("%") <> 0 Then callerName = callerName.Left(callerName.InStr("%")-1)
		      App.DebugWriter.Write(StringUtils.Sprintf("%s called from %s, Key %u, Mask %u",CurrentMethodName,callerName,Asc(Key),ModifierMask))
		    End If
		  End Try
		  #pragma BreakOnExceptions Default
		  
		  Dim processed As Boolean
		  Select Case Asc(Key)
		  Case ASC_KEY_LEFT
		    processed = (Direction And DIR_LEFT) = DIR_LEFT
		  Case ASC_KEY_RIGHT
		    processed = (Direction And DIR_RIGHT) = DIR_RIGHT
		  Case ASC_KEY_UP, ASC_KEY_PGUP, ASC_KEY_HOME
		    processed = (Direction And DIR_UP) = DIR_UP
		  Case ASC_KEY_DOWN, ASC_KEY_PGDN, ASC_KEY_END
		    processed = (Direction And DIR_DOWN) = DIR_DOWN
		  Case Asc("+"), Asc("-")
		    processed = True
		  End Select
		  If Not processed Then Return False
		  
		  Dim dX As Integer
		  Dim dY As Integer
		  Dim newPage As Integer
		  Dim changed As Boolean = False
		  Dim modCtrl As Boolean
		  
		  dX = 0
		  dY = 0
		  newPage = CurrentPage
		  modCtrl = (ModifierMask And KMOD_CTRL) = KMOD_CTRL
		  Select Case Asc(Key)
		  Case ASC_KEY_DOWN
		    If modCtrl Then
		      dY = scr_vertical.PageStep
		    Else
		      dY = scr_vertical.LineStep
		    End If
		  Case ASC_KEY_UP
		    If modCtrl Then
		      dY = -scr_vertical.PageStep
		    Else
		      dY = -scr_vertical.LineStep
		    End If
		  Case ASC_KEY_RIGHT
		    If modCtrl Then
		      dX = scr_horizontal.PageStep
		    Else
		      dX = scr_horizontal.LineStep
		    End If
		  Case ASC_KEY_LEFT
		    If modCtrl Then
		      dX = -scr_horizontal.PageStep
		    Else
		      dX = -scr_horizontal.LineStep
		    End If
		  Case ASC_KEY_PGDN
		    If modCtrl Then
		      newPage = CurrentPage + 1
		    Else
		      If scr_vertical.Value = scr_vertical.Maximum Then
		        If CurrentPage < PageCount Then
		          newPage = CurrentPage + 1
		          dY = -scr_vertical.Value
		        End If
		      Else
		        dY = scr_vertical.PageStep
		      End If
		    End If
		  Case ASC_KEY_PGUP
		    If modCtrl Then
		      newPage = CurrentPage - 1
		    Else
		      If scr_vertical.Value = scr_vertical.Minimum Then
		        If CurrentPage > 1 Then
		          newPage = CurrentPage - 1
		          dY = scr_vertical.Maximum - scr_vertical.Value
		        End If
		      Else
		        dY = -scr_vertical.PageStep
		      End If
		    End If
		  Case ASC_KEY_END
		    If modCtrl Then
		      newPage = PageCount
		      dX = -scr_horizontal.Value
		      dY = scr_vertical.Maximum - scr_vertical.Value
		    Else
		      dY = scr_vertical.Maximum - scr_vertical.Value
		    End If
		  Case ASC_KEY_HOME
		    If modCtrl Then
		      newPage = 1
		      dX = -scr_horizontal.Value
		      dY = -scr_vertical.Value
		    Else
		      dY = -scr_vertical.Value
		    End If
		  Case Asc("+")
		    ActionZoom(0.2)
		  Case Asc("-")
		    ActionZoom(-0.2)
		  End Select
		  
		  Dim newX, newY As Integer
		  newX = scr_horizontal.Value + dX
		  newX = Min(newX,scr_horizontal.Maximum)
		  newX = Max(newX,scr_horizontal.Minimum)
		  newY = scr_vertical.Value + dY
		  newY = Min(newY,scr_vertical.Maximum)
		  newY = Max(newY,scr_vertical.Minimum)
		  newPage = Min(newPage,PageCount)
		  newPage = Max(newPage,1)
		  
		  If newPage <> CurrentPage Then
		    App.DebugWriter.Write(StringUtils.Sprintf("%s : CurrentPage %d newPage %d",CurrentMethodName,CurrentPage,newPage))
		    CurrentPage = newPage
		    changed = True
		  End If
		  
		  If newX <> scr_horizontal.Value Then
		    App.DebugWriter.Write(StringUtils.Sprintf("%s : horizontal value %d newX %d",CurrentMethodName,scr_horizontal.Value,newX))
		    scr_horizontal.Value = newX
		    changed = True
		  End If
		  
		  If newY <> scr_vertical.Value Then
		    App.DebugWriter.Write(StringUtils.Sprintf("%s : vertical value %d newY %d",CurrentMethodName,scr_vertical.Value,newY))
		    scr_vertical.Value = newY
		    changed = True
		  End If
		  
		  If changed Then
		    nil_panel.Invalidate
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ScrollPreview(X As Integer, Y As Integer, deltaX As Integer, deltaY As Integer)
		  #Pragma Unused X
		  #Pragma Unused Y
		  //++
		  // Handle the scroll wheel events
		  //--
		  
		  Dim newX As Integer
		  Dim newY As Integer
		  Dim changed As Boolean = False
		  
		  If deltaX <> 0 Then
		    newX = scr_horizontal.Value + (deltaX * scr_horizontal.LineStep)
		    newX = Min(newX, scr_horizontal.Maximum)
		    newX = Max(newX, scr_horizontal.Minimum)
		    scr_horizontal.Value = newX
		    changed = True
		  End If
		  
		  If deltaY <> 0 Then
		    newY = scr_vertical.Value + (deltaY * scr_vertical.LineStep)
		    newY = Min(newY, scr_vertical.Maximum)
		    newY = Max(newY, scr_vertical.Minimum)
		    scr_vertical.Value = newY
		    changed = True
		  End If
		  
		  If changed Then
		    nil_panel.Invalidate
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetReport(Rpt As ReportClass)
		  App.DebugWriter.Write "PrintWindow.SetReport: Enter"
		  PrintReport = Rpt
		  If Rpt <> Nil Then
		    PageCount = Rpt.GetPageCount
		    PrintableWidth = Rpt.PrintableWidth
		    PrintableHeight = Rpt.PrintableHeight
		    If Rpt.ps <> Nil Then
		      PageHeight = Rpt.ps.PageHeight / Rpt.ps.VerticalResolution
		      PageWidth = Rpt.ps.PageWidth / Rpt.ps.HorizontalResolution
		    Else
		      PageHeight = PrintableHeight
		      PageWidth = PrintableWidth
		    End If
		    ChangePage(1)
		  End If
		  App.DebugWriter.Write "PrintWindow.SetReport: Exit"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupPage()
		  App.DebugWriter.Write "PrintWindow.SetupPage: Enter", 9
		  cnv_page.Width = PageWidth * 72 * WindowScale * zoom
		  cnv_page.Height = PageHeight * 72 * WindowScale * zoom
		  edt_page_zoom.Text = Str(zoom*100) + "%"
		  FixScrollBars
		  App.DebugWriter.Write "PrintWindow.SetupPage: Exit", 9
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdatePageNavigationControls()
		  App.DebugWriter.Write "PrintWindow.UpdatePageNavigationControls: Enter"
		  
		  If PrintReport = Nil Then
		    btn_page_first.Enabled = False
		    btn_page_previous.Enabled = False
		    btn_page_next.Enabled = False
		    btn_page_last.Enabled = False
		  End If
		  
		  btn_page_previous.Enabled = CurrentPage > 1
		  btn_page_first.Enabled = CurrentPage > 1
		  
		  btn_page_next.Enabled = CurrentPage < PageCount
		  btn_page_last.Enabled = CurrentPage < PageCount
		  
		  App.DebugWriter.Write "PrintWindow.UpdatePageNavigationControls: Exit"
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCurrentPage
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ChangePage(value)
			End Set
		#tag EndSetter
		CurrentPage As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		HSizer As HalfSizer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected initialActivation As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentPage As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			Total number of pages in the report being previewed
		#tag EndNote
		Protected PageCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PageHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PageObj As Group2D
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PageWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrintableHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrintableWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Report currently being displayed.
			Using superclass to support more report types.
		#tag EndNote
		PrintReport As ReportClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WheelDeltaX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WheelDeltaY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowScale As Double = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		Zoom As Double
	#tag EndProperty


#tag EndWindowCode

#tag Events nil_panel
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  // For zooming we don't want the "Number of lines per mouse wheel step.
		  // I don't know how to get tthe value from each operating system,
		  // so do some heuristics
		  If deltaX > 0 Then
		    If WheelDeltaX = 0 Or WheelDeltaX > deltaX Then
		      WheelDeltaX = deltaX
		    End If
		  End If
		  If deltaY > 0 Then
		    If WheelDeltaY = 0 Or WheelDeltaY > deltaY Then
		      WheelDeltaY = deltaY
		    End If
		  End If
		  
		  If Keyboard.AsyncShiftKey Or Keyboard.AsyncAltKey Or Keyboard.AsyncOSKey Then
		    Return False
		  End If
		  
		  If Keyboard.AsyncControlKey Then
		    // Ctrl + mouse wheel -> zoom
		    If deltaY > 0 Then
		      deltaY = deltaY \ WheelDeltaY
		      If deltaY = 0 Then deltaY = 1
		    End If
		    ActionZoom(deltaY * -0.2)
		  Else
		    ScrollPreview(X, Y, deltaX, deltaY)
		  End If
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cnv_page
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  Dim x, y As Double
		  Dim ps As PrinterSetup
		  Dim pg As Object2D
		  
		  App.DebugWriter.Write "PrintWindow.cnv_page.paint: Enter"
		  If PrintReport = Nil Then Return
		  ps = PrintReport.ps
		  If ps = Nil Then
		    ps = App.GetPrinterSetup(False)
		  End If
		  If ps = Nil Then Return
		  App.DebugWriter.Write "Printwindow.cnv_page.paint: ps is OK"
		  g.ForeColor = &cffffff
		  g.FillRect 0, 0, g.Width, g.Height
		  pg = PrintReport.GetPage(CurrentPage, WindowScale * Zoom)
		  If pg = Nil Then
		    App.DebugWriter.Write "PrintWindow.cnv_page.Paint: pg = Nil"
		    Return
		  End If
		  x = PrintReport.LeftMargin * 72 * WindowScale * Zoom
		  y = PrintReport.TopMargin * 72 * WindowScale * Zoom - scr_vertical.Value
		  App.DebugWriter.Write "PrintWindow.cnv_page.paint: calling DrawObject with x, y: " + str(x) + ", " + str(y)
		  g.DrawObject pg, x, y
		  App.DebugWriter.Write "PrintWindow.cnv_page.paint: Exit"
		  Catch DrawException
		    If DrawException IsA OutOfBoundsException Then
		      App.DebugWriter.Write "PrintWindow.cnv_page.paint, OutOfBoundsException"
		    Else
		      App.DebugWriter.Write "PrintWindow.cnv_page.paint, caught unknown exception."
		    End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scr_vertical
	#tag Event
		Sub ValueChanged()
		  cnv_page.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If NavigatePreview(15, Key, ModifierMask(Keyboard.ShiftKey, Keyboard.AltKey, Keyboard.ControlKey Or Keyboard.CommandKey, Keyboard.OSKey)) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events scr_horizontal
	#tag Event
		Sub ValueChanged()
		  cnv_page.Left = 10 - scr_horizontal.Value
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If NavigatePreview(15, Key, ModifierMask(Keyboard.ShiftKey, Keyboard.AltKey, Keyboard.ControlKey Or Keyboard.CommandKey, Keyboard.OSKey)) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_page_print
	#tag Event
		Sub Action()
		  If PrintReport = Nil Then Return
		  Self.Hide
		  If PrintReport.Print Then Close
		  Self.Show
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
#tag Events btn_page_first
	#tag Event
		Sub Action()
		  ChangePage(1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_page_previous
	#tag Event
		Sub Action()
		  If CurrentPage > 1 Then
		    ChangePage(CurrentPage - 1)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_page_next
	#tag Event
		Sub Action()
		  If PrintReport = Nil Then Return
		  If currentPage <= PrintReport.GetPageCount Then
		    ChangePage(CurrentPage + 1)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_page_last
	#tag Event
		Sub Action()
		  If PrintReport = Nil Then Return
		  ChangePage(PrintReport.GetPageCount)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_page_zoom_in
	#tag Event
		Sub Action()
		  App.DebugWriter.Write "PrintWindow.btn_page_zoom_in: Enter", 7
		  
		  ActionZoom(-0.2)
		  
		  App.DebugWriter.Write "PrintWindow.btn_page_zoom_in: Exit", 7
		  Catch ExZoomIn
		    App.DebugWriter.Write "PrintWindow.btn_page_zoom_in: Caught exception", 7
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_page_zoom
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim i As Integer
		  Dim zoomtext As String
		  Dim newzoom As Double
		  Dim txt As String = Chr(10) + Chr(13) + Chr(9)
		  If InStr(txt, Key) > 0 Then
		    // Check to see if the user typed in the % or something else
		    For i = 1 to Len(Me.Text)
		      If StringUtils.isdigit(Asc(Mid(Me.Text, i, 1))) Then _
		      zoomtext = zoomtext + Mid(Me.Text, i, 1)
		    Next i
		    Try
		      Newzoom  = CDbl(zoomtext) / 100
		    Catch e As typeMismatchException
		      newzoom = Zoom // Set it back to where it was
		    End Try
		    Zoom = newzoom
		    SetupPage
		    cnv_page.Invalidate
		    If Asc(Key) <> 9 Then
		      // consume Enter so the default button does not fire
		      // Transfer input focus to page (scrolling)
		      self.SetFocus
		      self.FocusNext
		      Return True
		    End If
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  zoom  = CDbl(Me.Text) / 100
		  SetupPage
		  cnv_page.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_page_zoom_out
	#tag Event
		Sub Action()
		  App.DebugWriter.Write "PrintWindow.btn_page_zoom_out: Enter", 7
		  
		  ActionZoom(0.2)
		  
		  App.DebugWriter.Write "PrintWindow.btn_page_zoom_out: Exit", 7
		  Catch ExZoomOut
		    App.DebugWriter.Write "PrintWindow.btn_page_zoom_out: Caught exception", 7
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_page_print_setup
	#tag Event
		Sub Action()
		  Dim ps As PrinterSetup
		  Dim myPrintSettingsWindow As PrintSettingsWindow
		  
		  ps = PrintReport.ps
		  myPrintSettingsWindow = New PrintSettingsWindow(PrintReport.PrintSettings, ps)
		  myPrintSettingsWindow.ShowModalWithin PrintWindow
		  If myPrintSettingsWindow.SetupChanged Then
		    PrintReport.ps = myPrintSettingsWindow.GetPageSetup
		    
		    //++
		    // September 2006, EMP
		    //
		    // Regenerate the report with the new settings.
		    //--
		    If PrintReport.Generate Then
		      SetReport(PrintReport)
		    End If
		    
		    SetupPage
		  End If
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
		Name="CurrentPage"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
	#tag ViewProperty
		Name="Zoom"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="WindowScale"
		Visible=false
		Group="Behavior"
		InitialValue="1"
		Type="Double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
