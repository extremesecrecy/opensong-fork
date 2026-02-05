#tag Class
Protected Class RBPrjIdents
	#tag Method, Flags = &h21
		Private Sub addGlobals(root as RBPrjObjEntity)
		  dim item as RBPrjObjEntity
		  
		  for each item in root.Children
		    
		    select case item.type
		      
		    case RBPrjObjEntity.TypeModule
		      addItems (nil, item.Children, true)
		      addItems (item, item.Children, false)
		      
		    case RBPrjObjEntity.TypeClass, RBPrjObjEntity.TypeWindow, RBPrjObjEntity.TypeContainerControl, RBPrjObjEntity.TypeInterface
		      addMember (nil, item)
		      addItems (item, item.Children, false)
		      
		    end
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addItems(classItem as RBPrjObjEntity, items() as RBPrjObjEntity, onlyPublic as Boolean)
		  dim item as RBPrjObjEntity
		  
		  for each item in items
		    if item.Type <> RBPrjObjEntity.TypeNote and item.Type <> RBPrjObjEntity.TypeControlBehavior then
		      if not onlyPublic or item.Flags = 0 then
		        addMember (classItem, item)
		      end if
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addMember(classItem as RBPrjObjEntity, memberRef as RBPrjObjEntity, memberName as String = "")
		  // @param classItem pass nil for global scope
		  // @param memberName: if not provided, then memberRef.Name will be used
		  
		  dim theClass as RBPrjIdentContainer
		  dim theItem as Object
		  dim theContainer as RBPrjIdentContainer
		  dim className as String
		  
		  if classItem = nil then
		    // globals
		  else
		    className = classItem.Name
		  end
		  
		  theClass = classByName (className)
		  if theClass = nil then
		    theClass = new RBPrjIdentContainer (className, classItem)
		    me.classes.Value (className) = theClass
		  end
		  
		  if memberName = "" then
		    memberName = memberRef.Name
		    if memberName = "" then
		      raise new RBPrjException ("memberRef.Name empty", "RBPrjIdents")
		    end
		  end
		  
		  if theClass.Members.HasKey (memberName) then
		    theItem = theClass.Members.Value (memberName)
		    if theItem isA RBPrjObjEntity then
		      if theItem <> memberRef then
		        // turn the single item into a container holding both the old and the new item
		        theContainer = new RBPrjIdentContainer (memberName, nil)
		        theContainer.Members.Value (theItem) = theItem
		        theContainer.Members.Value (memberRef) = memberRef
		      end if
		    else
		      theContainer = RBPrjIdentContainer (theItem)
		      theContainer.Members.Value (memberRef) = memberRef
		      'we could detect collisions if we'd use a different key, such as item.Declaration: raise new RBPrjException ("memberRef.Name collision")
		    end if
		  else
		    theClass.Members.Value (memberName) = memberRef
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllClassNames() As String()
		  dim theClass as RBPrjIdentContainer
		  dim i, n as Integer
		  dim result() as String
		  
		  n = me.classes.Count-1
		  for i = 0 to n
		    theClass = me.classes.Value(me.classes.Key(i))
		    result.Append theClass.Name
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllIdentNames(className as String) As Variant()
		  dim theClass as RBPrjIdentContainer
		  
		  theClass = classByName (className)
		  if theClass <> nil then
		    #if RBVersion >= 6
		      return theClass.Members.Keys
		    #else
		      dim i, n as Integer
		      dim arr() as Variant
		      n = theClass.Members.Count-1
		      for i = 0 to n
		        arr.Append theClass.Members.Key(i)
		      next
		      return arr
		    #endif
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllIdents(className as String) As RBPrjObjEntity()
		  dim theClass as RBPrjIdentContainer
		  dim items() as RBPrjObjEntity
		  dim ident, ident2 as Variant
		  dim i, n, i2, n2 as Integer
		  dim d, d2 as Dictionary
		  
		  theClass = classByName (className)
		  if theClass <> nil then
		    d = theClass.Members
		    n = d.Count-1
		    for i = 0 to n
		      ident = d.Value(d.Key(i))
		      if ident.ObjectValue isA RBPrjObjEntity then
		        items.Append ident
		      else
		        d2 = RBPrjIdentContainer(ident).Members
		        n2 = d2.Count-1
		        for i2 = 0 to n2
		          ident2 = d2.Value(d2.Key(i2))
		          items.Append ident2
		        next
		      end
		    next
		  end
		  return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function classByName(className as String) As RBPrjIdentContainer
		  if className = "" then
		    return me.globals
		  elseif me.classes.HasKey (className) then
		    return me.classes.Value (className)
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(objTree as RBPrjObjTree)
		  me.Constructor
		  me.classes = new Dictionary
		  me.globals = new RBPrjIdentContainer ("", nil)
		  
		  addGlobals objTree.Root
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsContainer(className as String) As Boolean
		  dim theClass as RBPrjIdentContainer
		  
		  theClass = classByName (className)
		  if theClass <> nil then
		    return true
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LookupClass(className as String) As RBPrjObjEntity
		  dim theClass as RBPrjIdentContainer
		  
		  theClass = classByName (className)
		  if theClass <> nil then
		    return theClass.entity
		  end
		End Function
	#tag EndMethod


	#tag Note, Name = About
		// This class maintains a tree in the view of the global identifier scope.
		// 
		// This means that on the root level of this tree all items are listed that are globally visible,
		// i.e. all Classes, Windows and public items of Modules.
		// Each of these items list what's visible in their reach then, and so on.
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			Key: Name of class
			Value: RBPrjIdentContainer
		#tag EndNote
		Private classes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private globals As RBPrjIdentContainer
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
