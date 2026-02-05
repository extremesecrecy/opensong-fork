#tag Window
Begin Window ClassBrowserWin
   BackColor       =   16777215
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   530
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
   Title           =   "Class Browser"
   Visible         =   True
   Width           =   624
   Begin GrayEditField FindEdit
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      black           =   0
      Bold            =   False
      Border          =   True
      CompleteOnLostFocus=   0
      CompletionSelectsAll=   0
      ControlOrder    =   0
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      gray            =   0
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   False
      Password        =   False
      ReadOnly        =   False
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   14
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   584
   End
   Begin GroupBox ClassBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Classes"
      ControlOrder    =   1
      Enabled         =   True
      Height          =   291
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   48
      Underline       =   False
      Visible         =   True
      Width           =   202
      Begin PopupMenu classViewPopup
         AutoDeactivate  =   True
         Bold            =   False
         ControlOrder    =   2
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ClassBox"
         InitialValue    =   "flat\rhierar. (in->out)\rhierar. (out->in)"
         Italic          =   False
         Left            =   32
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   10
         Top             =   74
         Underline       =   False
         Visible         =   True
         Width           =   178
      End
      Begin ListBox ClassList
         AutoDeactivate  =   True
         Bold            =   False
         ColumnCount     =   1
         ColumnsResizable=   False
         ColumnWidths    =   ""
         ControlOrder    =   3
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
         Height          =   226
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "ClassBox"
         InitialValue    =   "<Globals>"
         Italic          =   False
         Left            =   32
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   10
         Top             =   102
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   178
      End
   End
   Begin GroupBox MembersBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Members"
      ControlOrder    =   4
      Enabled         =   True
      Height          =   291
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   240
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   48
      Underline       =   False
      Visible         =   True
      Width           =   364
      Begin CheckBox insideViewChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "inside view"
         ControlOrder    =   5
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "MembersBox"
         Italic          =   False
         Left            =   253
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   10
         Top             =   74
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   340
      End
      Begin CheckBox inheritedChk
         AutoDeactivate  =   True
         BehaviorIndex   =   6
         Bold            =   False
         Caption         =   "show inherited"
         ControlOrder    =   6
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "MembersBox"
         Italic          =   False
         Left            =   253
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         State           =   1
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   10
         Top             =   95
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   340
      End
      Begin ListBox MembersList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         BehaviorIndex   =   7
         Bold            =   False
         ColumnCount     =   2
         ColumnsResizable=   False
         ColumnWidths    =   20
         ControlOrder    =   7
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
         Height          =   206
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "MembersBox"
         InitialValue    =   ""
         Italic          =   False
         Left            =   253
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   10
         Top             =   122
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   340
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
   Begin TextArea ContentView
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      BehaviorIndex   =   8
      Bold            =   False
      Border          =   True
      ControlOrder    =   8
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   160
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      Password        =   False
      ReadOnly        =   True
      ScrollbarHorizontal=   True
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "SmallSystem"
      TextSize        =   10
      Top             =   358
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   584
   End
   Begin MarsSplitter MarsSplitter1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BehaviorIndex   =   9
      ControlOrder    =   9
      Enabled         =   True
      EraseBackground =   True
      Height          =   291
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   222
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   True
      MinBottomRight  =   100
      MinTopLeft      =   100
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   48
      UseFocusRing    =   True
      Visible         =   True
      Width           =   18
   End
   Begin MarsSplitter MarsSplitter2
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BehaviorIndex   =   10
      ControlOrder    =   10
      Enabled         =   True
      EraseBackground =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MinBottomRight  =   60
      MinTopLeft      =   160
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   339
      UseFocusRing    =   True
      Visible         =   True
      Width           =   584
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  me.setup()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  if RBVersion < 2005 then
		    MsgBox "Sorry, but the window resizing has probably messed up the layout of items in the window. Wouldn't happen if you'd use RB 2005 or if RS had fixed this earlier"
		  end
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub populateClassList()
		  dim names(), name as String
		  
		  '### need to evaluate "classViewPopup" as well!
		  
		  ClassList.DeleteAllRows
		  ClassList.AddRow me.globalsName // Globals come always first in list, the rest gets sorted
		  ClassList.CellTag (ClassList.LastIndex, 0) = ""
		  
		  names = me.theTree.AllClassNames ()
		  names.Sort
		  
		  redim me.autoCompletionChoices(-1)
		  for each name in names
		    ClassList.AddRow name
		    ClassList.CellTag (ClassList.LastIndex, 0) = name
		    me.autoCompletionChoices.Append name
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub refreshContentView()
		  dim item as RBPrjObjEntity
		  dim s as String
		  
		  if MembersList.ListIndex >= 0 then
		    item = MembersList.CellTag (MembersList.ListIndex, 0)
		    s = item.Notes + EndOfLine + item.Content
		  end
		  ContentView.Text = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub refreshMembers()
		  if ClassList.ListIndex >= 0 then
		    me.currClassName = ClassList.CellTag (ClassList.ListIndex, 0)
		  end if
		  me.includeInherited = inheritedChk.Value
		  me.insideView = insideViewChk.Value
		  
		  me.showMembers me.theTree, me.currClassName, me.includeInherited, me.insideView
		  
		  me.refreshContentView // this effectively clears the content view
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTree(tree as RBPrjIdents)
		  me.theTree = tree
		  
		  populateClassList
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setup()
		  me.globalsName = ClassList.List(0)
		  
		  if RBVersion < 2005 then
		    // Due to bugs (or shortcomings) in RB 5.5, resizing GroupBoxes
		    // does not automatically resize its contained items along properly.
		    // Because of this, the resizing is suppressed for this experimental
		    // window to avoid the ugly side effects.
		    MarsSplitter1.enabled = false
		    MarsSplitter2.enabled = false
		    self.GrowIcon = false // actually, this does not even work - the window remains resizable in RB 5.5.5,
		    self.ZoomIcon = false // so we warn the user instead in the Window.Resized event
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub showMembers(tree as RBPrjIdents, className as String, includeInherited as Boolean, insideView as Boolean)
		  dim items(), tmpItems(), item, tmpItem, classItem as RBPrjObjEntity
		  dim inheritedItems as Dictionary
		  dim isContainer as Boolean
		  dim s, superName as String
		  
		  items = tree.AllIdents (className)
		  
		  inheritedItems = new Dictionary
		  if includeInherited then
		    superName = className
		    do
		      classItem = tree.LookupClass (superName)
		      if classItem = nil then exit
		      superName = classItem.SuperClass
		      if superName = "" then exit
		      tmpItems = tree.AllIdents (superName)
		      for each tmpItem in tmpItems
		        if not tmpItem.IsPrivate() then // never include privates from super classes
		          '### should detect overidden methods here and mark them in the view somehow
		          items.Append tmpItem
		          inheritedItems.Value(tmpItem) = true
		        end if
		      next
		    loop
		  end
		  
		  // sort the items by their name
		  TTsArraySorter.SortValueArray items, true
		  
		  MembersList.DeleteAllRows
		  for each item in items
		    if (insideView or item.IsPublic) then
		      isContainer = tree.IsContainer (item.Name)
		      if not isContainer then
		        select case item.Type
		        case RBPrjObjEntity.TypeMethod
		          s = "M"
		        case RBPrjObjEntity.TypeEventDef
		          s = "E"
		        case RBPrjObjEntity.TypeEventHandler
		          s = "H"
		        case RBPrjObjEntity.TypeVariable, RBPrjObjEntity.TypeProperty
		          s = "P"
		        case RBPrjObjEntity.TypeConstant
		          s = "C"
		        else
		          s = "?" // it's usually a control, but we can't handle them here yet ###
		        end
		        if isContainer then
		          MembersList.AddFolder s
		        else
		          MembersList.AddRow s
		        end
		        MembersList.CellTag (MembersList.LastIndex, 0) = item
		        s = item.Name
		        if Left(item.Declaration, 1) = "(" then // '### I am not happy with how this works out yet. I need to change the way I store this information!
		          s = s + " " + item.Declaration
		        else
		          s = s + " as " + item.Declaration
		        end
		        MembersList.Cell (MembersList.LastIndex, 1) = s
		        if inheritedItems.HasKey (item) then
		          MembersList.CellItalic (MembersList.LastIndex, 1) = true
		        end
		        'Cell (LastIndex, 1) = item.TypeName
		        'Cell (LastIndex, 2) = item.SuperClass
		        'Cell (LastIndex, 3) = item.Declaration
		        'Cell (LastIndex, 4) = ReplaceAll (item.Content, EndOfLine, " / ")
		        'Cell (LastIndex, 5) = ReplaceAll (item.Notes, EndOfLine, " / ")
		        'if isContainer and (autoExpand or expanded.HasKey (item)) then
		        'Expanded(LastIndex) = true
		        'end
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private autoCompletionChoices() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private currClassName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private globalsName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private includeInherited As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private insideView As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theTree As RBPrjIdents
	#tag EndProperty


#tag EndWindowCode

#tag Events FindEdit
	#tag Event
		Sub GetChoices(ByRef choices() as String)
		  choices = self.autoCompletionChoices
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  dim theChoice as String
		  dim i as Integer
		  
		  if me.Text <> "" then
		    theChoice = me.Text
		    for i = 0 to ClassList.ListCount-1
		      if ClassList.List(i) = theChoice then
		        ClassList.ListIndex = i
		        exit
		      end if
		    next
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClassList
	#tag Event
		Sub Change()
		  self.refreshMembers
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events insideViewChk
	#tag Event
		Sub Action()
		  self.refreshMembers
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events inheritedChk
	#tag Event
		Sub Action()
		  self.refreshMembers
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MembersList
	#tag Event
		Sub Change()
		  self.refreshContentView
		End Sub
	#tag EndEvent
#tag EndEvents
