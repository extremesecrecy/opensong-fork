#tag Module
Protected Module FileUtils
	#tag Method, Flags = &h1
		Protected Function AbsolutePathSeparator() As String
		  #If TargetMacOS
		    Return ":"
		  #elseif TargetWin32
		    Return "\"
		  #elseif TargetLinux
		    Return "/"
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AbsolutePathToFolderItem(path As String) As FolderItem
		  //++
		  // AbsolutePath is deprecated from 2013r1 and removed in 2019r2
		  // macOS needs to account for the differences between AbsolutePath and NativePath (the replacement)
		  //--
		  Try
		    #If RBVersion < 2019.01
		      Dim f As FolderItem
		      If IsPathTypeAbsolute(path) Then
		        f = GetFolderItem(Path, FolderItem.PathTypeAbsolute)
		      Else
		        App.DebugWriter.Write("FileUtils.AbsolutePathToFolderItem: IsPathAbsolute reported invalid path: '" + path + "'", 1)
		        f = Nil
		      End If
		      
		      Return f
		    #Else
		      #If Not TargetMacOS
		        Return New FolderItem(path, PathType)
		      #Else
		        Dim nativePath As String
		        
		        Declare Function CFURLCopyFileSystemPath Lib "Foundation" (anURL As Ptr, pathStyle As Int32) As CFStringRef
		        Declare Function CFURLCreateWithFileSystemPath Lib "Foundation" (CFURLCreateWithFileSystemPath As Ptr, filePath As CFStringRef, pathStyle As Int32) As Ptr
		        
		        Const kCFURLPOSIXPathStyle = 0
		        Const kCFURLHFSPathStyle = 1
		        
		        Dim ptrNSURL As Ptr = CFURLCreateWithFileSystemPath(Nil, path, kCFURLHFSPathStyle)
		        NativePath = CFURLCopyFileSystemPath(ptrNSURL, kCFURLPOSIXPathStyle)
		        
		        Return New FolderItem(NativePath, FolderItem.PathTypeNative)
		      #EndIf
		    #EndIf
		  Catch
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AbsolutePathToNativePath(abspath As String) As String
		  #If Not TargetMacOS
		    Return abspath
		  #Else
		    If abspath.InStr(AbsolutePathSeparator) = 0 Then
		      Return abspath
		    Else
		      Dim fi As FolderItem = AbsolutePathToFolderItem(abspath)
		      If fi Is Nil Then
		        Return ""
		      Else
		        Return fi.NativePath
		      End If
		    End If
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CopyFile(fromItem As FolderItem, toItem As FolderItem, overwrite As String = "NEVER") As Boolean
		  If fromItem Is Nil or toItem Is Nil Then
		    SetLastError(Nil)
		    Return False
		  End If
		  
		  If (Not fromItem.Parent.Exists) Then
		    LastError = App.T.Translate("errors/fileutils/filenotfound", GetDisplayFullPath(fromItem.Parent))
		    Return False
		  End If
		  If (Not toItem.Parent.Exists) Then
		    LastError = App.T.Translate("errors/fileutils/filenotfound", GetDisplayFullPath(toItem.Parent))
		    Return False
		  End If
		  
		  If fromItem.Directory Then
		    LastError = App.T.Translate("errors/fileutils/notaregularfile", GetDisplayFullPath(fromItem))
		    Return False
		  End If
		  
		  If Not fromItem.Exists Then
		    LastError = App.T.Translate("errors/fileutils/filenotfound", GetDisplayFullPath(fromItem))
		    Return False
		  End If
		  
		  If toItem.Directory Then
		    toItem = toItem.Child(fromItem.Name)
		  End If
		  
		  If _
		    (overwrite = kOverwriteAlways) Or _
		    (overwrite = kOverwriteNever And Not toItem.Exists) Or _
		    (overwrite = kOverwriteNewer And ((Not toItem.Exists) Or toItem.ModificationDate.TotalSeconds < fromItem.ModificationDate.TotalSeconds)) Then
		    If toItem.Exists Then toItem.Delete
		    If toItem.Exists Then
		      SetLastError(toItem)
		      Return False
		    End If
		    fromItem.CopyFileTo toItem
		    If Not toItem.Exists Then
		      SetLastError(toItem)
		      Return False
		    End If
		  End If
		  
		  SetLastError(toItem)
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CopyPath(fromFolder As FolderItem, toFolder As FolderItem, overwrite As String = "NEVER") As Boolean
		  Dim i As Integer
		  Dim fromItem, toItem As FolderItem
		  
		  If toFolder = Nil Then Return False
		  
		  If Not toFolder.Exists Then toFolder.CreateAsFolder
		  
		  If Not toFolder.Exists Then Return False
		  
		  For i = 1 To fromFolder.Count
		    fromItem = fromFolder.Item(i)
		    toItem = toFolder.Child(fromItem.Name)
		    
		    If fromItem.Directory Then
		      If Left(fromItem.Name, 1) <> "." Then
		        If Not toItem.Exists Then toItem.CreateAsFolder
		        If Not toItem.Exists Then Return False
		        If Not CopyPath(fromItem, toItem) Then Return False
		      End If
		    Else ' not a directory
		      If Left(fromItem.Name, 1) <> "." Then
		        If Not CopyFile(fromItem, toItem, overwrite) Then Return False
		      End If
		    End If
		  Next i
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateFolder(f As FolderItem) As Boolean
		  
		  If f = Nil Then
		    SetLastError(f)
		    Return False
		  End If
		  
		  If f.Exists Then
		    If f.Directory Then
		      SetLastError(f)
		      Return True
		    Else
		      LastError = App.T.Translate("errors/fileutils/notafolder", GetDisplayFullPath(f))
		      Return False
		    End If
		  Else
		    If f.Parent Is Nil Then
		      SetLastError(Nil)
		      Return False
		    Else
		      f.CreateAsFolder
		      SetLastError(f)
		      #if TargetLinux
		        //
		        // Linux has been found to return ENOENT even if CreateAsFolder
		        // is successful. Trap this and do the right thing.
		        //
		        If (f.LastErrorCode <> 0) And f.Exists And f.Directory And f.IsWriteable Then
		          App.DebugWriter.Write "FileUtils.CreateFolder: Got an error after successfully creating " +_
		          f.URLPath + ", code was " + CStr(f.LastErrorCode), 1
		          LastError = ""
		          Return True
		        End If
		      #endif
		      
		      Return f.LastErrorCode = 0
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateFolderTree(Root As FolderItem, path As String) As Boolean
		  // ++JRC This function create a folder tree
		  // Root specifies the starting Folder
		  // path specifies the subfolder(s) to create (relative)
		  
		  // path is expected to be compatible to a NativePath
		  // If Root is NIL, path is expected to be absolute
		  
		  Dim i As Integer
		  Dim folder As String
		  Dim pathSep As String = NativePathSeparator
		  Dim originalPath, rootPath As String
		  
		  If IsNull(Root) Then
		    App.DebugWriter.Write CurrentMethodName + ": parent is 'Nil'", 5
		  Else
		    App.DebugWriter.Write CurrentMethodName + ": parent is '" + Root.NativePath + "'", 5
		  End If
		  App.DebugWriter.Write CurrentMethodName + ": path is '" + path + "'", 5
		  
		  If IsNull(Root) Then
		    originalPath = path
		    If path.StartsWith("\\?\") Then
		      rootPath = path.Mid(5, 3)
		      path = path.Mid(8)
		    ElseIf path.StartsWith("\\") Then
		      i = path.InStr(3, "\")
		      i = path.InStr(i + 1, "\")
		      rootPath = path.Left(i)
		      path = path.Mid(i + 1)
		    ElseIf path.StartsWith(pathSep) Then
		      rootPath = pathSep
		      path = path.Mid(2)
		    ElseIf path.Mid(2, 2) = ":\" Then
		      rootPath = path.Left(3)
		      path = path.Mid(4)
		    Else
		      SetLastError(Root)
		      Return False
		    End If
		    App.DebugWriter.Write CurrentMethodName + ": parent now is '" + rootPath + "'", 5
		    App.DebugWriter.Write CurrentMethodName + ": path now is '" + path + "'", 5
		    Try
		      root = New FolderItem(rootPath)
		    Catch
		      // fake error message
		      LastError = App.T.Translate("errors/fileutils/invalidname", originalPath)
		      Return False
		    End Try
		  End If
		  
		  // first create the root folder (if it doesn't exist)
		  If NOT CreateFolder(Root) Then
		    SetLastError(Root)
		    Return False
		  End If
		  
		  path = ReplaceAll(path, "\", "/")
		  For Each folder In path.Split("/")
		    App.DebugWriter.Write CurrentMethodName + ": on folder " + root.DisplayName + ", create child folder: '" + folder + "'", 5
		    
		    If folder.Len > 0 Then
		      Root = Root.Child(folder)
		      If Root = Nil Then Return False
		      
		      If NOT CreateFolder(Root) Then
		        SetLastError(Root)
		        Return False
		      End If
		    End If
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DelimiterFromPath(path As String) As String
		  If path.StartsWith("file:") Then Return "/"
		  If path.InStr(NativePathSeparator) > 0 Then Return NativePathSeparator
		  If path.InStr("/") > 0 Then Return "/"
		  If path.InStr("\") > 0 Then Return "\"
		  If path.InStr(3, ":") > 0 Then Return ":"  // exclude DOS/Windows drive
		  Return NativePathSeparator
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extension(Extends fi As FolderItem, includeDot As Boolean = True) As String
		  // At least on Windows we cannot trust on fi.ExtensionVisible, because this property shows the system wide setting
		  // but does not take into account the type dependent registry settings AlwaysShowExt or NeverShowExt
		  
		  Dim completeName As String
		  Dim fullPath As String
		  Dim ext As String
		  Dim i As Integer
		  
		  If fi = Nil Or fi.Parent = Nil Then
		    completeName = ""
		  Else
		    completeName = fi.NativePath
		    If completeName.EndsWith(NativePathSeparator) Then
		      completeName = completeName.Left(Len(completeName) - 1)
		    End If
		    fullPath = fi.Parent.NativePath
		    If fullPath.EndsWith(NativePathSeparator) Then
		      completeName = completeName.Mid(fullPath.Len + 1)
		    Else
		      completeName = completeName.Mid(fullPath.len + 2)
		    End If
		  End If
		  
		  i = completeName.CountFields(".")
		  If i <= 1 Then
		    ext = ""
		  ElseIf i = 2 And completeName.left(1) = "." Then
		    ext = ""
		  Else
		    ext = completeName.NthField(".", i)
		    If includeDot Then
		      ext = "." + ext
		    End If
		  End
		  Return ext
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Extension(PathOrName As String, includeDot As Boolean = True) As String
		  // assuming the last character of the filename does not contain one of "/", "\" ":"
		  Dim i As Integer
		  Dim c, extension As String
		  
		  i = Len(PathOrname)
		  While i > 0
		    If Mid(PathOrName, i, 1) = "." Then
		      Exit
		    Else
		      i = i - 1
		    End If
		  Wend
		  
		  If i = 0  Or i = 1 Then  // 0=no extension, 1=name starting with .
		    extension = ""
		  Else
		    c = Mid(PathOrName, i - 1, 1)
		    If c = "/" Or c = "\" Or c = ":" Then
		      extension = ""  // another case of name starting with .
		    Else
		      extension = Mid(PathOrName, i + 1)
		    End If
		  End If
		  
		  If includeDot Then
		    extension = "." + extension
		  End If
		  Return extension
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatFolderName(Extends f As Folderitem, maxLen As Integer = 60) As String
		  //++
		  // Format a foldername for display
		  // If longer than maxLen, eliminate elements of the path with
		  // an ellipsis until shorter.  Always show f's name unless it is longer than maxlen
		  //--
		  Dim path As String
		  Dim name As String
		  Dim nameLen As Integer
		  Dim separator As String = NativePathSeparator
		  
		  If f = Nil Then Return ""
		  
		  path = f.PathName
		  name = f.Name
		  nameLen = Len(name) + 3 // 3 for the ...
		  Dim leaf As String
		  
		  If Len(path) <= maxLen Then Return path
		  
		  Dim elements() As String
		  elements = Split(path, separator)
		  Select Case UBound(elements)
		  Case -1 //This is strange...
		    Return ""
		  Case 0 // Unqualified filename
		    path = Left(name, (maxlen / 2) - 2) + "..." + Right(name, (maxlen / 2) - 1)
		  Case 1 // Root and filename
		    path = Left(elements(0), maxlen - nameLen) + "..." + name
		  Case Else // Multiple parent folders
		    path = elements(0) + "..."
		    leaf = elements.Pop //take off the filename
		    While UBound(elements) > 0
		      leaf = elements.pop
		      If path.len + leaf.len + name.len + 2 > maxlen Then Exit While
		      name = leaf + separator + name
		    Wend
		    path = path + separator + name
		  End Select
		  
		  Return path
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetDisplayFullPath(f As Folderitem) As String
		  //++
		  // NativePath and ShellPath may not be pretty
		  // This uses the display name to build something more
		  // user-friendly.
		  //--
		  Dim Path As String
		  Dim Separator As String
		  Dim LeadingSeparator As Boolean
		  Dim p As FolderItem
		  
		  #if TargetWin32
		    LeadingSeparator = False
		  #Else
		    LeadingSeparator = True
		  #Endif
		  Separator = NativePathSeparator
		  
		  If f = Nil Then Return ""
		  
		  p = f
		  While p <> Nil
		    path = p.DisplayName + Separator + Path
		    p = p.Parent
		  Wend
		  
		  Path = StringUtils.Chop(Path, Separator) // Kill trailing separator
		  If LeadingSeparator Then Path = Separator + Path
		  
		  Return Path
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsChild(child As FolderItem, parent As FolderItem) As Boolean
		  If child = Nil Then Return False
		  If parent = Nil Then Return False
		  
		  While child <> Nil
		    If child.Parent = parent Then Return True
		    child = child.Parent
		  Wend
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFileVisible(Extends f As FolderItem) As Boolean
		  //++
		  // Most of this is borrowed from a posting on the RB NUG mailing list
		  // at http://support.realsoftware.com/listarchives/realbasic-nug/2004-12/msg00244.html
		  //
		  // Apparently there are multiple ways on OS X to define visibility and RB
		  // doesn't check them all.
		  //
		  // Ed Palmer, November 2006
		  //--
		  
		  #if TargetMacOS
		    Dim sysx As Integer
		    Dim fp as FolderItem
		    Dim ts as TextInputStream
		    Dim HideFiles As String
		  #endif
		  
		  If f.Visible Then
		    
		    #if TargetMacOS
		      If System.Gestalt("sysv", sysx) And sysx > &h1000 Then
		        If Left(f.Name, 1) = "." Then Return False
		        fp = f.Parent
		        If fp = Nil Then Return True
		        fp = fp.Child(".hidden")
		        If fp <> Nil And fp.Exists And fp.IsReadable Then
		          ts = fp.OpenAsTextFile
		          HideFiles = Chr(10) + ts.ReadAll + Chr(10)
		          If InStr(HideFiles, Chr(10) + f.Name + Chr(10)) > 0 Then Return False
		        End If
		      End If
		    #endif
		    // Non-Carbon apps (Windows, Linux, Classic) just fall to here
		    //
		    // OpenSong uses files that start with an underscore for
		    // internal functions.  We define these as not being visible.
		    //
		    If Left(f.Name, 1) <> "_" Then Return True
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsPathAbsolute(path As String, trueAbsoluteOnly As Boolean = False) As Boolean
		  //++
		  // "trueAbsoluteOnly" = True will force this to distinguish
		  // between Xojo's AbsolutePath syntax and NativePath syntax on MacOS.
		  // Does not affect Linux or Windows.
		  //--
		  
		  #If TargetLinux
		    Return path.Left(1) = "/"
		    
		  #ElseIf TargetWindows
		    Return IsPathAbsoluteWindows(path)
		    
		  #ElseIf TargetMacOS
		    Return IsPathAbsoluteMacOS(path, trueAbsoluteOnly)
		    
		  #EndIf
		  
		  #If Not TargetMacOS
		    #Pragma Unused trueAbsoluteOnly
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsPathAbsoluteMacOS(path As String, trueAbsoluteOnly As Boolean = False) As Boolean
		  //++
		  // Determine if a path is absolute or relative.
		  // If the optional parameter "trueAbsoluteOnly" is True,
		  // this will only return True if the path is in old-style AbsolutePath
		  // with ":" separators and the volume name first.
		  // Otherwise, it returns True for both ":" notation and
		  // Unix-style "/" paths (NativePath in Xojo parlance).
		  //--
		  
		  #If TargetMacOS
		    If Not trueAbsoluteOnly And path.left(1) = "/" Then Return True
		    
		    If path.InStr(":") = 0 Then Return False
		    
		    Dim parts() As String = path.Split(":")
		    Dim volumeName As String = parts(0)
		    
		    If volumeName.Len = 0 Then volumeName = parts(1) // Support leading ":" that OpenSong mistakenly has used in the past
		    
		    For i As Integer = 0 To VolumeCount - 1
		      If Volume(i).Name = volumeName Then Return True
		    Next
		  #Else
		    #Pragma Unused path
		    #Pragma Unused trueAbsoluteOnly
		  #EndIf
		  
		  Return False
		  
		  Exception ex
		    Return False
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsPathAbsoluteWindows(path As String) As Boolean
		  //++
		  // Determine if the path is an absolute path in Windows syntax.
		  // See https://docs.microsoft.com/en-us/windows/win32/fileio/naming-a-file
		  // This is a little pedantic in form in case it needs adjustment in the future.
		  //
		  // N.B.
		  // This will return false for a "rooted" path (starts at the current drive's root folder),
		  // e.g., "\folder1\folder2\file.txt"
		  //--
		  
		  #If TargetWindows
		    If path.Left(4) = "\\?\" Then Return True  // Extended length syntax is always absolute
		    
		    If path.Left(2) = "\\" Then Return True // Short UNC syntax
		    
		    Dim re As New RegEx
		    Dim match As RegExMatch
		    
		    re.SearchPattern = "[[:alpha:]]\:\\"  // "x:\"
		    match = re.Search(path)
		    Return match <> Nil
		    
		  #Else
		    Return False
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsPathRooted(path As String) As Boolean
		  If path.StartsWith("file://") Then
		    // it's relative if the first path segment (after the host) starts with a dot
		    //
		    Return Not path.NthField("/", 4).StartsWith(".")
		  End If
		  #If TargetWin32
		    path = path.ReplaceAll("/", "\")
		    // some of the following test are not strictly true, but if the path reported as absolute is not absoulute, it is invalid
		    If path.StartsWith("\\?\") Then Return True
		    If path.Mid(2).StartsWith(":\") Then Return True
		    If path.StartsWith("\\") Then Return True
		    Return False
		  #ElseIf TargetMacOS
		    If path.StartsWith("/") Then Return True
		    
		    Dim vol As String
		    Dim i As Integer
		    
		    i = path.InStr(":")
		    If i = 1 Then  // Support leading ":" that OpenSong mistakenly has used in the past
		      path = path.Mid(2)
		      i = path.InStr(":")
		    End If
		    If i <= 1 Then Return False
		    vol = path.Left(i - 1)
		    For i = 0 To VolumeCount - 1
		      If Volume(i).Name = vol Then Return True
		    Next
		    Return False
		  #Else
		    Return path.StartsWith("/")
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsReadonly(f As FolderItem) As Boolean
		  If Not f.Directory Then
		    Return Not f.IsWriteable
		  End If
		  #Pragma BreakOnExceptions False
		  Try
		    Dim tmp As FolderItem
		    Dim tos As TextOutputStream
		    tmp = f.Child("TMP" + Chr(&h41 + System.Random.InRange(0, 25)) + CStr(System.Random.InRange(1000, 9999)))
		    tos = TextOutputStream.Create(tmp)
		    tos.Close
		    tmp.Delete
		  Catch
		    Return True
		  End Try
		  #Pragma BreakOnExceptions Default
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsSafeFileName(name As String) As Boolean
		  Dim c As String
		  Dim i, leng As Integer
		  leng = Len(name)
		  For i = 1 To leng
		    c = Mid(name, i, 1)
		    If InStr("\/:*?""<>|", c) <> 0 Then Return False
		  Next
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JoinNativePath(Base As String, ParamArray Children As String) As String
		  // Joins Children to Base using the NativePathSeparator
		  // Assumes parts use NativePathSeparator already
		  //
		  // Solves the problem that FolderItem allows only one inexistent or inaccessible component
		  
		  Dim Path As String
		  
		  Path = Base
		  For Each child As String in Children
		    child = StringUtils.LTrim(Child, NativePathSeparator)
		    If Child <> "" Then
		      Path = StringUtils.RTrim(Path, NativePathSeparator) + NativePathSeparator + child
		    End If
		  Next
		  Return Path
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastPathPart(path As String, delimiter As String = "") As String
		  // Extracts the last part of a path, i.e. the filename including the extension,
		  // or the child folder, if the path points to a folder
		  // If no delimiter is given, the most likely candidate ist derived from the string
		  
		  If delimiter = "" Then delimiter = DelimiterFromPath(path)
		  path = StringUtils.Chop(path, delimiter)
		  If path = "" Then Return path
		  Return Right(path, StringUtils.InStrReverse(path, delimiter) + 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MakeSafeFileName(name As String) As String
		  Dim c, ret As String
		  Dim i, leng As Integer
		  leng = Len(name)
		  
		  For i = 1 To leng
		    c = Mid(name, i, 1)
		    If c = "\" Or c = "/" Or c = ":" Or c = "*" Or c = "?" Or c = """" Or c = "<" Or c = ">" Or c = "|" Then
		    Else
		      ret = ret + c
		    End If
		  Next
		  
		  Return Trim(ret)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeSafeURLName(name As String, urlencode As Boolean) As String
		  Dim c As TextConverter
		  
		  'Replace spaces in the file name
		  name = ReplaceAll(name, " ", "_")
		  
		  'Convert UTF8 to ISOLatin1 to get rid of UTF's 2-Byte sequences
		  'This workaround is at least required for Internet Explorer that's not able to find
		  'files with special characters when the filename has been decoded from URL to UTF8.
		  c = GetTextConverter(Encodings.UTF8, Encodings.SystemDefault)
		  name = c.convert(name)
		  
		  If urlencode Then
		    'Create the URL for the HTML document
		    name = EncodeURLComponent(name)
		  End If
		  
		  Return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NameWithoutExtension(Extends fi As Folderitem) As String
		  Dim name As String
		  Dim ext As String
		  
		  ext = fi.Extension
		  name = fi.Name
		  If ext <> "" Then
		    If name.Right(ext.Len) = ext Then
		      name = name.Left(name.Len - ext.Len)
		    End If
		  End If
		  
		  Return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NativePathSeparator() As String
		  #If TargetMacOS
		    Return "/"
		  #elseif TargetWin32
		    Return "\"
		  #elseif TargetLinux
		    Return "/"
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NativePathToFolderItem(path As String) As FolderItem
		  Dim fi As FolderItem
		  Try
		    fi = New FolderItem(path, PathType)
		  Catch
		    fi = Nil
		  End Try
		  Return fi
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathName(Extends f As FolderItem) As String
		  // All systems seem to return NativePath of a folder with a trailing path separator
		  // If the folder does not exist or is inaccessible, NativPath does not contain a trailing path separator (al least on Windows)
		  // It is customary to show paths without a trailing path separator
		  // Moreover, it is unreasonable that NativePath would change with a call to CreateFolder
		  // so, use PathName wherever a textual representation of a full file system path of a folder is shown to a user
		  
		  If f = Nil Then Return ""
		  Dim PathName As String
		  PathName = f.NativePath
		  If PathName = NativePathSeparator Then
		    Return PathName  // the root on unixoid systems
		  Else
		    Return f.NativePath.TrimRight(NativePathSeparator)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathToFolderItem(Path As String, pathType As Integer = - 1) As FolderItem
		  Try
		    If pathType <> -1 Then
		      Return New FolderItem(Path, pathType)
		    End If
		    If IsPathAbsolute(Path, True) Then
		      Return AbsolutePathToFolderItem(Path)
		    End If
		    If Path.StartsWith("file://") Then
		      Return New FolderItem(Path, FolderItem.PathTypeURL)
		    Else
		      Return New FolderItem(Path, FileUtils.PathType)
		    End If
		  Catch
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PathType() As Integer
		  //++
		  // Since the developers are on widely disparate versions of Xojo,
		  // there are issues implementing FolderItem.PathTypeNative,
		  // introduced in Xojo 2013.1 as a replacement for FolderItem.PathTypeAbsolute.
		  // On Windows and Linux, the two are effectively equivalent,
		  // but on MacOS, PathTypeNative returns a POSIX-style path and
		  // PathTypeAbsolute returns the older colon-delimited path. This
		  // creates issues since a file path may have been stored in PathTypeAbsolute
		  // and used as an argument to a FolderItem.Child call.
		  //
		  // This will return PathTypeAbsolute in Xojo versions before 2013r1 and
		  // PathTypeNative in Xojo versions where it is implemented. That can
		  // be passed as an argument to FolderItem.Constructor or other places where
		  // the PathType constants are used.
		  //--
		  
		  #If RBVersion < 2013
		    Return FolderItem.PathTypeAbsolute
		  #Else
		    Return FolderItem.PathTypeNative
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RelativePathToFolderItem(parent As FolderItem, path As String) As FolderItem
		  Dim folder As String
		  Dim folders() As String
		  Dim target As FolderItem
		  
		  // check if the path is rooted. If so, ignore Parent
		  If IsPathRooted(path) Then
		    If IsPathAbsolute(path) Then
		      target = AbsolutePathToFolderItem(path)
		    ElseIf path.StartsWith("file:") Then
		      target = New FolderItem(path, FolderItem.PathTypeURL)
		    Else
		      target = New FolderItem(path, FileUtils.PathType)
		    End If
		    App.DebugWriter.Write "FileUtils.RelativePathToFolderItem: Returning path '" + target.URLPath + "'", 5
		    Return target
		  End If
		  
		  If parent = Nil Then
		    App.DebugWriter.Write CurrentMethodName + ": parent is Nil although path is not rooted '" + path + "'", 3
		    SetLastError(target)
		    Return target
		  End If
		  
		  App.DebugWriter.Write "FileUtils.RelativePathToFolderItem: parent is '" + parent.URLPath + "'", 5
		  App.DebugWriter.Write "FileUtils.RelativePathToFolderItem: path is '" + path + "'", 5
		  path = ReplaceAll(path, "\", "/")
		  path = ReplaceAll(path, ":", "/")
		  App.DebugWriter.Write "FileUtils.RelativePathToFolderItem: path after ReplaceAll '" + path + "'", 5
		  
		  target = parent
		  #If TargetWin32
		    If path.StartsWith("/") Then // the path is relatve to the disk only, so find it
		      //TODO: does this work for an UNC path also?
		      While target.Parent <> Nil
		        target = target.Parent
		      Wend
		      path = path.Mid(2)
		    End If
		  #endif
		  
		  folders = path.Split("/")
		  App.DebugWriter.Write "FileUtils.RelativePathToFolderItem: count of path segments to add is " + CStr(folders.Ubound + 1), 5
		  
		  For Each folder In Folders
		    App.DebugWriter.Write "FileUtils.RelativePathToFolderItem: looking for child '" + folder + "'", 5
		    If folder.Len > 0 Then
		      If folder = "." Then
		        // do nothing
		      ElseIf folder = ".." Then
		        target = target.Parent
		      Else
		        target = target.Child(folder)
		      End If
		      If target = Nil Then Return Nil
		    End If
		  Next
		  App.DebugWriter.Write "FileUtils.RelativePathToFolderItem: Returning path '" + target.URLPath + "'", 5
		  Return target
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetLastError(f As FolderItem)
		  
		  If f = Nil Then
		    LastError = App.T.Translate("errors/fileutils/nilobjecterror")
		    Return
		  End If
		  
		  Select Case f.LastErrorCode
		  Case 0 // Success
		    LastError = ""
		  Case FolderItem.AccessDenied
		    LastError = App.T.Translate("errors/fileutils/accessdenied", GetDisplayFullPath(f))
		  Case FolderItem.DestDoesNotExistError
		    LastError = App.T.Translate("errors/fileutils/destdoesnotexisterror", GetDisplayFullPath(f))
		  Case FolderItem.FileInUse
		    LastError = App.T.Translate("errors/fileutils/fileinuse", GetDisplayFullPath(f))
		  Case FolderItem.FileNotFound
		    LastError = App.T.Translate("errors/fileutils/filenotfound", GetDisplayFullPath(f))
		  Case FolderItem.InvalidName
		    LastError = App.T.Translate("errors/fileutils/invalidname", f.NativePath)
		  Case FolderItem.NotEnoughMemory
		    LastError = App.T.Translate("errors/fileutils/notenoughmemory", GetDisplayFullPath(f))
		  Case Else
		    LastError = App.T.Translate("errors/fileutils/unknownerror", GetDisplayFullPath(f))
		  End Select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected LastError As String
	#tag EndProperty


	#tag Constant, Name = kOverwriteAlways, Type = String, Dynamic = False, Default = \"ALWAYS", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kOverwriteNever, Type = String, Dynamic = False, Default = \"NEVER", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kOverwriteNewer, Type = String, Dynamic = False, Default = \"NEWER", Scope = Protected
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
