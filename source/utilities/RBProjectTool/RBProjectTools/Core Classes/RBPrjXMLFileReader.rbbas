#tag Class
Protected Class RBPrjXMLFileReader
Inherits XmlReader
Implements RBPrjParsing
	#tag Event
		Sub StartElement(name as String, attributeList as XmlAttributeList)
		  dim blkID, lineIdx, typeCode as Integer
		  dim tag as String
		  dim value as RBPrjDataRef
		  dim inBlk as Boolean
		  
		  lineIdx = 1
		  
		  do
		    'fetchLine (lines, lineIdx, tag, typeCode, value)
		    
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
		    elseif typeCode = RBPrjItem.TypeEOF then
		      exit
		    else
		      raiseExc ("bad block header (Blok): "+RBPrjHelper.IntToStr4(typeCode))
		    end
		    
		  loop
		  
		  assert (not inBlk, "wrong state - inBlk")
		End Sub
	#tag EndEvent


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
		  // returns false if the file is readable but it's not a RB project file (i.e. it does not have an '<RBProject' header)
		  
		  return openSub (f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function openSub(f as FolderItem, testOnly as Boolean = false) As Boolean
		  // returns false if the file is readable but it's not a RB project file (i.e. it does not have an '<RBProject' header)
		  
		  dim bs as TextInputStream
		  dim len as Integer
		  dim mb as MemoryBlock
		  dim xmlTxt as String
		  
		  if f = nil then
		    raiseExc ("no file specified")
		  end
		  
		  bs = TextInputStream.Open (f)
		  if bs = nil then
		    raiseExc ("open failed", f)
		    return false
		  end
		  bs.Encoding = Encodings.UTF8
		  
		  // first, read only a small part of the file to determine if it's a RB Prj file at all
		  len = 256
		  if f.Length < len then
		    len = f.Length
		  end
		  xmlTxt = bs.Read(len)
		  if bs.LastErrorCode <> 0 then
		    bs.Close
		    raiseExc ("read failed", f)
		    return false
		  end
		  
		  if InStr(xmlTxt, "<RBProject") = 0  then
		    // this is not a project file
		    bs.Close
		    return false
		  end
		  
		  if testOnly then
		    bs.Close
		    return true
		  end
		  
		  // now read the rest
		  if not bs.EOF then
		    xmlTxt = xmlTxt + bs.ReadAll()
		    if bs.LastErrorCode <> 0 then
		      bs.Close
		      raiseExc ("read failed", f)
		    end
		  end
		  bs.Close
		  
		  len = LenB(xmlTxt)
		  
		  mb = New MemoryBlock (len)
		  if mb = nil then
		    raiseExc ("out of memory ("+Format(len,"#")+")", f)
		  end
		  mb.LittleEndian = false
		  
		  mb.StringValue (0, len) = xmlTxt // read the entire file into one big memory block
		  
		  me.prjFile = f
		  me.prjData = mb
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(processor as RBPrjProcessing, results as RBPrjParseResults, externalsHandling as Integer, parseOpts as RBPrjItemsTreeParseOptions)
		  assert (parseOpts = nil, "'options' can only be used with RBPrjItemsTree.Parse")
		  assert (results <> nil, "'results' argument must not be 'nil'")
		  me.results = results
		  
		  assert (externalsHandling = RBPrjSupport.IgnoreExternals, "Use 'RBPrjExternalsIncluder' to handle externals!")
		  
		  assert (me.processor = nil, "there's still a process active on this parser instance")
		  me.processor = processor
		  me.hadEncryptedItems = false
		  
		  super.Parse (me.prjData.StringValue(0, me.prjData.Size)) // invokes the XMLReader.Parse method
		  
		  me.processor.ProcessFinished()
		  
		  me.results = nil
		  me.processor = nil
		  
		Exception exc
		  me.results = nil
		  me.processor = nil
		  raise exc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub raiseExc(msg as String, f as FolderItem = nil)
		  raise new RBPrjException (msg, "RBPrjXMLFileReader", f)
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


	#tag Note, Name = About
		// Reads and parses XML project files
	#tag EndNote


	#tag Property, Flags = &h21
		Private hadEncryptedItems As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prjFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private processor As RBPrjProcessing
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
			InheritedFrom="XmlReader"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InheritedFrom="XmlReader"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="XmlReader"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="XmlReader"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InheritedFrom="XmlReader"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
