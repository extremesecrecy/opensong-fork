#tag Class
Protected Class RBPrjExternalsIncluder
Inherits RBPrjProcessingHelper
Implements RBPrjProcessing
	#tag Method, Flags = &h0
		Function BlockEnter(tag as String, id as Integer, header as RBPrjDataRef) As Boolean
		  dim result as Boolean
		  
		  assert (me.groupLevel = 0, "groupLevel not 0") // that would be an internal error
		  
		  if me.externalItemState = 2 then
		    
		    // this is our external item -> write that out
		    result = me.processor.BlockEnter (tag, id, header)
		    me.externalItemState = 3
		    
		  else
		    
		    assert (me.externalItemState = 0, "externalItemState not 0") // that would be an internal error
		    
		    redim me.extItemRefTags(-1)
		    redim me.extItemRefValues(-1)
		    redim me.extItemRefFileNames(-1)
		    me.objName = ""
		    me.objContVal = 0
		    me.filterCont = false
		    
		    if RBPrjHelper.Equal (tag, "pExt") or RBPrjHelper.Equal (tag, "pEEx") then
		      // let's read the external item and write it out as an internal item
		      me.externalItemState = 1
		      me.blockIsEncrypted = RBPrjHelper.Equal (tag, "pEEx")
		      if me.hideExternalRef or me.processor = nil then
		        result = true // -> traverse into the block
		      else
		        result = me.processor.BlockEnter (tag, id, header)
		      end
		    else
		      // this is a normal block from the main prj file
		      me.blockIsEncrypted = header.ptr.Long(header.ofs+20) <> 0
		      if me.processor <> nil then
		        result = me.processor.BlockEnter (tag, id, header)
		      end
		    end
		    
		  end
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlockLeave(tag as String, id as Integer, optionalName as String, extFileRef as FolderItem)
		  assert (me.groupLevel = 0, "groupLevel not 0") // that would be an internal error
		  
		  dim theExtFile as FolderItem
		  
		  if RBPrjHelper.Equal (tag, "pExt") or RBPrjHelper.Equal (tag, "pEEx") then
		    
		    assert (me.externalItemState = 1, "wrong externalItemState")
		    
		    theExtFile = me.locateExternalItem()
		    if theExtFile <> nil then
		      // finally, parse the item
		      call parseExternalFile (theExtFile)
		    end
		    
		    if me.externalItemState <> 4 then
		      reportError ("External item '"+me.objName+"' can not be located")
		    end
		    
		    if not me.hideExternalRef then
		      if me.processor <> nil then
		        me.processor.BlockLeave (tag, id, me.objName, theExtFile)
		      end
		    end
		    me.externalItemState = 0
		    
		  elseif RBPrjHelper.Equal (tag, "BScf") then
		    // This is a Build Script, CopySupportFolders. Don't search for it
		    me.processor.BlockLeave (tag, id, me.objName, theExtFile)
		  else
		    
		    if me.processor <> nil then
		      if me.externalItemState = 0 and Ubound (me.extItemRefTags) >= 0 then
		        theExtFile = me.locateExternalItem()
		      end
		      me.processor.BlockLeave (tag, id, optionalName, theExtFile)
		    end
		    
		  end
		  
		  if me.externalItemState = 0 then
		    me.blockIsEncrypted = false
		    me.filterCont = false
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  // this should never get called
		  raiseExc ("recursive external inclusion must not be happening")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(processor as RBPrjProcessing, parser as RBPrjParsing, collectAllIntoOne as Boolean, hideExternalRef as Boolean, externalsLocator as RBPrjFileLocating)
		  // if processor=nil, only the list of external files will be collected
		  
		  me.Constructor()
		  me.processor = processor
		  me.collectAllIntoOne = collectAllIntoOne
		  me.hideExternalRef = hideExternalRef
		  me.externalsLocator = externalsLocator
		  me.theParser = parser
		  
		  if me.collectAllIntoOne then
		    me.hideExternalRef = true
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExternalProjectFiles() As FolderItem()
		  return me.fileRefs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalsProcessingFinished()
		  me.processor.ExternalsProcessingFinished()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function extractFileName(tag as String, path as String) As String
		  dim ch, fileName as String
		  dim i as Integer
		  
		  // extract the file name from the path
		  if RBPrjHelper.Equal (tag, "alis") then
		    fileName = me.macGetAliasInfo (path, 0) // 0: target name, 1: parent name
		  else
		    i = Len (path)
		    while i > 1
		      i = i - 1
		      ch = Mid (path, i, 1)
		      if ch = ":" or ch = "/" or ch = "\" then
		        i = i + 1
		        exit
		      end
		    wend
		    fileName = Mid (path, i)
		  end
		  
		  return fileName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupEnter(tag as String, id as Integer)
		  me.groupLevel = me.groupLevel + 1
		  
		  if me.externalItemState <> 1 or not me.hideExternalRef  then
		    // If me.externalItemState=1 it means that we're parsing a group of a pExt block.
		    // Such groups used not to exist in RB 2006r2, but are now in 2007r1. We need
		    // to skip these when including (merging) externals or some exporters such as
		    // RBPrjBinaryFileWriter would get confused because they'd write out this data
		    // as a new (invalid) 'Blok' segment.
		    // However, this still has a little disadvantage: The group (here: 'VwBh') exists in
		    // the main prj file in order to override the external's group of the same name.
		    // This code here does not imitate this overriding currently, though.
		    me.processor.GroupEnter (tag, id)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupLeave(tag as String, id as Integer)
		  if me.externalItemState <> 1 or not me.hideExternalRef  then
		    me.processor.GroupLeave (tag, id)
		  end
		  
		  me.groupLevel = me.groupLevel - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function locateExternalItem() As FolderItem
		  dim f, primaryLocation as FolderItem
		  dim i as Integer
		  dim fileName as String
		  
		  // determine the item's file name
		  for i = 0 to Ubound (me.extItemRefTags)
		    if fileName = "" or (me.extItemRefTags(i) = "ppth" and me.extItemRefFileNames(i) <> "") then // ppth is preferred because it's getting updated on all platforms (while "alis" is not)
		      fileName = me.extItemRefFileNames(i)
		    end
		  next
		  
		  // give the parser a chance to locate the external item before we try on our own
		  if not me.theParser.LocateExternalItem (me.objName, fileName, me.extItemRefTags, me.extItemRefValues, f) then
		    
		    // search for the file using the various path references given in the Block
		    RBPrjHelper.LocateExternalFile (me.directoryRef, me.extItemRefTags, me.extItemRefValues, f, primaryLocation)
		    
		    if me.externalsLocator <> nil then
		      // let the externalsLocator relocate the item if it really wants to (even if it was not found yet)
		      f = me.externalsLocator.RelocateFile (f, fileName, me.objName)
		      if f = nil then
		        // external item could not be found automatically - give the user a choice now to locate it
		        f = me.externalsLocator.LocateMissingFile (fileName, me.objName)
		      end
		    elseif f = nil and me.processor = nil then
		      // we're only collecting file locations
		      f = primaryLocation
		    end
		    
		  end
		  
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function macGetAliasInfo(aliasData as String, infoPart as Integer) As String
		  #pragma DisableBackgroundTasks
		  
		  #if TargetMacOS
		    
		    #if TargetCarbon
		      declare function GetAliasInfo Lib "Carbon" (aliasHdl as Integer, infoType as short, str63 as Ptr) as Integer
		      declare function NewHandle Lib "Carbon" (size as Integer) as Integer
		      declare sub DisposeHandle Lib "Carbon" (hdl as Integer)
		    #elseif TargetMachO
		      declare function GetAliasInfo Lib "Carbon" (aliasHdl as Integer, infoType as Short, str63 as Ptr) as Integer
		      declare function NewHandle Lib "Carbon" (size as Integer) as Integer
		      declare sub DisposeHandle Lib "Carbon" (hdl as Integer)
		    #else
		      declare function GetAliasInfo Lib "InterfaceLib" (aliasHdl as Integer, infoType as Short, str63 as Ptr) as Integer
		      declare function NewHandle Lib "InterfaceLib" (size as Integer) as Integer
		      declare sub DisposeHandle Lib "InterfaceLib" (hdl as Integer)
		    #endif
		    
		    dim mb1, mb2 as MemoryBlock
		    dim result as String
		    dim err, attempt as Integer
		    
		    for attempt = 1 to 2
		      if LenB (aliasData) > 0 then
		        mb1 = NewMemoryBlock (4) // holds just the handle for the alias data
		        mb1.Long(0) = NewHandle (LenB(aliasData))
		        mb1.Ptr(0).Ptr(0).StringValue (0, LenB(aliasData)) = aliasData
		        mb2 = NewMemoryBlock (256) // holds the returned string
		        err = GetAliasInfo (mb1.Long(0), infoPart, mb2)
		        DisposeHandle (mb1.Long(0))
		        if err = 0 then
		          result = mb2.PString(0).DefineEncoding (Encodings.SystemDefault)
		          exit
		        end
		        aliasData = MidB (aliasData, 13) // RB appears to add 12 extra leading bytes to the AliasData (have no idea why)
		      end
		    next
		    
		    return result
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseExternalFile(f as FolderItem)
		  dim rbp as RBPrjParsing
		  dim savedProcessor as RBPrjProcessing
		  
		  assert (me.parseResults <> nil, "'me.parseResults' must not be 'nil'")
		  
		  if f <> nil then
		    
		    me.fileRefs.Append f
		    
		    if me.processor = nil then
		      
		      me.externalItemState = 4
		      
		    else
		      
		      if f.Exists and not f.Directory then
		        
		        rbp = me.theParser.CloneForExternalsParsing (f)
		        rbp.SetExternalObjectName (me.objName)
		        if rbp.Open (f) then
		          // item is a RB prj object - let's parse it now
		          me.externalItemState = 2
		          savedProcessor = me.processor
		          try
		            rbp.Parse (me, me.parseResults, RBPrjSupport.IgnoreExternals, nil)
		            if me.processor <> savedProcessor then
		              me.processor.ExternalsProcessingFinished()
		            end
		            assert (me.externalItemState = 3, "external item: wrong state (3)")
		          catch exc
		            if me.processor <> nil and me.processor <> savedProcessor then
		              me.processor.ExternalsProcessingFinished()
		            end
		            raise exc // we could as well just make a note of the problem but continue with the next block anyways
		          end
		          me.processor = savedProcessor
		          me.externalItemState = 4
		        end
		        
		      end
		      
		    end
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFinished()
		  
		  if me.processor = nil then
		    // do nothing
		  elseif me.externalItemState = 0 then
		    // this is the end of the main project file
		    me.processor.ProcessFinished
		  elseif not me.collectAllIntoOne then
		    // this is an external file that we've just included
		    // finish the individual file
		    me.processor.ProcessFinished
		  else
		    // it is an external item that we silently included as if it were part of the main prj file
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessHeader(dataRef as RBPrjDataRef, results as RBPrjParseResults, inputFileRef as FolderItem)
		  dim extProcessor as RBPrjProcessing
		  if me.externalItemState = 0 then
		    // this is the beginning of the main project file
		    me.SetParseResultsObj (results)
		    me.directoryRef = inputFileRef.Parent
		    me.groupLevel = 0
		    me.hadEncryptedItems = false
		    if me.processor <> nil then
		      me.processor.ProcessHeader (dataRef, results, inputFileRef)
		    end
		  elseif not me.collectAllIntoOne then
		    // this is an external file that we're just including now
		    // treat this as an individual file
		    extProcessor = me.processor.CloneForExternalsProcessing (inputFileRef) // the prev value got already saved inside parseExternalFile()
		    extProcessor.ProcessHeader (dataRef, results, inputFileRef)
		    me.processor = extProcessor
		  else
		    // it is an external item that we silently include as if it were part of the main prj file
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessItem(type as Integer, tag as String, valueRef as RBPrjDataRef)
		  if me.processor <> nil then
		    if me.externalItemState = 0 then
		      // parsing the main prj file outside a pExt block
		      me.processor.ProcessItem (type, tag, valueRef)
		    elseif me.externalItemState = 3 then
		      // parsing an external item
		      if me.filterCont and me.groupLevel = 0 and RBPrjHelper.Equal (tag, "Cont") then
		        // replace the original container id with the one from the pExt instead as collected below
		        me.processor.ProcessItem (RBPrjItem.TypeInt, tag, new RBPrjDataRef (me.objContVal))
		        me.filterCont = false // this tag only appears once, so we can stop looking further for it
		      else
		        me.processor.ProcessItem (type, tag, valueRef)
		      end
		    else
		      // parsing properties of a pExt block inside the main prj file
		      if not me.hideExternalRef then
		        me.processor.ProcessItem (type, tag, valueRef)
		      end
		    end
		  end
		  
		  if me.groupLevel = 0 then
		    if me.externalItemState = 1 then
		      // this is an external code item reference in the main project
		      if RBPrjHelper.Equal (tag, "Cont") then
		        // remember the container id because we need to copy it to the included item to preserve the folder hierarchy
		        me.objContVal = Val (AsText (type, valueRef))
		        me.filterCont = not me.blockIsEncrypted // but don't do this if it's an ecrypted block because we must not mess with its contents
		      end
		    end
		    if RBPrjHelper.Equal (tag, "Name") then
		      // let's remember the project item's name
		      me.objName = valueRef.AsText
		    elseif RBPrjHelper.Equal (tag, "alis") or RBPrjHelper.Equal (tag, "path") or RBPrjHelper.Equal (tag, "ppth") then
		      // external file reference -> collect it for handling it later in BlockLeave
		      me.extItemRefTags.Append tag
		      me.extItemRefValues.Append valueRef.AsText
		      me.extItemRefFileNames.Append me.extractFileName (tag, valueRef.AsText)
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Works as an it-between filter.
		
		Identifies external items and includes them in the process
	#tag EndNote


	#tag Property, Flags = &h21
		Private blockIsEncrypted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			if true, all external objects as passed to the sub-processor as if they were part of the main prj file
			if false, external objects are passed to a Clone of the sub-processor so that they can be treated as invidual prj files
		#tag EndNote
		Private collectAllIntoOne As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private directoryRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private externalItemState As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private externalsFileNameSuffix As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private externalsLocator As RBPrjFileLocating
	#tag EndProperty

	#tag Property, Flags = &h21
		Private extItemRefFileNames() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private extItemRefTags() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private extItemRefValues() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private fileRefs() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private filterCont As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private groupLevel As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hadEncryptedItems As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			if true, the pExt block's items in the main prj file are hidden to the sub-processor
		#tag EndNote
		Private hideExternalRef As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private objContVal As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private objName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private processor As RBPrjProcessing
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theParser As RBPrjParsing
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
