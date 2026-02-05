#tag Class
Protected Class RBPrjItemsTreeBuilder
Inherits RBPrjProcessingHelper
Implements RBPrjProcessing
	#tag Method, Flags = &h21
		Private Function addItem(type as Integer, tag as String, id as Integer, dataRef as RBPrjDataRef, isContainer as Boolean) As RBPrjItem
		  dim item as RBPrjItem
		  item = new RBPrjItem (me.currItemContainer, type, tag, dataRef, id)
		  if isContainer then
		    me.currItemContainer = item
		  end
		  return item
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockEnter(tag as String, id as Integer, header as RBPrjDataRef) As Boolean
		  // let's clear the block length because it would only be in the way all the time:
		  header.ptr.Long(header.ofs+16) = 0
		  
		  // also, RB 5.5 appears to leave garbage in the last 8 bytes of the header, so clear them as well
		  // but only if it's not encrypted
		  if header.ptr.Long(header.ofs+20) = 0 then
		    header.ptr.Long(header.ofs+24) = 0
		    header.ptr.Long(header.ofs+28) = 0
		  end
		  
		  call addItem (RBPrjItem.TypeBlock, tag, id, header, true)
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlockLeave(tag as String, id as Integer, optionalName as String, extFileRef as FolderItem)
		  dim name as String
		  dim v as Variant
		  
		  name = optionalName
		  if name = "" then
		    if getChildValue (Array ("Name"), me.currItemContainer, false, v) then
		      name = v
		    end
		  end
		  
		  // have this block ordered in the root obj by its name
		  if name <> "" then
		    me.currItemContainer.theOrderValue = tag + name
		  else
		    me.currItemContainer.theOrderValue = tag + Right ("000"+Str(me.currItemContainer.OwnIndex()+1), 4)
		  end
		  
		  if me.parent <> nil then
		    // we're an external item, with just one block. Add this tree to the main prj's tree now:
		    me.tree.SetExternalObjectName (name)
		    me.parent.tree.AddExternalItem (name, me.tree)
		  end
		  
		  me.currItemContainer = me.currItemContainer.parent
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  // does only create a "virgin" clone, without the data that may be assembled by the processing!
		  dim p as RBPrjItemsTreeBuilder
		  p = new RBPrjItemsTreeBuilder ()
		  p.parent = me
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  super.Constructor
		  
		  dim s as String
		  me.sortableGroupTags = new Dictionary
		  s = "PDef,VwBh,VwPr,Cnst,CIns,HIns,Prop,Meth,XMth,Dmth,Hook,Prop,Note,fTyp"
		  for each s in s.Split(",")
		    me.sortableGroupTags.Value (s) = true
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalsProcessingFinished()
		  me.parent = nil // releases possible circular refs
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getChildValue(tagNames() as String, container as RBPrjItem, useIdxOtherwise as Boolean, ByRef v as Variant) As Boolean
		  dim s as String
		  dim item as RBPrjItem
		  if container.HasChildren() then
		    for each s in tagNames
		      item = container.ChildByTag(s)
		      if item <> nil then
		        v = item.PrintableValue // returns a string
		        return true
		      end
		    next
		  end
		  if useIdxOtherwise then
		    v = container.OwnIndex()+1
		  else
		    v = 0
		  end
		  // returns a number
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupEnter(tag as String, id as Integer)
		  call addItem (RBPrjItem.TypeGroup, tag, id, nil, true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupLeave(tag as String, id as Integer)
		  assert (me.currItemContainer.tag = tag, "internal error with group stack")
		  
		  // have this group ordered by its name or whatever else works as an identifier
		  //
		  // note: one might want to use "CBix" here as a sorter between "Name" and "name" - not sure, though, if this is right,
		  //   because that index is not the control index but the index into Control Behavior, and this means that the Ctrl
		  //   items must probably not be reordered or they get their own index changed (because their index is given by their
		  //   order of appearance and not by an explicit value)
		  dim name as String
		  dim v as Variant
		  if me.sortableGroupTags.HasKey (me.currItemContainer.tag) and getChildValue (Array ("Name", "name", "decl"), me.currItemContainer, false, v) then
		    if RBPrjHelper.IsOneOf (tag, Array ("Meth", "XMth", "Dmth")) then
		      tag = "Meth"
		    end if
		    name = v
		    me.currItemContainer.theOrderValue = tag + name
		  else
		    me.currItemContainer.theOrderValue = tag + Right ("000"+Str(me.currItemContainer.OwnIndex()+1), 4)
		  end
		  
		  me.currItemContainer = me.currItemContainer.parent
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemsTree() As RBPrjItemsTree
		  return me.tree
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFinished()
		  assert (me.currItemContainer = me.tree.RootItem, "internal error: tree in wrong state")
		  me.currItemContainer = nil
		  
		  me.parent = nil // better clear this here again to avoid circular refs that could lead to leaks
		  
		  Ready (me.tree, me.inputFileRef)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessHeader(dataRef as RBPrjDataRef, results as RBPrjParseResults, inputFileRef as FolderItem)
		  assert (me.tree = nil, "tree has already been created", inputFileRef)
		  me.tree = new RBPrjItemsTree(new RBPrjItem (nil, RBPrjItem.TypeProject, RBPrjHelper.IntToStr4(RBPrjItem.TypeProject)), inputFileRef)
		  
		  me.SetParseResultsObj (results)
		  me.currItemContainer = me.tree.RootItem
		  me.currItemContainer.SetData (dataRef)
		  me.inputFileRef = inputFileRef
		  
		  // just a little safety check:
		  dim s as String
		  s = "Ctrl,CBhv,MItm,OTab"
		  for each s in s.Split(",")
		    assert (not me.sortableGroupTags.HasKey(s), "must not be reordered: "+s)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessItem(type as Integer, tag as String, valueRef as RBPrjDataRef)
		  dim item as RBPrjItem
		  
		  item = addItem (type, tag, -1, valueRef, false)
		  
		  // Have this leaf item ordered by its index in the parent's array of children (i.e. keep its original order)
		  // Note: all non-leaf items (i.e. groups) will be ordered behind these leaves
		  item.theOrderValue = item.OwnIndex
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Ready(prjTree as RBPrjItemsTree, origFileRef as FolderItem)
	#tag EndHook


	#tag Note, Name = About
		This class collects all data into a tree of RBPrjItem objects
		
		It also predetermines the items' values for later sorting by setting their "theOrderValue" property
		
		This tree ('RBPrjItemsTree') then has the same structure as the original project file had
	#tag EndNote

	#tag Note, Name = Note on sorting (ordered items)
		When the functions in this class add items to the tree, those items' value for a
		possible sorting later, e.g. via RBPrjItem.Children(true), is predetermined here
		by the insertion code already.
		
		This means that if one modifies the items in the tree later, their ordering position
		will not be adequately updated. I should eventually change this, but for now the
		solution would be to use this Builder class to recreate a new tree from the modified
		one to get a proper sorting again.
	#tag EndNote


	#tag Property, Flags = &h21
		Private currItemContainer As RBPrjItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private inputFileRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected parent As RBPrjItemsTreeBuilder
	#tag EndProperty

	#tag Property, Flags = &h21
		Private sortableGroupTags As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected tree As RBPrjItemsTree
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
