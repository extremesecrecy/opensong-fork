#tag Window
Begin Window SongActivity
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   11
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   200
   MinimizeButton  =   True
   MinWidth        =   650
   Placement       =   0
   Resizeable      =   True
   Title           =   "Song Activity Log"
   Visible         =   False
   Width           =   650
   Begin ListBox lst_act_songs
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   7
      ColumnsResizable=   True
      ColumnWidths    =   "3*,3*,7*,5*,5*,3*,3*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   234
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   112
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   610
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton btn_act_done
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Done"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   530
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btn_act_print
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Print"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   130
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      Visible         =   True
      Width           =   95
   End
   Begin PushButton btn_act_find
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Find"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   530
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   76
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin TextField edt_search
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   349
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   77
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   170
   End
   Begin Label lbl_show
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Show:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu pop_show
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   106
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   12
      Underline       =   ""
      Visible         =   True
      Width           =   202
   End
   Begin Label lbl_date_range
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Date Range (MM/DD/YYYY):"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   53
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   262
   End
   Begin TextField edt_from
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   78
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   120
   End
   Begin TextField edt_to
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   166
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   78
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   120
   End
   Begin Label txt_act_to
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   143
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "To"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   77
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   20
   End
   Begin PushButton btn_act_export
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Export"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   430
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      Visible         =   True
      Width           =   95
   End
   Begin PushButton btn_act_clear_log
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Clear Log"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btn_act_view
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "View LogFile"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   230
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      Visible         =   True
      Width           =   95
   End
   Begin PushButton btn_act_merge
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Merge"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   330
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   358
      Underline       =   ""
      Visible         =   True
      Width           =   95
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   45
      Visible         =   True
      Width           =   607
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim d As New Date
		  
		  App.T.TranslateWindow Me, "song_activity", App.TranslationFonts
		  App.T.LoadPopup("song_activity/show", pop_show)
		  App.CenterInControlScreen Me
		  
		  Initializing = True
		  edt_to.Text = d.ShortDate 'Default to current date
		  d.SQLDate = Str(d.Year) + "-01-01"  'Default to January 1st of the current year
		  edt_from.Text = d.ShortDate
		  
		  Initializing = False
		  
		  OldIndex = -2
		  pop_show.ListIndex = 0
		  Self.Visible = True
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddEntryToList(Log As LogEntry)
		  // This is where we plug-in all the Log entry infos into the list
		  
		  If log.DateAndTime <> Nil Then
		    // Date
		    lst_act_songs.AddRow Log.DateAndTime.ShortDate
		    // Time
		    lst_act_songs.Cell(lst_act_songs.LastIndex, 1) = Log.DateAndTime.ShortTime 'We could use LongTime for accuracy to the second (for our vulcan users :)
		  Else
		    // Date
		    lst_act_songs.AddRow ""
		    // Time
		    lst_act_songs.Cell(lst_act_songs.LastIndex, 1) = ""
		  End If
		  
		  // Activity
		  lst_act_songs.Cell(lst_act_songs.LastIndex, 2) = NthField(App.T.Translate("song_activity/description"), "|", Log.Activity)
		  // Title
		  lst_act_songs.Cell(lst_act_songs.LastIndex, 3) = Log.Title
		  // Author
		  lst_act_songs.Cell(lst_act_songs.LastIndex, 4) = Log.Author
		  // CCLI Song #
		  lst_act_songs.Cell(lst_act_songs.LastIndex, 5) = Log.CCLISongNumber
		  // Chords
		  If Log.HasChords Then
		    lst_act_songs.Cell(lst_act_songs.LastIndex, 6) = App.T.Translate("shared/yes")
		  Else
		    lst_act_songs.Cell(lst_act_songs.LastIndex, 6) = App.T.Translate("shared/no")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDate(Text As String, ByRef Date As Date) As Boolean
		  Dim d As Date
		  
		  If Text.Trim.Len = 0 Then
		    d = Nil
		  ElseIf Not ParseDate(Text, d) Then
		    Return False
		  End If
		  
		  If (d = Nil Xor Date = Nil) Or (d <> Nil And Date <> Nil And (CompareDates(d, Date) <> 0)) Then
		    Date = d
		    If Not Initializing Then
		      RefreshList
		    End If
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshList()
		  Dim i As Integer
		  Dim recordType As Integer
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  lst_act_songs.DeleteAllRows
		  
		  recordType = pop_show.RowTag(pop_show.ListIndex).IntegerValue
		  OldIndex = pop_show.ListIndex
		  
		  For i = 0 To LogEntries.Ubound
		    If (recordType > 0) And (LogEntries(i).Activity <> recordType) Then
		      Continue
		    End If
		    If FromDate <> Nil Then
		      If LogEntries(i).DateAndTime = Nil Or CompareDates(LogEntries(i).DateAndTime, FromDate) < 0 Then
		        Continue
		      End If
		    End If
		    If ToDate <> Nil Then
		      If LogEntries(i).DateAndTime = Nil Or CompareDates(LogEntries(i).DateAndTime, ToDate) > 0 Then
		        Continue
		      End If
		    End If
		    If Search Then
		      If LogEntries(i).Title.InStr(edt_search.Text) = 0 And LogEntries(i).Author.InStr(edt_search.Text) = 0 And LogEntries(i).CCLISongNumber.InStr(edt_search.Text) = 0 Then
		        Continue
		      End If
		    End If
		    AddEntryToList(LogEntries(i))
		  Next i
		  Search = False
		  
		  App.MouseCursor = Nil
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mActLog
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mActLog = value
			  ReDim LogEntries(-1)
			  If mActLog <> Nil Then
			    Call mActLog.ReadAllEntries(LogEntries)
			  End If
			End Set
		#tag EndSetter
		ActLog As ActivityLog
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		FromDate As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		FromFile As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Initializing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LogEntries() As LogEntry
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActLog As ActivityLog
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used in edt_from, edt_to to restore the previous date if the field is left with an invalid date
		#tag EndNote
		Private oldDate As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		OldIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Search As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ToDate As Date
	#tag EndProperty


