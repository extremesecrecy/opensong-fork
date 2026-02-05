#tag Class
Protected Class StyleImage
	#tag Method, Flags = &h0
		Shared Function AsObjectFit(fitInt As Integer) As ObjectFit
		  Return ObjectFit(fitInt)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  Me.oImage = Nil
		  Me.sFilename = ""
		  Me.sBase64 = ""
		  Me.ImageFit = ObjectFit.Cover
		  Me.TrimBottom = 0
		  Me.ImagePositionH = 0.5
		  Me.ImagePositionW = 0.5
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Clear
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(img As StyleImage)
		  Dim imgPicture As Picture
		  If img <> Nil Then
		    imgPicture = img.GetImage
		    If imgPicture <> Nil Then
		      Try
		        #Pragma BreakOnExceptions Off
		        Me.oImage = New Picture(imgPicture.Width, imgPicture.Height)
		        #pragma BreakOnExceptions Default
		      Catch err As PlatformNotSupportedException
		        Me.oImage = New Picture(imgPicture.Width, imgPicture.Height, imgPicture.Depth)
		      End Try
		      Me.oImage.HorizontalResolution = imgPicture.HorizontalResolution
		      Me.oImage.VerticalResolution = imgPicture.VerticalResolution
		      // is this a bug or a feature I don't understand? (XoJo 2020 r2.1) : If imgPicture has a dpi setting different from 72, scaling happens, even though above assignments make sure source and target have the same dpi :(
		      Me.oImage.Graphics.DrawPicture(imgPicture, 0, 0, Me.oImage.Width, Me.oImage.Height, 0, 0, imgPicture.Width, imgPicture.Height)
		    End If
		    Me.sBase64 = img.GetImageAsString(False)
		    Me.sFilename = img.GetImageFilename()
		    Me.mImageFit = img.mImageFit
		    Me.ImagePositionH = img.ImagePositionH
		    Me.ImagePositionW = img.ImagePositionW
		    Me.TrimBottom = img.TrimBottom
		  Else
		    Clear()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g As Graphics)
		  #Pragma DisableBackgroundTasks True
		  #Pragma NilObjectChecking False
		  
		  If oImage = Nil Then Return
		  
		  Dim gWidth, gHeight As Double
		  Dim DestW, DestH As Double
		  Dim bgDrawH, bgDrawW As Double
		  Dim bgHeightRatio, bgWidthRatio As Double
		  Dim scale as Double
		  Dim Top, Left As Double
		  
		  gWidth = g.Width
		  gHeight = g.Height
		  bgDrawW = oImage.Width
		  bgDrawH = oImage.Height - TrimBottom
		  
		  Select Case ImageFit
		  Case ObjectFit._center
		    'old calculation (does not handle StripFooter properly) - kept for backward compatibility when used in old styles
		    Dim strip, stripW As Double
		    Dim aspect_ratio As Double
		    Dim display_height As Double
		    
		    aspect_ratio = gWidth / gHeight
		    
		    strip = (gHeight/oImage.Height) * TrimBottom
		    // This section makes the picture stretch at the picture's aspect ratio, not the screen's.
		    //
		    stripW = strip * aspect_ratio
		    bgDrawH = oImage.Height - strip
		    bgDrawW = oImage.Width - stripW
		    bgHeightRatio = gHeight / bgDrawH
		    bgWidthRatio = gWidth / bgDrawW
		    aspect_ratio = Min(bgHeightRatio, bgWidthRatio)
		    display_height = bgDrawH * aspect_ratio //Scale pic to display
		    display_height = gHeight - display_height //If this is the "short" side, calculate the difference between the pic and screen
		    display_height = display_height / 2 //Half of that is our y margin
		    
		    g.DrawPicture oImage, _
		    (gWidth / 2) - ((bgDrawW * aspect_ratio) / 2), _
		    display_height, _
		    bgDrawW * aspect_ratio, _
		    bgDrawH * aspect_ratio, _
		    stripw, 0, bgDrawW, bgDrawH
		  Case ObjectFit.none
		    Left = (gWidth - bgDrawW) * ImagePositionW
		    Top = (gHeight - bgDrawh) * ImagePositionH
		    g.DrawPicture oImage, Left, Top, bgDrawW, bgDrawH, 0, 0, bgDrawW, bgDrawH
		  Case ObjectFit.fill
		    bgWidthRatio = gWidth / bgDrawW
		    bgHeightRatio = gHeight / bgDrawH
		    DestW = bgDrawW * bgWidthRatio
		    DestH = bgDrawH * bgHeightRatio
		    Left = (gWidth - DestW) * ImagePositionW
		    Top = (gHeight - DestH) * ImagePositionH
		    g.DrawPicture oImage, Left, Top, DestW, DestH, 0, 0, bgDrawW, bgDrawH
		  Case ObjectFit.contain
		    bgHeightRatio = gHeight / bgDrawH
		    bgWidthRatio = gWidth / bgDrawW
		    scale = Min(bgWidthRatio,bgHeightRatio)
		    DestW = bgDrawW * scale
		    DestH = bgDrawH * scale
		    Left = (gWidth - DestW) * ImagePositionW
		    Top = (gHeight - DestH) * ImagePositionH
		    g.DrawPicture oImage, Left, Top, DestW, DestH, 0, 0, bgDrawW, bgDrawH
		  Case ObjectFit.cover
		    bgHeightRatio = g.Height / bgDrawH
		    bgWidthRatio = g.Width / bgDrawW
		    scale = Max(bgWidthRatio,bgHeightRatio)
		    DestW = bgDrawW * scale
		    DestH = bgDrawH * scale
		    Left = (gWidth - DestW) * ImagePositionW
		    Top = (gHeight - DestH) * ImagePositionH
		    g.DrawPicture oImage, Left, Top, DestW, DestH, 0, 0, bgDrawW, bgDrawH
		  End Select
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
		  If IsRelativeFilename Then
		    Return sRelativeFilename
		  Else
		    Return sFilename
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageFolderItem() As FolderItem
		  Dim filename As String
		  
		  FileName = GetImageFilename()
		  If Filename = "" Then
		    Return Nil
		  Else
		    Return FileUtils.RelativePathToFolderItem(FileUtils.NativePathToFolderItem(ImageDefaults.BackgroundsPath), filename)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ObjectFitAsString(fit As ObjectFit) As String
		  Select Case fit
		  Case ObjectFit.none
		    Return "none"
		  Case ObjectFit.cover
		    Return "cover"
		  Case ObjectFit.contain
		    Return "contain"
		  Case ObjectFit.fill
		    Return "fill"
		  Case ObjectFit._center
		    Return "center"
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFilename(Filename As String)
		  // sets metadata
		  // intended for use when the image is set using SetImage or SetImageFromString in order to keep metadata
		  // resolves a relative path the same way SetImageFromFileName does
		  // sets both, sFileName and sRelativeFileName if given as a relative path and is resolvable or is given rooted
		  // but below one of the base folders used to resolve a relative path
		  
		  Dim f As FolderItem
		  Dim relativeTo As FolderItem
		  
		  If Filename <> "" Then
		    Try
		      If FileUtils.IsPathAbsolute(FileName) Then
		        Filename = FileUtils.AbsolutePathToNativePath(FileName)
		      End If
		      If FileUtils.IsPathRooted(Filename) Then
		        f = GetFolderItem(FileName, FileUtils.PathType)
		        If f <> Nil Then
		          Filename = f.NativePath
		        End If
		        relativeTo = App.GetDocumentFolderItem(App.BACKGROUNDS_FOLDER)
		        If relativeTo <> Nil And Filename.StartsWith(relativeTo.NativePath) Then
		          IsRelativeFilename = True
		          sRelativeFilename = Filename.Mid(relativeTo.NativePath.Len + 1)
		        Else
		          relativeTo = App.MainPreferences.GetValueFI(prefs.kBackgroundsFolder, Nil, False)
		          If relativeTo <> Nil And Filename.StartsWith(relativeTo.NativePath) Then
		            IsRelativeFilename = True
		            sRelativeFilename = Filename.Mid(relativeTo.NativePath.Len + 1)
		          End If
		        End If
		        sFilename = Filename
		      Else
		        relativeTo = App.GetDocumentFolderItem(App.BACKGROUNDS_FOLDER)
		        f = FileUtils.RelativePathToFolderItem(relativeTo, Filename)
		        If f = Nil Then
		          relativeTo = App.MainPreferences.GetValueFI(prefs.kBackgroundsFolder, Nil, False)
		          If relativeTo <> Nil And relativeTo.IsFolder And relativeTo.Exists Then
		            f = FileUtils.RelativePathToFolderItem(relativeTo, Filename)
		          End If
		        End If
		        If f <> Nil Then
		          sFilename = f.NativePath
		        End If
		        IsRelativeFilename = True
		        sRelativeFilename = Filename
		      End If
		    Catch excpt As RuntimeException
		      App.DebugWriter.Write "Exception in " + CurrentMethodName + "(" + Filename + ") : " + Introspection.GetType(excpt).FullName + "->" + excpt.message
		      f = nil
		    End Try
		  Else
		    sFilename = ""
		    sRelativeFilename = ""
		    IsRelativeFilename = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImage(img As Picture)
		  Me.oImage = img
		  Me.sFilename = ""
		  Me.sBase64 = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetImageFromFile(File As FolderItem) As Boolean
		  Dim bSuccess As Boolean = False
		  
		  If Globals.Status_SupplyColorPallet Then
		    oImage = Nil
		    sBase64 = ""
		    If File = Nil Then
		      sFilename = ""
		    Else
		      sFilename = File.NativePath()
		    End If
		    Return False
		  End If
		  
		  If File <> Nil And File.Exists() Then
		    If File.NativePath() <> Me.sFilename Then
		      
		      Dim inputStream As BinaryStream = BinaryStream.Open(File, False)
		      If inputStream <> Nil Then
		        Try
		          Me.oImage = Picture.Open(File)
		        Catch excpt
		          If Not Globals.Status_Presentation Then
		            If excpt IsA UnsupportedFormatException Then
		              If Not Globals.Status_Presentation Then
		                InputBox.Message App.T.Translate("errors/unsupported_image_type", File.NativePath)
		              End If
		            Else
		              Raise excpt
		            End If
		          End If
		        End Try
		        
		        If Me.oImage <> Nil Then
		          
		          If File.NativePath().StartsWith( SpecialFolder.Temporary.NativePath() ) Then
		            Me.sBase64 = EncodeBase64(inputStream.Read(File.Length))
		            Me.sFilename = ""
		          Else
		            Me.sBase64 = ""
		            Me.sFilename = File.NativePath()
		          End If
		          
		          bSuccess = True
		        Else
		          Clear()
		        End If
		        
		      Else
		        If Not Globals.Status_Presentation Then
		          InputBox.Message App.T.Translate("errors/unreadable_image", File.NativePath)
		        End If
		      End If
		      
		    End If
		  Else
		    If File <> Nil Then
		      If File.NativePath() <> "" Then
		        If Not Globals.Status_Presentation Then
		          InputBox.Message App.T.Translate("errors/unreadable_image", File.NativePath)
		        End If
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
		  #elseif TargetWin32 then
		    Filename = Filename.ReplaceAll("/", "\")
		  #elseif TargetLinux then
		    Filename = Filename.ReplaceAll("\", "/")
		  #endif
		  
		  If Globals.Status_SupplyColorPallet Then
		    oImage = Nil
		    sBase64 = ""
		    sFilename = Filename
		    Return False
		  End If
		  
		  Dim result As Boolean = False
		  Dim f as FolderItem
		  
		  If Filename <> "" Then
		    Try
		      If FileUtils.IsPathAbsolute(FileName) Then
		        Filename = FileUtils.AbsolutePathToNativePath(FileName)
		        f = GetFolderItem(FileName, FileUtils.PathType)
		      Else
		        Dim tempFI As FolderItem
		        tempFI = App.GetDocumentFolderItem(App.BACKGROUNDS_FOLDER)
		        f = FileUtils.RelativePathToFolderItem(tempFI, Filename)
		        If f = Nil Then
		          tempFI = App.MainPreferences.GetValueFI(prefs.kBackgroundsFolder, Nil, False)
		          If tempFI <> Nil And tempFI.IsFolder And tempFI.Exists Then
		            f = FileUtils.RelativePathToFolderItem(tempFI, Filename)
		          End If
		        End If
		        IsRelativeFilename = True
		        sRelativeFilename = Filename
		      End If
		    Catch excpt As RuntimeException
		      App.DebugWriter.Write "Exception in " + CurrentMethodName + "(" + Filename + ") : " + Introspection.GetType(excpt).FullName + "->" + excpt.message
		      f = nil
		    End Try
		    
		    #Pragma BreakOnExceptions Off
		    Try
		      App.DebugWriter.Write StringUtils.Sprintf("%s: filename was %s, f.NativePath = %s, Exists = %s", _
		      CurrentMethodName, filename, f.NativePath, If(f.Exists, "True", "False")), 10
		    Catch
		      App.DebugWriter.Write StringUtils.Sprintf("%s: Issue with folderitem for filename %s", filename), 10
		    End Try
		    #Pragma BreakOnExceptions Default
		    
		    If IsNull(f) Or Not f.Exists() Then
		      sFilename = Filename
		      If Not Globals.Status_Presentation Then
		        InputBox.Message App.T.Translate("errors/unreadable_image", Filename)
		      End If
		    Else
		      result = SetImageFromFile(f)
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetImageFromString(Base64 As String) As Boolean
		  Dim bSuccess As Boolean
		  Dim data As MemoryBlock
		  
		  bSuccess = False
		  Base64 = Trim(Base64)
		  If Len(Base64) = 0 Then
		    Clear()
		  Else
		    If Base64 <> Self.sBase64 Or Self.oImage = Nil Then
		      
		      Try
		        data = DecodeBase64(Base64)
		        Self.oImage = Picture.FromData(data)
		      Catch
		        Self.oImage = Nil
		      End Try
		      
		      If Me.oImage <> Nil Then
		        Me.sBase64 = Base64
		        bSuccess = True
		      Else
		        Me.sBase64 = ""
		      End If
		      Me.sFilename = ""
		      
		    End If
		  End If
		  
		  Return bSuccess  // Returns True if a new image is succesfully loaded. If the new image is equal to the old image, false is returned.
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //
			  // Used to determine if the image has a mask stored in the Alpha channel of the image.
			  // This is different from Picture.HasAlphaChannel in that it checks for the
			  // existence of the alpha channel as well as a non-zero value in any of the pixels.
			  //
			  
			  If oImage = Nil Then Return False
			  If Not oImage.HasAlphaChannel Then Return False
			  
			  Dim x As Integer
			  Dim y As Integer
			  Dim surf As RGBSurface = oImage.RGBSurface
			  
			  For y = 0 To oImage.Height
			    For x = 0 To oImage.Width
			      If surf.Pixel(x, y).Alpha > 0 Then Return True
			    Next
			  Next
			  
			  Return False
			End Get
		#tag EndGetter
		HasUsableAlpha As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mImageFit
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mImageFit = value
			End Set
		#tag EndSetter
		ImageFit As ObjectFit
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ImagePositionH As Double = 0.5
	#tag EndProperty

	#tag Property, Flags = &h0
		ImagePositionW As Double = 0.5
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsRelativeFilename As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mImageFit As ObjectFit
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected oImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected sBase64 As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected sFilename As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private sRelativeFilename As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TrimBottom As Integer
	#tag EndProperty


	#tag Enum, Name = ObjectFit, Type = Integer, Flags = &h0
		cover
		  contain
		  fill
		  none
		_center = 99
	#tag EndEnum


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
			Name="ImageFit"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="ObjectFit"
			EditorType="Enum"
			#tag EnumValues
				"0 - cover"
				"1 - contain"
				"2 - fill"
				"3 - none"
				"99 - _center"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImagePositionH"
			Visible=true
			Group="Behavior"
			InitialValue="0.5"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImagePositionW"
			Visible=true
			Group="Behavior"
			InitialValue="0.5"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TrimBottom"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasUsableAlpha"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
