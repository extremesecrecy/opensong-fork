#tag Class
Protected Class RBPrjVaultReader
Inherits RBPrjTextFileReader
Implements RBPrjParsing
	#tag Method, Flags = &h0
		Function CanOpen(f as FolderItem) As Boolean
		  return openSub (f, true)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsParsing(f as FolderItem) As RBPrjParsing
		  call fetchFromPendingVaultFiles (f.Name) // the file has been found already in LocateExternalItem()
		  dim tfr as RBPrjTextFileReader
		  tfr = new RBPrjTextFileReader
		  tfr.firstLineIdentifier = RBPrjVaultWriter.FileFirstLineSuffix1
		  tfr.theExtOrigDir = me.outPrjFile.Parent
		  tfr.simulateHeader = true
		  return tfr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub collectExistingVaultFiles(dir as FolderItem)
		  dim i as Integer
		  dim f as FolderItem
		  
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

	#tag Method, Flags = &h0
		Sub Constructor()
		  // default constructor
		  super.Constructor
		  me.firstLineIdentifier = RBPrjVaultWriter.FileFirstLineSuffix1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function fetchFromPendingVaultFiles(fileName as String) As FolderItem
		  dim i as Integer
		  dim f as FolderItem
		  
		  for i = 0 to Ubound (me.origVaultFiles)
		    f = me.origVaultFiles(i)
		    if fileName = f.Name then
		      me.origVaultFiles.Remove i
		      return f
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateExternalItem(prjItemName as String, fileName as String, kinds() as String, values() as String, ByRef fOut as FolderItem) As Boolean
		  dim f as FolderItem
		  dim relPath, delim, name, tag as String
		  dim id as Integer
		  
		  // We try to locate the item by finding the file that contains the item name
		  // This is not the most proper solution, but it apparently works
		  // The proper way would be to look into each file and retrieve their item name
		  // and match them up that way. (But that would only work for .rbvx files,
		  // not for non-code external items ending in .rbvf)
		  
		  fOut = nil
		  
		  for each f in me.origVaultFiles
		    if RBPrjHelper.SplitVaultFileName (f.Name, name, tag, id) then
		      if name = prjItemName then
		        // found the file in the vault dir
		        fOut = f
		        exit
		      end
		    elseif f.Name = fileName + RBPrjHelper.OtherFileSuffix then
		      // found the file in the vault dir
		      fOut = f
		      exit
		    end
		  next
		  
		  if fOut = nil then
		    // not found in vault dir - search in list of relPaths, as it might be an external file outside the vault
		    for each relPath in me.externalRelPaths
		      delim = Left (relPath,1)
		      name = NthField (relPath, delim, CountFields (relPath, delim))
		      if name = fileName + RBPrjHelper.TextFileSuffix then
		        fOut = me.vaultDir.ResolveRelativePath (relPath, true)
		      end
		    next
		  end
		  
		  return true // even if we've not found it, we want the caller not to try other means of finding the item, hence we must always return true here
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(dir as FolderItem) As Boolean
		  // returns false if there is no valid RB project file in the dir
		  // raises an exception if the dir is not named the way the RBPrjVaultWriter would write into
		  
		  return openSub (dir)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function openSub(dir as FolderItem, testOnly as Boolean = false) As Boolean
		  // returns false if there is no valid RB project file in the dir
		  // raises an exception if the dir is not named the way the RBPrjVaultWriter would write into
		  
		  dim contentsFile as FolderItem
		  dim relPath, name, tag, separator, fileName, s as String
		  dim lineIdx, id as Integer
		  dim currExternals as Boolean
		  
		  me.vaultDir = nil
		  redim me.itemNamesToParse(-1)
		  redim me.itemTagsToParse(-1)
		  redim me.itemIDsToParse(-1)
		  redim me.origVaultFiles(-1)
		  
		  if dir = nil then
		    raiseExc ("no vault directory specified")
		  end
		  
		  if not dir.Directory then
		    // this is not a vault dir
		    return false
		  end
		  
		  // read the "Contents" file
		  
		  contentsFile = dir.TrueChild (RBPrjHelper.PrjMainContents+RBPrjHelper.TextFileSuffix)
		  
		  if not contentsFile.Exists then
		    return false
		  end
		  
		  dim lines() as String
		  dim amount as Integer
		  if testOnly then
		    amount = 1 // read only the first line
		  end
		  RBPrjHelper.ReadLinesFromTextFile contentsFile, lines, amount
		  
		  dim vers as Integer // we do not need to preserve this "Contents" file's version
		  if not checkFirstHdrLine (lines, RBPrjVaultWriter.FileFirstLineSuffix1, vers) then
		    // this is not a valid project item file
		    return false
		  end
		  
		  if testOnly then
		    return true
		  end
		  
		  // read the other header information
		  lineIdx = 1
		  do
		    assert (lineIdx <= Ubound (lines), "file header damaged", contentsFile)
		    s = lines(lineIdx)
		    lineIdx = lineIdx + 1
		    if InStr (s, RBPrjTextFileWriter.FileHdrOrigName) > 0 then
		      fileName = Mid (s, InStr (s, RBPrjTextFileWriter.FileHdrOrigName)+Len(RBPrjTextFileWriter.FileHdrOrigName))
		      me.outPrjFile = dir.Parent.TrueChild (fileName)
		    end
		  loop until InStr (s, RBPrjVaultWriter.FileHdrL4) > 0
		  
		  // now read the items list
		  separator = Mid (s, InStr (s, RBPrjVaultWriter.FileHdrL4)+Len(RBPrjVaultWriter.FileHdrL4))
		  if separator = "" then
		    separator = Chr(9)
		  end
		  do
		    assert (lineIdx <= Ubound (lines), "file header damaged", contentsFile)
		    s = Trim (lines(lineIdx))
		    lineIdx = lineIdx + 1
		    if InStr (s, RBPrjTextFileWriter.FileHdrVaultEnd) > 0 then
		      exit
		    elseif InStr (s, RBPrjVaultWriter.FileHdrL5) > 0 then
		      currExternals = true
		    end
		    assert (Left(s,1) = RBPrjTextFileWriter.CommentPrefix, "items list is defective", contentsFile)
		    s = Mid (s, 2)
		    name = NthField(s, separator, 1)
		    tag = NthField(s, separator, 2)
		    id = Val ("&H"+NthField(s, separator, 3))
		    if currExternals then
		      relPath = NthField(s, separator, 4)
		      me.externalRelPaths.Append relPath
		    else
		      me.itemNamesToParse.Append name
		      me.itemTagsToParse.Append tag
		      me.itemIDsToParse.Append id
		    end
		  loop
		  redim lines(-1)
		  
		  // make sure the vault dir has the correct name
		  s = RBPrjHelper.MakeVaultDirName (me.outPrjFile.Name, false)
		  if s <> dir.Name then
		    raiseExc ("The vault dir must be named """+s+"""", dir)
		  end
		  
		  collectExistingVaultFiles dir
		  call fetchFromPendingVaultFiles (contentsFile.Name)
		  
		  me.vaultDir = dir
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrigPrjFile() As FolderItem
		  return me.outPrjFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(processor as RBPrjProcessing, results as RBPrjParseResults, externalsHandling as Integer, parseOpts as RBPrjItemsTreeParseOptions)
		  assert (parseOpts = nil, "'options' can only be used with RBPrjItemsTree.Parse")
		  assert (results <> nil, "'results' argument must not be 'nil'")
		  assert (externalsHandling = RBPrjSupport.IgnoreExternals, "Use 'RBPrjExternalsIncluder' to handle externals!")
		  
		  me.simulateHeader = true // actually, it should be "super.simulateHeader", but this does not work, strangely
		  me.theOrigFile = me.outPrjFile // actually, it should be "super.theOrigFile", but this does not work, strangely
		  
		  me.results = results
		  sendProgress (0)
		  me.parseAllFiles processor
		  sendProgress (-1)
		  me.results = nil
		  
		Exception exc
		  me.results = nil
		  sendProgress (-1)
		  raise exc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseAllFiles(processor as RBPrjProcessing)
		  // read each rbvx file and parse it (they are already in the right order, with the "Proj" item coming first)
		  dim f, filesToParse() as FolderItem
		  dim i as Integer
		  dim name, namesToParse(), lines() as String
		  
		  // first, fetch all the main items from the file list, leaving the rest for externals lookup
		  for i = 0 to Ubound (me.itemNamesToParse)
		    name = RBPrjHelper.MakeVaultFileName (me.itemNamesToParse(i), me.itemTagsToParse(i), me.itemIDsToParse(i), false, nil)
		    filesToParse.Append fetchFromPendingVaultFiles (name)
		    namesToParse.Append name
		  next
		  for i = 0 to Ubound (filesToParse)
		    f = filesToParse(i)
		    if f <> nil then
		      // read the file
		      RBPrjHelper.ReadLinesFromTextFile f, lines
		      setInput (lines, f, RBPrjVaultWriter.FileFirstLineSuffix1)
		      parseFile processor
		      redim lines(-1)
		    else
		      results.AppendErrMsg "Vault file """+namesToParse(i)+""" can not be found"
		    end
		  next
		  
		  processor.ProcessFinished()
		  
		  for i = 0 to Ubound(me.origVaultFiles)
		    results.AppendWarnMsg "Vault file """+me.origVaultFiles(i).Name+""" is not part of the project"
		  next
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		// Reads and parses .rbvx ("REALbasic vault export") files inside .rbvault folders as they're created by RBPrjVaultWriter
	#tag EndNote


	#tag Property, Flags = &h21
		Private externalRelPaths() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private fileCheckData As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private itemIDsToParse() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private itemNamesToParse() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private itemTagsToParse() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private origVaultFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private outPrjFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private vaultDir As FolderItem
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
End Class
#tag EndClass
