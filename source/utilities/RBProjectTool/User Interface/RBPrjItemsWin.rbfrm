#tag Window
Begin Window RBPrjItemsWin
   BackColor       =   16777215
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   425
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
   Title           =   "All items in project ^0"
   Visible         =   True
   Width           =   711
   Begin RBPrjItemsListBox theTreeView
      AutoDeactivate  =   True
      Bold            =   False
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      ControlOrder    =   0
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   14
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      expanding       =   0
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   401
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "will be set in listbox"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      ordered         =   0
      RequiresSelection=   ""
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      Top             =   24
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   711
   End
   Begin CheckBox orderedChk
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Ordered"
      ControlOrder    =   1
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   8
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   2
      Underline       =   ""
      Value           =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   ""
      ControlOrder    =   2
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   153
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Note: The first RbBF item is always the main project's. Further RbBF items are externals"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "SmallSystem"
      TextSize        =   10
      Top             =   4
      Underline       =   ""
      Visible         =   True
      Width           =   480
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  me.origTitle = self.Title
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			me.Close
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Sub RefreshTree()
		  theTreeView.Populate (theTreeView.CurrentTree, orderedChk.Value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowItem(hilightItem as RBPrjItem)
		  theTreeView.ShowItem (hilightItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowTree(tree as RBPrjItemsTree, prjname as String = "*", hilightItem as RBPrjItem = nil)
		  if prjname = "*" then
		    prjname = tree.FileRef.Name
		  end
		  self.Title = Replace (me.origTitle, "^0", prjname)
		  theTreeView.Populate (tree, orderedChk.Value)
		  if hilightItem <> nil then
		    ShowItem (hilightItem)
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private origTitle As String
	#tag EndProperty


#tag EndWindowCode

#tag Events orderedChk
	#tag Event
		Sub Action()
		  self.RefreshTree
		End Sub
	#tag EndEvent
#tag EndEvents
