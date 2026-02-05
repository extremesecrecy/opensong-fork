#tag Class
Protected Class FolderDB
	#tag Method, Flags = &h0
		Function AddFile(path As String) As FolderItem
		  Dim f As FolderItem
		  
		  path = CleanPath(path)
		  
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  
		  // Prevent NilObjectException
		  If f = Nil Then
		    ErrorCode = 4
		    ErrorString = "Could not find path to folder."
		    Return Nil
		  End If
		  
		  If f.Exists Then
		    ErrorCode = 3
		    ErrorString = "File already exists."
		    Return Nil
		  End If
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddFolder(path As String) As FolderItem
		  Dim f As FolderItem
		  path = CleanPath(path)
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  
		  If Not (f Is Nil) Then
		    If f.Exists Then
		      ErrorCode = 1
		      ErrorString = "Folder already exists."
		      Return Nil
		    End If
		    
		    f.CreateAsFolder
		    If Not f.Exists Then
		      ErrorCode = 2
		      ErrorString = "Could not create folder."
		      Return Nil
		    End If
		  End If
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddFolderToCache(folder As FolderItem, path As String = "/")
		  //++
		  // April 2007: Change to process folders last
		  //--
		  
		  Dim x As Integer
		  Dim s As String
		  Dim f As FolderItem
		  Dim count As Integer
		  
		  Dim j As integer
		  Dim fname As String
		  Dim subfolders() As FolderItem
		  
		  count = Folder.Count
		  fname = Folder.Name
		  
		  j = 0
		  ProgressWindow.SetMaximum(count)
		  ProgressWindow.SetProgress(j)
		  ProgressWindow.Show
		  ProgressWindow.SetStatus  App.T.Translate("progress_status/folder", fName) + "..."
		  
		  For x = 1 to count
		    j = j + 1
		    ProgressWindow.SetMaximum(count)
		    ProgressWindow.SetStatus App.T.Translate("progress_status/folder", fName) + "..."
		    ProgressWindow.SetProgress(j)
		    
		    f = folder.Item(x)
		    s = f.Name
		    If InStr("._", Left(s, 1)) = 0 And f.Visible Then
		      If f.Directory Then
		        subfolders.Append f
		      Else
		        Cache.Append s + path
		        NumFiles = NumFiles + 1
		      End If
		    End If
		  Next x
		  // Handle the directories
		  For x = 0 To UBound(subfolders)
		    f = subfolders(x)
		    s = f.name
		    Cache.Append path + s + "/"
		    NumFiles = NumFiles + 1
		    AddFolderToCache f, path + s + "/"
		  Next x
		  ProgressWindow.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BitCheck(number as uint64, offset as integer) As Boolean
		  
		  // by Mike Bailey ... http://forums.realbasic.com/viewtopic.php?t=4637
		  
		  Dim bit As UInt64
		  bit = Bitwise.ShiftLeft( 1, offset-1 )
		  Return (Bitwise.BitAnd( number, bit ) > 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CachePathToPath(cachePath As String) As String
		  Dim slashPos As Integer = InStr(cachePath, "/")
		  Return Mid(cachePath, slashPos+1) + Left(cachePath, slashPos-1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellTagFormat(path As String) As String
		  // formats a DBPath as it is used in lst_songs_songs.CellTag
		  path = CleanPath(path)
		  If path <> "" Then
		    path.Append("/")
		  End If
		  Return path
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CleanPath(path As String) As String
		  Dim modified As Boolean
		  path = path.RTrim
		  Do
		    modified = False
		    path = path.LTrim
		    If path.StartsWith("/") Then
		      path = StringUtils.LTrim(path, "/")
		      modified = True
		    End If
		    If path.StartsWith(FilterAll) Then
		      path = Replace(path, FilterAll, "")
		      modified = True
		    End If
		    If path.StartsWith(FilterMain) Then
		      path = Replace(path, FilterMain, "")
		      modified = True
		    End If
		  Loop Until Not modified
		  
		  #If XojoVersion < 2022.02
		    While path.ContainsSU("//")
		      path = path.ReplaceAll("//", "/")
		    Wend
		  #Else
		    While path.Contains("//")
		      path = path.ReplaceAll("//", "/")
		    Wend
		  #EndIf
		  Return path.TrimRight("/")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CombinePath(path As String, addPath As String) As String
		  addPath = CleanPath(addPath)
		  path = CleanPath(path)
		  If addPath.IsEmpty Then
		    Return path
		  End If
		  If path.IsEmpty Then
		    Return addPath
		  End If
		  #If XojoVersion < 2022.011
		    // Bug allert: adding an UTF8 string to an empty string (which is unchangeably encoded as US-ASCII) results in an UTF16 string
		    // Writing that UTF16 string to an XML file truncates the result after the first 00 byte in the UTF16 byte stream
		    // this bug has been dicovered and addressed in r1333 (2020-06-03)
		    // The encoding problem has been verified to no longer exist in Xojo 2022.r11
		    // I have not found any reference in Xojo's change log as to when this has been fixed
		    // I have not investigated the problem of writing UTF16 encoded strings to XML any further
		    Return CleanPath(ConvertEncoding(path + "/" + addPath, Encodings.UTF8))
		  #Else
		    Return CleanPath(path + "/" + addPath)
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(folder As FolderItem)
		  If App.T Is Nil Then
		    FilterAll = "( All )"
		    FilterMain = "( Main )"
		  Else
		    FilterAll = "( " + App.T.Translate("songs_mode/song_folders/filter_all/@caption") + " )"
		    FilterMain = "( " + App.T.Translate("songs_mode/song_folders/filter_main/@caption") + " )"
		  End If
		  Load folder
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyFile(path As String, destFolder As String) As Boolean
		  Dim f, fo As FolderItem
		  
		  destFolder = CleanPath(destFolder)
		  path = CleanPath(path)
		  
		  fo = FileUtils.RelativePathToFolderItem(Folder, destFolder)
		  If fo = Nil Or Not fo.Exists Then
		    ErrorCode = 6
		    ErrorString = "Could not find folder."
		    Return False
		  End If
		  
		  If Not fo.Directory Then
		    ErrorCode = 6
		    ErrorString = "Destination folder is a regular file."
		    Return False
		  End If
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  If f = Nil Or Not f.Exists Then
		    ErrorCode = 8
		    ErrorString = "Could not find file."
		    Return False
		  End If
		  
		  f.CopyFileTo fo
		  
		  If f.LastErrorCode <> 0 Then
		    If f.Exists And fo.Exists Then  // File with that name already in destination folder
		      ErrorCode = 13
		      ErrorString = "Destination file exists."
		    Else
		      ErrorCode = 12
		      ErrorString = "Could not copy file."
		    End If
		    Return False
		  End If
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyFileEx(path As String, destFile As String) As Boolean
		  // copy the song referenced by path to a song with a new file name given by destfile within the same path
		  Dim fo As FolderItem
		  Dim g As FolderItem
		  
		  destFile = CleanPath(destFile)
		  destFile = ReplaceAll(destFile, "/", "\")
		  path = CleanPath(path)
		  
		  fo = FileUtils.RelativePathToFolderItem(Folder, path)
		  If fo = Nil Or Not fo.Exists Then
		    ErrorCode = 8
		    ErrorString = "Source for copy does not exist"
		    Return False
		  End If
		  
		  g = fo.Parent.Child(destFile)
		  
		  If g.Exists Then
		    ErrorCode = 3
		    ErrorString = App.T.Translate("errors/already_exists", destFile)
		    Return False
		  End If
		  
		  fo.CopyFileTo g
		  
		  If fo.LastErrorCode <> 0 Then
		    If g.Exists And fo.Exists Then // File with that name already in destination folder
		      ErrorCode = 13
		      ErrorString = "Destination file exists."
		    Else
		      ErrorCode = 12
		      ErrorString = "Could not copy file."
		    End If
		    Return False
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyFileEx(sourceFolder As String, sourceName As String, destFolder As String, destName As String) As Boolean
		  // copy a file to a new folder and new name
		  Dim f, fo As FolderItem
		  
		  If destFolder = "" Then destFolder = sourceFolder
		  If destName = "" Then destName = sourceName
		  
		  fo = GetFile(destFolder, "")
		  If fo = Nil Or Not fo.Exists Then
		    ErrorCode = 6
		    ErrorString = "Could not find folder."
		    Return False
		  End If
		  
		  If Not fo.Directory Then
		    ErrorCode = 6
		    ErrorString = "Destination folder is a regular file."
		    Return False
		  End If
		  
		  Try
		    fo = fo.Child(destName)
		    If fo = Nil then
		      ErrorCode = 8
		      ErrorString = "Could not find file."
		      Return False
		    ElseIf fo.Exists Then
		      ErrorCode = 13
		      ErrorString = "Destination file exists."
		      Return False
		    End If
		  Catch
		    ErrorCode = 12
		    ErrorString = "Could not copy file."
		    Return False
		  End Try
		  
		  
		  f = GetFile(sourceFolder, sourceName)
		  If f = Nil Or Not f.Exists Then
		    ErrorCode = 8
		    ErrorString = "Could not find file."
		    Return False
		  End If
		  
		  f.CopyFileTo fo
		  
		  If f.LastErrorCode <> 0 Then
		    If f.Exists And fo.Exists Then // File with that name already in destination folder
		      ErrorCode = 13
		      ErrorString = "Destination file exists."
		    Else
		      ErrorCode = 12
		      ErrorString = "Could not copy file."
		    End If
		    Return False
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DBPathFromFolderItem(f As FolderItem) As String
		  // Returns the relative path of the FolderItem within the FolderDB with '/' as folder separator
		  // If f is not within the FolderDB, then the system specific absolute path is returned instead
		  
		  Dim Path As String
		  Dim dbPath As String
		  
		  If f = Nil Then Return ""
		  
		  Path = f.NativePath
		  dbPath = folder.NativePath
		  If Not dbPath.EndsWith(FileUtils.NativePathSeparator) Then
		    dbPath.Append(FileUtils.NativePathSeparator)
		  End If
		  If Path.EndsWith(FileUtils.NativePathSeparator) Then
		    If Not f.IsFolder Then
		      Path = Path.TrimRight(FileUtils.NativePathSeparator)
		    End If
		  Else
		    If f.IsFolder Then
		      Path.Append(FileUtils.NativePathSeparator)
		    End If
		  End If
		  If Path.StartsWith(dbPath) Then
		    Path = Path.Mid(dbPath.Length + 1)
		  Else
		    Return Path  'TODO: should this be a platform independent path?
		  End If
		  
		  Path = Path.Translate("\:", "/")
		  #If XojoVersion < 2022.02
		    While path.ContainsSU("//")
		      path = path.ReplaceAll("//", "/")
		    Wend
		  #Else
		    While path.Contains("//")
		      path = path.ReplaceAll("//", "/")
		    Wend
		  #EndIf
		  Return Path
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteFile(path As String) As Boolean
		  Dim f As FolderItem
		  path = CleanPath(path)
		  
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  
		  If f = Nil Then Return True
		  If Not f.Exists Then Return True
		  f.Delete
		  If f.Exists Then
		    ErrorCode = 9
		    ErrorString = "Could not delete file."
		    Return False
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteFolder(path As String) As Boolean
		  Dim f As FolderItem
		  path = CleanPath(path)
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  If f = Nil Or Not f.Exists Then
		    ErrorCode = 6
		    ErrorString = "Could not find folder."
		    Return False
		  End If
		  
		  If f.Count > 0 Then
		    ErrorCode = 11
		    ErrorString = "Folder is not empty."
		    Return False
		  End If
		  
		  f.Delete
		  If f.Exists Then
		    ErrorCode = 7
		    ErrorString = "Could not delete folder."
		    Return False
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFile(path As String, addPath As String = "") As FolderItem
		  Dim f As FolderItem
		  path = CombinePath(path, addPath)
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  If f <> Nil Then
		    If Not f.Exists Then App.DebugWriter.Write "FolderDB.GetFile: File does not exist: '" + f.URLPath + "'", 5
		  End If
		  If f = Nil Or Not f.Exists Then
		    ErrorCode = 8
		    ErrorString = "Could not find file."
		    f = Nil
		  End If
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFileInFolderSafe(file As String, folder As String = "") As FolderItem
		  Dim f As FolderItem = Nil
		  
		  file = ReplaceAll(file, "/", "")
		  file = ReplaceAll(file, "\", "")
		  file = ReplaceAll(file, "..", "")
		  folder = ReplaceAll(folder, "..", "")
		  
		  Dim folders() As String = GetFolders()
		  //++
		  // GetFolders() returns the main folder (array item 0) with the
		  // value "( Main )" (or equivalent in the current language).
		  // Using a folder name of an empty string is the equivalent
		  // of "main" and is treated that way by GetFile.
		  //--
		  If folders.IndexOf(folder) > -1 Or folder = "" Then
		    
		    f = GetFile(folder, file)
		    If f <> Nil Then
		      If Not f.Exists() Then
		        f = Nil
		      End If
		    End If
		  End If
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFiles(pathFilter As String, fileBox As ListBox = Nil) As String()
		  Dim songList(0) As String
		  
		  Dim showAll As Boolean
		  
		  showAll = False
		  If InStr(pathFilter, FilterAll) = 1 Or Len(pathFilter) = 0 Then
		    showAll = True
		    pathFilter = ""
		  ElseIf InStr(pathFilter, FilterMain) = 1 Or pathFilter = "." Then
		    pathFilter = ""
		  ElseIf Right(pathFilter, 1) <> "/" Then
		    pathFilter = pathFilter + "/"
		  End If
		  If filebox <> Nil Then filebox.DeleteAllRows
		  songList = GetFilesInFolder(pathFilter, fileBox, showAll)
		  
		  If fileBox <> Nil Then
		    filebox.SortedColumn = 0
		    filebox.Sort
		  else
		    // only do a HeapSort if fileBox is Nil, as we don't use it if filling a listbox
		    // this speeds up the SongPicker by factor of 3
		    Heapsort songList
		  End If
		  
		  Return songList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFilesInFolder(path As String, list As listbox = Nil, recurse As Boolean = False) As String()
		  #If TargetWin32
		    Return GetFilesInFolderWin(path, list, recurse)
		  #elseif TargetMacOS
		    Return GetFilesInFolderMac(path, list, recurse)
		  #else
		    Return GetFilesInFolderGeneric(path, list, recurse)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFilesInFolderGeneric(path As String, list As listbox = Nil, recurse As Boolean = False) As String()
		  Dim fileList() As String
		  Dim f As FolderItem
		  Dim fi As FolderItem
		  Dim last As Integer
		  Dim childFolders() As FolderItem
		  
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  
		  If Not f.Directory Then Return fileList
		  
		  last = f.Count
		  For i As Integer = 1 To last
		    fi = f.item(i)
		    If Not fi.IsFileVisible Then Continue
		    If fi.Directory Then
		      childFolders.Append fi
		      Continue
		    End If
		    fileList.Append fi.Name
		    If list <> Nil Then
		      list.AddRow fi.Name
		      list.CellTag(list.LastIndex, 0) = path
		    End If
		  Next
		  
		  If recurse Then
		    For i As Integer = 0 To UBound(childFolders)
		      Dim temp() As String
		      Dim childName As String
		      // make sure there is no separator at the End of the Name. This may happen, at least in Windows
		      // not sure if the issue concerns only the ..Path fields, but better be sure
		      // no special treatment for root folders are needed here
		      childName = StringUtils.RTrim(childFolders(i).Name, FileUtils.NativePathSeparator)
		      temp = GetFilesInFolder(path + childName + "/", list, recurse)
		      For j As Integer = 0 To UBound(temp)
		        fileList.Append temp(j)
		      Next
		    Next
		  End If
		  
		  Return fileList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFilesInFolderMac(path As String, list As listbox = Nil, recurse As Boolean = False) As String()
		  #If Not TargetMacOS
		    Return GetFilesInFolderGeneric(path, list, recurse)
		  #EndIf
		  Dim f As FolderItem
		  Dim fileList() As String
		  
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  
		  Dim dirEnum As Cocoa.NSDirectoryEnumerator
		  Dim fm As Cocoa.NSFileManager = Cocoa.NSFileManager.DefaultManager
		  Dim theKeys As NSArray = NSArray.CreateFromArrayOfStrings(Array(NSURL.NSURLIsDirectoryKey))
		  Dim enumOptions As Integer
		  
		  enumOptions = NSFileManager.NSDirectoryEnumerationSkipsHiddenFiles + _
		  NSFileManager.NSDirectoryEnumerationSkipsPackageDescendants
		  If Not recurse Then
		    enumOptions = enumOptions + NSFileManager.NSDirectoryEnumerationSkipsSubdirectoryDescendants
		  End If
		  
		  dirEnum = fm.EnumeratorAtURL(f.URLPath, theKeys, enumOptions)
		  
		  Dim fileURL As Cocoa.NSURL
		  Dim fileParts() As String
		  
		  If list <> Nil Then
		    list.DeleteAllRows
		  End If
		  
		  fileURL = dirEnum.NextURL
		  Dim p1, p2, p3, p4 As String
		  p2 = f.NativePath
		  While fileURL <> Nil
		    If Not fileURL.IsDirectory Then
		      fileParts = fileurl.PathComponents
		      fileList.Append fileParts(fileParts.Ubound)
		      If list <> Nil Then
		        list.AddRow fileParts(fileParts.Ubound)
		        p1 = fileURL.Path
		        p3 = fileParts(fileParts.Ubound)
		        p4 = Right(p1, p1.Len - P2.Len + path.Len - 1)
		        p4 = Left(p4, p4.Len - p3.Len)
		        list.CellTag(list.LastIndex, 0) = p4
		      End If
		    End If
		    fileURL = dirEnum.NextURL
		  Wend
		  
		  Return fileList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFilesInFolderWin(path As String, list As ListBox = Nil, recurse As Boolean = False) As String()
		  #If Not TargetWin32
		    Return GetFilesInFolderGeneric(path, list, recurse)
		  #EndIf
		  
		  Dim fileDict() As Dictionary
		  Dim startPath As String
		  
		  startPath = Folder.NativePath
		  If Right(startPath, 1) <> "\" Then
		    startPath = startPath + "\"
		  End If
		  startPath = startPath + ReplaceAll(path, "/", "\")
		  win32GetFileList(fileDict, startPath, "", "*.*", recurse)
		  
		  Dim fileList() As String
		  Dim last As Integer
		  last = UBound(fileDict)
		  
		  For i As Integer = 0 To last
		    
		    If list <> Nil Then
		      // we currently only use array if the list is Nil
		      App.DebugWriter.Write(CurrentMethodName + " " + fileDict(i).Value("Name").StringValue.ConvertEncoding(Encodings.UTF8) + " : " + ReplaceAll(path + fileDict(i).Value("Path"), "\", "/"), 7)
		      list.AddRow fileDict(i).Value("Name").StringValue.ConvertEncoding(Encodings.UTF8)
		      list.CellTag(list.LastIndex, 0) = ReplaceAll(path + fileDict(i).Value("Path"), "\", "/")
		    Else
		      // list is Nil, array WILL be used
		      fileList.Append fileDict(i).Value("Name").StringValue.ConvertEncoding(Encodings.UTF8)
		    End If
		  Next
		  
		  Return fileList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFilterAll() As string
		  Return FilterAll
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFilterMain() As string
		  Return FilterMain
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFolders(popup As PopupMenu = Nil) As String()
		  Dim temp() As String
		  
		  #If TargetWin32
		    temp = GetFoldersWin()
		  #elseIf TargetMacOS
		    temp = GetFoldersMac()
		  #else
		    temp = GetFoldersGeneric(Folder)
		  #endif
		  
		  temp.Sort
		  
		  If popup <> Nil Then
		    popup.DeleteAllRows
		    popup.AddRow FilterAll
		    popup.AddRow FilterMain
		    For Each s As String In Temp
		      popup.AddRow s
		    Next
		  Else
		    temp.Insert 0, FilterMain
		  End If
		  
		  Return temp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFoldersGeneric(f As FolderItem, toplevel As Boolean = True) As String()
		  Dim childNames() As String
		  Dim temp() As String
		  Dim i As Integer
		  Dim last As Integer
		  Dim fi As FolderItem
		  
		  last = f.Count
		  For i = 1 To last
		    fi = f.Item(i)
		    If fi.Directory Then
		      If toplevel Then
		        childNames.Append fi.Name
		      Else
		        childNames.Append f.Name + "/" + fi.Name
		      End If
		      
		      ReDim temp(-1)
		      temp = GetFoldersGeneric(fi, False)
		      
		      For Each s As String in temp
		        If toplevel Then
		          childNames.Append s
		        Else
		          childNames.Append f.Name + "/" + s
		        End If
		      Next
		    End If
		  Next
		  
		  Return childNames
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFoldersMac() As String()
		  #If Not TargetMacOS
		    Return GetFoldersGeneric(Folder)
		  #endif
		  
		  Dim folderList() As String
		  
		  Dim dirEnum As Cocoa.NSDirectoryEnumerator
		  Dim fm As Cocoa.NSFileManager = Cocoa.NSFileManager.DefaultManager
		  Dim theKeys As NSArray = NSArray.CreateFromArrayOfStrings(Array (NSURL.NSURLIsDirectoryKey))
		  Dim enumOptions As Integer
		  
		  enumOptions = NSFileManager.NSDirectoryEnumerationSkipsHiddenFiles + _
		  NSFileManager.NSDirectoryEnumerationSkipsPackageDescendants
		  
		  dirEnum = fm.EnumeratorAtURL(Folder.URLPath, theKeys, enumOptions)
		  
		  Dim fileURL As Cocoa.NSURL
		  Dim fileParts() As String
		  
		  fileURL = dirEnum.NextURL
		  Dim p1, p2, p4 As String
		  p2 = Folder.NativePath
		  While fileURL <> Nil
		    If fileURL.IsDirectory Then
		      fileParts = fileurl.PathComponents
		      p1 = fileURL.Path
		      p4 = Right(p1, p1.Len - P2.Len - 1)
		      folderList.Append p4
		    End If
		    fileURL = dirEnum.NextURL
		  Wend
		  
		  Return folderList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFoldersWin() As String()
		  #If Not TargetWin32
		    Return GetFoldersGeneric(Folder)
		  #EndIf
		  
		  Dim fileDict() As Dictionary
		  win32GetFolderList(fileDict, Folder.NativePath, "", "*.*", True)
		  
		  Dim ret() As String
		  
		  For Each d As Dictionary In fileDict
		    ret.Append(ReplaceAll((d.Value("Path") + d.Value("Name")), "\", "/"))
		  Next
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRootFolder() As FolderItem
		  //++
		  // Returns a FolderItem pointing to the top folder in the FolderDB object
		  //
		  // This is what was passed to the Constructor
		  //--
		  
		  Return Folder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(folder As FolderItem)
		  Me.Folder = folder
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveFile(path As String, destFolder As String) As Boolean
		  Dim i As Integer
		  Dim f, fo As FolderItem
		  
		  destFolder = CleanPath(destFolder)
		  path = CleanPath(path)
		  
		  fo = FileUtils.RelativePathToFolderItem(Folder, destFolder)
		  If fo = Nil Or Not fo.Exists Then
		    ErrorCode = 6
		    ErrorString = "Could not find folder."
		    Return False
		  End If
		  
		  If Not fo.Directory Then
		    ErrorCode = 6
		    ErrorString = "Destination folder is a regular file."
		    Return False
		  End If
		  i = 1
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  If f = Nil Or Not f.Exists Then
		    ErrorCode = 8
		    ErrorString = "Could not find file."
		    Return False
		  End If
		  
		  f.MoveFileTo fo
		  
		  If f.LastErrorCode <> 0 Then
		    If f.Exists And fo.Exists Then // File with that name already in destination folder
		      ErrorCode = 13
		      ErrorString = "Destination file exists."
		    Else
		      ErrorCode = 12
		      ErrorString = "Could not move file."
		    End If
		    Return False
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefreshCache() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenameFile(path As String, newName As String) As Boolean
		  Dim f As FolderItem
		  Dim g As FolderItem
		  
		  path = CleanPath(path)
		  // Check for a path character in the new string.
		  If Instr(newName, "/") > 0 Or Instr(newName, ":") > 0 Or Instr(newName, "\") > 0 Then
		    ErrorCode = 15
		    ErrorString = App.T.Translate("errors/no_path_allowed")
		    Return False
		  End If
		  If newName.IsEmpty Or CleanPath(newName) <> newName Then
		    ErrorCode = 14
		    ErrorString = App.T.Translate("errors/bad_file_name", newName)
		    Return False
		  End If
		  
		  f = FileUtils.RelativePathToFolderItem(Folder, path)
		  If f = Nil Or Not f.Exists Then
		    ErrorCode = 10
		    ErrorString = "Source for rename does not exist"
		    Return False
		  End If
		  
		  g = f.Parent.Child(newName)
		  
		  If g.Exists Then
		    ErrorCode = 3
		    ErrorString = App.T.Translate("errors/already_exists", newName)
		    Return False
		  End If
		  
		  f.Name = newName
		  If f.Name <> newName Then
		    ErrorCode = 10
		    ErrorString = App.T.Translate("errors/rename_error")
		    Return False
		  End If
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Save() As Boolean
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBuiltinFilters(filterAll As String, filterMain As String)
		  Me.FilterAll = filterAll
		  Me.FilterMain = filterMain
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UIPath(path As String) As String
		  // prepares a FolderDB path for display to the user
		  // expects path to be folders only
		  
		  Dim uiPath As String
		  
		  uiPath = CleanPath(path)
		  If uiPath = "" Then
		    uiPath = GetFilterMain
		  End If
		  Return uiPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub win32GetFileList(ByRef FileList() as dictionary, path as String, relativepath as String, filter as String, recursive as boolean = false)
		  #If TargetWin32
		    // This function is based on a function by Aaron Ballman ...
		    //      http://forums.realbasic.com/viewtopic.php?t=13692
		    
		    // Parameters: FileList() is an array that gets passed in
		    //                      path is the path to search
		    //                      relativepath is the subfolder path  (used internally for recursion)
		    //                      filter is the file filter e.g. *.*
		    //                      recursive (true / false)
		    
		    // Returns: dictionary array with the following values:
		    //                        Path (Relative), Name, Size (bytes),
		    //                        ModifiedDate, CreatedDate, AccessedDate,
		    //                        Hidden, System, Folder, ReadOnly
		    
		    Soft Declare Function FindFirstFileW Lib "Kernel32" ( path as WString, data as Ptr ) as Integer
		    Soft Declare Function FindNextFileW Lib "Kernel32" ( handle as Integer, data as Ptr ) as Boolean
		    Soft Declare Function FileTimeToLocalFileTime Lib "Kernel32" ( filetime as Ptr,localfiletime as Ptr) as Integer
		    Soft Declare Function FileTimeToSystemTime Lib "Kernel32" ( filetime as Ptr,systemtime as Ptr) as Integer
		    
		    Declare Sub FindClose Lib "Kernel32" ( handle as Integer )
		    
		    dim temp as Dictionary
		    dim handle, result as Integer
		    dim tempdate as Date
		    
		    dim data,tempft,templt,tempst as MemoryBlock
		    
		    data = new MemoryBlock( 592 )
		    tempft = new MemoryBlock(8)  // FileTime Holder
		    templt = new MemoryBlock(8) // FileLocalTime Holder
		    tempst = new MemoryBlock(16) // SystemTime Holder
		    
		    dim maxdword,tempattr as Uint64
		    maxdword = 4294967296
		    
		    if right(path,1) <> "\" then
		      path = path + "\"
		    end if
		    
		    handle = FindFirstFileW( path + filter, data )
		    
		    if handle <> -1 then
		      // Loop over all of the items in using the handle and the find data
		      dim done as Boolean
		      
		      do
		        // Add the current item
		        temp = new Dictionary
		        temp.value("Name") = data.WString(44)
		        
		        if temp.value("Name") <> "." AND temp.value("Name") <> ".." then
		          
		          temp.value("Path") = relativepath
		          
		          temp.value("Size") = (data.Long(28) * maxdword) + data.Long(32)
		          
		          tempft = data.MidB(4,8)
		          
		          result = FileTimeToLocalFileTime(tempft,templt)
		          result = FileTimeToSystemTime(templt,tempst)
		          
		          tempdate = new Date
		          tempdate.Year = tempst.short(0)
		          tempdate.Month = tempst.short(2)
		          tempdate.Day = tempst.short(6)
		          tempdate.Hour = tempst.short(8)
		          tempdate.Minute = tempst.short(10)
		          tempdate.Second = tempst.short(12)
		          
		          temp.value("CreatedDate") = tempdate
		          
		          tempft = data.MidB(12,8)
		          
		          result = FileTimeToLocalFileTime(tempft,templt)
		          result = FileTimeToSystemTime(templt,tempst)
		          
		          tempdate = new Date
		          tempdate.Year = tempst.short(0)
		          tempdate.Month = tempst.short(2)
		          tempdate.Day = tempst.short(6)
		          tempdate.Hour = tempst.short(8)
		          tempdate.Minute = tempst.short(10)
		          tempdate.Second = tempst.short(12)
		          
		          temp.value("AccessedDate") = tempdate
		          
		          tempft = data.MidB(20,8)
		          
		          result = FileTimeToLocalFileTime(tempft,templt)
		          result = FileTimeToSystemTime(templt,tempst)
		          
		          tempdate = new Date
		          tempdate.Year = tempst.short(0)
		          tempdate.Month = tempst.short(2)
		          tempdate.Day = tempst.short(6)
		          tempdate.Hour = tempst.short(8)
		          tempdate.Minute = tempst.short(10)
		          tempdate.Second = tempst.short(12)
		          
		          temp.value("ModifiedDate") = tempdate
		          
		          tempattr = data.Long(0)
		          
		          if BitCheck(tempattr,1) then
		            temp.value("ReadOnly") = true
		          else
		            temp.value("ReadOnly") = false
		          end if
		          
		          if BitCheck(tempattr,2) then
		            temp.value("Hidden") = true
		          else
		            temp.value("Hidden") = false
		          end if
		          
		          if BitCheck(tempattr,3) then
		            temp.value("System") = true
		          else
		            temp.value("System") = false
		          end if
		          
		          if BitCheck(tempattr,5) then
		            temp.value("Folder") = true
		          else
		            temp.value("Folder") = false
		          end if
		          
		          // Add the current item to our list
		          If Not temp.Value("Hidden").BooleanValue _
		            And Left(temp.Value("Name"), 1) <> "_" _
		            And Left(temp.Value("Name"), 1) <> "." _
		            Then
		            If Not temp.Value("Folder").BooleanValue Then
		              FileList.Append( temp )
		            ElseIf recursive Then
		              win32GetFileList(FileList, path+temp.value("Name")+"\",relativepath+temp.value("Name")+"\",filter,recursive)
		            end if
		          End If
		        end if
		        
		        // Loop to the next item
		        done = FindNextFileW( handle, data )
		        
		      loop until not done
		      
		      FindClose( handle )
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub win32GetFolderList(ByRef FileList() as dictionary, path as String, relativepath as String, filter as String, recursive as boolean = false)
		  #If TargetWin32
		    // This function is based on a function by Aaron Ballman ...
		    //      http://forums.realbasic.com/viewtopic.php?t=13692
		    
		    // Parameters: FileList() is an array that gets passed in
		    //                      path is the path to search
		    //                      relativepath is the subfolder path  (used internally for recursion)
		    //                      filter is the file filter e.g. *.*
		    //                      recursive (true / false)
		    
		    // Returns: dictionary array with the following values:
		    //                        Path (Relative), Name, Size (bytes),
		    //                        ModifiedDate, CreatedDate, AccessedDate,
		    //                        Hidden, System, Folder, ReadOnly
		    
		    Soft Declare Function FindFirstFileW Lib "Kernel32" ( path as WString, data as Ptr ) as Integer
		    Soft Declare Function FindNextFileW Lib "Kernel32" ( handle as Integer, data as Ptr ) as Boolean
		    Soft Declare Function FileTimeToLocalFileTime Lib "Kernel32" ( filetime as Ptr,localfiletime as Ptr) as Integer
		    Soft Declare Function FileTimeToSystemTime Lib "Kernel32" ( filetime as Ptr,systemtime as Ptr) as Integer
		    
		    Declare Sub FindClose Lib "Kernel32" ( handle as Integer )
		    
		    dim temp as Dictionary
		    dim handle, result as Integer
		    dim tempdate as Date
		    
		    dim data,tempft,templt,tempst as MemoryBlock
		    
		    data = new MemoryBlock( 592 )
		    tempft = new MemoryBlock(8)  // FileTime Holder
		    templt = new MemoryBlock(8) // FileLocalTime Holder
		    tempst = new MemoryBlock(16) // SystemTime Holder
		    
		    dim maxdword,tempattr as Uint64
		    maxdword = 4294967296
		    
		    if right(path,1) <> "\" then
		      path = path + "\"
		    end if
		    
		    handle = FindFirstFileW( path + filter, data )
		    
		    if handle <> -1 then
		      // Loop over all of the items in using the handle and the find data
		      dim done as Boolean
		      
		      do
		        // Add the current item
		        temp = new Dictionary
		        temp.value("Name") = data.WString(44)
		        
		        if temp.value("Name") <> "." AND temp.value("Name") <> ".." then
		          
		          temp.value("Path") = relativepath
		          
		          temp.value("Size") = (data.Long(28) * maxdword) + data.Long(32)
		          
		          tempft = data.MidB(4,8)
		          
		          result = FileTimeToLocalFileTime(tempft,templt)
		          result = FileTimeToSystemTime(templt,tempst)
		          
		          tempdate = new Date
		          tempdate.Year = tempst.short(0)
		          tempdate.Month = tempst.short(2)
		          tempdate.Day = tempst.short(6)
		          tempdate.Hour = tempst.short(8)
		          tempdate.Minute = tempst.short(10)
		          tempdate.Second = tempst.short(12)
		          
		          temp.value("CreatedDate") = tempdate
		          
		          tempft = data.MidB(12,8)
		          
		          result = FileTimeToLocalFileTime(tempft,templt)
		          result = FileTimeToSystemTime(templt,tempst)
		          
		          tempdate = new Date
		          tempdate.Year = tempst.short(0)
		          tempdate.Month = tempst.short(2)
		          tempdate.Day = tempst.short(6)
		          tempdate.Hour = tempst.short(8)
		          tempdate.Minute = tempst.short(10)
		          tempdate.Second = tempst.short(12)
		          
		          temp.value("AccessedDate") = tempdate
		          
		          tempft = data.MidB(20,8)
		          
		          result = FileTimeToLocalFileTime(tempft,templt)
		          result = FileTimeToSystemTime(templt,tempst)
		          
		          tempdate = new Date
		          tempdate.Year = tempst.short(0)
		          tempdate.Month = tempst.short(2)
		          tempdate.Day = tempst.short(6)
		          tempdate.Hour = tempst.short(8)
		          tempdate.Minute = tempst.short(10)
		          tempdate.Second = tempst.short(12)
		          
		          temp.value("ModifiedDate") = tempdate
		          
		          tempattr = data.Long(0)
		          
		          if BitCheck(tempattr,1) then
		            temp.value("ReadOnly") = true
		          else
		            temp.value("ReadOnly") = false
		          end if
		          
		          if BitCheck(tempattr,2) then
		            temp.value("Hidden") = true
		          else
		            temp.value("Hidden") = false
		          end if
		          
		          if BitCheck(tempattr,3) then
		            temp.value("System") = true
		          else
		            temp.value("System") = false
		          end if
		          
		          if BitCheck(tempattr,5) then
		            temp.value("Folder") = true
		          else
		            temp.value("Folder") = false
		          end if
		          
		          // only append visible folders
		          If temp.Value("Folder").BooleanValue _
		            And Not temp.Value("Hidden").BooleanValue _
		            And Left(temp.Value("Name"), 1) <> "." _
		            Then
		            // Add the current item to our list
		            FileList.Append( temp )
		            
		            If recursive Then
		              win32GetFolderList(FileList, path+temp.value("Name")+"\",relativepath+temp.value("Name")+"\",filter,recursive)
		            End If
		          End If
		          
		        end if
		        
		        // Loop to the next item
		        done = FindNextFileW( handle, data )
		        
		      loop until not done
		      
		      FindClose( handle )
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Description
		Accesses the songs folder as a go-between
		In this version folder caching has been dropped in favor of target specific function to enumerate the file system objects replacing the FolderItem approach.
		The caching version is available in FolderDBOld
	#tag EndNote

	#tag Note, Name = FolderDB path
		FolderDB uses a target system independent format.
		- the root is located at Self.Folder and is denoted by the empty string ""
		- subfolders are denoted by their name. If more than one level of subfolders 
		  exist, they are separated by "/"
		  Youth
		  Youth/Archive
		- leaf entries are represented just like subfolders
		  How Great Thou Art
		  Youth/Reckless Love
		There is no such thing as a relative path in FolderDB. Any path starts at the 
		root of the FolderDB
		FolderDB paths are case sensitive, even if the underlying filesystem is not.
		
		
		* DBPathFromFolderItem returns the DBPath for a DB entry given as FolderItem
		  in the CellTagFormat (see below). A subfolder has a trailing "/", a file 
		  does not.
		* GetFile returns the FolderItem representing the DB entry given by its DBPath
		
		
		* CleanPath tries its best to make sense of what it is passed and return a path 
		  formatted as specified above.
		* CombinePath joins a folder or a leaf entry name to a path
		
		These functions work without looking at objecs within the FolderDB. They do 
		string processing only.
		
		You should always write clean DBPaths to any external documents (linked songs,
		set items, activity log). But you shoud always sanitize any DBPath you read 
		from an external source.
		
		The folder selected in pop_songs_song_folders is saved to preferences.plist and
		reloaded from there on the next start of OpenSong. It saves the value stored in 
		the control, and attempts to position the control on startup by comparing the 
		stored value to the currently available ones. This is the easyest way to go 
		about it and it is able to distinguish between the filter ( All ), ( Main ) and 
		any subfolder. It failes if the stored folder was deleted, moved, or renamed 
		outside OpenSong, and it failes if the translation of the filter strings has 
		been changed. In these cases the system falls back to filter ( All ). This is 
		deemed acceptable in these improbable cases.
		
		
		* CellTagFormat returns a path in the same format as GetFolders does. Use with 
		  folder only. The format is identical to what CleanPath returns, except it 
		  appends a final path separator to anything but the root folder
		
		* UIPath returns a path in the same format as CleanPath, except it returns 
		  FilterMain i.e. a translated version of ( Main ) for the root folder. It is 
		  handy for messages to the user where an empty path might be confusing.
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected Cache(0) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorString As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected FilterAll As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected FilterMain As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Folder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		NumFiles As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return App.MainPreferences.GetValueB(Prefs.kUseOldFolderDB)
			End Get
		#tag EndGetter
		Protected UsingOldFolderDB As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorCode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
			Name="NumFiles"
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
	#tag EndViewBehavior
End Class
#tag EndClass
