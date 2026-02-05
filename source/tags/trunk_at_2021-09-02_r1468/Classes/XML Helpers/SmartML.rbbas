#tag Module
Protected Module SmartML
	#tag Method, Flags = &h0
		Function CleanXML(Extends str As String) As String
		  If reCleanXml = Nil Then
		    reCleanXml = New RegEx
		    reCleanXml.SearchPattern = "[\x01-\x08\x0B\x0C\x0E-\x1F]"
		    reCleanXml.ReplacementPattern = ""
		    reCleanXml.Options.ReplaceAllMatches = True
		  End If
		  
		  Return reCleanXml.Replace(str)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CloneAttributes(fromNode As XmlNode, toNode As XmlNode)
		  Dim i As Integer
		  Dim attCount As Integer
		  Dim att As XmlAttribute
		  
		  attCount = fromNode.AttributeCount
		  
		  For i = 0 To attCount - 1
		    att = fromNode.GetAttributeNode(i)
		    toNode.SetAttribute(att.Name, att.Value)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CloneChildren(fromNode As XmlNode, toNode As XmlNode)
		  Dim xchild As XmlNode
		  xchild = fromNode.FirstChild
		  While xchild <> Nil
		    toNode.AppendChild toNode.OwnerDocument.ImportNode(xchild, True)
		    xchild = xchild.NextSibling
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DeterminePathType(path As String) As Integer
		  //++
		  // Xojo has deprecated FolderItem.AbsolutePath in favor of
		  // FolderItem.NativePath. The differences are subtle on Windows
		  // and Linux, but on macOS they are radically different:
		  // the separator for AbsolutePath is ":" and the path starts with the
		  // name of the volume. NativePath is the Posix-style path using
		  // the "/" separator and starting from the root ("/").
		  //
		  // Return the appropriate value to feed to the second argument for
		  // New FolderItem(path, pathtype)
		  //--
		  
		  If path.Left(7) = "file://" Then
		    Return FolderItem.PathTypeURL
		  End If
		  
		  #If Not TargetMacOS
		    Return FolderItem.PathTypeAbsolute
		  #EndIf
		  
		  #If RBVersion >= 2013
		    If path.Left(1) = "/" Then
		      Return FolderItem.PathTypeNative
		    Else
		      Return FolderItem.PathTypeAbsolute
		    End If
		  #Else
		    Return FolderItem.PathTypeAbsolute
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DisplayError()
		  InputBox.Message GetErrorMessage()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetAttribute(xnode As XmlNode, attribName As String, default As String = "") As String
		  Dim attribute As XmlNode
		  Dim s As String
		  Dim i As Integer
		  if xnode = Nil Then Return default  'EMP 09/05
		  s = attribName
		  i = 0
		  //++EMP
		  // Add Try block
		  Try
		    attribute = xnode.GetAttributeNode(attribName)
		  Catch err
		    '++JRC Translated
		    MsgBox(TranslateMessage("smartml/attrib_except", "Exception with attribute %s, %s", attribName, xnode.ToString))
		    '--
		    Return default
		  End Try
		  
		  //--
		  If attribute <> Nil Then Return attribute.Value
		  
		  ' For some reason, the following seems necessary sometimes. At least it did in RB 5.2.1
		  'For i = 1 To xnode.AttributeCount + 1 ' 5.2.1
		  For i = 0 To xnode.AttributeCount - 1 ' 5.2.2
		    attribute = xnode.GetAttributeNode(i)
		    If attribute <> Nil Then
		      If attribute.Name = s Then Return attribute.Value
		    End If
		  Next i
		  
		  Return default
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetChildNode(xnode As XmlNode, childName As String, create As Boolean = True) As XmlNode
		  If xnode = Nil Then Return Nil
		  
		  Dim child As XmlNode
		  
		  child = xnode.FirstChild
		  While child <> Nil
		    If child.Name = childName Then Return child
		    child = child.NextSibling
		  Wend
		  
		  If create Then Return xnode.AppendChild(xnode.OwnerDocument.CreateElement(childName))
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetErrorMessage() As String
		  Return ErrorString + " (" + Str(ErrorCode) + ")"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetNode(xnode As XmlNode, nodePath As String, create As Boolean = False) As XmlNode
		  Dim parent As XmlNode
		  
		  Dim i, j As Integer
		  
		  parent = xnode
		  
		  nodePath = nodePath + "/"
		  i = 1
		  j = InStr(i, nodePath, "/")
		  While j > 0
		    parent = GetChildNode(parent, Mid(nodePath, i, j-i), create) ' GetNode will create a node if asked
		    If parent = Nil Then Return Nil
		    
		    i = j + 1
		    j = InStr(i, nodePath, "/")
		  Wend
		  
		  Return parent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPlatform() As SmartML.Platform
		  Static thePlatform As SmartML.Platform = SmartML.Platform.Unknown
		  
		  If thePlatform <> SmartML.Platform.Unknown Then Return thePlatform
		  
		  #if RBVersion < 2015.04
		    #If TargetWin32
		      thePlatform = SmartML.Platform.Windows
		    #ElseIf TargetMacOS
		      thePlatform = SmartML.Platform.macOS
		    #ElseIf TargetLinux
		      thePlatform = SmartML.Platform.Linux
		    #endif
		  #Else
		    #if TargetWindows
		      thePlatform = SmartML.Platform.Windows
		    #ElseIf TargetMacOS
		      thePlatform = SmartML.Platform.macOS
		    #ElseIf TargetARM
		      thePlatform = SmartML.Platform.LinuxARM
		    #ElseIf TargetLinux
		      thePlatform = SmartML.Platform.Linux
		    #EndIf
		  #EndIf
		  
		  Return thePlatform
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValue(xnode As XmlNode, childPath As String, create As Boolean = True, default As String = "") As String
		  If xnode = Nil Then Return default
		  
		  Dim atPos As Integer
		  atPos = InStr(childPath, "@")
		  If atPos > 0 Then
		    If atPos > 1 Then xnode = GetNode(xnode, Left(childPath, atPos-2), create)
		    Return GetAttribute(xnode, Mid(childPath, atPos+1), default)
		  End If
		  
		  xnode = GetNode(xnode, childPath, create)
		  If xnode <> Nil Then
		    If xnode.ChildCount > 0 Then
		      Return xnode.Child(0).Value
		    Else
		      Return default
		    End If
		  Else
		    Return default
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValueB(xnode As XmlNode, childPath As String, create As Boolean = True, default As Boolean = False) As Boolean
		  Dim s As String
		  s = GetValue(xnode, childPath, create)
		  If Len(s) = 0 Then
		    If create Then
		      SetValueB(xnode, childPath, default)
		    End If
		    Return default
		  ElseIf Lowercase(s) = "true" Or s = "1" Then
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValueC(xnode As XmlNode, childPath As String, ByRef c As Color, create As Boolean = True) As Boolean
		  Dim s As String
		  s = GetValue(xnode, childPath, create)
		  //
		  // Update to support the RGBA string as well as legacy RGB
		  //
		  If Len(s) = 0 Then Return False
		  If Left(s, 1) <> "#" Then
		    App.DebugWriter.Write "SmartML::GetValueC, invalid color string '" + s + "'", 1
		    Return False
		  End If
		  Select Case Len(s)
		  Case 7
		    c = RGB( _ ' modified for backward compatibility: Color.RGB( _
		    Val("&H" + (Mid(s, 2, 2))), _
		    Val("&H" + (Mid(s, 4, 2))), _
		    Val("&H" + (Mid(s, 6, 2))))
		  Case 9
		    #if RBVersion >= 2011.04
		      c = RGB( _ ' modified for backward compatibility: Color.RGBA(_
		      Val("&H" + (Mid(s,2,2))), _
		      Val("&H" + (Mid(s,4,2))), _
		      Val("&H" + (Mid(s,6,2))), _
		      Val("&H" + (Mid(s,8,2))))
		    #else
		      c = RGB( _ ' modified for backward compatibility: Color.RGB( _
		      Val("&H" + (Mid(s, 2, 2))), _
		      Val("&H" + (Mid(s, 4, 2))), _
		      Val("&H" + (Mid(s, 6, 2))))
		    #endif
		  Case Else
		    App.DebugWriter.Write "SmartML::GetValueC, invalid color string '" + s + "'", 1
		    Return False
		  End Select
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValueDate(xnode As XmlNode, childPath As String, create As Boolean = True, default As Date = Nil) As Date
		  'TODO Internationalize & cross-platform
		  
		  Dim s As String
		  Dim d As New Date
		  
		  s = GetValue(xnode, childPath, create)
		  If create And Len(s) = 0 Then
		    SetValueDate(xnode, childPath, default)
		    Return default
		  End If
		  d.SQLDate = s
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValueF(xnode As XmlNode, childPath As String, create As Boolean = True) As FontFace
		  If Not create Then
		    If Not HasNode(xnode, childPath + "/@font") Then
		      Return Nil
		    End If
		  End If
		  
		  Dim f As New FontFace
		  Dim c As Color
		  
		  f.Name = GetValue(xnode, childPath + "/@font")
		  f.Size = GetValueN(xnode, childPath  + "/@size")
		  f.Bold = GetValueB(xnode, childPath  + "/@bold")
		  f.Italic = GetValueB(xnode, childPath  + "/@italic")
		  f.Underline = GetValueB(xnode, childPath  + "/@underline")
		  
		  f.Border = GetValueB(xnode, childPath  + "/@border")
		  If GetValueC(xnode, childPath  + "/@border_color", c) Then
		    f.BorderColor = c
		  End If
		  f.Shadow = GetValueB(xnode, childPath  + "/@shadow")
		  If GetValueC(xnode, childPath  + "/@shadow_color", c) Then
		    f.ShadowColor = c
		  End If
		  f.Fill = GetValueB(xnode, childPath  + "/@fill")
		  If GetValueC(xnode, childPath  + "/@fill_color", c) Then
		    f.FillColor = c
		  End If
		  
		  If GetValueC(xnode, childPath  + "/@color", c) Then
		    f.ForeColor = c
		  End If
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValueFI(xnode As XmlNode, childPath As String) As FolderItem
		  //++
		  // Return a FolderItem built from the information at xnode + childPath.
		  //
		  // Unlike other GetValue... routines, this does not have a "create" option. If the XML location
		  // does not exist, this will return Nil.
		  //
		  // See companion SetValueFI for a detailed description of what is stored.
		  //
		  // Since paths and FolderItem SaveInfo are not portable across platforms, a path saved on
		  // one platform may not work if the XML is read on another platform. In this case, a
		  // PlatformNotSupportedException will be raised with the path returned as the
		  // error message text. This gives the calling routine information to attempt to locate
		  // the file, if desired.
		  //
		  // Nil will be returned if there is no way to construct a valid FolderItem. Note that "valid"
		  // does not imply "exists".
		  //--
		  
		  Dim targetSaveInfo As String
		  Dim relativeTo As SmartML.RelativePath
		  Dim relativeToInt As Integer
		  Dim fTarget As FolderItem
		  Dim fRelative As FolderItem
		  Dim xPlatException As PlatformNotSupportedException
		  Dim targetPath As String
		  Dim sourcePlatform As SmartML.Platform
		  Dim sourcePlatformInt As Integer
		  Dim completeNode As XmlNode
		  
		  #If DebugBuild
		    Dim xPath As String
		    xPath = xnode.xPath
		    If childPath.Left(1) <> "/" Then xPath = xPath + "/"
		    xPath = xPath + childPath
		    System.DebugLog CurrentMethodName + ": " + xPath
		  #EndIf
		  
		  //++
		  // Exception case where the path is an attribute. Treat as absolute path and return result.
		  // Will not catch cross-platform issues or other problems.
		  //--
		  If xnode.Type = XmlNodeType.ATTRIBUTE_NODE Or childPath.InStr("@") > 0 Then
		    targetPath = GetValue(xnode, childPath, False)
		    Return PathToFolderItem(targetPath, FileUtils.PathType)
		  End If
		  
		  completeNode = GetChildNode(xnode, childPath, False)
		  If completeNode = Nil Then Return Nil
		  
		  targetSaveInfo = DecodeBase64(GetValue(completeNode, kSaveInfo))
		  //++
		  // If no SaveInfo stored, the path may have been stored using SetValue and not SetValueFI.
		  // Return a FolderItem based on the path string.
		  //--
		  If targetSaveInfo.Len = 0 Then
		    targetPath = GetValue(xnode, childPath, False)
		    Return PathToFolderItem(targetPath, DeterminePathType(targetPath))
		  End If
		  
		  sourcePlatformInt = Val(completeNode.GetAttribute(kPlatform))
		  sourcePlatform = SmartML.Platform(sourcePlatformInt)
		  If sourcePlatform <> GetPlatform Then
		    xPlatException = New PlatformNotSupportedException
		    xPlatException.Message = GetValue(xnode, childPath, False)
		  End If
		  
		  relativeToInt = Val(completeNode.GetAttribute(kRelativeTo))
		  relativeTo = SmartML.RelativePath(relativeToInt)
		  
		  Select Case relativeTo
		    
		  Case SmartML.RelativePath.Absolute
		    fRelative = New FolderItem
		    
		  Case SmartML.RelativePath.UserSpecified
		    fRelative = New FolderItem
		    fRelative = fRelative.GetRelative(DecodeBase64(GetValue(completeNode, kRelativeInfo)))
		    
		  Case SmartML.RelativePath.AppParent
		    fRelative = App.AppFolder
		    
		  Case SmartML.RelativePath.AppSupport
		    #If RBVersion < 2015.04
		      #If TargetWin32
		        fRelative = SpecialFolder.ApplicationData.Child("OpenSong")
		      #Endif
		    #else
		      #If TargetWindows
		        fRelative = SpecialFolder.ApplicationData.Child("OpenSong")
		      #endIf
		    #endIf
		    
		    #If TargetMacOS
		      fRelative = SpecialFolder.ApplicationData.Child("org.opensong.opensong")
		    #ElseIf TargetLinux
		      fRelative = SpecialFolder.ApplicationData.Child("opensong")
		    #EndIf
		    If Not fRelative.Exists Then fRelative = App.AppPreferencesFolderForOpenSong
		    
		  Case SmartML.RelativePath.MyDocuments
		    fRelative = SpecialFolder.Documents
		    
		  Case SmartML.RelativePath.OpenSongDocuments
		    fRelative = App.AppDocumentsFolderForOpenSong
		    
		  Case SmartML.RelativePath.OpenSongPreferences
		    fRelative = App.AppPreferencesFolderForOpenSong
		    
		  End Select
		  
		  fTarget = fRelative.GetRelative(targetSaveInfo)
		  
		  Return fTarget
		  'Catch ex As RuntimeException
		  'App.DebugWriter.Write CurrentMethodName + ": Caught a " + ex.ToString, 1
		  'If xnode <> Nil Then
		  'App.DebugWriter.Write CurrentMethodName + ": XML node is " + xnode.xPath + " and childPath " + childPath, 1
		  'End If
		  '
		  'If ex IsA PlatformNotSupportedException Then Raise ex
		  '
		  'Return Nil
		  'End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValueN(xnode As XmlNode, childPath As String, create As Boolean = True) As Double
		  Return Val(GetValue(xnode, childPath, create))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValueP(xnode As XmlNode, childPath As String, create As Boolean = True) As Picture
		  Dim s As String
		  Dim p As Picture
		  s = GetValue(xnode, childPath, create)
		  If Len(s) = 0 Then Return Nil
		  
		  Dim f As FolderItem
		  Dim outputStream As BinaryStream
		  
		  f = GetTemporaryFolderItem()
		  If f <> Nil Then
		    outputStream = BinaryStream.Create(f, True)
		    outputStream.Write DecodeBase64(s)
		    outputStream.Close
		    p = Picture.Open(f)
		    f.Delete
		  End If
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetValueTime(xnode As XmlNode, childPath As String, create As Boolean = True, default As Date = Nil) As Date
		  'TODO Internationalize & cross-platform
		  
		  Dim s As String
		  Dim d As New Date
		  
		  s = GetValue(xnode, childPath, create)
		  If create And Len(s) = 0 Then
		    SetValueTime(xnode, childPath, default)
		    Return default
		  End If
		  d.SQLDateTime = d.SQLDate + " " + s
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HasNode(xnode As XmlNode, childPath As String) As Boolean
		  If xnode = Nil Then Return False
		  
		  Dim xNodeList As XmlNodeList
		  xNodeList = xnode.Xql(childpath)
		  
		  Return xNodeList.LastError = 0 AND xNodeList.Length > 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Init()
		  //Obsolete
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InsertAfter(xnode As XmlNode, newNode As String) As XmlNode
		  If xnode.NextSibling = Nil Then
		    Return xnode.Parent.AppendChild(xnode.OwnerDocument.CreateElement(newNode))
		  Else
		    Return xnode.Parent.Insert(xnode.OwnerDocument.CreateElement(newNode), xnode.NextSibling)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InsertBefore(xnode As XmlNode, newNode As String) As XmlNode
		  Return xnode.Parent.Insert(xnode.OwnerDocument.CreateElement(newNode), xnode)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InsertChild(xnode As XmlNode, childName As String, index As Integer) As XmlNode
		  If index < xnode.ChildCount Then
		    Return xnode.Insert(xnode.OwnerDocument.CreateElement(childName), xnode.Child(index))
		  Else
		    Return xnode.AppendChild(xnode.OwnerDocument.CreateElement(childName))
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InsertChildNode(xnode As XmlNode, child As XmlNode, index As Integer) As XmlNode
		  If index < xnode.ChildCount Then
		    Return xnode.Insert(xnode.OwnerDocument.ImportNode(child, True), xnode.Child(index))
		  Else
		    Return xnode.AppendChild(xnode.OwnerDocument.ImportNode(child, True))
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MoveChild(xnode As XmlNode, fromIndex As Integer, toIndex As Integer) As XmlNode
		  If toIndex >= xnode.ChildCount Then
		    Return xnode.AppendChild(xnode.Child(fromIndex))
		  Else
		    Return xnode.Insert(xnode.Child(fromIndex), xnode.Child(toIndex))
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveChild(xnode As XmlNode, index As Integer)
		  xnode.RemoveChild xnode.Child(index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveChild(xnode As XmlNode, child As XmlNode)
		  xnode.RemoveChild child
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveChildren(xnode As XmlNode)
		  Dim xchild As XmlNode
		  
		  xchild = xnode.FirstChild
		  While xchild <> Nil
		    xnode.RemoveChild xchild
		    xchild = xnode.FirstChild
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveNode(root As XmlNode, childname As String)
		  Dim ChildNode As XmlNode
		  Dim ChildPath() As String
		  Dim CurChild As String
		  
		  If root = Nil Then Return
		  
		  ChildPath = Split(childname, "/")
		  If UBound(ChildPath) = -1 Then Return
		  
		  CurChild = ChildPath(0)
		  ChildPath.Remove 0
		  
		  // Are we looking for an attribute or a node?
		  If Left(CurChild,1) = "@" Then
		    CurChild = Mid(CurChild, 2)
		    If Ubound(ChildPath) > -1 Then Return // Illegal path passed (can't have /something/@att/something)
		    XmlElement(root).RemoveAttribute CurChild
		    Return
		  End If
		  
		  ChildNode = root.FirstChild
		  
		  While ChildNode <> Nil
		    If ChildNode.Name = CurChild Then // We've found it
		      If UBound(ChildPath) > -1 Then // But we have more to go
		        RemoveNode(ChildNode, Join(ChildPath, "/"))
		        Return
		      Else
		        root.RemoveChild ChildNode
		        Return
		      End If // If Ubound...
		    End If // If ChildNode.Name ...
		    ChildNode = ChildNode.NextSibling
		  Wend
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveSelf(xnode As XmlNode)
		  If xnode = Nil Then Return
		  If xnode.Parent <> Nil Then
		    xnode.Parent.RemoveChild xnode
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ReplaceWithImportNode(oldNode As XmlNode, newNode As XmlNode) As XmlNode
		  Dim parent, previous As XmlNode
		  
		  parent = oldNode.Parent
		  previous = oldNode.PreviousSibling
		  
		  parent.ReplaceChild oldNode.OwnerDocument.ImportNode(newNode, True), oldNode
		  If previous = Nil Then
		    Return parent.FirstChild
		  Else
		    Return previous.NextSibling
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SafeImport(fromNode As XmlNode, toNode As XmlNode)
		  ' Using this rather than the builtin ImportNode seems to stop weird problems with changes not being made until a set or whatever is reloaded
		  
		  'toNode.Name = fromNode.Name
		  
		  Dim i As Integer
		  Dim child As XmlNode
		  Dim attribute As XmlAttribute
		  
		  For i = 0 To fromNode.AttributeCount - 1
		    attribute = fromNode.GetAttributeNode(i)
		    SmartML.SetValue toNode, "@" + attribute.Name, attribute.Value
		  Next i
		  
		  For i = 0 To fromNode.ChildCount - 1
		    child = fromNode.Child(i)
		    If child.Type = XmlNodeType.ELEMENT_NODE Then
		      SafeImport child, toNode.AppendChild(toNode.OwnerDocument.CreateElement(child.Name))
		    ElseIf child.Type = XmlNodeType.TEXT_NODE Then
		      toNode.AppendChild toNode.OwnerDocument.CreateTextNode(child.Value)
		    End If
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetAttribute(xnode As XmlNode, attribName As String, value As String)
		  xnode.SetAttribute attribName, value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetValue(xnode As XmlNode, childPath As String, value As String)
		  Dim atPos As Integer
		  atPos = InStr(childPath, "@")
		  value = value.ConvertEncoding(Encodings.UTF8).CleanXML
		  If atPos > 0 Then
		    If atPos > 1 Then xnode = GetNode(xnode, Left(childPath, atPos-2), True)
		    If xnode <> Nil Then SetAttribute(xnode, Mid(childPath , atPos+1), value)
		    Return
		  End If
		  
		  xnode = GetNode(xnode, childPath, True)
		  If xnode <> Nil Then
		    If xnode.ChildCount > 0 Then
		      xnode.Child(0).Value = value
		      Return
		    Else
		      xnode = xnode.AppendChild(xnode.OwnerDocument.CreateTextNode(value))
		      Return
		    End If
		  Else
		    Return
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetValueB(xnode As XmlNode, childPath As String, value As Boolean)
		  If value Then
		    SetValue xnode, childPath, "true"
		  Else
		    SetValue xnode, childPath, "false"
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetValueC(xnode As XmlNode, childPath As String, c As Color)
		  // Updated to include alpha value
		  #if RBVersion >= 2011.04 Then
		    #if RBVersion>2015 then
		      SetValue xnode, childPath, "#" _
		      + c.Red.ToHex(2) _
		      + c.Green.ToHex(2) _
		      + c.Blue.ToHex(2) _
		      + c.Alpha.ToHex(2)
		    #else
		      SetValue xnode, childPath, "#" _
		      + StringUtils.PadLeft(Hex(c.Red),2,"0") _
		      + StringUtils.PadLeft(Hex(c.Green),2,"0") _
		      + StringUtils.PadLeft(Hex(c.Blue),2,"0") _
		      + StringUtils.PadLeft(Hex(c.Alpha),2,"0")
		    #endif
		  #else
		    SetValue xnode, childPath, "#" _
		    + StringUtils.PadLeft(Hex(c.Red),2,"0") _
		    + StringUtils.PadLeft(Hex(c.Green),2,"0") _
		    + StringUtils.PadLeft(Hex(c.Blue),2,"0")
		  #endif
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetValueDate(xnode As XmlNode, childPath As String, D As Date)
		  If D = Nil Then Return
		  
		  SetValue xnode, childPath, D.SQLDate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetValueF(xnode As XmlNode, childPath As String, f As FontFace)
		  SetValue xnode, childPath + "/@font", f.Name
		  SetValueN xnode, childPath + "/@size", f.Size
		  SetValueB xnode, childPath + "/@bold", f.Bold
		  SetValueB xnode, childPath + "/@italic", f.Italic
		  SetValueB xnode, childPath + "/@underline", f.Underline
		  SetValueC xnode, childPath + "/@color", f.ForeColor
		  
		  SetValueB xnode, childPath  + "/@border", f.Border
		  SetValueC xnode, childPath  + "/@border_color", f.BorderColor
		  SetValueB xnode, childPath  + "/@shadow", f.Shadow
		  SetValueC xnode, childPath  + "/@shadow_color", f.ShadowColor
		  SetValueB xnode, childPath  + "/@fill", f.Fill
		  SetValueC xnode, childPath  + "/@fill_color", f.FillColor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetValueFI(xnode As XmlNode, childPath As String, f As FolderItem, relativeTo As SmartML.RelativePath = SmartML.RelativePath.Absolute, relativeFolder As FolderItem = Nil)
		  //++
		  // Save a FolderItem in a somewhat intelligent way
		  // Prior to this, the FolderItem was stored as a String using the AbsolutePath.
		  // If the target XML node is an Attribute, this behavior is maintained for backward compatibility.
		  //
		  // This creates numerous issues for xplat usage, and was complicated by the
		  // deprecation of AbsolutePath by Xojo as of 2015r1.
		  // This uses a more "Xojo-like" way and increases flexibility by formalizing
		  // a way to store a relative path to one of the standard folders.
		  // Here is what we save with this function:
		  // 1. Text node with AbsolutePath (for backward compatibility; eventually will have to
		  //      change to NativePath when the deprecation is removed totally...see @PathType)
		  // 2. SaveInfo: Base64 encoded SaveInfo string for the target
		  // 3. @RelativeTo: Integer version of the SmartML.RelativePath enum
		  // 4. RelativeSaveInfo: Base64 encoded SaveInfo string for the relative folder
		  // 5. @RelativePath: Absolute or Native path of the RelativeFolder
		  // 6. @Platform: Integer version of the SmartML.Platform enum
		  // 7. @PathType: Integer version of the FolderItem.PathTypeAbsolute/PathTypeNative enum values
		  // 8. @SaveInfoType: The GetSaveInfo mode (any = 0, relative = 1, absolute = 2)
		  //
		  // If the xnode or childPath is an AttributeNode, the AbsolutePath is stored in the attribute
		  // and the function returns.
		  //
		  // If the RelativeTo enum argument is anything other than SmartML.RelativePath.UserSpecified,
		  // the RelativeFolder argument is ignored.
		  //--
		  
		  Dim SaveInfo64 As String
		  Dim RelativeSaveInfo64 As String
		  Dim myPlatform As Integer = Integer(GetPlatform)
		  Dim created As Boolean = False
		  Dim saveMode As Integer
		  
		  // Nil FolderItem is not processed
		  If f = Nil Then Return
		  
		  //
		  // Check to see if the specified XMLnode is an Attribute node
		  //
		  If xnode.Type = XmlNodeType.ATTRIBUTE_NODE Or childPath.InStr("@") > 0 Then
		    SetValue(xnode, childPath, f.NativePath)
		    Return
		  End If
		  
		  Dim targetNode As xmlNode = GetNode(xnode, childPath, False)
		  If targetNode = Nil Then
		    targetNode = GetNode(xnode, childPath, True)
		    created = (targetNode <> Nil)
		  End If
		  
		  //
		  // Handle standard XmlNode
		  //
		  targetNode.SetAttribute(kPathType, CStr(FolderItem.PathTypeAbsolute))
		  targetNode.SetAttribute(kPlatform, CStr(myPlatform))
		  targetNode.SetAttribute(kRelativeTo, CStr(Integer(relativeTo)))
		  targetNode.AppendChild(targetNode.OwnerDocument.CreateTextNode(f.NativePath))
		  Select Case relativeTo
		    
		  Case SmartML.RelativePath.Absolute
		    relativeFolder = Nil
		    saveMode = FolderItem.SaveInfoAbsoluteMode
		    
		  Case SmartML.RelativePath.UserSpecified
		    If relativeFolder = Nil Then
		      Dim rpNOE As New NilObjectException
		      rpNOE.Message = CurrentMethodName + ": Requested user-specified relative path, but did relativeFolder is Nil"
		      Raise rpNOE
		    End If
		    saveMode = FolderItem.SaveInfoRelativeMode
		    
		  Case SmartML.RelativePath.AppParent
		    relativeFolder = App.AppFolder
		    saveMode = FolderItem.SaveInfoRelativeMode
		    
		  Case SmartML.RelativePath.AppSupport
		    #if RBVersion < 2015.04
		      #if TargetWin32
		        relativeFolder = SpecialFolder.ApplicationData.Child("OpenSong")
		      #endif
		    #else
		      #If TargetWindows
		        relativeFolder = SpecialFolder.ApplicationData.Child("OpenSong")
		      #EndIf
		    #Endif
		    
		    #If TargetMacOS
		      relativeFolder = SpecialFolder.ApplicationData.Child("org.opensong.opensong")
		    #ElseIf TargetLinux
		      relativeFolder = SpecialFolder.ApplicationData.Child("opensong")
		    #EndIf
		    saveMode = FolderItem.SaveInfoRelativeMode
		    
		  Case SmartML.RelativePath.MyDocuments
		    relativeFolder = SpecialFolder.Documents
		    saveMode = FolderItem.SaveInfoRelativeMode
		    
		  Case SmartML.RelativePath.OpenSongDocuments
		    relativeFolder = App.AppDocumentsFolderForOpenSong
		    saveMode = FolderItem.SaveInfoRelativeMode
		    
		  Case SmartML.RelativePath.OpenSongPreferences
		    relativeFolder = App.AppPreferencesFolderForOpenSong
		    saveMode = FolderItem.SaveInfoRelativeMode
		    
		  End Select
		  
		  //++
		  // If Relative doesn't exist when the GetValueFI is attempted
		  // an NOE will result. Try to avoid this happening.
		  //--
		  
		  If RelativeFolder = Nil Or Not relativeFolder.exists Then
		    relativeFolder = Nil
		    saveMode = FolderItem.SaveInfoAbsoluteMode
		  End If
		  
		  SaveInfo64 = EncodeBase64(f.GetSaveInfo(relativeFolder, saveMode))
		  SetValue(targetNode, kSaveInfo, SaveInfo64)
		  If relativeFolder <> Nil Then
		    RelativeSaveInfo64 = EncodeBase64(relativeFolder.GetSaveInfo(Nil, FolderItem.SaveInfoAbsoluteMode))
		    SetValue(targetNode, kRelativeInfo, RelativeSaveInfo64)
		    targetNode.SetAttribute(kRelativePath, relativeFolder.NativePath)
		  End If
		  targetNode.SetAttribute(kSaveInfoType, CStr(saveMode))
		  
		  'Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetValueN(xnode As XmlNode, childPath As String, value As Double)
		  SetValue xnode, childPath, Str(value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetValueP(xnode As XmlNode, childPath As String, f As FolderItem)
		  Dim inputStream As BinaryStream
		  
		  If f <> Nil Then
		    inputStream = BinaryStream.Open(f)
		    If inputStream <> Nil Then
		      SetValue xnode, childPath, EncodeBase64(inputStream.Read(f.Length))
		      inputStream.Close
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetValueTime(xnode As XmlNode, childPath As String, T As Date)
		  'TODO Internationalize & cross-platform
		  If T = Nil Then Return
		  Dim timeString As String
		  
		  timeString = T.SQLDateTime
		  timeString = Mid(timeString, Len(T.SQLDate) + 2)
		  SetValue xnode, childPath, timeString
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SwapChildren(xnode As XmlNode, index1 As Integer, index2 As Integer)
		  Dim temp As XmlNode
		  
		  temp = MoveChild(xnode, index1, index2)
		  temp = MoveChild(xnode, index2, index1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TranslateMessage(id As String, altText As String = "", param1 As String = "", param2 As String = "", param3 As String = "") As String
		  //++
		  // Even though Translator.Translate is defined with a paramarray argument, there's no way
		  // to use one as input here and pass it along.  Therefore, only handle the most basic cases
		  // (0, 1, 2 or 3)
		  //
		  // This routine helps eliminate excessive If...Then coding in error traps by providing a
		  // means to generate a meaningful error message if the translator object is not loaded.
		  //
		  // Ed Palmer, June 2007
		  //--
		  
		  If App.T Is Nil Then
		    Return StringUtils.Sprintf(altText, param1, param2, param3)
		  Else
		    Return App.T.Translate(id, param1, param2, param3)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function XDocFromFile(f As FolderItem) As XmlDocument
		  Dim input As TextInputStream
		  Dim s As String
		  Dim d As New XmlDocument
		  d.PreserveWhitespace = False
		  
		  If f = Nil Then
		    ErrorCode = 1
		    '++JRC Translated
		    ErrorString = TranslateMessage("smartml/no_path", "The FolderItem object is Nil in XDocFromFile")
		    '--
		    Return Nil
		  ElseIf Not f.Exists Then
		    ErrorCode = 2
		    '++JRC Translated
		    ErrorString = TranslateMessage("smartml/no_file",  "File does not exist in XDocFromFile: %s", f.NativePath)
		    '--
		    Return Nil
		  End If
		  input = TextInputStream.Open(f)
		  If input = Nil Then
		    ErrorCode = 4
		    ErrorString = TranslateMessage("smartml/cant_open",  "Could not open %s in XDocFromFile: %s", f.NativePath, CStr(f.LastErrorCode))
		    Return Nil
		  End If
		  
		  s = input.ReadAll
		  input.Close
		  Try
		    If Len(s) > 5 Then
		      '
		      ' OnSong writes "OpenSong" format claiming UTF-8 in the XML  header, but the file has a UTF-16 bytemark.
		      '     The XML parser throws an error
		      '     trying to load this with the encoding wrong. By empirical testing, it appears that the &HFFFE byte mark for
		      '     a UTF-16 file in little-endian format shows up as &H001C0000 when we read the leftmost "character" of the string.
		      '     Check for this and define the correct encoding.
		      '     We'll excuse OnSong for claiming in the XML header that it's a UTF-8 encoding when it's not... :-)
		      '     This may need to be revisited and corrected by reopening the file and re-reading it with a defined UTF-16 encoding.
		      '
		      Dim FixSongFile As Boolean = False
		      If asc(Left(s,1)) = &H001C0000 Then 'The string actually starts with a UTF-16LE byte mark (&HFFFE)
		        s = DefineEncoding(s, encodings.UTF16)
		        Dim XmlDeclLen As Integer = InStr(6, s, ">")
		        If InStr(Mid(s, 6, XmlDeclLen-6), "UTF-8") <> 0 Then
		          ' the xml declaration says it is UTF-8, so convert it to be so
		          s = s.ConvertEncoding(Encodings.UTF8)
		          FixSongFile = True
		        End If
		      End If
		      d.LoadXml(s)
		      If FixSongFile Then
		        FixSongFile = XDocToFile(d, f) ' try to write the file in the correct encoding, ignoring errors
		      End If
		      Return d
		    Else
		      ErrorCode = 5
		      '++JRC Translated
		      ErrorString = TranslateMessage("smartml/xml_error",  "LoadXML Error from file %s", f.NativePath)
		      '--
		      Return Nil
		    End If
		  Catch err As XmlException
		    ErrorCode = 3
		    '++JRC Translated
		    Dim msg As String
		    msg = ""
		    If err.Line <> "" Then msg = msg + " " + err.Line
		    If err.Node <> "" Then msg = msg + " " + err.Node
		    If err.Message <> "" Then msg = msg + " " + err.Message
		    ErrorString = TranslateMessage("smartml/xml_exterror", "XmlException from LoadXML on file %s %s", f.NativePath, msg, "")
		    '--
		    Return Nil
		  End Try
		  Catch ex
		    If ex IsA NilObjectException Then
		      //++
		      // Most likely the Nil object is App.T and we're trying to open
		      // one of the XML documents that should be in a subdirectory of
		      // the application.  Without trapping this, the program abruptly
		      // blows up.  With this, at least a basic error message is output
		      // to give someone an idea of what is happening.
		      //--
		      ErrorString = "Error in SmartML.XDocFromFile and translator is not loaded"
		    Else
		      ErrorString = "Unexpected exception in SmartML.XDocFromFile"
		      If ErrorCode = 0 Then ErrorCode = -1
		    End If
		    If f <> Nil Then ErrorString = ErrorString + ", file is " + f.NativePath
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function XDocFromString(s As String) As XmlDocument
		  Dim d As New XmlDocument
		  d.PreserveWhitespace = False
		  
		  Try
		    If Len(s) > 5 Then
		      d.LoadXml(s)
		      Return d
		    Else
		      Return Nil
		    End If
		  Catch err As XmlException
		    ErrorCode = 3
		    '++JRC Translated
		    ErrorString = TranslateMessage("smartml/xml_error",  "XML Error in XDocFromString: %s", Left(s, 30))
		    '--
		    If Len(s) > 30 Then ErrorString = ErrorString
		    Return Nil
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function XDocToFile(xdoc As XmlDocument, f As FolderItem) As Boolean
		  If f = Nil Then
		    ErrorCode = 11
		    ErrorString = TranslateMessage("smartml/no_path", "XDocToFile: FolderItem argument is Nil")
		    Return False
		  End If
		  
		  Dim output As TextOutputStream = Nil
		  Try
		    output = TextOutputStream.Create(f)
		  Catch e As IOException
		    output = Nil
		  End Try
		  If output <> Nil Then
		    Try
		      output.Write XDocToString(xdoc).FormatLocalEndOfLine
		      output.Close
		    Catch e As IOException
		      ErrorString = f.NativePath
		      If e.Message <> "" Then
		        ErrorString = ErrorString + EndOfLine + EndOfLine + e.Message
		      End If
		      If e.ErrorNumber <> 0 Then
		        ErrorString = ErrorString + " (Error Code " + CStr(e.ErrorNumber) + ")"
		      End If
		      ErrorString = TranslateMessage("fileutils/unknownerror", "XDocToFile: Unable to save to file: %s", ErrorString)
		    End Try
		    Return True
		  Else
		    ErrorCode = 12
		    ErrorString = TranslateMessage("smartml/cant_create", "XDocToFile: Unable to create file: %s", f.NativePath)
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function XDocToString(xdoc As XmlDocument) As String
		  Dim s As String
		  
		  s = xdoc.ToString
		  s = ReplaceAll(s, "/></", "/>" + Newline + "</")
		  s = ReplaceAll(s, "?><", "?>" + Newline + "<")
		  s = ReplaceAll(s, "></", "&aardvark;")
		  s = ReplaceAll(s, "><", ">" + Newline + "  <")
		  s = ReplaceAll(s, "&aardvark;", "></")
		  s = ReplaceAll(s, "<option>", "  <option>")
		  's = ReplaceAll(s, "UTF-8", "ISO-8859-1")
		  's = ConvertEncoding(s, Encodings.ISOLatin1) ' ISO-8859-1
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function xPath(Extends xnode As XmlNode) As String
		  //++
		  // Return an approximate XPath for a given XmlNode
		  // Not guaranteed to be unique; do no trust that Xql with this XPath will
		  // return this unique node.
		  //--
		  Dim nodeNumber As Integer = 1
		  Dim parentPath As String
		  Dim myName As String = xnode.Name
		  Dim myPath As String
		  
		  If xnode.Type = XmlNodeType.DOCUMENT_NODE Then Return ""
		  
		  parentPath = xnode.Parent.xPath
		  Dim xSib As XmlNode
		  xSib = xnode.PreviousSibling
		  
		  While xSib <> Nil
		    If xSib.Name = myName Then nodeNumber = nodeNumber + 1
		    xSib = xSib.PreviousSibling
		  Wend
		  
		  myPath = parentPath + "/"
		  If xnode.Type = XmlNodeType.ATTRIBUTE_NODE Then
		    myPath = myPath + "@"
		  End If
		  myPath = myPath + myName
		  If nodeNumber > 1 Then
		    myPath = myPath + "[" + Str(nodeNumber) + "]"
		  End If
		  
		  Return myPath
		End Function
	#tag EndMethod


	#tag Note, Name = Enum RelativePath
		Used to identify the relationship between the SaveInfo of the target FolderItem. 
		"Absolute" is assigned to zero as GetAttribute will return a zero-length string for a missing Attribute. 
		This gives a reasonable default in the absence of additional information.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected ErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ErrorString As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return EndOfLine
			End Get
		#tag EndGetter
		Protected Newline As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private reCleanXml As RegEx
	#tag EndProperty


	#tag Constant, Name = kPathType, Type = String, Dynamic = False, Default = \"pathtype", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlatform, Type = String, Dynamic = False, Default = \"platform", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRelativeInfo, Type = String, Dynamic = False, Default = \"relativesaveinfo", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRelativePath, Type = String, Dynamic = False, Default = \"relativepath", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRelativeTo, Type = String, Dynamic = False, Default = \"relativeto", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSaveInfo, Type = String, Dynamic = False, Default = \"saveinfo", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSaveInfoType, Type = String, Dynamic = False, Default = \"saveinfotype", Scope = Private
	#tag EndConstant


	#tag Enum, Name = Platform, Flags = &h1
		Unknown
		  Windows
		  macOS
		  Linux
		LinuxARM
	#tag EndEnum

	#tag Enum, Name = RelativePath, Type = Integer, Flags = &h1, Description = 5573656420746F206964656E74696679207468652072656C6174696F6E73686970206265747765656E207468652053617665496E666F206F66207468652074617267657420466F6C6465724974656D2E20224162736F6C757465222069732061737369676E656420746F207A65726F206173204765744174747269627574652077696C6C2072657475726E2061207A65726F2D6C656E67746820737472696E6720666F722061206D697373696E67204174747269627574652E2054686973206769766573206120726561736F6E61626C652064656661756C7420696E2074686520616273656E6365206F66206164646974696F6E616C20696E666F726D6174696F6E2E
		Absolute = 0
		  UserSpecified
		  MyDocuments
		  AppSupport
		  AppParent
		  OpenSongDocuments
		OpenSongPreferences
	#tag EndEnum


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
End Module
#tag EndModule