#tag EndWindowCode

#tag Events lst_act_songs
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  Select Case column
		  Case 0  // Date
		    Dim d1, d2 As Date
		    
		    If Not ParseDate(Me.Cell(row1, column), d1) Then
		      Return False
		    End If
		    If Not ParseDate(Me.Cell(row2, column), d2) Then
		      Return False
		    End If
		    
		    result = CompareDates(d1, d2)
		    
		    If Result = 0 Then
		      // include time for proper chronological order
		      // if time is unparseable treat blank as 00:00, non-blank as 24:00
		      Dim t1, t2 As Date
		      If Not ParseTime(Me.Cell(row1, 1), t1) Then
		        t1 = New Date(d1.Year, d1.Month, d1.Day)
		        If Me.Cell(row1, 1).Trim.Len <> 0 Then
		          t1.Hour = 23
		          t1.Minute = 59
		          t1.Second = 59
		          t1.TotalSeconds = t1.TotalSeconds + 0.999
		        End If
		      End If
		      If Not ParseTime(Me.Cell(row2, 1), t2) Then
		        t2 = New Date(d2.Year, d2.Month, d2.Day)
		        If Me.Cell(row2, 1).Trim.Len <> 0 Then
		          t2.Hour = 23
		          t2.Minute = 59
		          t2.Second = 59
		          t1.TotalSeconds = t1.TotalSeconds + 0.999
		        End If
		      End If
		      
		      result = CompareTimes(t1, t2)
		    End If
		  Case 1  // Time
		    Dim d1, d2 As Date
		    
		    If Not ParseTime(Me.Cell(row1, column), d1) Then
		      Return False
		    End If
		    If Not ParseTime(Me.Cell(row2, column), d2) Then
		      Return False
		    End If
		    
		    result = CompareTimes(d1, d2)
		  Case 5  // CCLI Song #
		    result = CompareHymnBookOrder(Me.Cell(row1, column).LTrim, Me.Cell(row2, column).LTrim)
		  Case Else
		    Return False
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_act_done
	#tag Event
		Sub Action()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_act_find
	#tag Event
		Sub Action()
		  Search = edt_search.Text <> ""
		  RefreshList
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_search
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(Key) = 13 Or Asc(Key) = 10 Or Asc(Key) = 3 Then
		    Search = edt_search.Text <> ""
		    RefreshList
		    Return True
		  End If
		  Return False
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pop_show
	#tag Event
		Sub Change()
		  If Initializing Then return
		  
		  If Me.ListIndex <> OldIndex Then RefreshList
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_from
	#tag Event
		Sub TextChange()
		  Call GetDate(Me.Text, FromDate)
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  //++
		  // When we come off this field, it should either have a valid date that was input or get
		  // set to the last valid date
		  //
		  If Not GetDate(Me.text, FromDate) Then
		    FromDate = OldDate
		  End If
		  If FromDate = Nil Then
		    Me.Text = ""
		  Else
		    Me.Text = FromDate.ShortDate
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  OldDate = FromDate
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(Key) = 10 Or Asc(Key) = 13 Then  // Enter, Return
		    FocusNext
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_to
	#tag Event
		Sub TextChange()
		  Call GetDate(Me.Text, ToDate)
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  //++
		  // When we come off this field, it should either have a valid date that was input or get
		  // set to the last valid date
		  //
		  If Not GetDate(Me.Text, ToDate) Then
		    ToDate = oldDate
		  End If
		  If ToDate = Nil Then
		    Me.Text = ""
		  Else
		    Me.Text = ToDate.ShortDate
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  OldDate = ToDate
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(Key) = 10 Or Asc(Key) = 13 Then  // Enter, Return
		    FocusNext
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_act_export
	#tag Event
		Sub Action()
		  Dim dlg As New SaveAsDialog
		  Dim f As FolderItem
		  Dim filterName As String
		  Dim doneMsg As String
		  Dim found As Boolean
		  
		  // build dialog
		  dlg.ActionButtonCaption = App.T.Translate("shared/ok/@caption")
		  dlg.CancelButtonCaption = App.T.Translate("shared/cancel/@caption")
		  filterName = App.T.Translate("file_filter/xml", found)
		  If found Then
		    FileTypes.XMLFiles.Name = filterName
		  End If
		  filterName = App.T.Translate("file_filter/all_files", found)
		  If found Then
		    FileTypes.AllFiles.Name = filterName
		  End If
		  dlg.Filter = FileTypes.XMLFiles + FileTypes.AllFiles
		  
		  f = dlg.ShowModal() // show dialog
		  If f <> Nil Then
		    If mActLog.LogFolderItem <> Nil Then
		      If Not FileUtils.CopyFile(mActLog.LogFolderItem, f, FileUtils.kOverwriteAlways) Then
		        InputBox.Message FileUtils.LastError
		      End If
		    Else
		      mActLog.LogFolderItem = f
		      mActLog.xDoc.SaveXml(f)
		    End If
		    
		    doneMsg = App.T.Translate("song_activity/done", found, f.DisplayName, f.Parent.NativePath)
		    If Not found Then
		      doneMsg = App.T.Translate("shared/done/@caption", found)
		    End If
		    If Not found Then doneMsg = "Done"
		    InputBox.Message doneMsg
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_act_clear_log
	#tag Event
		Sub Action()
		  If Not InputBox.Ask(App.T.Translate("song_activity/input_box/erase_all")) Then Return
		  
		  If Not mActLog.ClearLog Then
		    'TODO
		    Return
		  End If
		  
		  ActLog = mActLog // sync dependencies
		  
		  If Not FromFile Then
		    Globals.SongActivityLog = mActLog
		  End If
		  
		  lst_act_songs.DeleteAllRows
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_act_view
	#tag Event
		Sub Action()
		  Dim file As FolderItem
		  Dim Act As New FileType
		  
		  Act.Name = App.T.Translate("song_activity/file_type")
		  Act.Extensions = "xml"
		  Act.MacType = "XML"
		  
		  file = GetOpenFolderItem(Act)
		  
		  If file = Nil Then Return
		  
		  Dim Log As New ActivityLog
		  If Not Log.Load(file) Then
		    'TODO
		    Return
		  End If
		  
		  Dim saWin As New SongActivity
		  saWin.ActLog = Log
		  saWin.FromFile = True
		  saWin.Title = App.T.Translate("song_activity/@title") + " - (" + Log.LogFolderItem.FormatFolderName + ")"
		  saWin.RefreshList
		  saWin.btn_act_merge.Enabled = True
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_act_merge
	#tag Event
		Sub Action()
		  If mActLog.NumEntries = 0 Then
		    Return
		  End If
		  
		  Dim i As Integer
		  Dim j As Integer
		  Dim dupes As Integer
		  Dim Entry1 As LogEntry
		  Dim Entry2 As LogEntry
		  Dim msg As String
		  
		  For i = 1 To mActLog.NumEntries
		    
		    Entry1 = New LogEntry(mActLog)
		    If Entry1.GetLogEntry(i) Then
		      
		      For j = 1 To Globals.SongActivityLog.NumEntries
		        Entry2 = New LogEntry(Globals.SongActivityLog)
		        If Entry2.GetLogEntry(j) Then
		          If Entry1.CompareLogEntry(Entry2) Then
		            dupes = dupes + 1
		            Continue For i
		          End If
		        End If
		      Next j
		      
		      // no duplicates found -- add entry
		      Entry2 = New LogEntry(Globals.SongActivityLog)
		      
		      If Not Entry2.CreateLogEntry(Entry1) Then
		        'TODO
		      End If
		      
		      If Not Entry2.AddLogEntry Then
		        InputBox.Message App.T.Translate("errors/adding_entry")
		      End If
		    End If
		  Next i
		  
		  RefreshList
		  
		  Msg = App.T.Translate("song_activity/merged", Str(mActLog.NumEntries - dupes))
		  
		  If dupes > 0 Then
		    Msg = Msg + " " + App.T.Translate("song_activity/merged_dupes", Str(dupes))
		  End If
		  
		  InputBox.Message Msg
		End Sub
	#tag EndEvent
#tag EndEvents
