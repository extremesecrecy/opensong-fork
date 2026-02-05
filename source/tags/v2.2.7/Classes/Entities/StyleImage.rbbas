#tag Class
Protected Class StyleImage
	#tag Method, Flags = &h0
		Sub Clear()
		  Me.oImage = Nil
		  Me.sFilename = ""
		  Me.sBase64 = ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Clear
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(img As StyleImage)
		  If img<> Nil Then
		    Me.oImage = img.GetImage()
		    Me.sBase64 = img.GetImageAsString(False)
		    Me.sFilename = img.GetImageFilename()
		  Else
		    Clear()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImage() As Picture
		  Return Me.oImage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageAsString(generateIfMissing As Boolean = True) As String
		  If Me.sBase64 = "" And Me.oImage <> Nil And generateIfMissing Then
		    Me.sBase64 = App.GetImageAsString(Me.oImage)
		  End If
		  
		  Return Me.sBase64
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageFilename() As String
		  Return Me.sFilename
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImage(img As Picture)
		  Me.oImage = img
		  Me.sFilename = ""
		  Me.sBase64 = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetImageAsString(Base64 as String) As Boolean
		  Dim f As FolderItem
		  Dim outputStream As BinaryStream
		  Dim bSuccess As Boolean
		  
		  bSuccess = False
		  Base64 = Trim(Base64)
		  If Len(Base64) = 0 Then
		    Clear()
		  Else
		    If Base64 <> Me.sBase64 Then
		      
		      f = GetTemporaryFolderItem ()
		      If f <> Nil Then
		        outputStream = BinaryStream.Create(f, True)
		        outputStream.Write DecodeBase64(Base64)
		        outputStream.Close
		        Me.oImage = Picture.Open(f)
		        #If TargetLinux
		          If IsNull(Me.oImage) Then
		            Dim f_jpg As FolderItem = GetFolderItem( f.AbsolutePath() + ".jpg" )
		            f.MoveFileTo( f_jpg )
		            Me.oImage = f_jpg.OpenAsPicture()
		            f_jpg.Delete
		          End If
		        #Else
		          f.Delete
		        #EndIf
		        
		        If Me.oImage <> Nil Then
		          Me.sBase64 = Base64
		          bSuccess = True
		        Else
		          Me.sBase64 = ""
		        End If
		        Me.sFilename = ""
		      End If
		      
		    End If
		  End If
		  
		  Return bSuccess 'Returns True if a new image is succesfully loaded. If the new image is equal to the old image, false is returned.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetImageFromFile(File As FolderItem) As Boolean
		  Dim bSuccess As Boolean = False
		  
		  If File<>Nil And File.Exists() Then
		    If File.AbsolutePath() <> Me.sFilename Then
		      
		      Dim inputStream As BinaryStream = BinaryStream.Open(File, False)
		      If inputStream <> Nil Then
		        Me.oImage = Picture.Open(File)
		        
		        If Me.oImage <> Nil Then
		          
		          If File.AbsolutePath().StartsWith( SpecialFolder.Temporary.AbsolutePath() ) Then
		            Me.sBase64 = EncodeBase64(inputStream.Read(File.Length))
		            Me.sFilename = ""
		          Else
		            Me.sBase64 = ""
		            Me.sFilename = File.AbsolutePath()
		          End If
		          
		          bSuccess = True
		        Else
		          Clear()
		        End If
		        
		      Else
		        InputBox.Message App.T.Translate("errors/unreadable_image", File.AbsolutePath)
		      End If
		      
		    End If
		  Else
		    If File<>Nil Then
		      If File.AbsolutePath() <> "" Then
		        InputBox.Message App.T.Translate("errors/unreadable_image", File.AbsolutePath)
		      End If
		    End If
		    Clear()
		  End If
		  
		  Return bSuccess 'Returns True if a new image is succesfully loaded. If the new image filename is equal to the old image filename, false is returned.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetImageFromFileName(Filename As String) As Boolean
		  #If TargetMacOS Then
		    Filename = Filename.ReplaceAll("\", "/")
		    //++
		    // MacOS: also check for possible NativePath instead of AbsolutePath
		    //--
		    If FileName.Mid(2, 1) <> ":" Then // Assume that the volume name is not going to be one character long
		      If FileName.InStr(":") = 0 And FileName.InStr("/") > 0 Then // NativePath?
		        Dim tempF As FolderItem
		        #Pragma BreakOnExceptions False
		        Try
		          tempF = New FolderItem(Filename, FolderItem.PathTypeNative)
		          If tempF <> Nil Then Filename = tempF.AbsolutePath
		        End Try
		        #Pragma BreakOnExceptions Default
		      End If
		    End If
		  #ElseIf TargetWin32 Then
		    Filename = Filename.ReplaceAll("/", "\")
		  #elseif TargetLinux then
		    Filename = Filename.ReplaceAll("\", "/")
		  #endif
		  
		  Dim result As Boolean = False
		  Dim f as FolderItem
		  
		  If Filename <> "" Then
		    //++
		    // Look for ":" anywhere to capture both the case of the Windows and macOS AbsolutePath
		    //--
		    If FileName.StartsWith("/") Or FileName.StartsWith("\\") Or FileName.Instr(":") > 0 Then 
		      f = GetFolderItem(FileName)
		    Else
		      f = GetFolderItem( App.DocsFolder.Child("Backgrounds").AbsolutePath + Filename )
		    End If
		    
		    If IsNull(f) or not f.Exists() Then
		      InputBox.Message App.T.Translate("errors/unreadable_image", Filename)
		    Else
		      result = SetImageFromFile(f)
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected oImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected sBase64 As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected sFilename As String
	#tag EndProperty


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
