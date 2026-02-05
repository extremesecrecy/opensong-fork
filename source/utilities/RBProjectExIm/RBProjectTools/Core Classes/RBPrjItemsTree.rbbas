#tag Class
Protected Class RBPrjItemsTree
Implements RBPrjParsing
	#tag Method, Flags = &h0
		Sub AddExternalItem(name as String, item as RBPrjItemsTree)
		  if me.theExternals = nil then
		    me.theExternals = new Dictionary
		  end
		  RBPrjHelper.Assert (not me.theExternals.HasKey (name), "duplicate externals", "AddExternalItem")
		  me.theExternals.Value (name) = item
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function addRelPath(processor as RBPrjProcessing, results as RBPrjParseResults, name as String) As FolderItem
		  dim relPath as String
		  dim i as Integer
		  dim dir, f, f2 as FolderItem
		  
		  for i = 0 to Ubound (me.extItemRefTags)
		    if me.extItemRefTags(i) = "ppth" then
		      // take it
		      relPath = me.extItemRefValues(i)
		      exit
		    end
		  next
		  
		  dir = me.origFileRef.Parent
		  
		  if relPath = "" then
		    // Search for the file using the various path references given in the Block
		    RBPrjHelper.LocateExternalFile (dir, me.extItemRefTags, me.extItemRefValues, f, f2)
		    if f = nil then
		      f = f2
		    end
		    if f = nil then
		      results.AppendErrMsg "External item """+name+""" entry has no valid path"
		      return nil
		    end
		    relPath = dir.CreateRelativePath (f, "\")
		    RBPrjHelper.Assert (Left (relPath, 1) = "\", "bad relPath format", "addRelPath", f)
		    relPath = Mid (relPath, 2) // remove the leading separator
		  else
		    f = dir.ResolveRelativePath ("\"+relPath, false)
		  end
		  
		  processor.ProcessItem (RBPrjItem.TypeString, "ppth", new RBPrjDataRef (relPath))
		  
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanOpen(f as FolderItem) As Boolean
		  return f = nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanParseExternals() As Boolean
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsParsing(f as FolderItem) As RBPrjParsing
		  RBPrjHelper.RaiseExc ("unexpected call", "RBPrjItemsTree.CloneForExternalsParsing", f) //there's no use for this here as Parse() handles externals implicitly
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rootItem as RBPrjItem, origFileRef as FolderItem)
		  me.Constructor
		  me.root = rootItem
		  me.origFileRef = origFileRef
		  
		  // these are editor state entry tags from RB 5.5.5 and earlier (not used in RB 2005 and later any more)
		  // that can be removed by a parse option:
		  dim s as String
		  me.editorItemTags = new Dictionary
		  s = "rEdt,eSpt,bPGp,bPEl,scKy,lstH,lstV,stsr,stsc,ndsr,ndsc"
		  for each s in s.Split(",")
		    me.editorItemTags.Value (s) = true
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  if me.root <> nil then
		    me.root.Release
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub doRemoveDuplicateSupers(theChildren() as RBPrjItem)
		  dim childIdx as Integer
		  dim item, lastSuper, diff1, diff2 as RBPrjItem
		  
		  for childIdx = Ubound(theChildren) downTo 0
		    item = theChildren(childIdx)
		    if RBPrjHelper.Equal (item.tag, "PDef") and RBPrjHelper.Equal (item.ChildByTag("name").PrintableValue, "Super") then
		      if lastSuper = nil then
		        lastSuper = item
		      else
		        if item.Equals (lastSuper, diff1, diff2) then
		          theChildren.Remove childIdx
		        end
		      end
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExternalByName(itemName as String) As RBPrjItemsTree
		  if me.theExternals <> nil then
		    if me.theExternals.HasKey (itemName) then
		      return me.theExternals.Value (itemName)
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Externals() As RBPrjItemsTree()
		  dim items() as RBPrjItemsTree
		  dim tree as RBPrjItemsTree
		  
		  if me.theExternals <> nil then
		    #if RBVersion < 2005 then
		      dim i as Integer
		      for i = 0 to me.theExternals.Count-1
		        tree = me.theExternals.Value (me.theExternals.Key(i))
		        items.Append tree
		      next
		    #else
		      for each tree in me.theExternals.Values
		        items.Append tree
		      next
		    #endif
		  end
		  return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileRef() As FolderItem
		  // returns just the main project's file reference
		  return me.origFileRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileRefs() As FolderItem()
		  // returns the main project's file reference and those of its external items
		  
		  dim prjItemFiles() as FolderItem
		  dim tree as RBPrjItemsTree
		  
		  prjItemFiles.Append me.FileRef()
		  
		  if me.theExternals <> nil then
		    #if RBVersion < 2005 then
		      dim i as Integer
		      for i = 0 to me.theExternals.Count-1
		        tree = me.theExternals.Value (me.theExternals.Key(i))
		        prjItemFiles.Append tree.FileRef()
		      next
		    #else
		      for each tree in me.theExternals.Values
		        prjItemFiles.Append tree.FileRef()
		      next
		    #endif
		  end
		  
		  return prjItemFiles
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateExternalItem(prjItemName as String, fileName as String, kinds() as String, values() as String, ByRef fOut as FolderItem) As Boolean
		  RBPrjHelper.RaiseExc ("unexpected call", "RBPrjItemsTree.LocateExternalItem") //there's no use for this here as Parse() handles externals implicitly
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(item as FolderItem) As Boolean
		  if item <> nil then
		    RBPrjHelper.RaiseExc ("Open() not supported here", "RBPrjItemsTree")
		  end
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(processor as RBPrjProcessing, results as RBPrjParseResults, externalsHandling as Integer, parseOpts as RBPrjItemsTreeParseOptions)
		  RBPrjHelper.Assert (externalsHandling <> RBPrjSupport.IncludeExternals, "'IncludeExternals' is unsupported", "RBPrjItemsTree.Parse")
		  
		  if parseOpts = nil then
		    parseOpts = new RBPrjItemsTreeParseOptions
		  end
		  
		  me.traverseItem processor, results, externalsHandling, me.root, 0, parseOpts
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RootItem() As RBPrjItem
		  return me.root
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExternalObjectName(objName as String)
		  me.theExtObjName = objName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub traverseChildren(processor as RBPrjProcessing, results as RBPrjParseResults, children() as RBPrjItem, parseOpts as RBPrjItemsTreeParseOptions)
		  // traverse the array
		  dim i as Integer
		  for i = 0 to Ubound(children)
		    traverseItem (processor, results, 0, children(i), i, parseOpts)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub traverseExternals(processor as RBPrjProcessing, results as RBPrjParseResults, parseOpts as RBPrjItemsTreeParseOptions)
		  dim tree as RBPrjItemsTree
		  dim extProcessor as RBPrjProcessing
		  
		  if me.theExternals <> nil then
		    #if RBVersion < 2005 then
		      dim i as Integer
		      for i = 0 to me.theExternals.Count-1
		        tree = me.theExternals.Value (me.theExternals.Key(i))
		        extProcessor = processor.CloneForExternalsProcessing (tree.origFileRef)
		        try
		          tree.Parse extProcessor, results, RBPrjSupport.IgnoreExternals, parseOpts
		        catch exc1
		          extProcessor.ExternalsProcessingFinished()
		          raise exc1
		        end
		        extProcessor.ExternalsProcessingFinished()
		      next
		    #else
		      for each tree in me.theExternals.Values
		        extProcessor = processor.CloneForExternalsProcessing (tree.origFileRef)
		        try
		          tree.Parse extProcessor, results, RBPrjSupport.IgnoreExternals, parseOpts
		        catch exc2
		          extProcessor.ExternalsProcessingFinished()
		          raise exc2
		        end
		        extProcessor.ExternalsProcessingFinished()
		      next
		    #endif
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub traverseItem(processor as RBPrjProcessing, results as RBPrjParseResults, externalsHandling as Integer, item as RBPrjItem, itemIdx as Integer, parseOpts as RBPrjItemsTreeParseOptions)
		  dim nameItem as RBPrjItem
		  dim name as String
		  dim theChildren() as RBPrjItem
		  dim f as FolderItem
		  
		  if item.type = RBPrjItem.TypeProject then
		    
		    // outmost level: the entire prj file
		    
		    processor.ProcessHeader (me.root.dataRef, results, me.origFileRef)
		    
		    theChildren = item.Children (parseOpts.orderedBlocks)
		    traverseChildren (processor, results, theChildren, parseOpts)
		    
		    if externalsHandling = RBPrjSupport.SeparateExternals then
		      // Note: we must perform the externals parsing _before_ we call ProcessFinished for the main prj because
		      //   some parsers do some final cleanup there and expect that externals have been processed by then
		      traverseExternals processor, results, parseOpts
		    end
		    
		    processor.ProcessFinished ()
		    
		  elseif item.type = RBPrjItem.TypeBlock then
		    
		    // next level: items in a project (classes, modules, windows, menubar, etc.)
		    
		    nameItem = item.ChildByTag("Name") // first search for name in Block, only then take default
		    if nameItem <> nil then
		      name = nameItem.PrintableValue
		    end
		    if name = "" then
		      name = me.theExtObjName
		    end
		    
		    f = nil
		    if processor.BlockEnter (item.tag, item.id, item.dataRef) then
		      redim me.extItemRefTags(-1)
		      redim me.extItemRefValues(-1)
		      me.reducePaths = parseOpts.reduceExternalPaths and not RBPrjHelper.IsOneOf (item.tag, Array ("pObj", "pVew", "Proj", "pFTy", "pMnu", "pFol", "pUIs"))
		      me.foundPaths = false
		      theChildren = item.Children (parseOpts.orderedGroups)
		      traverseChildren (processor, results, theChildren, parseOpts)
		      if me.reducePaths and (me.foundPaths or (item.tag = "pExt")) then
		        f = addRelPath (processor, results, name)
		        me.reducePaths = false
		      end
		    end
		    
		    processor.BlockLeave (item.tag, item.id, name, f)
		    
		  elseif item.type = RBPrjItem.TypeGroup then
		    
		    // inner levels: groupings inside the prj items (source code, editor info, etc.)
		    
		    if parseOpts.removeEditingInfos and me.editorItemTags.HasKey (item.tag) then
		      // filter this group
		    else
		      processor.GroupEnter (item.tag, item.id)
		      theChildren = item.Children (parseOpts.orderedGroups)
		      if parseOpts.removeDuplicateSupers and RBPrjHelper.Equal (item.tag, "Ctrl") then
		        // the RB IDE often leaves duplicate "Super" items in here - remove them
		        me.doRemoveDuplicateSupers theChildren
		      end
		      traverseChildren (processor, results, theChildren, parseOpts)
		      processor.GroupLeave (item.tag, item.id)
		    end
		    
		  else
		    
		    // an individual item
		    
		    if item.HasChildren() then
		      raise new RBPrjException ("internal error: non-container has children", "RBPrjItemsTree")
		    end
		    
		    if parseOpts.removeEditingInfos and me.editorItemTags.HasKey (item.tag) then
		      // filter this item
		    elseif (me.reducePaths and RBPrjHelper.IsOneOf (item.tag, Array ("ppth", "path", "alis"))) and (item.parent is nil or not RBPrjHelper.Equal(item.parent.tag, "BScf")) then
		      // this is a path item that we need to remove for now
		      me.extItemRefTags.Append item.tag
		      me.extItemRefValues.Append item.dataRef.AsText
		      me.foundPaths = true
		    else
		      processor.ProcessItem (item.type, item.tag, item.dataRef)
		    end
		    
		  end
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		// Used as a container to hold the tree of RBPrjItems, which describe the entire project
		// in a general format (versus the specific binary and XML file formats)
		//
		// This extra 'tree' class (above the 'RBPrjItem' objs) is necessary so that we get automatic destruction
		// of the tree when this obj is destructed, because the RBPrjItems alone have circular refs that
		// prevent automatic destruction
	#tag EndNote


	#tag Property, Flags = &h21
		Private editorItemTags As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private extItemRefTags() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private extItemRefValues() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private foundPaths As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private origFileRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private reducePaths As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private root As RBPrjItem
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			key: name
			value: RBPrjItemsTree
		#tag EndNote
		Private theExternals As Dictionary
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
