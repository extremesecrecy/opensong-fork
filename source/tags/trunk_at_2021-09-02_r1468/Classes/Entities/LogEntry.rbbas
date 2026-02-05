#tag Class
Protected Class LogEntry
	#tag Method, Flags = &h0
		Function AddLogEntry() As Boolean
		  Dim head As XmlNode
		  Dim entry As XmlNode
		  
		  head = Log.xDoc.DocumentElement
		  If head.Name <> E_Log Then 
		    Dim r As New RuntimeException
		    r.Message = "Unexpected root element " + head.Name + ".  Expected " + E_Log + "."
		    Raise r
		  End If
		  
		  entry = head.AppendChild(head.OwnerDocument.CreateElement(E_ENTRY + Str(Log.LastEntryNo + 1)))
		  Log.NumEntries = Log.NumEntries + 1
		  Log.LastEntryNo = Log.LastEntryNo + 1
		  
		  If DateAndTime = Nil Then DateAndTime = New Date
		  SmartML.SetValueDate entry, E_DATE, DateAndTime
		  SmartML.SetValueTime entry, E_TIME, DateAndTime
		  SmartML.SetValueN entry, E_DESCRIPTION, Activity
		  SmartML.SetValue entry, E_FILENAME, SongFileName
		  SmartML.SetValue entry, E_TITLE, Title
		  SmartML.SetValue entry, E_AUTHOR, Author
		  SmartML.SetValue entry, E_CCLI, CCLISongNumber
		  SmartML.SetValueB(entry, E_CHORDS, HasChords)
		  
		  If Log.LogFolderItem <> Nil Then
		    If Not SmartML.XDocToFile(Log.xDoc, Log.LogFolderItem) Then
		      SmartML.DisplayError
		      Return False
		    End If
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckLyricsForChords(lyrics As string) As Boolean
		  //++
		  // This is just bascially a modified MainWindow.CheckLyricLines()
		  //
		  // Do a basic check on the lyrics lines
		  // If the first character on the line has a ".",
		  // assume it's a chord line and return True
		  //--
		  Dim lines() As String
		  Dim codes As String
		  
		  codes = "."
		  lyrics = ReplaceLineEndings(lyrics, EndOfLine.Unix)
		  lines = Split(lyrics, EndOfLine.Unix)
		  
		  For i As Integer = 0 To lines.UBound
		    If InStr(codes, Left(lines(i).ConvertEncoding(Encodings.UTF8), 1)) <> 0 Then
		      Return True
		    End If
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareLogEntry(Entry As LogEntry) As Boolean
		  'Compares the passed Log Entry to this Log Entry
		  'Returns true if entries are equal
		  If Entry.Title = Title And Entry.Author = Author And Entry.Activity = Activity And _
		    Entry.CCLISongNumber = CCLISongNumber And Entry.HasChords  = HasChords Then
		    If Entry.DateAndTime <> Nil And DateAndTime <> Nil Then
		      If CompareDates(Entry.DateAndTime, DateAndTime) = 0 Then
		        Return true
		      End If
		    End If
		    If Entry.DateAndTime = Nil And DateAndTime = Nil Then Return true
		    
		  End If
		  
		  return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(thisLog As ActivityLog)
		  Log = thisLog
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyLogEntry(Byref Entry As LogEntry) As Boolean
		  'Copies this Log Entry into the passed Entry
		  If Entry = Nil Then Return False
		  
		  Entry.Title = Title
		  Entry.Author = Author
		  Entry.CCLISongNumber = CCLISongNumber
		  Entry.DateAndTime = DateAndTime
		  Entry.Activity = Activity
		  Entry.HasChords = HasChords
		  Entry.SongFileName = SongFileName
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateLogEntry(Entry As LogEntry) As Boolean
		  'Creates a Log Entry from the passed Log Entry
		  If Entry = Nil Then Return False
		  
		  Title = Entry.Title
		  Author = Entry.Author
		  Activity = Entry.Activity
		  DateAndTime = Entry.DateAndTime
		  HasChords = Entry.HasChords
		  CCLISongNumber = Entry.CCLISongNumber
		  SongFileName = Entry.SongFileName
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateLogEntry(node As XMLNode) As Boolean
		  If node = Nil Then Return False
		  
		  Dim entry As XmlNode
		  Dim D As Date
		  Dim T As Date
		  
		  entry = node.FirstChild
		  While entry <> Nil
		    Select Case entry.Name
		      // Do this alphabetically to make it easier for the programmer :-)
		    Case E_AUTHOR
		      Author = entry.GetText
		    Case E_CCLI
		      CCLISongNumber = entry.GetText
		    Case E_CHORDS
		      HasChords = SmartML.GetValueB(node, entry.Name, false)
		    Case E_DATE
		      D = SmartML.GetValueDate(node, entry.Name, false)
		    Case E_DESCRIPTION
		      Activity = SmartML.GetValueN(node, entry.Name, false)
		    Case E_FILENAME
		      SongFileName = entry.GetText
		    Case E_TIME
		      T= SmartML.GetValueTime(node, entry.Name, false)
		    Case E_TITLE
		      Title = entry.GetText
		      
		    Case Else
		      'InputBox.Message App.T.Translate("song/errors/unknown_element", entry.Name)
		      // ignore and contiue
		    End Select
		    
		    entry = entry.NextSibling
		  Wend
		  
		  // Combine Date & Time
		  If D <> Nil And T <> Nil Then
		    DateAndTime = D
		    DateAndTime.Hour = T.Hour
		    DateAndTime.Minute = T.Minute
		    DateAndTime.Second = T.Second
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLogEntry(EntryNumber As Integer) As Boolean
		  //++
		  // Loads the information from the XML document into
		  // this instance's variables
		  //--
		  Dim head As XmlNode
		  Dim node As XmlNode
		  
		  If Log.xDoc = Nil Then Return False
		  
		  head = Log.xDoc.DocumentElement
		  
		  // Verify we have a log file here...
		  
		  If head.Name <> E_LOG Then
		    Return False
		  End If
		  
		  Dim nodeList As XmlNodeList
		  nodeList = head.Xql(E_ENTRY + Str(EntryNumber) + "[1]")
		  If nodeList <> Nil And nodeList.Length > 0 Then
		    node = nodeList.Item(0)
		    If node <> Nil Then
		      Return CreateLogEntry(node)
		    End If
		  End If
		  Return False
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Activity As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Author As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CCLISongNumber As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Activity = kSongCopied
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then Activity = kSongCopied
			End Set
		#tag EndSetter
		Copied As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Activity = kSongCreated
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then Activity = kSongCreated
			End Set
		#tag EndSetter
		Created As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DateAndTime As Date
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Activity = kSongDeleted
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then Activity = kSongDeleted
			End Set
		#tag EndSetter
		Deleted As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Displayed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HasChords As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This is a reference to the log. It should not be it's own instance but should be shared among all LogEntries that belong to the same physical (or virtual) log
		#tag EndNote
		Log As ActivityLog
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Activity = kSongModified
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then Activity = kSongModified
			End Set
		#tag EndSetter
		Modified As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Activity = kSongMoved
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then Activity = kSongMoved
			End Set
		#tag EndSetter
		Moved As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		OldSongFileName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Activity = kSongPresented
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then Activity = kSongPresented
			End Set
		#tag EndSetter
		Presented As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Activity = kSongPrinted
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then Activity = kSongPrinted
			End Set
		#tag EndSetter
		Printed As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Activity = kSongRenamed
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then Activity = kSongRenamed
			End Set
		#tag EndSetter
		Renamed As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SetItemNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SongFileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As String
	#tag EndProperty


	#tag Constant, Name = E_AUTHOR, Type = String, Dynamic = False, Default = \"author", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_CCLI, Type = String, Dynamic = False, Default = \"ccli", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_CHORDS, Type = String, Dynamic = False, Default = \"HasChords", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_DATE, Type = String, Dynamic = False, Default = \"Date", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_DESCRIPTION, Type = String, Dynamic = False, Default = \"Description", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_ENTRY, Type = String, Dynamic = False, Default = \"Entry", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_FILENAME, Type = String, Dynamic = False, Default = \"FileName", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_LOG, Type = String, Dynamic = False, Default = \"log", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_TIME, Type = String, Dynamic = False, Default = \"Time", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_TITLE, Type = String, Dynamic = False, Default = \"title", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongCopied, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongCreated, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongDeleted, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongModified, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongMoved, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongPresented, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongPrinted, Type = Double, Dynamic = False, Default = \"6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongRenamed, Type = Double, Dynamic = False, Default = \"7", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Activity"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Author"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CCLISongNumber"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copied"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Created"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Deleted"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Displayed"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasChords"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Modified"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Moved"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OldSongFileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Presented"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Printed"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Renamed"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SetItemNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SongFileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
