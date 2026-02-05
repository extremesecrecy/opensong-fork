#tag Class
Protected Class RBPrjXMLBuilder
Inherits RBPrjProcessingHelper
Implements RBPrjProcessing
	#tag Method, Flags = &h21
		Private Sub addToCollectedItems(type as Integer, tag as String, id as Integer, valueRef as RBPrjDataRef)
		  collectedItems.Append new RBPrjItem (nil, type, tag, valueRef, id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsXML() As XMLDocument
		  return me.xmlDoc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockEnter(tag as String, id as Integer, header as RBPrjDataRef) As Boolean
		  me.currXMLItem = writeItem ("Blok")
		  me.currXMLItem.SetAttribute ("type", translate (tag))
		  me.currXMLItem.SetAttribute ("ID", RBPrjHelper.MyStr(id))
		  me.indent = me.indent + 1
		  
		  me.kindStack.Append tag // do this last, _after_ translating 'tag'!
		  me.nameStack.Append ""
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlockLeave(tag as String, id as Integer, optionalName as String, extFileRef as FolderItem)
		  
		  assert (me.kindStack.Pop = tag, "internal error with group stack")
		  call me.nameStack.Pop
		  
		  me.indent = me.indent - 1
		  writeLine ()
		  
		  me.currXMLItem = me.currXMLItem.Parent
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  return new RBPrjXMLBuilder (me.optionSuppressHugeWords, me.versionStr)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function collectedItem(tag as String) As RBPrjItem
		  dim item as RBPrjItem
		  for each item in me.collectedItems
		    if RBPrjHelper.Equal (tag, item.tag) then
		      return item
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  me.Constructor (true, "") // use "true" as long as but ID "ntnexits" exists, afterwards FALSE is OK here
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(forXqlAndTransform as Boolean, version as String)
		  super.Constructor
		  
		  me.optionSuppressHugeWords = forXqlAndTransform
		  
		  //
		  // add items that need not to appear in the XML file
		  //
		  me.suppressedTags = new Dictionary
		  me.suppressedTags.Value(RBPrjHelper.Str4ToInt("pasw")) = true
		  me.suppressedTags.Value(RBPrjHelper.Str4ToInt("AChp")) = true
		  me.suppressedTags.Value(RBPrjHelper.Str4ToInt("OPSp")) = true
		  
		  //
		  // set up some output options
		  //
		  if version = "5.5.5" then
		    me.optionShortProp = true // this will write Properties in the old format (might lose information if 200x's new features are used in the file!)
		  elseif version = "2005r4" then
		    // nothing special here compared to latest known version (see below)
		  elseif version = "" then
		    // -> use latest known version
		    version = "2006r1"
		  else
		    raiseExc ("invalid version specified for xml export")
		  end
		  me.versionStr = version
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function describeCurrItem(itemDesc as String) As String
		  // returns a text identifying the item to the user
		  
		  dim i as Integer
		  
		  for i = Ubound(me.nameStack) downTo 0
		    itemDesc = me.nameStack(i) + ":" + itemDesc
		  next
		  
		  return itemDesc
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalsProcessingFinished()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupEnter(tag as String, id as Integer)
		  dim suppressTagCreation as Boolean
		  
		  if RBPrjHelper.Equal (tag, "Icon") then
		    me.textIsNonPrintable = me.textIsNonPrintable + 1
		  end
		  
		  if me.collectingItems then
		    addToCollectedItems RBPrjItem.TypeGroup, tag, id, nil
		    suppressTagCreation = true
		  elseif RBPrjHelper.Equal (tag, "PDef") or RBPrjHelper.Equal (tag, "Prop") then
		    me.collectingItems = true
		    me.collectionTag = tag
		    redim me.collectedItems(-1)
		  end
		  
		  if not suppressTagCreation then
		    me.currXMLItem = writeItem (tag)
		  end
		  me.indent = me.indent + 1
		  
		  me.kindStack.Append tag // do this last, _after_ translating 'tag'!
		  me.nameStack.Append ""
		  assert (Ubound(me.kindStack) = Ubound(me.nameStack), "name&tag stacks are out of sync")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupLeave(tag as String, id as Integer)
		  dim suppressWrite, suppressTagClosure as Boolean
		  
		  assert (me.kindStack.Pop = tag, "internal error with group stack")
		  call me.nameStack.Pop
		  
		  if RBPrjHelper.Equal (tag, "Icon") then
		    me.textIsNonPrintable = me.textIsNonPrintable - 1
		  end
		  
		  if me.collectingItems then
		    if RBPrjHelper.Equal (tag, me.collectionTag) then
		      suppressWrite = writeCollected (tag)
		      me.collectingItems = false
		      redim me.collectedItems(-1)
		    else
		      addToCollectedItems RBPrjItem.TypeGroupEnd, tag, id, nil
		      suppressTagClosure = true
		      suppressWrite = true
		    end
		  end
		  
		  me.indent = me.indent - 1
		  if not suppressWrite then
		    writeLine ()
		  end
		  
		  if not suppressTagClosure then
		    me.currXMLItem = me.currXMLItem.Parent
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function newXmlTextNode(item as RBPrjItem) As XmlNode
		  dim node as XmlNode
		  dim valueRef as RBPrjDataRef
		  
		  valueRef = item.dataRef
		  if item.type = RBPrjItem.TypeString and not valueRef.IsPrintable() then
		    node = me.xmlDoc.CreateElement ("Hex")
		    node.SetAttribute "bytes", RBPrjHelper.MyStr (valueRef.len)
		    node.AppendChild me.xmlDoc.CreateTextNode (valueRef.AsHexString)
		  else
		    node = me.xmlDoc.CreateTextNode (item.PrintableValue)
		  end
		  
		  return node
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFinished()
		  writeLine ()
		  
		  if Ubound (me.missingTranslations) >= 0 then
		    reportWarning ("These ""tag"" translations are missing (see Note in RBPrjSupport module): "+Join(me.missingTranslations,", "))
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessHeader(dataRef as RBPrjDataRef, results as RBPrjParseResults, inputFileRef as FolderItem)
		  me.SetParseResultsObj (results)
		  
		  // reset a few properties that we use in each parse process
		  redim me.missingTranslations(-1)
		  redim me.kindStack(-1)
		  me.collectingItems = false
		  me.indent = 0
		  me.textIsNonPrintable = 0
		  
		  // prepare the xml document that we'll create
		  me.xmlDoc = new XMLDocument
		  me.xmlDoc.PreserveWhitespace = true
		  me.currXMLItem = me.xmlDoc
		  me.currXMLItem = writeItem ("RbBF")
		  me.currXMLItem.SetAttribute "version", me.versionStr
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessItem(type as Integer, tag as String, valueRef as RBPrjDataRef)
		  dim xmlItem as XMLNode
		  
		  if RBPrjHelper.Equal (tag, "name") or RBPrjHelper.Equal (tag, "Name") then
		    me.nameStack(Ubound(me.nameStack)) = valueRef.AsText
		  end
		  
		  if me.collectingItems then
		    // special handling: collect the items instead of writing them out, will be finished in GroupLeave then
		    addToCollectedItems type, tag, -1, valueRef
		  elseif me.suppressedTags.HasKey (RBPrjHelper.Str4ToInt(tag)) then
		    // ignore it
		  elseif type = RBPrjItem.TypeInt then
		    // it's an integer
		    call writeItem (tag, valueRef.AsIntString)
		  elseif type = RBPrjItem.TypeDbl then
		    // it's a double
		    call writeItem (tag, valueRef.AsDblString)
		  elseif type = RBPrjItem.TypeString then
		    if me.textIsNonPrintable > 0 or not valueRef.IsPrintable() then
		      // it's non-printable text
		      if me.optionSuppressHugeWords and valueRef.len >= 65536 then
		        // due to a crashing bug (ID ntnexits) we must not create large text nodes
		        // if the user wants to use XQL() or Transform() functions on it.
		      else
		        xmlItem = writeItem (tag, "")
		        xmlItem = xmlItem.AppendChild (me.xmlDoc.CreateElement("Hex"))
		        xmlItem.SetAttribute "bytes", RBPrjHelper.MyStr(valueRef.len)
		        xmlItem.AppendChild me.xmlDoc.CreateTextNode (valueRef.AsHexString)
		      end
		    else
		      // it's printable text
		      call writeItem (tag, valueRef.AsText)
		    end
		  elseif type = RBPrjItem.TypeRect then
		    xmlItem = writeItem (tag, "")
		    xmlItem = xmlItem.AppendChild (me.xmlDoc.CreateElement("Rect"))
		    xmlItem.SetAttribute "left", RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+0))
		    xmlItem.SetAttribute "top", RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+4))
		    xmlItem.SetAttribute "width", RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+8))
		    xmlItem.SetAttribute "height", RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+12))
		  else
		    // it's something else I don't know yet
		    raiseExc ("unknown value type "+RBPrjHelper.IntToStr4(type)+" passed with tag "+tag)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function translate(tag as String) As String
		  dim v as Variant
		  dim dict as Dictionary
		  dim depth, tagn as Integer
		  dim defaultResult, key as String
		  
		  assert (Len(tag) = 4, "tag values must be 4 chars long")
		  
		  depth = Ubound(kindStack)
		  dict = RBPrjTagTranslator.Translations()
		  key = tag
		  defaultResult = ""
		  do
		    tagn = RBPrjHelper.Str4ToInt(key)
		    defaultResult = lookup (dict, tagn, defaultResult)
		    if depth >= 0 then
		      v = lookup (dict, -tagn, nil) // look for group-specific names first
		    else
		      v = nil
		    end
		    if v = nil then
		      // we have the final translation string -> return it
		      if defaultResult <> "" then
		        return defaultResult
		      else
		        if me.missingTranslations.IndexOf(tag) < 0 then me.missingTranslations.Append tag
		        return "unknown_"+tag
		      end
		    end
		    // must be a Dictionary then
		    dict = v
		    key = kindStack(depth)
		    depth = depth - 1
		  loop
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function writeCollected(tag as String) As Boolean
		  dim hasMoreInfo as Boolean
		  dim value, key, declStr as String
		  dim item, declItem as RBPrjItem
		  
		  if RBPrjHelper.Equal (tag, "PDef") then
		    
		    me.currXMLItem.AppendChild newXmlTextNode (collectedItem("PVal"))
		    me.currXMLItem.SetAttribute "Name", collectedItem("name").PrintableValue
		    
		  elseif RBPrjHelper.Equal (tag, "Prop") then
		    
		    // see if we have the new style Property items with optional comments or code
		    hasMoreInfo = false
		    declItem = collectedItem("decl")
		    declStr = declItem.dataRef.AsText
		    for each item in me.collectedItems
		      key = item.tag
		      value = Trim (item.PrintableValue)
		      select case key
		      case "Enco", "decl", "flag", "sorc"
		        // ok
		      case "srcl"
		        if value <> "" and value <> Trim (declStr) then hasMoreInfo = true
		      else
		        hasMoreInfo = true
		      end
		      if hasMoreInfo then exit
		    next
		    
		    if hasMoreInfo then
		      // we've decided to export all items of this group after all
		      if me.optionShortProp then
		        // let the user know that he's losing some information in this backward compatible output
		        reportWarning ("Reduced information: "+describeCurrItem(value))
		      end
		      // let's have another run at this group, this time without the collection:
		      me.collectingItems = false
		      for each item in me.collectedItems
		        if item.type = RBPrjItem.TypeGroup then
		          me.GroupEnter (item.tag, item.id)
		        elseif item.type = RBPrjItem.TypeGroupEnd then
		          me.GroupLeave (item.tag, item.id)
		        else
		          me.ProcessItem (item.type, item.tag, item.dataRef)
		        end
		      next
		      return false // -> tell caller to pretend this call did not happen because we've already had another run at it
		    else
		      // export just the declaration and name in old (RB 5.5) format
		      // note: this might suppress new features used with RB2005!
		      me.currXMLItem.AppendChild newXmlTextNode (declItem)
		      value = collectedItem("flag").PrintableValue
		      if value <> "" then
		        me.currXMLItem.SetAttribute "Flags", value
		      end
		    end
		    
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function writeItem(tag as String, value as String = "") As XMLNode
		  dim result as XMLNode
		  
		  writeLine ()
		  result = me.currXMLItem.AppendChild (me.xmlDoc.CreateElement (translate (tag)))
		  result.AppendChild (me.xmlDoc.CreateTextNode (value))
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub writeLine()
		  me.currXMLItem.AppendChild (me.xmlDoc.CreateTextNode (EndOfLine+Left("                                            ", me.indent)))
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Creates a XMLDocument from the project
		
		Careful: This version is not well suitable for generating a XML project file
		that the RB IDE can read, because it does not handle a few special cases
		and cannot deal with external items, either. For creating a XML Prj File,
		use the RBPrjXMLFileWriter class instead!
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			ProcessItem() collects items of a group herein if not nil
		#tag EndNote
		Private collectedItems() As RBPrjItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private collectingItems As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private collectionTag As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private currXMLItem As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private indent As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			A stack of the 'tag' values of the current enclosures
		#tag EndNote
		Private kindStack(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private missingTranslations() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			A stack of the 'name' values of the current enclosures
		#tag EndNote
		Private nameStack(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private optionShortProp As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private optionSuppressHugeWords As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private suppressedTags As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private textIsNonPrintable As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private versionStr As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private xmlDoc As XMLDocument
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
