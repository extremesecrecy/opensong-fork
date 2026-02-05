#tag Class
Protected Class RBPrjXMLFileWriter
Inherits RBPrjItemsTreeBuilder
	#tag Event
		Sub Ready(prjTree as RBPrjItemsTree, origFileRef as FolderItem)
		  if me.outFileRef <> nil then
		    origFileRef = me.outFileRef
		  end
		  myProcessAll prjTree, origFileRef
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  dim p as RBPrjXMLFileWriter
		  p = new RBPrjXMLFileWriter (me.versionStr)
		  p.parent = me
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  me.Constructor("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(version as String)
		  super.Constructor
		  
		  //
		  // prepare propery lists
		  //
		  readPropOrders ()
		  
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
		  me.versionStr = version
		  if version = "5.5.5" then
		    me.optionShortProp = true // this will write Properties in the old format (might lose information if 2005's new features are used in the file!)
		  elseif version = "2005r4" then
		    // ...
		  elseif version = "" then
		    // default
		  else
		    raiseExc ("invalid version specified for xml export")
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function describeItem(item as RBPrjItem, itemDesc as String) As String
		  // returns a text identifying the item to the user
		  
		  dim name as RBPrjItem
		  
		  while item.parent <> nil
		    name = item.ChildByTag("name")
		    if name <> nil then
		      itemDesc = name.PrintableValue + ":" + itemDesc
		    end
		    item = item.parent
		  wend
		  
		  return itemDesc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub myProcessAll(prjTree as RBPrjItemsTree, origFileRef as FolderItem)
		  dim root, item as RBPrjItem
		  
		  root = prjTree.RootItem
		  
		  // reset a few properties that we use in each parse process
		  redim me.missingTranslations(-1)
		  me.indent = 0
		  me.textIsNonPrintable = 0
		  
		  // prepare the xml document that we'll create
		  me.xmlDoc = new XMLDocument
		  me.xmlDoc.PreserveWhitespace = true
		  me.currXMLItem = me.xmlDoc
		  me.currXMLItem = writeItem (root)
		  me.currXMLItem.SetAttribute "version", me.versionStr
		  
		  // loop over project items
		  try
		    for each item in root.Children (false)
		      me.currXMLItem = writeItem (item)
		      me.currXMLItem.SetAttribute ("type", translate (item, item.tag))
		      me.currXMLItem.SetAttribute ("ID", RBPrjHelper.MyStr(item.id))
		      myProcessItem item // loops over items of a project block
		      me.currXMLItem = me.currXMLItem.Parent
		    next
		    writeLine ()
		  exception exc as RuntimeException
		    if exc isA RBPrjException then
		      reportError (RBPrjException(exc).Message)
		    else
		      reportError ("An unexpected exception occured while exporting to XML")
		    end
		  end
		  
		  if Ubound (me.missingTranslations) >= 0 then
		    reportWarning ("These ""tag"" translations are missing (see notes in the RBPrjTagTranslator module): "+Join(me.missingTranslations,", "))
		  end
		  
		  dim f as FolderItem
		  f = origFileRef.Parent.TrueChild(origFileRef.Name+".xml")
		  RBPrjHelper.DeleteFile f, true
		  me.xmlDoc.SaveXML f
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub myProcessItem(containerItem as RBPrjItem)
		  dim xmlItem as XMLNode
		  dim item as RBPrjItem
		  dim type, lastNonPrintable as Integer
		  dim tag as String
		  dim valueRef as RBPrjDataRef
		  dim children() as RBPrjItem
		  dim isComputedProperty as Boolean
		  
		  children = containerItem.Children (false)
		  
		  if RBPrjHelper.Equal (containerItem.tag, "Ctrl") then
		    // It's a "Control" - we want to sort the properties inside it to match the order the RB IDE uses
		    me.sortProperties children, containerItem.ChildByTag("ccls").dataRef.AsText
		  elseif RBPrjHelper.Equal (containerItem.tag, "PDef") then
		    me.currXMLItem.SetAttribute "Name", containerItem.ChildByTag("name").dataRef.AsText
		    item = containerItem.ChildByTag("PVal")
		    valueRef = item.dataRef
		    if item.type = RBPrjItem.TypeString and not valueRef.IsPrintable() then
		      xmlItem = me.currXMLItem.AppendChild (me.xmlDoc.CreateElement ("Hex"))
		      xmlItem.SetAttribute "bytes", RBPrjHelper.MyStr (valueRef.len)
		      xmlItem.AppendChild me.xmlDoc.CreateTextNode (valueRef.AsHexString)
		    else
		      me.currXMLItem.AppendChild me.xmlDoc.CreateTextNode (item.PrintableValue)
		    end
		    return // no more loop over the children
		  elseif RBPrjHelper.Equal (containerItem.tag, "Prop") then
		    if me.myProcessProperty (containerItem, isComputedProperty) then
		      return // no more loop over the children
		    end
		  end
		  
		  me.indent = me.indent + 1
		  
		  for each item in children
		    type = item.type
		    tag = item.tag
		    valueRef = item.dataRef
		    
		    dim specialName as String
		    
		    if isComputedProperty and RBPrjHelper.Equal (tag, "decl") then
		      isComputedProperty = false
		      specialName = "Declaration" // computed properties uses this name instead of "ItemDeclaration"
		    end
		    
		    if me.suppressedTags.HasKey (RBPrjHelper.Str4ToInt(tag)) then
		      // ignore it
		    elseif type = RBPrjItem.TypeInt then
		      // it's an integer
		      call writeItem (item, valueRef.AsIntString)
		    elseif type = RBPrjItem.TypeDbl then
		      // it's a double
		      call writeItem (item, valueRef.AsDblString)
		    elseif type = RBPrjItem.TypeString then
		      if me.textIsNonPrintable > 0 or not valueRef.IsPrintable() then
		        // it's non-printable text
		        xmlItem = writeItem (item, "", specialName)
		        xmlItem = xmlItem.AppendChild (me.xmlDoc.CreateElement("Hex"))
		        xmlItem.SetAttribute "bytes", RBPrjHelper.MyStr(valueRef.len)
		        xmlItem.AppendChild me.xmlDoc.CreateTextNode (valueRef.AsHexString)
		      else
		        // it's printable text
		        call writeItem (item, valueRef.AsText, specialName)
		      end
		    elseif type = RBPrjItem.TypeRect then
		      xmlItem = writeItem (item, "")
		      xmlItem = xmlItem.AppendChild (me.xmlDoc.CreateElement("Rect"))
		      xmlItem.SetAttribute "left", RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+0))
		      xmlItem.SetAttribute "top", RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+4))
		      xmlItem.SetAttribute "width", RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+8))
		      xmlItem.SetAttribute "height", RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+12))
		    elseif type = RBPrjItem.TypeGroup then
		      lastNonPrintable = me.textIsNonPrintable
		      if RBPrjHelper.Equal (tag, "Icon") then me.textIsNonPrintable = me.textIsNonPrintable + 1
		      me.currXMLItem = writeItem (item)
		      myProcessItem item
		      me.textIsNonPrintable = lastNonPrintable
		      me.currXMLItem = me.currXMLItem.Parent
		    elseif type = RBPrjItem.TypeEncrypted then
		      // it's an encrypted block
		      writeLine ()
		      xmlItem = me.currXMLItem.AppendChild (me.xmlDoc.CreateElement ("EncryptedProjectItem"))
		      xmlItem.SetAttribute "headerbytes", containerItem.dataRef.AsHexString
		      xmlItem = xmlItem.AppendChild (me.xmlDoc.CreateElement("Hex"))
		      xmlItem.SetAttribute "bytes", RBPrjHelper.MyStr(valueRef.len)
		      xmlItem.AppendChild me.xmlDoc.CreateTextNode (valueRef.AsHexString)
		    else
		      // it's something else I don't know yet
		      raiseExc ("unknown value type "+RBPrjHelper.IntToStr4(type)+" passed with tag "+tag)
		    end
		    
		  next
		  
		  me.indent = me.indent - 1
		  writeLine ()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function myProcessProperty(propItem as RBPrjItem, ByRef isComputedProperty as Boolean) As Boolean
		  dim hasMoreInfo as Boolean
		  dim compVal, sharedVal, flags, value, declaration as String
		  dim item, line as RBPrjItem
		  
		  isComputedProperty = false
		  
		  // see if we have the new style Property items with optional comments or code
		  declaration = propItem.ChildByTag("decl").PrintableValue
		  for each item in propItem.Children (false)
		    select case item.tag
		    case "Enco", "decl"
		      // ok
		    case "shrd"
		      sharedVal = item.PrintableValue
		    case "Comp"
		      compVal = item.PrintableValue
		    case "flag"
		      flags = item.PrintableValue
		    case "sorc"
		      for each line in item.Children (false)
		        value = line.PrintableValue
		        if value <> "" and value <> Trim(declaration) then
		          hasMoreInfo = true
		          exit
		        end
		      next
		    case "CPrg", "CPrs"
		      isComputedProperty = true
		      hasMoreInfo = true
		    else
		      hasMoreInfo = true
		    end
		    if hasMoreInfo then exit
		  next
		  
		  if isComputedProperty then
		    me.currXMLItem.Name = "ComputedProperty"
		  end
		  
		  if hasMoreInfo then
		    // we've decided to export all items of this group after all
		    if me.optionShortProp then
		      // let the user know that he's losing some information in this backward compatible output
		      reportWarning ("Reduced information: "+describeItem(propItem,declaration))
		    end
		    // let's have another run at this group, this time without the collection:
		    return false // -> tell caller to pretend this call did not happen because we've had another run at it
		  end
		  
		  // export just the declaration and name in old (RB 5.5) format
		  me.currXMLItem.AppendChild me.xmlDoc.CreateTextNode (declaration)
		  me.currXMLItem.SetAttribute "Flags", flags
		  me.currXMLItem.SetAttribute "Compatibility", compVal
		  if sharedVal.LenB > 0 and sharedVal <> "0" then
		    me.currXMLItem.SetAttribute "Shared", "true"
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub readPropOrders()
		  dim s, lines() as String
		  
		  // determine the line delimiters of the PropertyLists:
		  if InStr(RBPrjHelper.PropertyLists, chr(13)+chr(10)) > 0 then
		    s = chr(13)+chr(10)
		  elseif InStr(RBPrjHelper.PropertyLists, chr(13)) > 0 then
		    s = chr(13)
		  else
		    s = chr(10)
		  end
		  
		  me.propOrders = new Dictionary
		  
		  lines = RBPrjHelper.PropertyLists.Split(s)
		  for each s in lines
		    if s <> "" then
		      me.propOrders.Value(NthField(s,":",1)) = NthField(s,":",2)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetOutputFile(outFile as FolderItem)
		  // This fileref overrides the one passed in ProcessHeader
		  
		  me.outFileRef = outFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub sortProperties(items() as RBPrjItem, controlName as String)
		  // "items" contains an array of all Control items
		  // Part of them are "PDef" group items - only these should be sorted, based on their containing "name" items
		  
		  if not me.propOrders.HasKey (controlName) then
		    return
		  end
		  
		  // Get the desired order of the PDef items:
		  dim order() as String
		  order = me.propOrders.Value(controlName).StringValue.Split (",")
		  
		  // Now we give each item a number representing its designation relative position in the ordered list
		  // items before the PDef range below 100, PDef items between 100 and 1000, other items above 1000
		  
		  dim otherOfs, idx as Integer
		  dim item as RBPrjItem
		  for idx = 0 to Ubound(items)
		    item = items(idx)
		    if RBPrjHelper.Equal (item.tag, "PDef") then
		      if otherOfs = 0 then otherOfs = 1000
		      item.theOrderValue = 100 + order.IndexOf(item.ChildByTag("name").PrintableValue)
		      if item.theOrderValue = 99 then item.theOrderValue = item.theOrderValue + 900
		    else
		      item.theOrderValue = otherOfs + idx
		    end
		  next
		  
		  TTsArraySorter.SortValueArray items, true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function translate(item as RBPrjItem, key as String) As String
		  dim v as Variant
		  dim dict as Dictionary
		  dim tagn as Integer
		  dim defaultResult, origKey as String
		  dim itemPar as RBPrjItem
		  
		  origKey = key
		  itemPar = item
		  dict = RBPrjTagTranslator.Translations
		  defaultResult = ""
		  do
		    if itemPar <> nil then itemPar = itemPar.parent
		    tagn = RBPrjHelper.Str4ToInt(key)
		    defaultResult = lookup (dict, tagn, defaultResult)
		    if itemPar <> nil then
		      v = lookup (dict, -tagn, nil) // look for group-specific names first
		    else
		      v = nil
		    end
		    if v = nil then
		      // we have the final translation string -> return it
		      if defaultResult <> "" then
		        return defaultResult
		      else
		        if me.missingTranslations.IndexOf(origKey) < 0 then me.missingTranslations.Append origKey
		        return "unknown_"+origKey
		      end
		    end
		    // must be a Dictionary then
		    dict = v
		    key = itemPar.tag
		  loop
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function writeItem(item as RBPrjItem, value as String = "", specialName as String = "") As XMLNode
		  dim transtag as String
		  dim result as XMLNode
		  
		  if specialName.LenB > 0 then
		    transtag = specialName
		  elseif item.type = RBPrjItem.TypeBlock then
		    transtag = translate (item, RBPrjHelper.IntToStr4(item.type))
		  else
		    transtag = translate (item, item.tag)
		  end
		  
		  writeLine ()
		  result = me.currXMLItem.AppendChild (me.xmlDoc.CreateElement (transtag))
		  result.AppendChild (me.xmlDoc.CreateTextNode (value))
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub writeLine()
		  writeLine (me.currXMLItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub writeLine(item as XMLNode)
		  item.AppendChild (me.xmlDoc.CreateTextNode (EndOfLine+Left("                                            ", me.indent)))
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		// Similar to RBPrjXMLBuilder, but with two differences:
		//
		// 1. It creates XML files instead of just creating a XMLDocument in memory. This
		//     is necessary so that we can get individual XML files for external items if we want that.
		//
		// 2. It handles a few special cases better (which the XMLBuilder should as well, but it
		//     has not been kept up-to-date, unfortunately).
		//
		// 3. The sorting is supposed to create XML files that fully match those created by the RB IDE
		//     in their order of Property items. Unfortunately, the order is still wrong, and I can't figure
		//     out how to fix that (functionally, it does not matter, but it would be nice if the order matches
		//     so that it's easier to compare this output with RB's XML files for verification).
	#tag EndNote


	#tag Property, Flags = &h21
		Private currXMLItem As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private indent As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private missingTranslations() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private optionShortProp As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private outFileRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private propOrders As Dictionary
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
