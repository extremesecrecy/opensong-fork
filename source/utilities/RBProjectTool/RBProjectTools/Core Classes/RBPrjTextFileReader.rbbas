#tag Class
Protected Class RBPrjTextFileReader
Implements RBPrjParsing
	#tag Method, Flags = &h1
		Protected Sub assert(condition as Boolean, msg as String, f as FolderItem = nil)
		  if not condition then
		    raiseExc (msg)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanOpen(f as FolderItem) As Boolean
		  return openSub (f, true)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanParseExternals() As Boolean
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function checkFirstHdrLine(lines() as String, sfx1 as String, ByRef version as Integer) As Boolean
		  if lines.Ubound < 0 then
		    return false
		  end
		  
		  dim firstLine as String
		  firstLine = NthField (lines(0), " - ", 1)
		  
		  if InStr (firstLine, RBPrjVaultWriter.FileFirstLinePrefix+sfx1) < 0 then
		    return false
		  end
		  
		  dim s as String
		  s = Trim (NthField (firstLine, RBPrjTextFileWriter.FileFirstLineDelim, 4))
		  if s = "" then
		    version = 0
		  else
		    version = Val (NthField(s,".",1))
		  end
		  
		  dim i as Integer
		  if version < 1 then
		    // update the header lines from old format
		    for i = 1 to Ubound(lines)
		      s = lines(i)
		      if Left (s, 1) <> "#" then
		        exit
		      elseif InStr (s, "##OrigFileName: ") > 0 then
		        lines(i) = Replace (s, "##OrigFileName: ", RBPrjTextFileWriter.FileHdrOrigName)
		      elseif InStr (s, "##OrigRelPath: ") > 0 then
		        lines(i) = Replace (s, "##OrigRelPath: ", RBPrjTextFileWriter.FileHdrOrigRelPath)
		      end
		    next
		  end
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsParsing(f as FolderItem) As RBPrjParsing
		  return RBPrjSupport.NewFileParser (f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  me.firstLineIdentifier = RBPrjTextFileWriter.FileFirstLineSuffix1 // may be overwritten in RBPrjVaultReader's methods
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub determineOrigFileRef()
		  dim dir as FolderItem
		  
		  if me.theExtOrigDir = nil then
		    dir = theInputFile.Parent
		  else
		    // this is an external item
		    dir = me.theExtOrigDir
		    if me.theExtRelPath <> "" then
		      dir = dir.ResolveRelativePath (me.theExtRelPath)
		    end
		    if dir = nil or not dir.Exists then
		      dir = me.theExtOrigDir
		      if dir.IsRelPathLocal (me.theExtRelPath) then
		        // recreate the missing folders
		        dir = dir.ResolveRelativePath (me.theExtRelPath, true)
		      else
		        // place this item into a special folder
		        dir = dir.Child (RelocatedExtItemsDirName)
		        results.AppendWarnMsg "Relative path """+RelativePath.DisplayPath (me.theExtRelPath)+""" for "+me.theFileName+" does not exist - relocated to """+dir.Name+""""
		      end
		      if not dir.Exists then
		        dir.CreateAsFolder
		      end
		    end
		  end
		  
		  me.theOrigFile = dir.TrueChild (me.theFileName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub fetchLine(lines() as String, ByRef lineIdx as Integer, ByRef tag as String, ByRef typeCode as Integer, ByRef value as RBPrjDataRef)
		  dim i, firstSrcLineIdx, insertionIdx, len, ofs as Integer
		  dim typeStr, lastLineHdr, line as String
		  dim grpLines() as String
		  dim mb as MemoryBlock
		  dim isMultiSourceLine as Boolean
		  
		  do
		    do
		      if lineIdx > Ubound(lines) then
		        value = nil
		        tag = ""
		        typeCode = RBPrjItem.TypeEOF
		        return
		      end
		      
		      line = lines(lineIdx)
		      lines(lineIdx) = ""
		      lineIdx = lineIdx + 1
		      
		      ofs = InStr (line, RBPrjTextFileWriter.TypeValueSeparator)
		      if ofs = 0 then
		        assert (Trim(line) = "" or Left(Trim(line), 1) = RBPrjVaultWriter.CommentPrefix, "invalid line")
		      end
		    loop until ofs > 0
		    
		    lastLineHdr = LTrim (Left (line, ofs-1))
		  loop until Left(lastLineHdr, 1) <> RBPrjVaultWriter.CommentPrefix
		  
		  tag = NthField (lastLineHdr, RBPrjTextFileWriter.TagTypeSeparator, 1)
		  typeStr = NthField (lastLineHdr, RBPrjTextFileWriter.TagTypeSeparator, 2)
		  
		  line = Mid (line, ofs+2)
		  
		  select case typeStr // see Note "File Formats" in RBPrjTextFileWriter for explanation on these codes
		    
		  case "S"
		    typeCode = RBPrjItem.TypeString
		    if RBPrjHelper.Equal (typeStr, "s") then
		      // value is base64 encoded
		      line = DecodeBase64 (line)
		    end
		    len = LenB(line)
		    if len > 0 then
		      mb = New MemoryBlock (len)
		      mb.LittleEndian = false
		      mb.StringValue (0, len) = line
		    end
		    
		  case "h" // this does not work: is RBPrjHelper.Equal (typeStr, "h")
		    // value is hex encoded
		    typeCode = RBPrjItem.TypeString
		    line = RBPrjHelper.HexToStr (line)
		    mb = New MemoryBlock (LenB(line))
		    mb.LittleEndian = false
		    mb.StringValue (0, mb.Size) = line
		    
		  case "N"
		    if RBPrjHelper.Equal (typeStr, "N") then // N = Integer
		      typeCode = RBPrjItem.TypeInt
		      mb = New MemoryBlock (4)
		      mb.LittleEndian = false
		      mb.Long(0) = Val(line)
		    Else  // n = Double
		      typeCode = RBPrjItem.TypeDbl
		      mb = New MemoryBlock (8)
		      mb.LittleEndian = false
		      mb.DoubleValue(0) = Val(Line)
		    end if
		    
		  case "G"
		    if RBPrjHelper.Equal (typeStr, "g") then
		      typeCode = RBPrjItem.TypeGroupEnd
		    else
		      typeCode = RBPrjItem.TypeGroup
		    end
		    mb = New MemoryBlock (4)
		    mb.LittleEndian = false
		    mb.Long(0) = Val(line) // gets the group ID, if available
		    
		  case "D"
		    if RBPrjHelper.Equal (typeStr, "d") then
		      isMultiSourceLine = true
		    else
		      assert (Right (RTrim (line), 1) = ")", "missing ')' in 'D' group")
		    end
		    typeCode = RBPrjItem.TypeGroup
		    mb = New MemoryBlock (4)
		    mb.LittleEndian = false
		    mb.Long(0) = Val(line) // gets the group ID, if available
		    // optimized group (all items in one line) -> convert back into separate lines
		    line = RTrim (Mid (line, Instr (line, "(")+1)) // extract text in parentheses
		    if not isMultiSourceLine then
		      line = Left (line, Len(line)-1) // cut off right ")"
		    end
		    grpLines = line.Split (RBPrjTextFileWriter.GroupItemDelimiter)
		    insertionIdx = lineIdx
		    for each line in grpLines
		      if not isMultiSourceLine or Left (line, 4) <> "srbp" then // breakpoint lines, which always come last in grpLines, will be handled further down
		        lines.Insert insertionIdx, line
		        insertionIdx = insertionIdx + 1
		      end
		    next
		    if isMultiSourceLine then
		      // fetch the source lines and add their "srcl/S" header again
		      firstSrcLineIdx = insertionIdx
		      do
		        line = lines(insertionIdx)
		        if Trim (line) = RBPrjTextFileWriter.SourceGroupClosure then
		          lines.Remove insertionIdx
		          exit
		        end
		        lines(insertionIdx) = "srcl" + RBPrjTextFileWriter.TagTypeSeparator + "S" + RBPrjTextFileWriter.TypeValueSeparator + LTrim (line)
		        insertionIdx = insertionIdx + 1
		      loop
		      // now insert the breakpoints
		      i = Ubound(grpLines)
		      while i >= 0 and Left (grpLines(i), 4) = "srbp"
		        lines.Insert firstSrcLineIdx + 1 + Val (NthField (grpLines(i), RBPrjTextFileWriter.TypeValueSeparator, 2)), grpLines(i)
		        insertionIdx = insertionIdx + 1
		        i = i - 1
		      wend
		    end
		    lines.Insert insertionIdx, tag + RBPrjTextFileWriter.TagTypeSeparator + "g" + RBPrjTextFileWriter.TypeValueSeparator + RBPrjHelper.MyStr (mb.Long(0))
		    line = ""
		    
		  case "R"
		    typeCode = RBPrjItem.TypeRect
		    mb = New MemoryBlock (16)
		    mb.LittleEndian = false
		    for i = 1 to 4
		      mb.Long ((i-1)*4) = Val(NthField(line,",",i))
		    next
		    
		  case "e" // this does not work: is RBPrjHelper.Equal (typeStr, "e")
		    typeCode = RBPrjItem.TypeEncrypted
		    line = DecodeBase64 (line)
		    mb = New MemoryBlock (LenB(line))
		    mb.LittleEndian = false
		    mb.StringValue (0, mb.Size) = line
		    
		  case "B"
		    typeCode = RBPrjItem.TypeBlock
		    if RBPrjHelper.Equal (typeStr, "B") then
		      // value is a hex string
		      line = RBPrjHelper.HexToStr (line)
		      mb = New MemoryBlock (LenB(line))
		      mb.LittleEndian = false
		      mb.StringValue (0, mb.Size) = line
		    end
		    
		  case "P"
		    if RBPrjHelper.Equal (typeStr, "P") then
		      // value is a hex string
		      typeCode = RBPrjItem.TypeProject
		      line = RBPrjHelper.HexToStr (line)
		      mb = New MemoryBlock (LenB(line))
		      mb.LittleEndian = false
		      mb.StringValue (0, mb.Size) = line
		    else
		      typeCode = RBPrjItem.TypeEOF
		    end
		    
		  else
		    assert (LenB(line) = 0, "unexpected type: "+lastLineHdr)
		    
		  end
		  
		  value = new RBPrjDataRef (mb)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub fillMemBlk(mb as MemoryBlock, v() as Integer)
		  assert (mb.Size <= 4*(Ubound(v)+1), "fillMemBlk - does not fit")
		  assert (not mb.LittleEndian, "fillMemBlk - must be big endian")
		  
		  dim i as Integer
		  for i = 0 to Ubound(v)
		    mb.Long(i*4) = v(i)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateExternalItem(prjItemName as String, fileName as String, kinds() as String, values() as String, ByRef fOut as FolderItem) As Boolean
		  return false // this parser does let the includer do all the work
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(inputTextFile as FolderItem) As Boolean
		  // Returns false if the passed file is not a valid RB project item file
		  //
		  // In conjunction with RBPrjVaultReader, this function opens all the .rbvx files beside the "Contents" file
		  
		  return openSub (inputTextFile)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function openSub(inputTextFile as FolderItem, testOnly as Boolean = false) As Boolean
		  // Returns false if the passed file is not a valid RB project item file
		  //
		  // In conjunction with RBPrjVaultReader, this function opens all the .rbvx files beside the "Contents" file
		  
		  me.theInputFile = nil
		  
		  if inputTextFile = nil then
		    raiseExc ("no input file specified")
		  end
		  
		  if not inputTextFile.Exists or inputTextFile.Directory or inputTextFile.Alias then
		    // this is not a file
		    return false
		  end
		  
		  // read and verify the header information
		  
		  dim lines() as String
		  dim amount as Integer
		  if testOnly then
		    amount = 1 // read only the first line
		  end
		  RBPrjHelper.ReadLinesFromTextFile inputTextFile, lines, amount
		  
		  if not checkFirstHdrLine (lines, me.firstLineIdentifier, fileVersion) then
		    // this is not a valid project item file
		    return false
		  end
		  
		  if testOnly then
		    return true
		  end
		  
		  // get the original prj file name from the header lines
		  dim lineIdx as Integer
		  dim s as String
		  lineIdx = 1
		  do
		    if lineIdx > Ubound (lines) then
		      s = ""
		    else
		      s = lines(lineIdx)
		      lineIdx = lineIdx + 1
		      if InStr (s, RBPrjTextFileWriter.FileHdrOrigName) > 0 then
		        me.theFileName = Mid (s, InStr (s, RBPrjTextFileWriter.FileHdrOrigName)+Len(RBPrjTextFileWriter.FileHdrOrigName))
		      elseif InStr (s, RBPrjTextFileWriter.FileHdrOrigRelPath) > 0 then
		        me.theExtRelPath = Mid (s, InStr (s, RBPrjTextFileWriter.FileHdrOrigRelPath)+Len(RBPrjTextFileWriter.FileHdrOrigRelPath))
		      end
		    end
		  loop until Left (s, 1) <> RBPrjTextFileWriter.CommentPrefix
		  
		  if me.theFileName = "" then
		    raiseExc ("FileName entry is missing", inputTextFile)
		  end
		  
		  setInput (lines, inputTextFile, me.firstLineIdentifier)
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(processor as RBPrjProcessing, results as RBPrjParseResults, externalsHandling as Integer, parseOpts as RBPrjItemsTreeParseOptions)
		  assert (parseOpts = nil, "'options' can only be used with RBPrjItemsTree.Parse")
		  assert (results <> nil, "'results' argument must not be 'nil'")
		  assert (externalsHandling = RBPrjSupport.IgnoreExternals, "Use 'RBPrjExternalsIncluder' to handle externals!")
		  
		  me.results = results
		  
		  // now that we can pass back warnings, we'll construct the output file reference:
		  determineOrigFileRef ()
		  
		  sendProgress (0)
		  parseFile (processor)
		  processor.ProcessFinished()
		  sendProgress (-1)
		  
		  me.results = nil
		  
		Exception exc
		  me.results = nil
		  sendProgress (-1)
		  raise exc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseBlock(processor as RBPrjProcessing, lines() as String)
		  dim blkID, lineIdx, typeCode as Integer
		  dim tag as String
		  dim value as RBPrjDataRef
		  dim inBlk as Boolean
		  dim mb as MemoryBlock
		  
		  lineIdx = 1
		  
		  do
		    fetchLine (lines, lineIdx, tag, typeCode, value)
		    
		    if me.simulateHeader then
		      If typeCode <> RBPrjItem.TypeProject Then
		        // this is the case for vault files
		        mb = New MemoryBlock (20)
		        mb.LittleEndian = false
		        fillMemBlk (mb, Array (&H52624246, 1, 0, 0, 20))
		        processor.ProcessHeader (new RBPrjDataRef (mb), me.results, me.theOrigFile)
		        mb = nil
		      end
		      me.simulateHeader = false // it's one-shot thing
		    end
		    
		    if typeCode = RBPrjItem.TypeString then
		      processor.ProcessItem (typeCode, tag, value)
		    elseif typeCode = RBPrjItem.TypeInt then
		      processor.ProcessItem (typeCode, tag, value)
		    elseif typeCode = RBPrjItem.TypeDbl then
		      processor.ProcessItem (typeCode, tag, value)
		    elseif typeCode = RBPrjItem.TypeRect then
		      processor.ProcessItem (typeCode, tag, value)
		    elseif typeCode = RBPrjItem.TypeGroup then
		      processor.GroupEnter (tag, value.AsInt)
		    elseif typeCode = RBPrjItem.TypeGroupEnd then
		      processor.GroupLeave (tag, value.AsInt)
		    elseif typeCode = RBPrjItem.TypeBlock then
		      if not inBlk then
		        inBlk = true
		        blkID = value.ptr.Long(8)
		        value.ptr.Long(16) = 0 // let's clear the block length because it would only be in the way all the time
		        if not processor.BlockEnter (tag, blkID, value) then
		          raiseExc ("can not process block as one item")
		        end
		      else
		        processor.BlockLeave (tag, blkID, me.theExtObjName, nil)
		        inBlk = false
		      end
		    elseif typeCode = RBPrjItem.TypeEncrypted then
		      processor.ProcessItem (typeCode, tag, value)
		    elseif typeCode = RBPrjItem.TypeProject then
		      assert (RBPrjHelper.Equal (tag, "RbBF"), "RbBF header is missing")
		      processor.ProcessHeader (value, me.results, me.theOrigFile)
		    elseif typeCode = RBPrjItem.TypeEOF then
		      exit
		    else
		      raiseExc ("bad block header (Blok): "+RBPrjHelper.IntToStr4(typeCode))
		    end
		    
		  loop
		  
		  assert (not inBlk, "wrong state - inBlk")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub parseFile(processor as RBPrjProcessing)
		  parseBlock processor, me.fileLines
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub raiseExc(msg as String, f as FolderItem = nil)
		  raise new RBPrjException (msg, "RBPrjTextFileReader", f)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub sendProgress(ofs as Integer)
		  if me.results.progressUpdate <> nil then
		    if not me.results.progressUpdate.ProgressUpdate (ofs, 0) then
		      raiseExc "Process stopped by user"
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExternalObjectName(objName as String)
		  me.theExtObjName = objName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setInput(lines() as String, fRef as FolderItem, headerID as String)
		  dim vers as Integer
		  if not checkFirstHdrLine (lines, headerID, vers) then
		    // this is not a valid rbvx file
		    raiseExc ("invalid file header", fRef)
		  end
		  me.fileVersion = vers
		  me.firstLineIdentifier = headerID
		  me.theInputFile = fRef
		  me.fileLines = lines
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function versValue(major as Integer, minor as Integer, fix as Integer) As Integer
		  return major * 1000000 + minor * 1000 + fix
		End Function
	#tag EndMethod


	#tag Note, Name = About
		// Reads and parses .rbvx ("REALbasic vault export") files as they're created by RBPrjTextFileWriter
	#tag EndNote


	#tag Property, Flags = &h21
		Private fileLines() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected fileVersion As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected firstLineIdentifier As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected results As RBPrjParseResults
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected simulateHeader As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theExtObjName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected theExtOrigDir As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theExtRelPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theFileName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theInputFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected theOrigFile As FolderItem
	#tag EndProperty


	#tag Constant, Name = RelocatedExtItemsDirName, Type = String, Dynamic = False, Default = \"Relocated External Items", Scope = Public
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
