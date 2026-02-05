#tag Class
Protected Class SnapshotThread
Inherits Thread
	#tag Event
		Sub Run()
		  Dim data As SnapshotData
		  
		  While m_snapshots.UBound() >= 0
		    
		    While PresentWindow.IsUpdatingSlide()
		      'Wait a short while to start storing snapshots.
		      'A slower machine needs its resources to update the display, rather than store the snapshot
		      Me.Sleep(7*70, True)
		    Wend
		    
		    m_lock.Enter
		    data = m_snapshots.Pop()
		    m_lock.Leave
		    
		    ExportSnapshot data
		  Wend
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  m_lock = New CriticalSection
		  
		  Me.Priority = Me.LowestPriority
		  
		  Snapshot_Filename = SmartML.GetValue(App.MyPresentSettings.DocumentElement, "snapshot/filename", False)
		  Export_Live_Insertions = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "snapshot/@export_live_insertions", False, True)
		  Export_Metadata = SmartML.GetValueB(App.MyPresentSettings.DocumentElement, "snapshot/@export_metadata", False, True)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Export(currentslideIndex As Integer, image As Picture, slide As XmlNode, style As SlideStyle)
		  Dim xStyle As XmlNode
		  If Export_Metadata And style <> Nil Then
		    xStyle = style.ToXML.DocumentElement
		  End
		  Dim data As New SnapshotData(currentslideIndex, image, slide, xStyle)
		  
		  m_lock.Enter
		  'Insert the new snapshot at the beginning of the listl
		  'the Run event will Pop the last (oldest) item first.
		  m_snapshots.Insert 0, data
		  m_lock.Leave
		  
		  If Me.State = Me.NotRunning Then
		    Try
		      Run
		    Catch
		      'Exception such as ThreadAlreadyRunningException
		    End Try
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ExportSnapshot(data As SnapshotData)
		  If SmartML.GetValue(data.slide.Parent.Parent, "@type") = "blank" Then
		    'Blank slides will not be exported as snapshot
		    Return
		  End If
		  
		  If Not export_live_insertions Then
		    'Check if the current slide is flagged that is has been added during a live set
		    If SmartML.GetValueB(data.slide.Parent.Parent, "@LiveInsertion", False, False) Then
		      Return
		    End If
		  End If
		  
		  Dim re As New RegEx
		  Dim start As Integer=0
		  Dim filename As String = snapshot_filename
		  re.SearchPattern = "(%[dhimnNPsSTVy]{1})"
		  re.Options.CaseSensitive = True
		  
		  Dim match As RegExMatch = re.Search(filename)
		  While match <> Nil
		    Select Case Asc(Mid(match.SubExpressionString(1), 2, 1))
		    Case Asc("d")
		      'The day of the current month (01-31)
		      Dim sd As String = Str(data.timestamp.Day)
		      If sd.Len() = 1 Then sd = "0" + sd
		      filename = ReplaceAllB(filename, "%d", sd)
		    Case Asc("h")
		      'The hour from the current time of day in 24-hour format (00-23)
		      Dim sh As String = Str(data.timestamp.Hour)
		      If sh.Len() = 1 Then sh = "0" + sh
		      filename = ReplaceAllB(filename, "%h", sh)
		    Case Asc("i")
		      'The minutes from the current time (00-59)
		      Dim si As String = Str(data.timestamp.Minute)
		      If si.Len() = 1 Then si = "0" + si
		      filename = ReplaceAllB(filename, "%i", si)
		    Case Asc("m")
		      'The current month (01-12)
		      Dim sm As String = Str(data.timestamp.Month)
		      If sm.Len() = 1 Then sm = "0" + sm
		      filename = ReplaceAllB(filename, "%m", sm)
		    Case Asc("n")
		      'The number of the slide in the current set (with leading zeroes)
		      Dim sn As String = Str(SmartML.GetValueN(data.slide.Parent.Parent, "@ItemNumber"))
		      If sn.Len() = 1 Then sn = "0" + sn
		      If sn.Len() = 2 Then sn = "0" + sn
		      filename = ReplaceAllB(filename, "%n", sn)
		    Case Asc("N")
		      'The name of the current slide
		      Dim sN As String = SmartML.GetValue(data.slide.Parent.Parent, "@name")
		      filename = ReplaceAllB(filename, "%N", sN)
		    Case Asc("P")
		      'The name of the current slide
		      Dim sP As String = Str(data.currentslideIndex)
		      If sP.Len() = 1 Then sP = "0" + sP
		      If sP.Len() = 2 Then sP = "0" + sP
		      filename = ReplaceAllB(filename, "%P", sP)
		    Case Asc("s")
		      'The seconds from the current time (00-59)
		      Dim ss As String = Str(data.timestamp.Second)
		      If ss.Len() = 1 Then ss = "0" + ss
		      filename = ReplaceAllB(filename, "%s", ss)
		    Case Asc("S")
		      'The name of the current set
		      Dim sS As String = SmartML.GetValue(data.slide.Parent.Parent.Parent.Parent, "@name")
		      filename = ReplaceAllB(filename, "%S", sS)
		    Case Asc("T")
		      'The title of the current set
		      Dim sT As String = SmartML.GetValue(data.slide.Parent.Parent, "title")
		      filename = ReplaceAllB(filename, "%T", sT)
		    Case Asc("V")
		      'The title of the current set
		      Dim sV As String = SmartML.GetValue(data.slide, "@id", False)
		      filename = ReplaceAllB(filename, "%V", sV)
		    Case Asc("y")
		      'The current year (4 digits)
		      Dim sy As String = Str(data.timestamp.Year)
		      If sy.Len() = 1 Then sy = "0" + sy
		      filename = ReplaceAllB(filename, "%y", sy)
		    Case Else
		      start = match.SubExpressionStartB(1)+2
		    End Select
		    
		    match = re.Search(filename, start)
		  Wend
		  
		  If filename.EndsWith( ".jpg" ) Then
		    filename = Left(filename, filename.Len()-4)
		  End If
		  
		  If IsNull(PathToFolderItem(filename)) Then
		    Dim base_folder As FolderItem = Nil
		    Dim folder_element As String
		    Dim folder_elements() As String = Split(ReplaceAll(filename, "\", "/"), "/")
		    Call folder_elements.Pop() 'Remove the filename part
		    
		    For Each folder_element in folder_elements
		      If IsNull(base_folder) Then
		        base_folder = PathToFolderItem(folder_element)
		      Else
		        base_folder = base_folder.Child(folder_element)
		        If Not base_folder.Exists() Then
		          base_folder.CreateAsFolder()
		        End If
		      End If
		    Next
		  End If
		  
		  Dim imageFileName As FolderItem = PathToFolderItem(filename)
		  Dim fType As String = imageFileName.Type
		  If fType = "" Then
		    imageFileName = PathToFolderItem(filename + ".jpg")
		  End If
		  Dim metaFileName As FolderItem = PathToFolderItem(filename + ".xml")
		  
		  If Not IsNull(imageFileName) Then
		    Try
		      //Optional parameter for JPG quality added in 2010r5
		      If fType = "PNG Files" Then
		        data.image.Save(imageFileName, Picture.SaveAsPNG)
		      Else
		        #If RBVersion < 2010.05
		          data.image.Save(ImageFileName, 151)
		        #Else
		          data.image.Save(ImageFileName, Picture.SaveAsJPEG , 85)
		        #EndIf
		      End If
		      If export_metadata And Not IsNull(metaFileName) then
		        Dim metaDoc As New XmlDocument
		        Dim metaSlide As XmlElement = metaDoc.CreateElement("slide")
		        metaDoc.DocumentElement.AppendChild(metaSlide)
		        SmartML.CloneChildren(data.slide.Parent.Parent, metaSlide)
		        SmartML.CloneAttributes(data.slide.Parent.Parent, metaSlide)
		        
		        metaDoc.DocumentElement.RemoveChild(SmartML.GetNode(metaSlide, "slides", True))
		        metaDoc.DocumentElement.AppendChild metaDoc.SafeImportNode(data.slide, True)
		        
		        metaDoc.DocumentElement.RemoveChild(SmartML.GetNode(metaSlide, "style", True))
		        metaDoc.DocumentElement.AppendChild metaDoc.SafeImportNode(data.style, True)
		        
		        Call SmartML.XDocToFile(metaDoc, metaFileName)
		      End If
		    Catch err
		      'Snapshot will not be saved...
		    End Try
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Export_Live_Insertions As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Export_Metadata As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_lock As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_snapshots() As SnapshotData
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Snapshot_Filename As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
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
	#tag EndViewBehavior
End Class
#tag EndClass
