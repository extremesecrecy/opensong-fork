#tag Class
Protected Class RBPrjVaultWriter
Inherits RBPrjTextFileWriter
	#tag Event
		Sub BlockComplete(lines() as String, name as String, tag as String, id as Integer, encrypted as Boolean, blockContainerID as Integer, extFileRef as FolderItem)
		  dim newTxt, relpath as String
		  dim hdrLines() as String
		  dim f as FolderItem
		  
		  if me.outputDir = nil then
		    // means we had an error earlier in FileStart and just ignore everything now
		    return
		  end
		  
		  if me.isExternalItem then
		    me.itemBlockID = id
		    me.itemName = name
		    
		    // determine the item's relative path, and verify it
		    relpath = me.mainWriter.inputFileRef.CreateRelativePath (me.inputFileRef.Parent) // use 'inputFileRef' here, not 'outputFileRef', because the latter may be redirected
		    f = me.mainWriter.inputFileRef.ResolveRelativePath (relpath)
		    if f = nil or not f.IsSameFolderItem (me.inputFileRef.Parent) then
		      // note: path must not contain "":"" in file and folder names because that's used as a path delimiter
		      raiseExc ("Can not create relpath", me.inputFileRef)
		    end
		  elseif extFileRef <> nil then
		    // collect all external file references so that we can optionally write the non-code externals in the end (in FileEnd)
		    me.mainWriter.extFilesPromised.Append extFileRef
		  end
		  
		  // generate the new file
		  hdrLines.Append RBPrjHelper.UTF8BOM + buildFirstHdrLine (FileFirstLineSuffix1)
		  hdrLines.Append me.FileHdrOrigName + me.outputFileRef.Name
		  if relpath <> "" then
		    hdrLines.Append me.FileHdrOrigRelPath + relpath
		  end
		  hdrLines.Append me.FileHdrVaultEnd
		  newTxt = (Join (hdrLines, me.lineDelim) + me.lineDelim) + Join (lines, me.lineDelim) + (me.lineDelim + me.FileLastLine + me.lineDelim)
		  redim lines(-1)
		  
		  me.mainWriter.saveBlock (name, tag, id, newTxt, me.isExternalItem, me.outputDir, blockContainerID, extFileRef, me.inputFileRef)
		End Sub
	#tag EndEvent

	#tag Event
		Sub FileEnd()
		  if me.outputDir = nil then
		    // means we had an error earlier in FileStart and just ignore everything now
		    return
		  end
		  
		  me.mainWriter.RegisterFileState me.outputFileRef, me.itemName, me.itemBlockID
		  
		  if me.isExternalItem then
		    
		    // For external items, neither write the extra file containing the list of prj items (externals always are single prj items)
		    // nor delete the other files (they may be used by other prjs, after all)
		    
		    me.mainWriter.extFilesHandled.Append me.outputFileRef
		    
		  else
		    
		    if me.includeAllExternals then
		      addMissingExternals ()
		    end
		    
		    // We have processed all items of the project - write all the cached data to files now
		    writeProjectFiles (me.adoptProjectFolderHierarchy)
		    
		    // Write the file listing all project items
		    writeContentsFile ()
		    
		    // Cleanup (delete all remaining files in the vault)
		    me.deleteOutdatedVaultFiles ()
		    
		  end
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function FileStart(f as FolderItem, dataRef as RBPrjDataRef) As Boolean
		  dim dir as FolderItem
		  dim prjName as String
		  
		  me.outputFileRef = f
		  me.theData = dataRef
		  
		  me.itemName = f.Name
		  
		  if me.outputDir <> nil then
		    
		    // This external file has already a vault folder assigned
		    // (we're handling an external item that gets put into the main vault)
		    
		    assert (me.isExternalItem, "FileStart", f) // if we want to redirect the main prj files into a different folder, some more changes are necessary
		    
		  else
		    
		    // We're starting on a vault dir (may also be an external item with its own vault dir)
		    // The vault folder is determined by the folder of the input file 'f'
		    
		    redim me.origVaultFiles(-1)
		    if me.isExternalItem then
		      // new in v1.1.4: external items that are not put into the main vault will now be stored right next to
		      //   their original instead of being put into a "Externals" folder.
		      dir = me.outputFileRef.Parent
		    else
		      prjName = RBPrjHelper.MakeVaultDirName (me.outputFileRef.Name, me.isExternalItem)
		      dir = me.outputFileRef.Parent.TrueChild(prjName)
		      if not dir.Exists then
		        reportError "The vault dir is missing: "+RBPrjHelper.DisplayPath (dir)
		        return true // abort for now
		      end
		      if not dir.Directory then
		        raiseExc ("vault is not a dir?!", dir)
		      end
		      me.collectExistingVaultFiles (dir)
		    end
		    
		    me.outputDir = dir
		    
		  end
		  
		  return true
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub addMissingExternals()
		  // copies all items to the vault that were not processed yet (i.e. because they are not code items but resources etc.)
		  
		  dim filesToCopy() as FolderItem
		  
		  // build a list of those files not handled yet
		  filesToCopy = me.extFilesPromised
		  dim f, f2 as FolderItem
		  for each f in me.extFilesHandled
		    for each f2 in me.extFilesPromised
		      if f.IsSameFolderItem (f2) then
		        filesToCopy.Remove filesToCopy.IndexOf (f2)
		        exit
		      end if
		    next
		  next
		  
		  // now add those files to the list that's processed later in writeProjectFiles()
		  dim idx as Integer
		  for each f in filesToCopy
		    idx = prjItemIndex (f)
		    saveBlock ("", "", 0, "", true, me.prjItemDirs(idx), me.prjItemContIDs(idx), f, nil)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  // this overrides the method in RBPrjTextFileWriter
		  
		  dim p as RBPrjVaultWriter
		  p = new RBPrjVaultWriter (me.placeExternalsIntoMainVault, me.adoptProjectFolderHierarchy, me.includeAllExternals)
		  p.isExternalItem = true
		  if me.placeExternalsIntoMainVault then
		    p.outputDir = me.outputDir
		  end
		  p.extParent = me
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub collectExistingVaultFiles(dir as FolderItem)
		  dim i as Integer
		  dim f as FolderItem
		  
		  assert (not me.isExternalItem, "collectExistingPrjFiles", f)
		  
		  for i = 1 to dir.Count
		    f = dir.TrueItem (i)
		    if f <> nil then
		      if Right (f.Name, Len(RBPrjHelper.TextFileSuffix)) = RBPrjHelper.TextFileSuffix then
		        me.origVaultFiles.Append f
		      elseif Right (f.Name, Len(RBPrjHelper.OtherFileSuffix)) = RBPrjHelper.OtherFileSuffix then
		        me.origVaultFiles.Append f
		      elseif f.Directory then
		        collectExistingVaultFiles f
		      end
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // must use the other constructor(s)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(placeExternalsIntoMainVault as Boolean, adoptProjectFolderHierarchy as Boolean, includeAllExternals as Boolean)
		  super.Constructor (nil, true, true, false) // invokes RBPrjTextFileWriter's constructor
		  
		  me.placeExternalsIntoMainVault = placeExternalsIntoMainVault
		  me.adoptProjectFolderHierarchy = adoptProjectFolderHierarchy
		  me.includeAllExternals = includeAllExternals
		  
		  me.fileCheckData = new Dictionary
		  me.lineDelim = EndOfLine
		  #if TargetMacOS
		    if RBPrjHelper.RunningOnMacOSX then
		      me.lineDelim = EndOfLine.Unix // use LFs on Mac OS X so that Apple's FileMerge can be used (it cannot handle CRs as line delims)
		    end
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub deleteOutdatedVaultFiles()
		  dim f as FolderItem
		  
		  assert (not me.isExternalItem, "deleteOutdatedPrjFiles", f)
		  
		  // delete the files that were not rewritten (the others were removed from the list when they were recreated)
		  for each f in me.origVaultFiles
		    RBPrjHelper.DeleteFile f, true
		    if f.Exists then
		      raiseExc ("Can not delete file", f)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalsProcessingFinished()
		  me.extParent = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function mainWriter() As RBPrjVaultWriter
		  if me.extParent <> nil then
		    return me.extParent
		  else
		    return me
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function prjItemIndex(extFile as FolderItem) As Integer
		  dim prjItemIdx as Integer, f as FolderItem
		  for prjItemIdx = 0 to Ubound (prjitemNames)
		    f = me.prjItemExtFiles(prjItemIdx)
		    if f <> nil and f.IsSameFolderItem (extFile) then
		      return prjItemIdx
		    end
		  next
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterFileState(f as FolderItem, itemName as String, itemID as Integer)
		  Assert (not me.isExternalItem, "RegisterState must be called on parent")
		  
		  // This code complements the one in RBPrjVaultReader.CheckFileState
		  
		  dim key as String
		  key = itemName + ":" + Format (itemID, "-#")
		  
		  Assert (not me.fileCheckData.HasKey (key), "RegisterState: Duplicate key")
		  
		  me.fileCheckData.Value (key) = f.ModificationDate.TotalSeconds
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function removeFromOrigVaultFiles(f as FolderItem) As Boolean
		  dim i as Integer
		  dim vwr as RBPrjVaultWriter
		  
		  vwr = me.mainWriter
		  
		  for i = 0 to Ubound (vwr.origVaultFiles)
		    if f.IsSameFolderItem (vwr.origVaultFiles(i)) then
		      vwr.origVaultFiles.Remove i
		      return true
		    end
		  next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub saveBlock(name as String, tag as String, id as Integer, fileData as String, isExternal as Boolean, outDir as FolderItem, contID as Integer, extFileRef as FolderItem, origFileRef as FolderItem)
		  assert (not me.isExternalItem, "saveBlock must be called on parent only")
		  
		  // data for the Contents file (sure, I could place these all into a Class, but I don't want to use more than necessary)
		  prjitemNames.Append name
		  prjitemTags.Append tag
		  prjitemIDs.Append id
		  prjitemDatas.Append fileData
		  prjitemIsExternals.Append isExternal
		  prjitemDirs.Append outDir
		  prjitemContIDs.Append contID
		  prjItemExtFiles.Append extFileRef
		  prjitemOrigFiles.Append origFileRef
		  prjitemWrittenFiles.Append nil // will be updated inside writeProjectFiles
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub updateFile(newTxt as String, srcFileRef as FolderItem, destFileRef as FolderItem, where as String)
		  dim oldTxt as String
		  dim tos as TextOutputStream
		  dim tis as TextInputStream
		  
		  if removeFromOrigVaultFiles (destFileRef) then
		    // old file exists - see if it has not changed - then we keep the old file (and its modification date)
		    if srcFileRef <> nil and LenB(newTxt) = 0 then
		      // check the file differences by comparing their modification date
		      if srcFileRef.ModificationDate.TotalSeconds = destFileRef.ModificationDate.TotalSeconds and srcFileRef.Length = destFileRef.Length then
		        // they appear to be identical - do not write new file
		        return
		      end
		    else
		      if destFileRef.Length = LenB (newTxt) then
		        tis = TextInputStream.Open (destFileRef)
		        if tis <> nil then
		          oldTxt = tis.ReadAll (nil) // force "nil" encoding
		          tis.Close
		          if StrComp (newTxt, oldTxt, 0) = 0 then
		            // they're identical - do not write new file
		            return
		          end
		          oldTxt = ""
		        end
		      end
		    end
		  elseif destFileRef.Exists then
		    if destFileRef.IsInsideFolder (me.outputDir) then
		      raiseExc (where+" - duplicate file name", destFileRef)
		    else
		      // it's a file outside the vault - we don't protect those yet (that would require more efforts)
		    end
		  end
		  
		  // write the new file
		  RBPrjHelper.DeleteFile destFileRef
		  if srcFileRef <> nil and LenB(newTxt) = 0 then
		    srcFileRef.CopyFileTo destFileRef
		    if srcFileRef.ModificationDate.TotalSeconds <> destFileRef.ModificationDate.TotalSeconds or srcFileRef.Length <> destFileRef.Length then
		      raiseExc ("Can not copy external file to vault", destFileRef)
		    end
		  else
		    tos = TextOutputStream.Create (destFileRef)
		    if tos = nil then
		      raiseExc ("Can not create file in vault", destFileRef)
		    end
		    tos.Write newTxt // use no "WriteLine" here and add no other writing - "newTxt" must be all that gets written
		    tos.Close
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VaultDir() As FolderItem
		  return me.outputDir
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub writeContentsFile()
		  dim i as Integer
		  dim relPath, separator, lines(), name, newTxt as String
		  dim f as FolderItem
		  
		  //
		  // Create the "Contents" file (a file listing all project file items stored in the vault)
		  //
		  
		  separator = Chr(9) // TAB (former use of "/" was not so good because you can use it actually in project folder names)
		  
		  lines.Append RBPrjHelper.UTF8BOM + buildFirstHdrLine (FileFirstLineSuffix1)
		  lines.Append FileHdrOrigName + me.outputFileRef.Name
		  
		  // add the prj items
		  lines.Append me.FileHdrL4 + separator
		  for i = 0 to Ubound(me.prjItemNames)
		    if not me.prjitemIsExternals(i) then
		      lines.Append me.CommentPrefix + me.prjItemNames(i) + separator + me.prjItemTags(i) + separator + RBPrjHelper.Hex8 (me.prjItemIDs(i))
		    end
		  next
		  
		  // add the external files
		  lines.Append me.FileHdrL5 + separator
		  for i = 0 to Ubound(me.prjItemNames)
		    if me.prjitemIsExternals(i) then
		      f = me.prjitemWrittenFiles(i)
		      relpath = me.outputDir.CreateRelativePath (f)
		      lines.Append me.CommentPrefix + me.prjItemNames(i) + separator + me.prjItemTags(i) + separator + RBPrjHelper.Hex8 (me.prjItemIDs(i)) + _
		      separator + relPath
		    end
		  next
		  
		  lines.Append me.FileHdrVaultEnd
		  lines.Append me.FileLastLine
		  newTxt = Join (lines, me.lineDelim) + me.lineDelim
		  redim lines(-1)
		  
		  // write the "Contents" file
		  name = RBPrjHelper.PrjMainContents
		  f = me.outputDir.TrueChild (name + RBPrjHelper.TextFileSuffix)
		  me.updateFile (newTxt, nil, f, "FileEnd contents save")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub writeProjectFiles(adoptProjectFolderHierarchy as Boolean)
		  dim folderNames(), fileName, name, tag as String
		  dim outDir, extFileRef, origFileRef, f as FolderItem
		  dim id, folderIdx, containerID, prjItemIdx as Integer
		  dim isExternal as Boolean
		  
		  for prjItemIdx = 0 to Ubound (prjitemNames)
		    name = prjitemNames(prjItemIdx)
		    tag = prjitemTags(prjItemIdx)
		    id = prjitemIDs(prjItemIdx)
		    isExternal = prjitemIsExternals(prjItemIdx)
		    outDir = prjitemDirs(prjItemIdx)
		    containerID = prjItemContIDs(prjItemIdx)
		    extFileRef = prjItemExtFiles(prjItemIdx)
		    origFileRef = prjItemOrigFiles(prjItemIdx)
		    
		    if tag = "" then
		      // it's a non-code external file
		      fileName = extFileRef.Name + RBPrjHelper.OtherFileSuffix
		    else
		      fileName = RBPrjHelper.MakeVaultFileName (name, tag, id, not me.placeExternalsIntoMainVault and isExternal, origFileRef)
		    end
		    
		    if adoptProjectFolderHierarchy and containerID <> 0 then
		      // this item belongs to a folder
		      redim folderNames(-1)
		      do
		        folderIdx = prjitemIDs.IndexOf (containerID)
		        if folderIdx < 0 then
		          exit
		        end
		        folderNames.Append prjitemNames (folderIdx)
		        containerID = prjItemContIDs (folderIdx)
		      loop until containerID = 0
		      for folderIdx = Ubound (folderNames) downTo 0
		        outDir = outDir.TrueChild (folderNames (folderIdx))
		        if not outDir.Exists then
		          outDir.CreateAsFolder
		        end
		        if not outDir.Directory then
		          reportError "Failed to create folder: "+RBPrjHelper.DisplayPath (outDir)
		        end
		      next
		    end
		    
		    f = outDir.TrueChild (fileName)
		    me.updateFile (prjitemDatas(prjItemIdx), extFileRef, f, "writeProjectFiles")
		    me.prjitemWrittenFiles(prjItemIdx) = f
		  next
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Writes text individual files for each project item (i.e. Block)
		This feature is used for version controlling
		
		There's also some information online about this functionality:
		  <http://www.tempel.org/RBProjectTools>
	#tag EndNote


	#tag Property, Flags = &h21
		Private adoptProjectFolderHierarchy As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private extFilesHandled() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private extFilesPromised() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected extParent As RBPrjVaultWriter
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			// stores a date or checksum for every file of the project
			Key: item name (e.g. file name)
			Value: a Variant containing the file's modification date or a checksum value
		#tag EndNote
		Private fileCheckData As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private includeAllExternals As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected isExternalItem As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private itemBlockID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private itemName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lineDelim As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private origVaultFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected outputDir As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected outputFileRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private placeExternalsIntoMainVault As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjitemContIDs() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjitemDatas() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjitemDirs() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjItemExtFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjitemIDs() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjitemIsExternals() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjitemNames() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjitemOrigFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjItemTags() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjitemWrittenFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theData As RBPrjDataRef
	#tag EndProperty


	#tag Constant, Name = FileFirstLineSuffix1, Type = String, Dynamic = False, Default = \"PrjVaultItem", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileHdrL4, Type = String, Dynamic = False, Default = \"##Project Items:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileHdrL5, Type = String, Dynamic = False, Default = \"##External Files:", Scope = Public
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
End Class
#tag EndClass
