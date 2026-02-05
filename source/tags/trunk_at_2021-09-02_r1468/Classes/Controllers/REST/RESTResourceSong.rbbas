#tag Class
Protected Class RESTResourceSong
Implements REST.RESTResource
	#tag Method, Flags = &h21
		Private Function GetSong(song As String, folder As String = "") As REST.RESTResponse
		  Dim result As REST.RESTresponse = Nil
		  Dim xml As XmlDocument
		  Dim root As XmlNode
		  
		  Dim songDoc As XmlDocument = Nil
		  Dim f As FolderItem = MainWindow.Songs.GetFileInFolderSafe(song, folder)
		  If f <> Nil Then
		    songDoc = SmartML.XDocFromFile(f)
		  End If
		  
		  If Not IsNull(songDoc) then
		    result = New REST.RESTresponse
		    xml = result.CreateXmlResponse(Name(), "detail", name)
		    root = xml.DocumentElement()
		    root.AppendChild(xml.ImportNode(songDoc.DocumentElement(), True))
		    result.response = xml.ToString
		  End If
		  
		  If IsNull(result) Then
		    result = New REST.RESTresponse("The requested action is not available.", HttpStatus.NotFound)
		  End If
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ListFolders() As REST.RESTResponse
		  Dim result As New REST.RESTresponse
		  Dim xml As XmlDocument
		  Dim root, xml_folders As XmlNode
		  
		  xml = result.CreateXmlResponse(Name(), "folders")
		  root = xml.DocumentElement()
		  xml_folders = root.AppendChild(xml.CreateElement("folders"))
		  
		  Dim folders() As String = MainWindow.Songs.GetFolders()
		  For Each folder As String In folders
		    Dim xml_folder As XmlNode = xml_folders.AppendChild(xml.CreateElement("folder"))
		    SmartML.SetValue(xml_folder, "@name", folder)
		  Next
		  
		  result.response = xml.ToString
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ListSongs(folder As String = "") As REST.RESTResponse
		  Dim result As New REST.RESTresponse
		  Dim xml As XmlDocument
		  Dim root, xml_songs As XmlNode
		  
		  folder = ReplaceAll(folder, "..", "")
		  Dim folders() As String = MainWindow.Songs.GetFolders()
		  
		  xml = result.CreateXmlResponse(Name(), "list")
		  root = xml.DocumentElement()
		  xml_songs = root.AppendChild(xml.CreateElement("songs"))
		  
		  If folders.IndexOf(folder) > -1 Then
		    SmartML.SetValue(xml_songs, "@folder", folder )
		    
		    Dim songs() As String = MainWindow.Songs.GetFiles(folder)
		    For Each song As String In songs
		      Dim xml_song As XmlNode = root.AppendChild(xml.CreateElement("song"))
		      SmartML.SetValue(xml_song, "@name", song)
		    Next
		  End If
		  
		  result.response = xml.ToString
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LoadSong(songName As String, folder As String = "") As REST.RESTResponse
		  Dim result As REST.RESTresponse = Nil
		  Dim songXml As XmlDocument
		  
		  If MainWindow.Status_SongChanged Then
		    result = New REST.RESTresponse("The currently loaded set has unsaved changes, requested action cannot be executed.", HttpStatus.Forbidden)
		  Else
		    
		    Dim f As FolderItem = MainWindow.Songs.GetFileInFolderSafe(songName, folder)
		    If f <> Nil Then
		      songXml = SmartML.XDocFromFile(f)
		    End If
		    
		    If IsNull(songXml) Then
		      result = New REST.RESTresponse("The requested song is not available.", HttpStatus.NotFound)
		    Else
		      
		      If MainWindow.LoadSong(f) Then
		        result = New REST.RESTResponse("OK")
		      Else
		        result = New REST.RESTResponse("The requested action failed.", HttpStatus.InternalServerError)
		      End If
		      
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  // Part of the REST.RESTResource interface.
		  
		  Return "song"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PresentSong(songName As String, folder As String = "", slideIndex As Integer = 0, mode As Integer = PresentWindow.MODE_DUAL_SCREEN) As REST.RESTResponse
		  Dim result As REST.RESTresponse = Nil
		  Dim songXml As XmlDocument
		  
		  slideIndex = Max(slideIndex, 1)
		  'Restrict supported display modes to single and dual screen; it makes no sense to start remote preview
		  If mode <> PresentWindow.MODE_SINGLE_SCREEN And _
		    mode <> PresentWindow.MODE_DUAL_SCREEN Then
		    mode = PresentWindow.MODE_DUAL_SCREEN
		  End If
		  
		  If MainWindow.Status_SongChanged Then
		    result = New REST.RESTresponse("The currently loaded set has unsaved changes, requested action cannot be executed.", HttpStatus.Forbidden)
		  Else
		    
		    Dim f As FolderItem = MainWindow.Songs.GetFileInFolderSafe(songName, folder)
		    If f <> Nil Then
		      songXml = SmartML.XDocFromFile(f)
		    End If
		    
		    If IsNull(songXml) Then
		      result = New REST.RESTresponse("The requested song is not available.", HttpStatus.NotFound)
		    Else
		      
		      If MainWindow.LoadSong(f) Then
		        Call MainWindow.ActionSongPresent(mode, slideIndex)
		        result = New REST.RESTResponse("OK")
		      Else
		        result = New REST.RESTResponse("The requested action failed.", HttpStatus.InternalServerError)
		      End If
		      
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Process(ByRef restSocket As REST.RESTSocket, protocolHandler As REST.RESTProtocolHandler) As REST.RESTresponse
		  // Part of the REST.RESTResource interface.
		  Dim result As REST.RESTResponse = Nil
		  
		  Select Case protocolHandler.Action()
		  Case ""
		    If protocolHandler.Identifier().Len() = 0 Then
		      result = ListSongs(protocolHandler.Parameter("folder", ""))
		    Else
		      result = GetSong(protocolHandler.Identifier(), protocolHandler.Parameter("folder", ""))
		    End If
		    
		  Case "list"
		    result = ListSongs(protocolHandler.Parameter("folder", ""))
		    
		  Case "folders"
		    result = ListFolders()
		    
		  Case "detail"
		    result = GetSong(protocolHandler.Identifier(), protocolHandler.Parameter("folder", ""))
		    
		  Case "present", _
		    "load"
		    
		    Select Case protocolHandler.Method()
		    Case HttpMethod.Options
		      result = New REST.RESTResponse()
		      If protocolHandler.Header(REST.kAccessControlRequestMethod, "") <> "POST" Then
		        result.headers.Value(REST.kHeaderAllow) = "POST"
		      End If
		      
		    Case HttpMethod.Post
		      If Globals.Status_Presentation Then
		        result = New REST.RESTresponse("There currently is a running presentation, requested action cannot be executed.", HttpStatus.Forbidden)
		      Else
		        Select Case protocolHandler.Action()
		          
		        case "load"
		          result = LoadSong(protocolHandler.Identifier(), protocolHandler.Parameter("folder", ""))
		          
		        case "present"
		          result = PresentSong(protocolHandler.Identifier(), protocolHandler.Parameter("folder", ""), _
		          protocolHandler.Parameter("slide", 0), protocolHandler.Parameter("display", 0))
		          
		        End Select
		      End If
		      
		    Else
		      result = New REST.RESTResponse("The request method is not allowed, use POST.", HttpStatus.MethodNotAllowed)
		      result.headers.Value(REST.kHeaderAllow) = "POST"
		    End Select
		    
		  Else
		    If protocolHandler.Identifier().Len() = 0 Then
		      result = GetSong(protocolHandler.Action(), protocolHandler.Parameter("folder", ""))
		    Else
		      result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		    End If
		  End Select
		  
		  Return result
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
