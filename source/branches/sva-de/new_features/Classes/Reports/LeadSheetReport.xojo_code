#tag Class
Protected Class LeadSheetReport
Inherits ReportClass
	#tag Method, Flags = &h0
		Sub AddSong(SongName As String, presentOrder As String = "")
		  Songs.Append SongName
		  Presentation.Append presentOrder
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  //
		  // Clear out all the songs
		  //
		  // Ed Palmer, January 2006
		  Dim i, cnt As Integer
		  App.DebugWriter.Write "LeadSheetReport.Clear: Enter"
		  cnt = Songs.Ubound
		  For i = 0 To cnt
		    Call Songs.Pop
		  Next i
		  cnt = Presentation.Ubound
		  For i = 0 To cnt
		    Call Presentation.Pop
		  Next i
		  App.DebugWriter.Write "LeadSheetReport.Clear: Exit"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Generate(Zoom As Double = 1.0, MyPages As Group2D = Nil) As Boolean
		  //
		  // This method is mostly taken from PrintWindow's souce code
		  // for PrintLeadSheets.  It's moved here so we don't
		  // open the PrintWindow before everything is ready
		  // to preview.
		  //
		  // Ed Palmer, January 2006
		  //
		  Dim i as Integer
		  Dim j As Integer
		  Dim f As FolderItem
		  Dim s As XmlDocument
		  Dim Song As Group2D
		  Dim pic As Picture
		  Dim ProgressWindowVisible As Boolean = False
		  Dim SongsWithErrors As New XmlDocument
		  Dim SongWithErrors As XmlNode
		  Dim ErrorChild As XmlNode
		  
		  Dim RunningPage As Integer = 1
		  
		  SongsWithErrors.AppendChild SongsWithErrors.CreateElement("errorlist")
		  
		  //
		  // If MyPages is Nil, then use the Pages object from the superclass
		  //
		  
		  If MyPages = Nil Then MyPages = Pages
		  
		  App.DebugWriter.Write(CurrentMethodName + " Page(initial) left=" + Str(LeftMargin) + ", top=" + Str(TopMargin) + ", width=" + Str(PrintableWidth) + ", height=" + Str(PrintableHeight) + ", zoom=" + Str(Zoom), 6)
		  
		  If LeftMargin < 0 Or TopMargin < 0 Or PrintableWidth <= 0 Or PrintableHeight <= 0 Or PrintableWidth > 200 Or PrintableHeight > 200 Then
		    PrintSettings = Nil  // initialize page dimensions
		  End If
		  If LeftMargin < 0 Or TopMargin < 0 Or PrintableWidth <= 0 Or PrintableHeight <= 0 Or PrintableWidth > 200 Or PrintableHeight > 200 Then
		    PrintableWidth = 7.5
		    PrintableHeight = 10
		    LeftMargin = 0.5
		    TopMargin = 0.5
		  End If
		  
		  // picture width and height must be smaller than 2**15
		  Dim maxPicDim As Integer = Pow(2, 15)
		  If Round(PrintableHeight * 72 * Zoom) >= maxPicDim Then
		    Zoom = (maxPicDim - 72) / PrintableHeight
		  End If
		  If Round(PrintableWidth * 72 * Zoom) >= maxPicDim Then
		    Zoom = (maxPicDim - 72) / PrintableWidth
		  End If
		  
		  App.DebugWriter.Write(CurrentMethodName + " Page(finally) left=" + Str(LeftMargin) + ", top=" + Str(TopMargin) + ", width=" + Str(PrintableWidth) + ", height=" + Str(PrintableHeight) + ", zoom=" + Str(Zoom), 6)
		  
		  pic = New Picture(Round(PrintableWidth * 72 * Zoom), Round(PrintableHeight * 72 * Zoom))
		  
		  // Set the picture resolution so 1 pt = 1 px
		  pic.HorizontalResolution = 72 * Zoom
		  pic.VerticalResolution = 72 * Zoom
		  
		  //Clear out the arrays
		  i = MyPages.Count - 1
		  While i > -1
		    MyPages.Remove i
		    i = i - 1
		  Wend
		  
		  // Build the pages for the songs
		  // Show progress window if we have a few
		  If UBound(Songs) > 10 Then
		    ProgressWindow.lbl_status.Text =  App.T.Translate("progress_status/lead_sheets") + "..."
		    
		    ProgressWindow.SetMaximum(UBound(Songs))
		    ProgressWindow.SetProgress 0
		    ProgressWindow.ShowWithin MainWindow
		    ProgressWindowVisible = True
		    ProgressWindow.CanCancel True
		    App.MouseCursor = System.Cursors.Wait
		  End If
		  
		  For i = 0 to UBound(Songs)
		    If ProgressWindowVisible Then
		      If Not ProgressWindow.SetProgress(i) Then
		        ProgressWindow.Close
		        Return False
		      End If
		    End If
		    f = MainWindow.Songs.GetFile(Songs(i))
		    If f <> Nil Then
		      s = SmartML.XDocFromFile(f)
		      If ProgressWindowVisible Then ProgressWindow.SetStatus f.DisplayName
		      If s <> Nil Then
		        Try
		          If Globals.SongActivityLog <> Nil Then
		            Log.Append( New LogEntry(Globals.SongActivityLog))
		            Dim logIdx As Integer = log.Ubound
		            Log(logIdx).Title = SmartML.GetValue(s.DocumentElement, "title", True)
		            Log(logIdx).Author = SmartML.GetValue(s.DocumentElement, "author", True)
		            Log(logIdx).CCLISongNumber =  SmartML.GetValue(s.DocumentElement, "ccli", True)  //The song's CCLI number
		            Log(logIdx).SongFileName = Songs(i)
		            Log(logIdx).DateAndTime = New Date
		            Log(logIdx).HasChords = Log(logIdx).CheckLyricsForChords( SmartML.GetValue(s.DocumentElement, "lyrics", True))
		          End If
		          
		          If Presentation(i) <> "" Then
		            SmartML.SetValue(s.DocumentElement, "presentation", Presentation(i))
		          End If
		          Song = SongML.Draw(s, pic.Graphics, Zoom, RunningPage, PrintSettings)
		          // Unroll the returned Group2D into individual pages
		          For j = 0 to Song.Count - 1
		            MyPages.Append Song.Item(j)
		          Next
		          If Sequential Then RunningPage = RunningPage + Song.Count
		        Catch DrawException As RuntimeException
		          // Add this song to the list of songs that had problems
		          SongWithErrors = SongsWithErrors.CreateElement("song")
		          ErrorChild =  SongsWithErrors.CreateElement("path")
		          ErrorChild.AppendChild SongsWithErrors.CreateTextNode(f.NativePath)
		          SongWithErrors.AppendChild ErrorChild
		          ErrorChild = SongsWithErrors.CreateElement("error")
		          ErrorChild.AppendChild _
		          SongsWithErrors.CreateTextNode(DrawException.ToString + " " + Str(DrawException.ErrorNumber) + ": " + DrawException.Message)
		          SongWithErrors.AppendChild ErrorChild
		          SongsWithErrors.DocumentElement.AppendChild SongWithErrors
		        End Try
		      End If
		    Else // f = Nil...no file
		      SongWithErrors = SongsWithErrors.CreateElement("song")
		      ErrorChild = SongsWithErrors.CreateElement("path")
		      ErrorChild.AppendChild SongsWithErrors.CreateTextNode(Songs(i))
		      SongWithErrors.AppendChild ErrorChild
		      ErrorChild = SongsWithErrors.CreateElement("error")
		      ErrorChild.AppendChild SongsWithErrors.CreateTextNode(App.T.Translate("errors/no_such_song"))
		      SongWithErrors.AppendChild ErrorChild
		      SongsWithErrors.DocumentElement.AppendChild SongWithErrors
		    End If
		  Next
		  
		  Scale = Zoom
		  
		  If ProgressWindowVisible Then
		    ProgressWindow.close
		    App.MouseCursor = Nil
		  End If
		  App.DebugWriter.Write "LeadSheetReport.Generate: Pages.Count = " + str(MyPages.Count)
		  App.DebugWriter.Write "LeadSheetReport.Generate: Exit"
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPage(PageNumber As Integer, Zoom As Double) As Object2D
		  //
		  // Returns a Object2D corresponding to a particular page, or Nil if out of bounds
		  //
		  // Ed Palmer, January 2006
		  App.DebugWriter.Write "LeadSheetReport.GetPage: Enter/Exit, Page, Zoom = " + str(PageNumber) + ", " + str(zoom)
		  If PageNumber < 1 Or PageNumber > Pages.Count + 1 Then
		    Return Nil
		  Else
		    Pages.Item(PageNumber - 1).Scale = Zoom
		    Return Pages.Item(PageNumber - 1)
		  End If
		  //++
		  // 2-1-06...this was what it started out as.  Unfortunately, the PrintWindow
		  // kept crashing.  Hypothesis: Generate was pulling an object right out from
		  // underneath a variable that had a pointer to it in PrintWindow (it wasn't PageObj,
		  // because when I removed the references to it in PrintWindow the problem was
		  // still there.
		  //
		  // The other issue that cropped up was changing pagination, apparently due to
		  // rounding in the scaling calculations courtesy of RB's string handling.  To calculate
		  // string height and width, the graphics object is used, which only supports Integer
		  // font sizes.  However, the StringShape has Double font sizes.  What fun.
		  //
		  // For now, just set the scale property to the zoom and accept some scaling
		  // errors.  Thus, the "Else" clause in the above If.
		  // EMP :-(
		  //--
		  
		  'If Scale = Zoom Then // This is easy
		  'App.DebugWriter.Write "LeadSheetReport.GetPage: Exit with Scale = Zoom"
		  'Return Pages.Item(PageNumber - 1)
		  'Else // It's not so easy
		  'If Generate(Zoom) Then
		  'App.DebugWriter.Write "LeadSheetReport.GetPage: Exit after Generate"
		  'Return Pages.Item(PageNumber - 1)
		  'Else // Something went wrong, assume Pages isn't valid anymore
		  'Return Nil
		  'End If
		  'End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSong(Index As Integer = 1) As String
		  //
		  // Returns the song at a specific index in the Songs
		  //
		  // NOTE: Using 1-based here, but array is 0-based
		  //
		  // Ed Palmer, January 2006
		  //
		  If Index < 1 Or Index > UBound(Songs) Then Return ""
		  
		  Return Songs(Index - 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSongCount() As Integer
		  //
		  // Return the number of songs currently in the object
		  //
		  // Ed Palmer, January 2006
		  //
		  
		  Return UBound(Songs) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSong(Index As Integer = 1)
		  //
		  // Removes the song at the specified index
		  // from Songs array.
		  //
		  // NOTE: Index is 1-based
		  //
		  // Ed Palmer, January 2006
		  //
		  If Index < 1 Or Index > UBound(Songs) + 1 Then Return
		  Songs.Remove Index - 1
		  Presentation.Remove Index - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Setup() As Boolean
		  App.DebugWriter.Write "LeadSheetReport.Setup: Enter"
		  Dim pgS As PrinterSetup
		  pgS = App.GetPrinterSetup
		  If pgS = Nil Then
		    If Globals.UseSheetDialogs Then
		      pgS = App.GetPrinterSetup(True, Window(0))
		    Else
		      pgS = App.GetPrinterSetup(True)
		    End If
		    If pgS = Nil Then Return False // User doesn't want to print
		  End If
		  ps = pgS
		  Sequential = False
		  Scale = 1.0
		  Clear
		  Pages = New Group2D
		  App.DebugWriter.Write "LeadSheetReport.Setup: Exit"
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		#tag Note
			Custom presentation order for song in Songs with same index
		#tag EndNote
		Protected Presentation() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			Specifies if the songs should be numbered sequentially.
			If False, page numbers restart at 1 with each song.
		#tag EndNote
		Protected Sequential As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The list of songs to print
		#tag EndNote
		Songs() As String
	#tag EndProperty


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
			Name="LeftMargin"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
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
			Name="PrintableHeight"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrintableWidth"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
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
			Name="TopMargin"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
