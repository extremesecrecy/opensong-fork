#tag Module
Protected Module Profiler
	#tag Method, Flags = &h0
		Sub BeginProfilerEntry(desc As String)
		  If Not ProfileEnabled Then Return
		  
		  If ProfileFile = Nil Then
		    If FileUtils.CreateFolder(App.AppPreferencesFolderForOpenSong) Then
		      ProfileFile = App.AppPreferencesFolderForOpenSong.Child("profile.txt") 'place in a writeable folder
		    End If
		    If ProfileFile.Exists Then ProfileFile.Delete
		    Try
		      If ProfileFile.IsWriteable Then
		        ProfileStream = TextOutputStream.Create(ProfileFile)
		      End If
		    Catch
		      ProfileFile = Nil
		    End Try
		    If ProfileStream = Nil Then
		      ProfileFile = Nil
		      ProfileEnabled = False
		      App.DebugWriter.Write "Could not prepare profiler file for writing."
		    End If
		  End If
		  
		  If ProfileFile <> Nil Then
		    desc = ReplaceLineEndings(desc,"\n")
		    Dim d As New Date
		    ProfileStream.WriteLine FormatLogDate(d,0,7) + MakeSpaces(15 + 2*UBound(LastDateStack) + 1) + desc
		    LastDateStack.Append d
		    LastEntryStack.Append desc
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
		  
		  Dim d As New Date
		  Dim diff As Double
		  
		  If ProfileFile <> Nil Then
		    diff = d.TotalSeconds - LastDateStack(UBound(LastDateStack)).TotalSeconds
		    LastDateStack.Remove UBound(LastDateStack)
		    ProfileStream.WriteLine FormatLogDate(d,0,7) + FormatLogSingle(diff,15,7) + MakeSpaces(1 + 2*UBound(LastDateStack)) + LastEntryStack(UBound(LastEntryStack)) + " END"
		    LastEntryStack.Remove UBound(LastEntryStack)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatLogDate(Date As Date, Width As Integer = 0, Decimals As Integer = 7) As String
		  Dim ds As String = Str(Date)
		  Dim fractSec As String
		  fractSec = FormatLogSingle(Date.TotalSeconds-Floor(Date.TotalSeconds),0,Decimals)
		  ds = ds + fractSec.Mid(InStr(fractSec,"."))
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
		Private LastDateStack(0) As Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastEntryStack(0) As String
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
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
