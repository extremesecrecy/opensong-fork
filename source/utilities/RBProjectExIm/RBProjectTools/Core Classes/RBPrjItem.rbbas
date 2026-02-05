#tag Class
Protected Class RBPrjItem
Implements TTsSortableValue
	#tag Method, Flags = &h0
		Function ChildByIndex(index_0 as Integer) As RBPrjItem
		  if index_0 >= 0 and index_0 <= Ubound(me.myChildren) then
		    return me.myChildren (index_0)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildByTag(tag as String) As RBPrjItem
		  dim item as RBPrjItem
		  for each item in me.myChildren
		    if StrComp (tag, item.tag, 0) = 0 then
		      return item
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Children(ordered as Boolean = False, forceSort as Boolean = False) As RBPrjItem()
		  // see the "sorting..." note about the 'ordered' parameter
		  
		  if ordered and Ubound (me.myChildren) > 0 then
		    if forceSort or Ubound (me.mySortedChildren) < 0 then
		      me.mySortedChildren = me.ClonedChildren(false)
		      TTsArraySorter.SortValueArray me.mySortedChildren, true
		    end
		    return me.mySortedChildren
		  else
		    return me.myChildren
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ClonedChildren(ordered as Boolean) As RBPrjItem()
		  // see the "sorting..." note about the 'ordered' parameter
		  
		  dim clones(), item as RBPrjItem
		  
		  for each item in me.Children(ordered)
		    clones.Append item
		  next
		  
		  return clones
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(parent as RBPrjItem, type as Integer, tag as String, data as RBPrjDataRef = nil, id as Integer = - 1)
		  me.Constructor
		  me.parent = parent
		  me.type = type
		  me.tag = tag
		  me.dataRef = data
		  me.id = id
		  if parent <> nil then
		    parent.myChildren.Append me
		    me.origIndex = Ubound(parent.myChildren)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(item as RBPrjItem, ByRef diffSelf as RBPrjItem, ByRef diffArg as RBPrjItem) As Boolean
		  dim childIdx as Integer
		  dim s1, s2 as MemoryBlock
		  
		  // for speed, we compare the fasted accessible values first:
		  if me.type <> item.type or Ubound(me.myChildren) <> Ubound(item.myChildren) or (me.dataRef=nil) <> (item.dataRef=nil) then
		    diffSelf = me
		    diffArg = item
		    return false
		  end
		  if item.parent <> nil and item.parent.parent = nil then
		    // this is a "Block" item inside the prj's root. Only here the "id" is significant
		    if me.id <> item.id then
		      diffSelf = me
		      diffArg = item
		      return false
		    end
		  end
		  if StrComp (me.tag, item.tag, 0) <> 0 then
		    diffSelf = me
		    diffArg = item
		    return false
		  end
		  if me.dataRef <> nil and StrComp (me.dataRef.AsBinaryString, item.dataRef.AsBinaryString, 0) <> 0 then
		    diffSelf = me
		    diffArg = item
		    s1 = me.dataRef.AsBinaryString
		    s2 = item.dataRef.AsBinaryString
		    return false
		  end
		  // finally, compare the children - we expect them in the same order, otherwise we won't see them as equal (which is good enough to detect duplicate "Super" entries in Controls)
		  for childIdx = 0 to Ubound(me.myChildren)
		    if not me.myChildren(childIdx).Equals (item.myChildren(childIdx), diffSelf, diffArg) then
		      return false
		    end
		  next
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasChildren() As Boolean
		  return Ubound(me.myChildren) >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPrintable() As Boolean
		  return me.dataRef.IsPrintable()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OwnIndex() As Integer
		  // returns index of itself in the unsorted array with its siblings
		  
		  'dim n as Integer
		  'n = me.parent.myChildren.IndexOf (me)
		  'if n < 0 then
		  'raise new RBPrjException ("Can not locate self in parent's children", "RBPrjItem", nil)
		  'end
		  'return n
		  
		  return me.origIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrintableValue() As String
		  dim s as String, i as Integer
		  
		  if me.dataRef = nil then
		    return ""
		  elseif me.type = RBPrjItem.TypeInt then
		    return me.dataRef.AsIntString
		  elseif me.type = RBPrjItem.TypeDbl Then
		    Return me.dataRef.AsDblString
		  elseif me.type = RBPrjItem.TypeString and me.dataRef.IsPrintable then
		    return me.dataRef.AsText
		  elseif me.type = RBPrjItem.TypeRect then
		    for i = 0 to 3
		      if i > 0 then
		        s = s + ","
		      end
		      s = s + RBPrjHelper.MyStr(me.dataRef.ptr.Long(me.dataRef.ofs+i*4))
		    next
		    return s
		  elseif me.type = RBPrjItem.TypePadding then
		    return "****..."
		  else
		    return "$"+me.dataRef.AsHexString
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  dim item as RBPrjItem
		  for each item in me.myChildren
		    item.Release
		  next
		  me.parent = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(dataRef as RBPrjDataRef)
		  me.dataRef = dataRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SortValue() As Variant
		  return me.theOrderValue
		End Function
	#tag EndMethod


	#tag Note, Name = Sorting of items
		Both the project items (blocks) and items inside (groups) them can be sorted
		upon request by the 'ordered' parameter in some of the functions here.
		
		Sorting makes sense wherever you want to find duplicate entries or
		compare a set of entries to a similar set, perhaps of a different version of
		the same project. The sorting is necessary for these purposes because the
		IDE sometimes changes the order of items randomly. For instance, the
		"PDef" (Property) entries often get reordered when changing a project
		in RB 2005 and 2006r1.
		
		See also the "Note on sorting" in RBPrjItemsTreeBuilder!
		
		
		Sorting root items (project items)
		-------------------------------
		
		When requesting a sorted list of children of the root (which would be the
		"block" items), these children are simply ordered by a concatenated string
		of their tag and their containing 'name' tag's value, or, if there is not such
		tag inside the block, by their original order in the tree.
		
		Sorting these blocks does still preserve the project integrity, however, it
		changes the order how the project items (modules, classes, windows, etc)
		appear in the "Project" tab's list inside the IDE. So, be careful not to use
		this reordered list to save a write project file unless you want to shuffle
		the user's carefully arranged items around. However, this option is useful
		when you want to compare the contents of a project with another, so you
		can see the difference in code even if the user just changed the visual
		order of the items in the project.
		
		Sorting deeper items (group items)
		-------------------------------
		
		When requesting a sorted list of deeper items, the sorting is more complicated:
		
		Some items must not be reordered because their order has an important
		meaning, most times by implicitly specifying an index to the item. This is
		the case, for instance, for Controls, ControlBehaviors and MenuItems. There
		may be others as well.
		
		Because of this, only certain items will be sorted, i.e. those that are known
		not ever to rely on their order.
		
		These are the rules applied for determining which items can be reordered:
		
		1. Leaf items are never reordered
		2. Non-leaf items (= group items) are only considered for sorting if their
		tag code is one of the known ones not to rely on a fixed order.
		3. Group items that are considered for sorting will be reordered amoung
		themselves, i.e. amoung those of the same tag code, only.
		4. Reordered items will be sorted in after non-reordered items, and be
		sorted by their tags
		
		Example
		--------
		
		Original (unsorted):
		
		  name: Foo
		  clss: FooClass
		  PDef: { name: item1; ... }
		  PDef: { name: item2; ... }
		  Meth: { name: method2; ... }
		  Meth: { name: method1; ... }
		  CBix: 0
		
		Sorted:
		
		  name: Foo
		  clss: FooClass
		  CBix: 0
		  Meth: { name: method1; ... }
		  Meth: { name: method2; ... }
		  PDef: { name: item1; ... }
		  PDef: { name: item2; ... }
		
		Here, "name", "clss" and "CBix" were not sorted, while the contents of
		"Meth" and "PDef" were sorted, as well as Meth entries got sorted before
		PDef items.
		
		The entire classification for this sorting is happening in RBPrjItemsTreeBuilder (see its Constructor)
	#tag EndNote


	#tag Property, Flags = &h0
		dataRef As RBPrjDataRef
	#tag EndProperty

	#tag Property, Flags = &h0
		id As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myChildren(-1) As RBPrjItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mySortedChildren(-1) As RBPrjItem
	#tag EndProperty

	#tag Property, Flags = &h0
		origIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		parent As RBPrjItem
	#tag EndProperty

	#tag Property, Flags = &h0
		tag As String
	#tag EndProperty

	#tag Property, Flags = &h0
		theOrderValue As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		type As Integer
	#tag EndProperty


	#tag Constant, Name = TypeBlock, Type = Double, Dynamic = False, Default = \"1114402667", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeDbl, Type = Double, Dynamic = False, Default = \"1147300896", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeEncrypted, Type = Double, Dynamic = False, Default = \"1315140217", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeEOF, Type = Double, Dynamic = False, Default = \"1162823201", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeGroup, Type = Double, Dynamic = False, Default = \"1198683504", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeGroupEnd, Type = Double, Dynamic = False, Default = \"1164862535", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeInt, Type = Double, Dynamic = False, Default = \"1231975456", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypePadding, Type = Double, Dynamic = False, Default = \"1348559982", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeProject, Type = Double, Dynamic = False, Default = \"1382171206", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeRect, Type = Double, Dynamic = False, Default = \"1382376308", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeString, Type = Double, Dynamic = False, Default = \"1400140398", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="id"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
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
			Name="origIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tag"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="type"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
