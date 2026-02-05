#tag Module
Protected Module RBPrjSupport
	#tag Method, Flags = &h1
		Protected Function AreProjectsIdentical(tree1 as RBPrjItemsTree, tree2 as RBPrjItemsTree, ByRef diff1 as RBPrjItem, ByRef diff2 as RBPrjItem) As Boolean
		  // compares the entire prj tree, ignoring differences in group IDs, since they are not significant and may change through the vault
		  // if there's a difference, the affected items are returned in diff1 and diff2
		  
		  diff1 = nil
		  diff2 = nil
		  
		  if tree1 = nil or tree2 = nil then
		    return false
		  end
		  
		  if not tree1.RootItem.Equals (tree2.RootItem, diff1, diff2) then
		    return false
		  end
		  
		  // check external items as well
		  dim i as Integer
		  dim ext1(), ext2() as RBPrjItemsTree
		  ext1 = tree1.Externals()
		  ext2 = tree2.Externals()
		  if Ubound(ext1) <> Ubound(ext2) then
		    return false
		  end
		  for i = 0 to Ubound(ext1)
		    if not ext1(0).RootItem.Equals (ext2(0).RootItem, diff1, diff2) then
		      return false
		    end
		  next
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ConvertToXML(prjFile as FolderItem, ByRef resultsOut as RBPrjParseResults) As XMLDocument
		  dim processor as RBPrjXMLBuilder
		  processor = new RBPrjXMLBuilder ()
		  
		  dim prjItemFiles() as FolderItem
		  resultsOut = ImportProject (NewFileParser (prjFile), prjFile, IncludeExternals, nil, "", processor, prjItemFiles)
		  
		  if resultsOut.HadFatalErrors() then
		    return nil
		  end
		  
		  return processor.AsXML
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateProjectFromVault(prjDir as FolderItem, ByRef resultsOut as RBPrjParseResults) As Boolean
		  dim changed, ok as Boolean
		  dim tree1 as RBPrjItemsTree
		  dim tmpResults as RBPrjParseResults
		  dim prjFiles() as FolderItem
		  
		  resultsOut = new RBPrjParseResults
		  
		  tree1 = ImportFromVault (prjDir, tmpResults)
		  resultsOut.Add tmpResults
		  
		  if tree1 <> nil then
		    prjFiles = tree1.FileRefs
		    
		    VerifyProjectState prjFiles(0), tmpResults, prjDir.Child (RBPrjHelper.ProjectStateFileName), changed
		    resultsOut.Add tmpResults
		    
		    if not resultsOut.HadFatalErrors then
		      if Right (prjFiles(0).Name, 4) = ".xml" then
		        ok = ExportToXMLFile (tree1, tmpResults)
		      else
		        ok = ExportToBinaryFile (tree1, tmpResults)
		      end
		      resultsOut.Add tmpResults
		      
		      SaveProjectState tree1.FileRefs, prjDir.Child (RBPrjHelper.ProjectStateFileName), true
		    end
		  end
		  
		  return not resultsOut.HadFatalErrors
		  
		Exception exc
		  dim msg as String
		  if exc isA RBPrjException then
		    msg = RBPrjException(exc).Message
		  end
		  if msg = "" then
		    msg = "An exception occured inside CreateProjectFromVault"
		  end
		  resultsOut.AppendErrMsg msg
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExportProject(prj as RBPrjItemsTree, processor as RBPrjProcessing, parseOpts as RBPrjItemsTreeParseOptions = nil) As RBPrjParseResults
		  dim results as RBPrjParseResults
		  
		  results = new RBPrjParseResults (nil)
		  
		  // process the project
		  try
		    prj.Parse (processor, results, SeparateExternals, parseOpts)
		  catch exc
		    reportException results, exc, "Export"
		  end
		  
		  return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExportToBinaryFile(prj as RBPrjItemsTree, ByRef resultsOut as RBPrjParseResults, forcedFolder as FolderItem = nil, fileSuffix as String = "") As Boolean
		  resultsOut = ExportProject (prj, new RBPrjBinaryFileWriter (forcedFolder, fileSuffix))
		  return not resultsOut.HadFatalErrors()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExportToTextFile(prj as RBPrjItemsTree, ByRef resultsOut as RBPrjParseResults, outFile as FolderItem, suppressGrpIDs as Boolean, everythingOrdered as Boolean, optimizedFormat as Boolean) As Boolean
		  dim processor as RBPrjTextFileWriter
		  processor = new RBPrjTextFileWriter (nil, suppressGrpIDs, optimizedFormat, everythingOrdered and optimizedFormat)
		  processor.SetOutputFile outFile
		  
		  dim parseOpts as RBPrjItemsTreeParseOptions
		  if everythingOrdered then
		    parseOpts = new RBPrjItemsTreeParseOptions (RBPrjItemsTreeParseOptions.OptimizeAll)
		  end
		  
		  resultsOut = ExportProject (prj, processor, parseOpts)
		  
		  return not resultsOut.HadFatalErrors()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExportToVault(prj as RBPrjItemsTree, ByRef resultsOut as RBPrjParseResults, placeExternalsIntoMainVault as Boolean, adoptProjectFolderHierarchy as Boolean, includeAllExternals as Boolean, ByRef vaultDirOut as FolderItem) As Boolean
		  dim processor as RBPrjVaultWriter
		  processor = new RBPrjVaultWriter (placeExternalsIntoMainVault, adoptProjectFolderHierarchy, includeAllExternals)
		  
		  resultsOut = ExportProject (prj, processor, new RBPrjItemsTreeParseOptions (RBPrjItemsTreeParseOptions.OptimizeForVault))
		  vaultDirOut = processor.VaultDir
		  
		  if not resultsOut.HadFatalErrors() then
		    if vaultDirOut = nil or not vaultDirOut.Exists then
		      resultsOut.AppendErrMsg "vaultDir not present"
		    end
		  end
		  
		  return not resultsOut.HadFatalErrors()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExportToXMLFile(prj as RBPrjItemsTree, ByRef resultsOut as RBPrjParseResults) As Boolean
		  resultsOut = ExportProject (prj, new RBPrjXMLFileWriter)
		  return not resultsOut.HadFatalErrors()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPrjFileFromVault(vaultDir as FolderItem, ByRef prjFile as FolderItem) As Boolean
		  // Retrieves the FolderItem for the original project file from the vault
		  // Note: The returned prjFile may be nonexisting yet
		  
		  dim rbp as RBPrjVaultReader
		  
		  prjFile = nil
		  rbp = new RBPrjVaultReader
		  try
		    if not rbp.Open (vaultDir) then
		      return false
		    end
		  catch exc1
		    return false
		  end
		  
		  prjFile = rbp.OrigPrjFile
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ImportFromPrjFile(prjFile as FolderItem, ByRef resultsOut as RBPrjParseResults, externalsHandling as Integer, externalsFolder as FolderItem = nil, externalsFileNameSuffix as String = "") As RBPrjItemsTree
		  dim processor as RBPrjItemsTreeBuilder
		  processor = new RBPrjItemsTreeBuilder ()
		  
		  dim prjItemFiles() as FolderItem
		  resultsOut = ImportProject (NewFileParser (prjFile), prjFile, externalsHandling, externalsFolder, externalsFileNameSuffix, processor, prjItemFiles)
		  
		  if resultsOut.HadFatalErrors() then
		    return nil
		  end
		  
		  return processor.ItemsTree
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ImportFromVault(vaultDir as FolderItem, ByRef resultsOut as RBPrjParseResults) As RBPrjItemsTree
		  dim dirName as String
		  dim processor as new RBPrjItemsTreeBuilder ()
		  dim prjItemFiles() as FolderItem
		  
		  resultsOut = ImportProject (new RBPrjVaultReader, vaultDir, SeparateExternals, nil, "", processor, prjItemFiles)
		  
		  if vaultDir <> nil then
		    dirName = vaultDir.Name
		  end
		  
		  if resultsOut.HadFatalErrors() then
		    return nil
		  end
		  
		  return processor.ItemsTree()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ImportProject(rbp as RBPrjParsing, prjFile as FolderItem, externalsHandling as Integer, externalsFolder as FolderItem, externalsFileNameSuffix as String, processor as RBPrjProcessing, ByRef prjFiles() as FolderItem, options as RBPrjItemsTreeParseOptions = nil) As RBPrjParseResults
		  // This method parses the given project file with the provided importer and optionally includes external items.
		  // If an external item can't be found, the user will be asked to locate it via a dialog
		  
		  dim noFiles() as FolderItem
		  prjFiles = noFiles
		  
		  dim results as RBPrjParseResults
		  results = new RBPrjParseResults (nil)
		  
		  // open the main prj file to see if it's valid
		  try
		    if not rbp.Open (prjFile) then
		      if rbp isA RBPrjVaultReader then
		        results.AppendErrMsg("This is not a valid project vault directory: "+prjFile.Name,0)
		      elseif rbp isA RBPrjTextFileReader then
		        results.AppendErrMsg("This is not a valid textual project file: "+prjFile.Name,0)
		      elseif rbp isA RBPrjXMLFileReader then
		        results.AppendErrMsg("This is not a valid XML project file: "+prjFile.Name,0)
		      elseif rbp isA RBPrjBinaryFileReader then
		        results.AppendErrMsg("This is not a valid binary project file: "+prjFile.Name,0)
		      elseif rbp isA RBPrjFileReader then
		        results.AppendErrMsg("This is not a valid project file: "+prjFile.Name,0)
		      else
		        RBPrjHelper.RaiseExc ("unknown 'rbp' type", "ImportProject")
		      end
		      return results
		    end
		  catch exc1
		    reportException results, exc1, "Open"
		    return results
		  end
		  
		  // optionally add a processor to include external files
		  dim extLocator as RBPrjFileLocator
		  if externalsHandling <> IgnoreExternals then
		    if not rbp.CanParseExternals() then
		      // use RBPrjExternalsIncluder as a helper
		      if processor = nil then
		        // meaning we only want to retrieve the list of external file references
		      elseif externalsFolder <> nil then
		        extLocator = new RBPrjFileLocator (externalsFolder, true, false, externalsFileNameSuffix)
		      elseif prjFile <> nil then
		        extLocator = new RBPrjFileLocator (prjFile.Parent, false, true, externalsFileNameSuffix)
		      else
		        // that's valid when called from NewItemsTree()
		      end
		      processor = new RBPrjExternalsIncluder (processor, rbp, externalsHandling = IncludeExternals, externalsHandling = IncludeExternals, extLocator)
		      externalsHandling = IgnoreExternals
		    end
		  end
		  
		  // parse the project file
		  try
		    rbp.Parse (processor, results, externalsHandling, options)
		  catch exc2
		    reportException results, exc2, "Import"
		  end
		  
		  if processor isA RBPrjExternalsIncluder then
		    prjFiles = RBPrjExternalsIncluder(processor).ExternalProjectFiles ()
		  end
		  prjFiles.Insert 0, prjFile
		  
		  return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsExportToVaultPending(vaultDir as FolderItem, ByRef resultsOut as RBPrjParseResults) As Boolean
		  dim prjFile as FolderItem
		  
		  resultsOut = new RBPrjParseResults (nil)
		  
		  if not GetPrjFileFromVault (vaultDir, prjFile) then
		    resultsOut.AppendErrMsg "Vault dir not valid: " + RBPrjHelper.DisplayPath (vaultDir)
		    return false
		  end
		  
		  dim changed as Boolean
		  VerifyProjectState prjFile, resultsOut, vaultDir.Child (RBPrjHelper.ProjectStateFileName), changed
		  
		  return changed
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsRBPrjFile(f as FolderItem) As Boolean
		  dim rbp as new RBPrjFileReader
		  return rbp.CanOpen (f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsRBPrjVault(dir as FolderItem, ByRef prjFile as FolderItem) As Boolean
		  dim rbp as new RBPrjVaultReader
		  dim ok as Boolean
		  prjFile = nil
		  ok = rbp.Open (dir)
		  if ok then
		    prjFile = rbp.OrigPrjFile()
		  end
		  return ok
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NewFileParser(f as FolderItem) As RBPrjParsing
		  // returns a fitting parser for the given project file
		  
		  dim parser as RBPrjParsing
		  
		  if f.Exists then
		    
		    parser = new RBPrjBinaryFileReader
		    if parser.CanOpen (f) then
		      return parser
		    end
		    
		    parser = new RBPrjXMLFileReader
		    if parser.CanOpen (f) then
		      return parser
		    end
		    
		    parser = new RBPrjTextFileReader
		    if parser.CanOpen (f) then
		      return parser
		    end
		    
		    parser = new RBPrjVaultReader
		    if parser.CanOpen (f) then
		      return parser
		    end
		    
		  end
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NewFileWriter(outFile as FolderItem, parent as RBPrjProcessing) As RBPrjProcessing
		  // ### not working yet
		  'dim p as RBPrjProcessing
		  'if Right (outFile.Name, 4) = ".xml" then
		  'p = new RBPrjXMLFileWriter ()
		  'RBPrjXMLFileWriter (p).SetParent parent
		  ''elseif Right (outFile.Name, Len(RBPrjHelper.TextFileSuffix)) = RBPrjHelper.TextFileSuffix then
		  ''p = new RBPrjTextFileWriter (nil, false, false, false)
		  'else
		  'p = new RBPrjBinaryFileWriter (parent, me.forcedFolder, me.addedSuffix)
		  'RBPrjBinaryFileWriter (p).SetParent parent
		  'end
		  'return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NewItemsTree(tree as RBPrjItemsTree, ByRef resultsOut as RBPrjParseResults, options as RBPrjItemsTreeParseOptions) As RBPrjItemsTree
		  // creates a copy of the tree with the given options
		  
		  dim processor as RBPrjItemsTreeBuilder
		  processor = new RBPrjItemsTreeBuilder ()
		  
		  dim prjItemFiles() as FolderItem
		  resultsOut = ImportProject (tree, nil, SeparateExternals, nil, "", processor, prjItemFiles, options)
		  
		  if resultsOut.HadFatalErrors() then
		    return nil
		  end
		  
		  return processor.ItemsTree
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub reportException(results as RBPrjParseResults, exc as RuntimeException, what as String)
		  if exc.Message <> "" then
		    results.AppendErrMsg(what + " failed: " + exc.Message,0)
		  else
		    results.AppendErrMsg(what + " failed because of an unexpected exception",0)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RetrieveListOfProjectFiles(prjFile as FolderItem, ByRef resultsOut as RBPrjParseResults, ByRef prjItemFiles() as FolderItem) As Boolean
		  try
		    if not prjFile.Exists then
		      resultsOut = new RBPrjParseResults
		      resultsOut.AppendErrMsg "File '"+RBPrjHelper.DisplayPath (prjFile)+"' does not exist"
		    else
		      resultsOut = ImportProject (NewFileParser (prjFile), prjFile, IncludeExternals, nil, "", nil, prjItemFiles)
		    end
		  catch exc
		    reportException resultsOut, exc, "Open"
		  end
		  return not resultsOut.HadFatalErrors
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveProjectState(prjItemFiles() as FolderItem, outputFile as FolderItem, isComplete as Boolean)
		  //
		  // Create the "ProjectState" file (a file saving the last state of all processed files)
		  //
		  
		  dim f as FolderItem
		  dim lines() as String
		  dim v as Variant
		  
		  lines.Append "# " + outputFile.Name + " - <" + RBPrjSupport.ReferenceWebsite + ">"
		  lines.Append "# Attention: Do not edit this file and do not check it into a repository either!"
		  lines.Append "# The purpose of this file is to record the last modification time of your local project file"
		  lines.Append "#"
		  lines.Append "<ProjectState>"
		  if not isComplete then
		    lines.Append "Incomplete"
		  else
		    for each f in prjItemFiles
		      v = f.ModificationDate.TotalSeconds
		      lines.Append "FileName_ModDate_RelPath" + chr(9) + ReplaceAll (f.Name, chr(9), " ") + chr(9) + _
		      ReplaceAll (v, chr(9), " ") + chr(9) + prjItemFiles(0).CreateRelativePath (f)
		    next
		  end
		  lines.Append "</ProjectState>"
		  RBPrjHelper.WriteTextFileFromLines outputFile, lines
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveProjectState(prjFile as FolderItem, ByRef resultsOut as RBPrjParseResults, outputFile as FolderItem, isComplete as Boolean)
		  //
		  // Create the "ProjectState" file (a file saving the last state of all processed files)
		  //
		  
		  dim prjItemFiles() as FolderItem
		  if RetrieveListOfProjectFiles (prjFile, resultsOut, prjItemFiles) then
		    SaveProjectState prjItemFiles, outputFile, isComplete
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowParseResults(results as RBPrjParseResults, where as String)
		  #if TargetHasGUI
		    
		    dim w as new ParseResultsWin
		    w.ShowResults results, where
		    
		  #else
		    
		    dim s as String
		    
		    if Ubound(results.errMsgs) >= 0 then
		      #if TargetHasGUI
		        MsgBox "The following ERRORS occured ("+where+"):"+EndOfLine+EndOfLine+Join(results.errMsgs,EndOfLine)
		      #else
		        StdErr.WriteLine "The following ERRORS occured ("+where+"):"
		        for each s in results.errMsgs
		          StdErr.WriteLine "- " + s
		        next
		      #endif
		    end
		    
		    if results.hadEncryptedItems then
		      results.warnMsgs.Insert 0, "Project contains encrypted items"
		    end
		    
		    if Ubound(results.warnMsgs) >= 0 then
		      #if TargetHasGUI
		        MsgBox "The following warnings were reported ("+where+"):"+EndOfLine+EndOfLine+Join(results.warnMsgs,EndOfLine)
		      #else
		        StdErr.WriteLine "The following warnings were reported ("+where+"):"
		        for each s in results.warnMsgs
		          StdErr.WriteLine "- " + s
		        next
		      #endif
		    end
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub VerifyProjectState(prjFile as FolderItem, ByRef resultsOut as RBPrjParseResults, stateFile as FolderItem, ByRef hasChanged as Boolean)
		  //
		  // Checks the "ProjectState" file (a file saving the last state of all processed files)
		  // If a file has been modified, the results add an error about it.
		  //
		  
		  dim prjItemFiles(), stateFiles(), f as FolderItem
		  dim reportedPaths(), lines(), line as String
		  dim scanNow as Boolean
		  dim dict as Dictionary
		  dim dbl as Double
		  dim v as Variant
		  
		  hasChanged = false
		  
		  if prjFile = nil or prjFile.Exists and not RetrieveListOfProjectFiles (prjFile, resultsOut, prjItemFiles) then
		    // well, not all is fine - let the caller figure it out by checking the resultsOut contents
		    return
		  end
		  
		  if stateFile.Exists then
		    RBPrjHelper.ReadLinesFromTextFile stateFile, lines
		    dict = new Dictionary
		    for each line in lines
		      if line = "<ProjectState>" then
		        scanNow = true
		      elseif line = "</ProjectState>" then
		        exit
		      elseif scanNow then
		        if NthField (line, chr(9), 1) = "Incomplete" then
		          resultsOut.AppendErrMsg "Vault has incomplete state (must Export to Vault to fix this)"
		        elseif CountFields (line, chr(9)) = 3 and NthField (line, chr(9), 1) = "FileName_ModDate" then
		          v = Val (NthField (line, chr(9), 3))
		          dict.Value (NthField (line, chr(9), 2)) = v
		        elseif CountFields (line, chr(9)) = 4 and NthField (line, chr(9), 1) = "FileName_ModDate_RelPath" then
		          v = Val (NthField (line, chr(9), 3))
		          dict.Value (NthField (line, chr(9), 2)) = v
		          stateFiles.Append prjFile.ResolveRelativePath (NthField (line, chr(9), 4), false)
		        else
		          resultsOut.AppendErrMsg "invalid prj state line in " + RBPrjHelper.DisplayPath (stateFile)
		        end
		      end
		    next
		    
		    // 1.  check the files as identified by the project file (in case it exists)
		    for each f in prjItemFiles
		      if dict.HasKey (f.Name) then
		        dbl = dict.Value (f.Name)
		        if f.Exists and f.ModificationDate.TotalSeconds <> dbl then
		          reportedPaths.Append f.AbsolutePath
		          resultsOut.AppendErrMsg "Import conflict: """+RBPrjHelper.DisplayPath (f)+""" appears to have changed since last export!"
		          hasChanged = true
		        end
		      else
		        // file has vanished - that's ok
		      end
		    next
		    
		    // 2.  check the files as identified by the saved state list in the vault (which is helpful in case only the main prj file is gone but externals still need to be checked)
		    for each f in stateFiles
		      if dict.HasKey (f.Name) then
		        dbl = dict.Value (f.Name)
		        if f.Exists and f.ModificationDate.TotalSeconds <> dbl then
		          if reportedPaths.IndexOf (f.AbsolutePath) < 0 then
		            reportedPaths.Append f.AbsolutePath
		            resultsOut.AppendErrMsg "Import conflict: """+RBPrjHelper.DisplayPath (f)+""" appears to have changed since last export!"
		            hasChanged = true
		          end
		        end
		      else
		        // file has vanished - that's ok
		      end
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WriteProjectToVault(prjFile as FolderItem, ByRef resultsOut as RBPrjParseResults, placeExternalsIntoMainVault as Boolean, adoptProjectFolderHierarchy as Boolean, includeAllExternals as Boolean) As Boolean
		  dim vaultDir, tmpDir, f1 as FolderItem
		  dim pathName as String
		  dim tmpResults as RBPrjParseResults
		  
		  resultsOut = new RBPrjParseResults
		  
		  RBPrjHelper.Assert (not includeAllExternals, "'includeAllExternals' option not fully supported yet (export works, but import doesn't)", "WriteProjectToVault")
		  
		  prjFile = prjFile.Parent.Child(prjFile.Name) // resolve possible alias (can't allow a vault be located next to an alias of the project)
		  
		  tmpResults = new RBPrjParseResults
		  if prjFile.Directory then
		    tmpResults.AppendErrMsg "Project is not a file but a folder"+RBPrjHelper.DisplayPath (prjFile)
		  else
		    // make sure the vault dir exists - or create it
		    f1 = prjFile
		    vaultDir = f1.Parent.TrueChild(RBPrjHelper.MakeVaultDirName (f1.Name, false))
		    if not vaultDir.Exists then
		      vaultDir.CreateAsFolder
		      pathName = RBPrjHelper.DisplayPath (vaultDir)
		      if vaultDir.Exists and vaultDir.Directory then
		        tmpResults.AppendWarnMsg "Created vault directory: "+pathName
		      else
		        tmpResults.AppendErrMsg "Failed to create vault directory: "+pathName
		      end
		    end
		  end
		  resultsOut.Add tmpResults
		  
		  dim ok as Boolean
		  dim tree1, tree2 as RBPrjItemsTree
		  dim item1, item2 as RBPrjItem
		  dim bfwr as RBPrjBinaryFileWriter
		  
		  if not resultsOut.HadFatalErrors then
		    
		    // export to vault, then read back from vault and compare to original to make sure the vault files are intact
		    
		    // read the project data into memory
		    tree1 = ImportFromPrjFile (prjFile, tmpResults, SeparateExternals)
		    resultsOut.Add tmpResults
		    if tree1 <> nil then
		      
		      // mark the vault as being incomplete until we're finished without error
		      SaveProjectState tree1.FileRefs, vaultDir.Child (RBPrjHelper.ProjectStateFileName), false
		      
		      // write the data to the vault
		      ok = ExportToVault (tree1, tmpResults, placeExternalsIntoMainVault, adoptProjectFolderHierarchy, includeAllExternals, tmpDir)
		      if not vaultDir.IsSameFolderItem (tmpDir) then
		        tmpResults.AppendErrMsg "'Internal error: VaultDir mismatch"
		        ok = false
		      end
		      resultsOut.Add tmpResults
		      if ok then
		        
		        // vault files were successfully written - now read them back
		        tree2 = ImportFromVault (vaultDir, tmpResults)
		        resultsOut.Add tmpResults
		        if tree2 <> nil then
		          
		          // write new prj files to a temporary folder
		          #if DebugBuild and false
		            tmpDir = DesktopFolder.Child("temp-vault")
		          #else
		            tmpDir = SpecialFolder.Temporary
		          #endif
		          if not tmpDir.Exists then
		            tmpDir.CreateAsFolder
		          end
		          bfwr = new RBPrjBinaryFileWriter (tmpDir, "")
		          tmpResults = ExportProject (tree2, bfwr)
		          resultsOut.Add tmpResults
		          ok = not tmpResults.HadFatalErrors
		          
		          if ok then
		            // now compare the recreated project with the original
		            tree1 = NewItemsTree (tree1, tmpResults, new RBPrjItemsTreeParseOptions (RBPrjItemsTreeParseOptions.OptimizeForVault)) // create a tree matching the settings in RBPrjVaultWriter.FileStart
		            tree2 = ImportFromPrjFile (bfwr.LastOutputFile, tmpResults, SeparateExternals, tmpDir)
		            resultsOut.Add tmpResults
		            if AreProjectsIdentical (tree1, tree2, item1, item2) then
		              ok = true
		            else
		              resultsOut.AppendErrMsg "Project verification failed"
		              #if DebugBuild and TargetHasGUI
		                if tree1 <> nil and tree2 <> nil then
		                  dim w1 as new RBPrjItemsWin
		                  dim w2 as new RBPrjItemsWin
		                  w1.ShowTree tree1, "original project", item1
		                  w2.ShowTree tree2, "generated project", item2
		                end
		              #endif
		            end
		          end
		          
		          // delete the files in the temp folder again
		          for each f1 in bfwr.FilesCreated()
		            f1.Delete
		          next
		          
		        end
		        
		      end
		    end
		    
		  end
		  
		  if not resultsOut.HadFatalErrors then
		    SaveProjectState tree1.FileRefs, vaultDir.Child (RBPrjHelper.ProjectStateFileName), true
		    resultsOut.Add tmpResults
		  end
		  
		  return not resultsOut.HadFatalErrors
		  
		Exception exc
		  dim msg as String
		  if exc isA RBPrjException then
		    msg = RBPrjException(exc).Message
		  end
		  if msg = "" then
		    msg = "An exception occured inside WriteProjectToVault"
		  end
		  resultsOut.AppendErrMsg msg
		  return false
		End Function
	#tag EndMethod


	#tag Note, Name = About RBPrjTools
		// Written originally on Nov 11-14, 2005 by Thomas Tempelmann
		//
		// Project homepage: <http://www.tempel.org/RBProjectTools>
		//
		// Consider all this code, being part of the RBPrjTools, freely available for
		// your use in your own projects.
		//
		// Please be kind and contact me if you have made improvements and like to share
		// them with others or if you like to make a commercial product out of it (while
		// you are free to do so, I'd like to know at least).
		//
		// Enjoy!
		// Thomas Tempelmann
	#tag EndNote

	#tag Note, Name = About this module
		// Here you find a few easy-to-use functions.
		//
		// E.g, 'ConvertToXML' reads a binary project file and gives you a XML version of it in return
		// You can call 'IsRBPrjFile' beforehand to see if the file is a binary prj file
	#tag EndNote

	#tag Note, Name = External Project Items
		External Projects Items are classes, modules, windows and other code items that
		you can Export individually as .rbo (or .rbw, .rbm) files to a separate place on your
		disk.
		
		You can use such External Items by dragging them back into your project while
		holding down the Command and Options (Mac) or Control and Alt (PC) keys.
		The such imported item will appear in italics and with a little arrow in its icon
		to tell you that this item is an External Item, meaning that it's not stored inside
		your .rbp file but in a separate file.
		
		The advantage of External Items is that you can share them between several
		projects: If you change the item within one project, it will affect other projects
		using this same item as well, as they all refer to the same file on the disk.
		
		
		Version Control with External Items
		-------------------------------
		
		Now, here comes the tricky part: The Vault Ex/Import feature of these tools can
		also handle external items. But if you'd then try to use them with a version control
		system such as SubVersion or CVS, it gets complicated easily.
		
		Therefore, the following rules are currently applied when you export or import a
		RB project to a so-called "vault" folder for version control:
		
		On Export To Vault:
		- All items of the project, including the external items, will be stored inside the
		   vault folder next to the main project file.
		
		On Import From Vault:
		- If an external item was stored in a folder that is in the same or a deeper folder
		   from there the main project file is located, then it will be restored in the same
		   place (and folders will be recreated as necessary)
		- If an external item was stored in a folder outside of the main project's folder,
		   and if that folder is not accessible, then it will be created in a new folder called
		   "Relocated External Items" next to the main project file.
		
		To learn more, visit this web page:
		
		<http://www.tempel.org/RBProjectTools>
	#tag EndNote

	#tag Note, Name = RB 'Blok' kinds
		Proj: global project settings
		pObj: Class or Module
		pVew: Window
		pMnu: Menubar
		pExt: external RB item (e.g. module, class, etc.)
		pEEx: external RB item, encrypted
		pUIs: editor settings
		pFTy: file type set
		pFol: folder
		pPic: Picture
		pCur: Cursor
		pDBs: data base
		pTxt: generic non-RB item (external file ref)
		pRes: Resources (external file ref)
		pMed: Movie (external file ref)
		pScp: Script (external file ref)
		pTbr: Toolbar
		
		### These have not been identified yet:
		
		CFMPlugin   CFM Plugin
		Sound   sound file
		XCMDPlugin   XCMD plugin
	#tag EndNote

	#tag Note, Name = RB 'Tag' Translations
		See the notes in the RBPrjTagTranslator module
	#tag EndNote

	#tag Note, Name = RB Project Format
		RB Project files exist in two formats: XML and Binary
		Both represend the same data structure in two forms.
		The here included "RBPrjTextFileWriter" class writes a 3rd form, which
		is also mainly text based, but more brief than the XML format.
		
		The idea is to use "RBPrjProcessing" as a parser for all 3 formats
		in the same way, so that one can both read and write prj files in
		all these formats and route them all thru the same channel for
		processing.
		
		Information on the project format used to be found at
		<http://www.rbdocs.com/rbprj/rb_project_format>,
		but this page is lost now. There is currently no other page with
		that information, sorry.
	#tag EndNote


	#tag Constant, Name = AppVersion, Type = String, Dynamic = False, Default = \"1.1.7", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = IgnoreExternals, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = IncludeExternals, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ReferenceWebsite, Type = String, Dynamic = False, Default = \"http://www.tempel.org/rb/#prjtool", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SeparateExternals, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
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
