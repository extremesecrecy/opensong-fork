#tag Window
Begin Window IdentsWin
   BackColor       =   16777215
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   439
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Global Scope"
   Visible         =   True
   Width           =   677
   Begin RBIdentsListBox theTreeView
      AutoDeactivate  =   True
      autoExpand      =   0
      Bold            =   False
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   "*"
      ControlOrder    =   0
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   14
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   406
      HelpTag         =   ""
      AutoDeactivate  =   "True"
      Enabled         =   True
      ColumnCount     =   1
      ColumnWidths    =   "*"
      HasHeading      =   "True"
      UseFocusRing    =   "True"
      InitialValue    =   "will be set in listbox"
      insideView      =   0
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      Top             =   33
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   677
   End
   Begin CheckBox inheritedChk
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "show inherited"
      ControlOrder    =   1
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   8
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      State           =   1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   6
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   128
   End
   Begin CheckBox insideViewChk
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "inside view"
      ControlOrder    =   2
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   142
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   6
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub refreshTree()
		  theTreeView.Populate nil, inheritedChk.Value, insideViewChk.Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowIdents(tree as RBPrjIdents)
		  me.theTree = tree
		  theTreeView.Populate tree, inheritedChk.Value, insideViewChk.Value
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private theTree As RBPrjIdents
	#tag EndProperty


#tag EndWindowCode

#tag Events inheritedChk
	#tag Event
		Sub Action()
		  self.refreshTree
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events insideViewChk
	#tag Event
		Sub Action()
		  self.refreshTree
		End Sub
	#tag EndEvent
#tag EndEvents
