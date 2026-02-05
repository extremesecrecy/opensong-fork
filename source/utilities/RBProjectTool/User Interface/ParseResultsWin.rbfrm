#tag Window
Begin Window ParseResultsWin
   BackColor       =   16777215
   Backdrop        =   ""
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   244
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   120
   MinimizeButton  =   True
   MinWidth        =   300
   Placement       =   0
   Resizeable      =   True
   Title           =   "Results from ^0"
   Visible         =   False
   Width           =   511
   Begin ListBox ListBox1
      AutoDeactivate  =   True
      Bold            =   ""
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   80
      ControlOrder    =   0
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   184
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Type	Message"
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   471
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Close"
      ControlOrder    =   1
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   411
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   210
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub addToList(isWarning as Boolean, msg as String)
		  dim s as String
		  if isWarning then
		    s = "Warning"
		  else
		    s = "ERROR"
		  end
		  ListBox1.AddRow s
		  ListBox1.Cell (ListBox1.LastIndex, 1) = msg
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowResults(results as RBPrjParseResults, where as String)
		  dim s as String
		  
		  self.Title = Replace (self.Title, "^0", where)
		  
		  if Ubound(results.errMsgs) >= 0 then
		    for each s in results.errMsgs
		      addToList false, s
		    next
		  end
		  
		  if results.hadEncryptedItems then
		    addToList true, "Project contains encrypted items"
		  end
		  
		  if Ubound(results.warnMsgs) >= 0 then
		    for each s in results.warnMsgs
		      addToList true, s
		    next
		  end
		  
		  if ListBox1.ListCount = 0 then
		    // nothing to show
		    self.Close
		  else
		    self.Show
		  end
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
