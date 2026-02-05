#tag Module
Protected Module Profiler
	#tag Method, Flags = &h0
		Sub BeginProfilerEntry(desc As String)
		  If Not ProfileEnabled Then Return
		  
		  Try
		    If ProfileFile = Nil Then
		      If FileUtils.CreateFolder(App.AppPreferencesFolderForOpenSong) Then
		        ProfileFile = App.AppPreferencesFolderForOpenSong.Child("profile.txt")  // place in a writeable folder
		      End If
		      If ProfileFile.Exists Then ProfileFile.Delete
		    End If
		    If ProfileStream = Nil Then
		      If ProfileFile.IsWriteable Then
		        ProfileStream = TextOutputStream.Open(ProfileFile)  // append if file exists
		      End If
		    End If
		  Catch
		    ProfileFile = Nil
		    ProfileStream = Nil
		    ProfileEnabled = False
		    App.DebugWriter.Write "Could not prepare profiler file for writing."
		  End Try
		  
		  If ProfileStream <> Nil Then
		    desc = ReplaceLineEndings(desc, "\n")
		    Dim d As DateTime = DateTime.Now
		    LastDateStack.Append d
		    LastEntryStack.Append desc
		    ProfileStream.WriteLine FormatLogDate(d, 0) + MakeSpaces(15 + 1 + 2 * LastDateStack.Count) + desc
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableProfiler()
		  While LastEntryStack.LastIndex >= 0
		    EndProfilerEntry
		  Wend
		  
		  ProfileEnabled = False
		  If ProfileStream <> Nil Then
		    Try
		      ProfileStream.WriteLine("=== Profiler Stop ===")
		      ProfileStream.Close
		    End Try
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableProfiler()
		  ProfileEnabled = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndProfilerEntry()
		  If Not ProfileEnabled Then Return
		  
		  Dim d As DateTime = DateTime.Now
		  Dim timeDiff As DateInterval
		  Dim diff As Double
		  Dim txt As String
		  
		  If LastDateStack.LastIndex >= 0 Then
		    timeDiff = d - LastDateStack.Pop
		    diff = timeDiff.Nanoseconds / 1000000000 + timeDiff.Seconds + 60 * (timeDiff.Minutes + 60 * (timeDiff.Hours + 24 * timeDiff.Days))
		  Else
		    diff = 0
		  End If
		  If LastEntryStack.LastIndex >= 0 Then
		    txt = LastEntryStack.Pop
		  Else
		    txt = ""
		  End If
		  If ProfileStream <> Nil Then
		    ProfileStream.WriteLine FormatLogDate(d, 0) + FormatLogSingle(diff,15,7) + MakeSpaces(1  + 2 * (LastDateStack.Count + 1)) + txt + " END"
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatLogDate(Date As DateTime, Width As Integer = 0) As String
		  Dim ds As String = Date.ToString("yyyy-MM-dd kk:mm:ss.SSS'")
		  If Width < 0 Then
		    If ds.Len > Abs(Width) Then
		      Return ds.Left(Abs(Width))
		    End If
		  ElseIf Width > 0 Then
		    If ds.Len > Width Then
		      Return ds.Left(Width)
		    Else
		      Return StringUtils.PadRight(ds,Width)
		    End If
		  End If
		  Return ds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatLogSingle(f As Single, Width As Integer = 0, Decimals As Integer = 7) As String
		  Dim fs As String
		  Dim fmt As String = "-#,###"
		  Dim pos As Integer
		  If Decimals > 0 Then fmt = "." + StringUtils.Repeat("0",Decimals)
		  fs = Str(f,fmt)
		  pos = fs.InStr(".")
		  If pos = 0 Then
		    fs = fs + "."
		    pos = fs.Len
		  End If
		  If fs.Len < pos + Decimals Then
		    fs = StringUtils.PadRight(fs,pos + Decimals,"0")
		  End If
		  If Width < 0 Then
		    If fs.Len > Abs(Width) Then
		      Return fs.Left(Abs(Width))
		    End If
		  ElseIf Width > 0 Then
		    If fs.Len > Width Then
		      Return fs.Left(Width)
		    Else
		      Return StringUtils.PadLeft(fs,Width)
		    End If
		  End If
		  Return fs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MakeSpaces(count As Integer) As String
		  Dim i As Integer
		  Dim s As String
		  
		  For i = 1 To count
		    s = s + " "
		  Next i
		  
		  Return s
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private LastDateStack() As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastEntryStack() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ProfileEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ProfileFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ProfileStream As TextOutputStream
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
	#tag EndViewBehavior
End Module
#tag EndModule
