#tag Module
Protected Module RelativePath
	#tag Method, Flags = &h0
		Function CreateRelativePath(extends fromFile as FolderItem, toFile as FolderItem, pathSeparator as String = "") As String
		  // a path separator will be automatically determined from the file and dir names involved, with the passed one preferred
		  
		  if not fromFile.Directory then
		    fromFile = fromFile.Parent
		  end if
		  
		  // Get a list of path parts by looping until the parent is nil.
		  dim tmpf as FolderItem
		  dim fromPathParts() as String
		  dim toPathParts() as String
		  
		  tmpf = fromFile
		  while tmpf <> nil
		    fromPathParts.Append tmpf.Name
		    tmpf = tmpf.Parent
		  wend
		  
		  tmpf = toFile
		  while tmpf <> nil
		    toPathParts.Append tmpf.Name
		    tmpf = tmpf.Parent
		  wend
		  
		  // If the top-level items don't match, we're on different volumes, and that ain't going to work
		  if fromPathParts( ubound( fromPathParts ) ) <> toPathParts( ubound( toPathParts ) ) then
		    return ""
		  end if
		  
		  // Now, remove each of the common items from the tops of both arrays.
		  while ubound( fromPathParts ) >= 0 and ubound( toPathParts ) >= 0 _
		    and fromPathParts( ubound( fromPathParts ) ) = toPathParts( UBound( toPathParts ) )
		    fromPathParts.Remove( UBound( fromPathParts ) )
		    toPathParts.Remove( UBound( toPathParts ) )
		  wend
		  
		  // Now, for every "from" path part that's remaining, it's one level we must go up.
		  
		  dim relativePathParts() as String
		  dim i as integer
		  
		  if UBound( fromPathParts ) < 0 then
		    // Just operate on the current directory
		    // !TT not necessary: relativePathParts.Append kSameDirPath
		  else
		    for i = 0 to UBound( fromPathParts )
		      relativePathParts.Append kUpDirPath
		    next
		  end if
		  
		  // Now that we're up to the same parent folder, we need to traverse down into
		  // each "toPathPart"
		  while UBound( toPathParts ) >= 0
		    relativePathParts.Append toPathParts.Pop
		  wend
		  
		  // determine a safe separator
		  dim path, s, seps() as String
		  seps = Array (pathSeparator, kPathSeparator1, kPathSeparator2, kPathSeparator3)
		  pathSeparator = chr(9) // use this as a last resort
		  path = Join( relativePathParts, "" )
		  for each s in seps
		    if Len(s) > 0 and InStr (path, s) = 0 then
		      pathSeparator = s
		      exit // found one
		    end
		  next
		  
		  // Finally, return the result
		  return pathSeparator + join( relativePathParts, pathSeparator )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DisplayPath(relPath as String) As String
		  dim sep as String
		  
		  sep = "/"
		  if not RBPrjHelper.RunningOnMacOSX then
		    if TargetWin32 then
		      sep = "\"
		    elseif TargetMacOS then
		      sep = ":"
		    end
		  end
		  
		  relPath = ReplaceAll (Mid(relPath,2), Left(relPath,1), sep)
		  
		  return relPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasName(extends f1 as FolderItem, n2 as String) As Boolean
		  // Note: the ConvertEncoding calls are necessary to deal with the possible mix of decomposed
		  // and composed non-ASCII chars
		  return f1.Name.ConvertEncoding(encodings.SystemDefault) = n2.ConvertEncoding(encodings.SystemDefault)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInsideFolder(extends thisItem as FolderItem, insideThisFolder as FolderItem) As Boolean
		  dim f as FolderItem
		  if thisItem <> nil then
		    f = thisItem
		    while f.Parent <> f and f.Parent <> nil
		      f = f.Parent
		      if f.IsSameFolderItem (insideThisFolder) then
		        return true
		      end
		    wend
		  end
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsRelPathLocal(extends fromFile as FolderItem, path as String) As Boolean
		  // returns true if the rel path is not outside the given folder
		  
		  if not fromFile.Directory then
		    fromFile = fromFile.Parent
		  end
		  
		  // Split the path parts and operate on the parts
		  dim pathParts() as String = Split( path, Mid (path, 1, 1) ) // the first char specifies the path separator
		  
		  return pathParts(1) <> kUpDirPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSameFolderItem(extends f1 as FolderItem, f2 as FolderItem) As Boolean
		  // This is not perfect yet! Using hard links on unix/linux or thru separate network mounts,
		  // the same item could be identified but we'd not able to detect it by only comparing
		  // their AbsolutePath values
		  
		  // Note: the ConvertEncoding calls are necessary to deal with the possible mix of decomposed
		  // and composed non-ASCII chars
		  return f1.AbsolutePath.ConvertEncoding(encodings.SystemDefault) = f2.AbsolutePath.ConvertEncoding(encodings.SystemDefault)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResolveRelativePath(extends fromFile as FolderItem, path as String, createFolders as Boolean = false) As FolderItem
		  if not fromFile.Directory then
		    fromFile = fromFile.Parent
		  end
		  
		  // Split the path parts and operate on the parts
		  dim outf as FolderItem = fromFile
		  
		  if Len(path) > 1 then
		    dim pathParts() as String = Split( path, Mid (path, 1, 1) ) // the first char specifies the path separator
		    dim i as integer
		    
		    for i = 1 to UBound( pathParts ) // start with index 1 because the first item is blank because of the added path separator
		      if outf = nil then exit
		      if not outf.Exists then
		        outf.CreateAsFolder
		      end
		      if pathParts(i) = kUpDirPath then
		        outf = outf.Parent
		      elseif pathParts(i) = kSameDirPath then
		        // Nothing, stay the same
		      else
		        outf = outf.Child( pathParts(i) )
		      end if
		    next
		  end
		  
		  return outf
		  
		Exception
		  // happens if the path is invalid
		  return nil
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Provided by Jonathan Johnson:
		
		<http://www.nilobject.com/?p=239>
		
		Changes made by TT:
		
		- the actually used path separator is prepended to the path and used for resolving
		- disabled "relativePathParts.Append kSameDirPath" to avoid paths such as "./file.txt"
		- catches exceptions in ResolveRelativePath and returns nil
		- added DisplayPath()
		- added IsRelPathLocal
		- added createFolders parameter to ResolveRelativePath
	#tag EndNote


	#tag Constant, Name = kPathSeparator1, Type = String, Dynamic = False, Default = \"/", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPathSeparator2, Type = String, Dynamic = False, Default = \"\\", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPathSeparator3, Type = String, Dynamic = False, Default = \":", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSameDirPath, Type = String, Dynamic = False, Default = \".", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUpDirPath, Type = String, Dynamic = False, Default = \"..", Scope = Private
	#tag EndConstant


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
