#tag Class
Protected Class RBPrjBinaryFileReader
Implements RBPrjParsing
	#tag Method, Flags = &h1
		Protected Sub assert(condition as Boolean, msg as String)
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

	#tag Method, Flags = &h0
		Function CloneForExternalsParsing(f as FolderItem) As RBPrjParsing
		  return RBPrjSupport.NewFileParser (f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateExternalItem(prjItemName as String, fileName as String, kinds() as String, values() as String, ByRef fOut as FolderItem) As Boolean
		  return false // this parser does let the includer do all the work
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(f as FolderItem) As Boolean
		  // returns false if the file is readable but it's not a RB project file (i.e. it does not have an 'RbBF' header)
		  
		  return openSub (f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function openSub(f as FolderItem, testOnly as Boolean = false) As Boolean
		  // returns false if the file is readable but it's not a RB project file (i.e. it does not have an 'RbBF' header)
		  
		  dim bs as BinaryStream
		  dim len as Integer
		  dim mb as MemoryBlock
		  
		  if f = nil then
		    raiseExc ("No file specified")
		  end
		  
		  if f.Directory then
		    // this is not a project file
		    return false
		  end
		  
		  bs = BinaryStream.Open(f, false)
		  if bs = nil then
		    raiseExc ("Open failed", f)
		    return false
		  end
		  
		  if bs.Read(4) <> "RbBF" then
		    // this is not a project file
		    bs.Close
		    return false
		  end
		  
		  if testOnly then
		    bs.Close
		    return true
		  end
		  
		  len = f.Length
		  
		  mb = New MemoryBlock (len)
		  if mb = nil then
		    bs.Close
		    raiseExc ("Out of memory ("+Format(len,"#")+")", f)
		  end
		  mb.LittleEndian = false
		  
		  bs.Position = 0
		  mb.StringValue (0, len) = bs.Read (len) // read the entire file into one big memory block
		  bs.Close
		  
		  if bs.LastErrorCode <> 0 then
		    raiseExc ("Read failed", f)
		    return false
		  end
		  
		  me.prjFile = f
		  me.prjData = mb
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(processor as RBPrjProcessing, results as RBPrjParseResults, externalsHandling as Integer, parseOpts as RBPrjItemsTreeParseOptions)
		  assert (parseOpts = nil, "'options' can only be used with RBPrjItemsTree.Parse")
		  assert (results <> nil, "'results' argument must not be 'nil'")
		  assert (externalsHandling = RBPrjSupport.IgnoreExternals, "Use 'RBPrjExternalsIncluder' to handle externals!")
		  me.hadEncryptedItems = false
		  me.results = results
		  me.traverseAll (processor)
		  me.results = nil
		Exception exc
		  me.results = nil
		  raise exc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub raiseExc(msg as String, f as FolderItem = nil)
		  raise new RBPrjException (msg, "RBPrjBinaryFileReader", f)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub sendProgress(ofs as Integer)
		  if me.results.progressUpdate <> nil then
		    if ofs < 0 then ofs = prjData.Size
		    if not me.results.progressUpdate.ProgressUpdate (ofs, prjData.Size) then
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

	#tag Method, Flags = &h21
		Private Sub traverseAll(processor as RBPrjProcessing)
		  
		  dim d as MemoryBlock = me.prjData
		  dim typeCode, id, nxt, len, ofs as Integer
		  dim tag as String
		  dim isEncrypted as Boolean
		  
		  assert (d.Long(0) = RBPrjItem.TypeProject, "bad file header (RbBF)")
		  
		  sendProgress (0)
		  
		  // process the project header
		  //
		  ofs = d.Long(16)
		  processor.ProcessHeader (new RBPrjDataRef (d, 0, ofs), me.results, me.prjFile)
		  
		  // loop over the blocks (Modules, Classes, Windows, etc.)
		  //
		  me.lastID = 0
		  do
		    typeCode = d.Long(ofs)
		    
		    if typeCode = RBPrjItem.TypeBlock then
		      tag = d.StringValue(ofs+4,4)
		      id = d.Long(ofs+8)
		      len = d.Long(ofs+16)
		      nxt = ofs + len
		      len = len - 32
		      isEncrypted = d.Long(ofs+20) <> 0
		      if processor.BlockEnter (tag, id, new RBPrjDataRef (d, ofs, 32)) then
		        // processor wants to process the block as individual items
		        d.Long(ofs+16) = 0 // let's clear the block length because it would only be in the way all the time
		        if isEncrypted then
		          // but we must process the block as one item because we can't decrypt it
		          me.hadEncryptedItems = true
		          processor.ProcessItem (RBPrjItem.TypeEncrypted, tag, new RBPrjDataRef (d, ofs+32, len))
		        else
		          traverseItems (processor, d, ofs+32, nxt)
		        end
		      else
		        // process the block as one item
		        processor.ProcessItem (typeCode, tag, new RBPrjDataRef (d, ofs+32, len))
		      end
		      processor.BlockLeave (tag, id, me.theExtObjName, nil)
		    elseif typeCode = RBPrjItem.TypeEOF then
		      exit
		    else
		      raiseExc ("bad block header (Blok): "+RBPrjHelper.IntToStr4(typeCode))
		    end
		    
		    ofs = nxt
		  loop
		  
		  if me.hadNoSteadyIncGroupID then
		    // I believe this is not to worry about. It can happen when a shared item is changed by a separate
		    // project and gets new IDs that way that do not fit within the other project. So, let's just ignore this
		    'results.warnMsgs.Append "Group IDs were not steadily increasing (not sure if this is a problem, though)"
		  end
		  
		  processor.ProcessFinished()
		  
		  sendProgress (-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub traverseItems(processor as RBPrjProcessing, d as MemoryBlock, ofs as Integer, endOfs as Integer)
		  
		  dim id, len, len1, typeCode, handledItems as Integer
		  dim tag as String
		  
		  // loop over the items in the block or group
		  // each one has a 4 byte tag (ID), 4 byte type, then data (no general size info, unfortunately)
		  //
		  while ofs < endOfs
		    
		    sendProgress (ofs)
		    
		    len = 0
		    tag = d.StringValue(ofs,4)
		    typeCode = d.Long(ofs+4)
		    
		    if typeCode = RBPrjItem.TypeString then // String: length, value, filled up with blanks (" ")
		      
		      len1 = d.Long(ofs+8) // string len, not rounded
		      len = len1 + 12 // total len, rounded
		      if len MOD 4 > 0 then len = len + 4 - (len MOD 4) // round up to next 4 byte boundary
		      processor.ProcessItem (typeCode, tag, new RBPrjDataRef (d, ofs+12, len1))
		      
		    elseif typeCode = RBPrjItem.TypeInt then // Integer value: 4 bytes
		      
		      len = 12
		      processor.ProcessItem (typeCode, tag, new RBPrjDataRef (d, ofs+8, 4))
		      
		    elseif typeCode = RBPrjItem.TypeRect then // Rect:
		      
		      len = 16+8
		      processor.ProcessItem (typeCode, tag, new RBPrjDataRef (d, ofs+8, 16))
		      
		    elseif typeCode = RBPrjItem.TypeDbl Then
		      
		      Len = 16
		      processor.ProcessItem (typeCode, tag, new RBPrjDataRef (d, ofs+8, 8))
		      
		    elseif typeCode = RBPrjItem.TypeGroup then // Grouping: length, ID, items(), "EndG", ID
		      
		      id = d.Long(ofs+12)
		      if id <= me.lastID then
		        me.hadNoSteadyIncGroupID = true // nothing serious, though, I (TT) believe
		      end
		      me.lastID = id
		      len = d.Long(ofs+8) + 12
		      if len MOD 4 > 0 then len = len + 4 - (len MOD 4) // round up to next 4 byte boundary
		      processor.GroupEnter (tag, id)
		      traverseItems (processor, d, ofs+16, ofs+len)
		      processor.GroupLeave (tag, id)
		      ofs = ofs + len
		      // finally, make sure there's a "EndG" item here:
		      assert (d.Long(ofs) = RBPrjItem.TypeGroupEnd and d.Long(ofs+4) = RBPrjItem.TypeInt and d.Long(ofs+8) = id, "invalid group end")
		      len = 12
		      
		    elseif typeCode = RBPrjItem.TypePadding then // Padding: length, filling made of asterisks ("*")
		      
		      len = 12 + d.Long(ofs+8)
		      
		    else
		      
		      // if we don't know the type, we can't continue since we do not know where the next item begins
		      raiseExc "unknown block item type ("+RBPrjHelper.IntToStr4(typeCode)+")"
		      
		    end
		    
		    if len = 0 then raise new RuntimeException // internal error - I forget to set 'nxt' for the next iteration
		    ofs = ofs + len
		    handledItems = handledItems + 1
		    
		  wend
		  
		  assert (ofs = endOfs, "invalid block end")
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		// Reads and parses Binary RB project files
	#tag EndNote


	#tag Property, Flags = &h21
		Private hadEncryptedItems As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hadNoSteadyIncGroupID As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private results As RBPrjParseResults
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theExtObjName As String
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
