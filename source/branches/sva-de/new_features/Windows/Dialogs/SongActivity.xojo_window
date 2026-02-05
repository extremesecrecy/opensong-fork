#tag Window
Begin Window SongActivity
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   11
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   432
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   650
   Placement       =   0
   Resizeable      =   True
   Title           =   "Song Activity Log"
   Visible         =   False
   Width           =   650
   Begin ListBox lst_act_songs
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   7
      ColumnWidths    =   "3*,3*,7*,5*,5*,3*,3*"
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
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   234
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   1
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   112
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   610
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton btn_act_done
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Done"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   530
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
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btn_act_print
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Print"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   130
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btn_act_find
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Find"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   530
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextField edt_search
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
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
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   349
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   77
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   170
   End
   Begin Label lbl_show
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
      Text            =   "Show:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu pop_show
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   25
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   106
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   202
   End
   Begin Label lbl_date_range
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Date Range (MM/DD/YYYY):"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   53
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   262
   End
   Begin TextField edt_from
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
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
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   78
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   120
   End
   Begin TextField edt_to
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
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
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   166
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   78
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   120
   End
   Begin Label txt_act_to
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
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "To"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   77
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin PushButton btn_act_export
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Export"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   430
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   95
   End
   Begin PushButton btn_act_clear_log
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Clear Log"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btn_act_view
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "View LogFile"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   230
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   95
   End
   Begin PushButton btn_act_merge
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Merge"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   330
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   95
   End
   Begin Separator Separator1
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   4
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   45
      Transparent     =   False
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
		  lst_act_songs.Cell(lst_act_songs.LastIndex, 2) = NthField(App.T.Translate("song_activity/description"), "|", Log.Description)
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
		    If (recordType > 0) And (LogEntries(i).Description <> recordType) Then
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
		Sub TextChange()
		  Call GetDate(Me.Text, FromDate)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_to
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
		Sub TextChange()
		  Call GetDate(Me.Text, ToDate)
		End Sub
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
		  saWin.Title = App.T.Translate("song_activity/@title") + " (" +  Log.LogFolderItem.NativePath + ")"
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
		Name="FromFile"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		Name="Initializing"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		Name="OldIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
		Name="Search"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
