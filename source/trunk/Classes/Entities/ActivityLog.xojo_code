#tag Class
Protected Class ActivityLog
	#tag Method, Flags = &h0
		Function ClearLog() As Boolean
		  If LogFolderItem = Nil Then Return False
		  
		  xDoc = New XmlDocument
		  xDoc.PreserveWhitespace = True
		  // Create file stub
		  xdoc.AppendChild(xdoc.CreateElement(E_LOG))
		  
		  Try
		    xdoc.SaveXml LogFolderItem
		  Catch ex
		    'TODO
		  End Try
		  
		  NumEntries = 0
		  LastEntryNo = 0
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNumEntries() As Integer
		  Dim head As XmlNode
		  Dim node As XmlNode
		  Dim nodeList As XmlNodeList
		  
		  NumEntries = 0
		  LastEntryNo = 0
		  
		  If xDoc = Nil Then
		    xDoc = New XmlDocument
		    xDoc.PreserveWhitespace = True
		    // Create file stub
		    head = xdoc.AppendChild(xdoc.CreateElement(E_LOG))
		    
		    Try
		      xdoc.SaveXml LogFolderItem
		    Catch ex
		      'TODO
		    End Try
		    
		    Return 0
		  End If
		  
		  head = xDoc.DocumentElement
		  
		  // Verify we have a log file here...
		  If head = Nil Or head.Name <> E_LOG Then
		    Return 0
		  End If
		  
		  nodeList = head.XQL("*[starts-with(name()," + E_ENTRY + ")]")  // fn:starts-with(string1,string2)
		  If nodeList <> Nil And nodeList.Length > 0 Then
		    NumEntries = nodeList.Length
		    node = nodeList.Item(nodeList.Length - 1)
		    If node.Name.InStr(E_ENTRY) = 1 Then
		      LastEntryNo = Val(node.Name.Mid(E_ENTRY.Len + 1))
		    End If
		    LastEntryNo = Max(LastEntryNo, NumEntries)
		  End If
		  Return NumEntries
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load(File As FolderItem = Nil) As Boolean
		  // If a FolderItem is passed, then the object shouldn't have one.
		  // If a FolderItem isn't passed, the object should have one.
		  If File <> Nil Then
		    If LogFolderItem = Nil Then
		      LogFolderItem = File
		    Else
		      Return False
		    End If
		  Else
		    If LogFolderItem = Nil Then Return False
		  End If
		  
		  // If it doesn't exist, create it with a stub
		  If Not LogFolderItem.Exists Then
		    xDoc = New XmlDocument
		    xDoc.AppendChild xDoc.CreateElement(E_LOG)
		    Try
		      xDoc.SaveXml(LogFolderItem)
		    Catch ex As RuntimeException
		      // Don't assume we have a logger available or a translator
		      Dim dlg As New MessageDialog
		      dlg.ActionButton.Visible = True
		      dlg.ActionButton.Default = True
		      dlg.AlternateActionButton.Visible = False
		      dlg.CancelButton.Visible = False
		      dlg.Message = "Error creating logfile. OpenSong will continue." + EndOfLine + ex.Message
		      Call dlg.ShowModal
		      LogFolderItem = Nil
		      System.Log(System.LogLevelError, "Error creating logfile: " + Introspection.GetType(ex).Name + "; " + ex.Message)
		      Return False
		    End Try
		    Call GetNumEntries
		    Return True
		  End If
		  
		  // Let's see if it is a valid XML document
		  Try
		    xDoc = New XmlDocument(LogFolderItem)
		  Catch ex As XmlException
		    If Not LogFolderItem.Exists Then
		      
		    Else
		      LogFolderItem = Nil
		      Return False
		    End If
		  End Try
		  
		  Call GetNumEntries
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load(Doc As String) As Boolean
		  // Load the object from the string that is passed.
		  //
		  // Note that LogFolderItem will be Nil when this is done.
		  //--
		  
		  Try
		    xDoc = New XmlDocument(Doc)
		  Catch ex As XmlException
		    LogFolderItem = Nil
		    Return False
		  End Try
		  
		  Call GetNumEntries
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadAllEntries(ByRef LogEntries() As LogEntry) As Boolean
		  ReDim LogEntries(-1)
		  
		  If xDoc = Nil Then Return False
		  
		  If NumEntries = 0 Then Return True
		  
		  Dim node As XmlNode
		  Dim log As New LogEntry(self)
		  
		  node = xDoc.DocumentElement
		  If node = Nil Then Return False
		  node = node.FirstChild
		  While node <> Nil
		    If Left(node.Name, E_ENTRY.Length) = E_ENTRY Then
		      If log.CreateLogEntry(node) Then
		        LogEntries.Append(log)
		        Log = New LogEntry(self)
		      End If
		    End If
		    node = node.NextSibling
		  Wend 
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		LastEntryNo As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LogFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		NumEntries As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		xDoc As XMLDocument
	#tag EndProperty


	#tag Constant, Name = E_ENTRY, Type = String, Dynamic = False, Default = \"Entry", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = E_LOG, Type = String, Dynamic = False, Default = \"log", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
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
			Name="NumEntries"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastEntryNo"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
