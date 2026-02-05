#tag Class
Protected Class RBPrjObjTreeBuilder
Inherits RBPrjProcessingHelper
Implements RBPrjProcessing
	#tag Method, Flags = &h21
		Private Sub assert(good as Boolean, msg as String, item as RBPrjObjEntity)
		  if not good then
		    super.assert (false, msg + EndOfLine + item.FullyQualifiedName)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockEnter(tag as String, id as Integer, header as RBPrjDataRef) As Boolean
		  me.enclosureStack.Append new RBPrjObjEntity (tree.Root)
		  
		  if tag = "pObj" or tag = "pVew" then
		    if tag = "pVew" then
		      me.topEntity.Type = RBPrjObjEntity.TypeWindow // default (could also be ContainerControl)
		    else
		      me.topEntity.Type = RBPrjObjEntity.TypeModule // default
		    end
		    return true
		  end
		  
		  SkippingBlock (tag, id, header)
		  
		  return false // no need to traverse into the other block kinds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlockLeave(tag as String, id as Integer, optionalName as String, extFileRef as FolderItem)
		  dim entity as RBPrjObjEntity
		  entity = me.enclosureStack.Pop
		  if entity.Type <> 0 then
		    me.tree.Root.Children.Append entity
		  else
		    entity.Release
		  end
		  assert (Ubound(me.enclosureStack) < 0, "enclosureStack damaged")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub cleanupItem(item as RBPrjObjEntity)
		  
		  // Clean up the collected data:
		  // - move declaration in source code of Event Handlers to our Declaration property
		  // - remove declarations from the source code
		  // - move source code of properties to Notes
		  // - move init values of properties and constants to Content
		  
		  dim s, newContent, firstSourceLine, name, declType, value as String
		  dim allSourceLines() as String
		  dim contentModified, contentIsComment, removeFirstLine, removeLastLine as Boolean
		  
		  allSourceLines = item.Content.Split (EndOfLine)
		  
		  if Ubound(allSourceLines) >= 0 and Len(allSourceLines(Ubound(allSourceLines))) = 0 then
		    // remove the last empty line, which got added by the "srcl" collection in ProcessItem()
		    allSourceLines.Remove Ubound(allSourceLines)
		  end
		  
		  if Ubound(allSourceLines) >= 0 then
		    firstSourceLine = allSourceLines (0)
		  end
		  
		  if item.type = RBPrjObjEntity.TypeEventHandler or item.type = RBPrjObjEntity.TypeMethod then
		    getDeclaration item, firstSourceLine, name, declType, value
		    assert (item.Name = name, "identifier mismatch in first source line", item)
		    if item.type = RBPrjObjEntity.TypeMethod then
		      if ReplaceAll(item.Declaration," ","") <> ReplaceAll(declType," ","") then
		        // This actually happens with some prj files that the IDE 2005r4 corrupts:
		        //   while there's a source line such as "Sub Foo()", there's also a "ItemParam"
		        //   entry giving a non-empty parameter list, such as "x as Integer". Only after
		        //   editing the method declaration, e.g. change its name, the parameter gets
		        //   added to the first source line. Until then, the compiler does not see these
		        //   parameters from "ItemParam"
		        reportWarning ("The method '"+item.FullyQualifiedName+"' has mismatching declarations, you should edit the method in the IDE so that the IDE fixes it.")
		      end
		    else
		      assert (item.Declaration = "", "event handler has non-empty declaration", item)
		      item.Declaration = declType
		    end
		    assert (value = "", "unpexpected data in first source line", item)
		    removeFirstLine = true
		    removeLastLine = true
		  elseif item.type = RBPrjObjEntity.TypeSetter or item.type = RBPrjObjEntity.TypeGetter then
		    assert (firstSourceLine = item.Name, "invalid data in first source line", item)
		    removeFirstLine = true
		    removeLastLine = true
		  elseif item.type = RBPrjObjEntity.TypeVariable then
		    if firstSourceLine <> "" then
		      if Left(firstSourceLine,7) = "Shared " then
		        firstSourceLine = Mid(firstSourceLine, 8)
		      end
		      if Left(firstSourceLine,9) = "Property " then
		        firstSourceLine = Mid(firstSourceLine, 10)
		      end
		      assert (ReplaceAll(item.Declaration," ","") = ReplaceAll(firstSourceLine," ",""), "property decl mismatch in first source line", item)
		      removeFirstLine = true
		    end
		    getDeclaration item, item.Declaration, name, declType, value
		    assert (item.Name = name, "identifier mismatch in first source line", item)
		    item.Declaration = declType
		    contentIsComment = true
		    newContent = value
		  elseif item.type = RBPrjObjEntity.TypeNote then
		    contentIsComment = true
		    newContent = ""
		  end
		  
		  if removeFirstLine then
		    allSourceLines.Remove 0
		    contentModified = true
		  end
		  
		  if removeLastLine then
		    s = allSourceLines(Ubound(allSourceLines))
		    assert (s = "End Sub" or s = "End Function" or s = "End Set" or s = "End Get", "invalid end of method")
		    allSourceLines.Remove Ubound(allSourceLines)
		    contentModified = true
		  end
		  
		  // remove trailing blank lines
		  while Ubound(allSourceLines) >= 0 and Trim (allSourceLines(Ubound(allSourceLines))) = ""
		    allSourceLines.Remove Ubound(allSourceLines)
		    contentModified = true
		  wend
		  
		  // remove leading blank lines
		  while Ubound(allSourceLines) >= 0 and Trim (allSourceLines(0)) = ""
		    allSourceLines.Remove 0
		    contentModified = true
		  wend
		  
		  if contentModified then
		    s = Join (allSourceLines, EndOfLine)
		  else
		    s = item.Content
		  end
		  
		  if contentIsComment then
		    item.Content = newContent
		    item.Notes = s
		  else
		    item.Content = s
		  end
		  
		  // ### at this point, any "name() as type" should be turned into "x as type()", and since this
		  // should also be done for parameters of methods, it's probably best to extend the structure
		  // by describing each parameter individually, and by the same structure that's used for variables,
		  // with these properties: name, isArray, type, presetvalue
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  // does only create a "virgin" clone, without the data that may be assembled by the processing!
		  return new RBPrjObjTreeBuilder ()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalsProcessingFinished()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function extractNameFromDecl(decl as String) As String
		  dim i, i2 as Integer
		  // separate the name from the rest that follows:
		  i = InStr (decl, "(")
		  if i = 0 then i = Len(decl)+1
		  i2 = InStr (decl, " ")
		  if i2 = 0 then i2 = Len(decl)+1
		  i = Min(i,i2)
		  return Trim (Left(decl, i-1))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub getDeclaration(item as RBPrjObjEntity, decl as String, ByRef name as String, ByRef type as String, ByRef value as String)
		  dim s as String
		  dim i, i2 as Integer
		  
		  i = InStr (decl, "(")
		  if (item.Type = RBPrjObjEntity.TypeEventDef or item.Type = RBPrjObjEntity.TypeEventHandler or item.Type = RBPrjObjEntity.TypeMethod) then
		    // it's a method decl
		    assert (i > 0, "method decl without '('")
		    s = Left (decl, i-1) // s: Sub methodname
		    type = Mid (decl, i)
		    value = ""
		    s = Trim(s)
		    name = NthField (s, " ", CountFields(s, " "))
		    s = Left(s, Len(s)-Len(name)-1)
		    assert (s = "Sub" or s = "Function" or s = "Shared Sub" or s = "Shared Function", _
		    "invalid method declaration: "+decl, item)
		  else
		    // it's a property or constant
		    // separate the name from the rest (type and value):
		    i = 0  // do we need the "("? causes problems with arrays
		    i2 = InStr (decl, " ")
		    if i = 0 then i = Len(decl)+1
		    if i2 = 0 then i2 = Len(decl)+1
		    i = Min(i,i2)
		    name = Trim (Left(decl, i-1))
		    type = Trim (Mid(decl, i))
		    // separate the value from the type:
		    i = InStr (type, "=")
		    if i = 0 then
		      value = ""
		    else
		      value = Trim (Mid (type, i+1))
		      type = Trim (Left (type, i-1))
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupEnter(tag as String, id as Integer)
		  dim type as Integer
		  dim name as String
		  dim enclosure, currEntity as RBPrjObjEntity
		  
		  enclosure = me.topEntity
		  me.enclosureStack.Append new RBPrjObjEntity(enclosure)
		  currEntity = me.topEntity
		  
		  select case tag
		    
		  case "sorc" // Source code or Notes
		    me.currSourceTarget = enclosure
		  case "Meth"
		    type = RBPrjObjEntity.TypeMethod
		  case "CPrs"
		    type = RBPrjObjEntity.TypeSetter
		    name = "Set"
		    me.currSourceTarget = currEntity
		  case "CPrg"
		    type = RBPrjObjEntity.TypeGetter
		    name = "Get"
		    me.currSourceTarget = currEntity
		  case "Prop"
		    type = RBPrjObjEntity.TypeVariable
		  case "PDef"
		    type = RBPrjObjEntity.TypeProperty
		  case "HIns"
		    type = RBPrjObjEntity.TypeEventHandler
		  case "Hook"
		    type = RBPrjObjEntity.TypeEventDef
		  case "Note"
		    type = RBPrjObjEntity.TypeNote
		  case "Cnst"
		    type = RBPrjObjEntity.TypeConstant
		  case "CIns" // ConstantInstance (specific sub-values of a Constants)
		    type = RBPrjObjEntity.TypeConstant
		  case "CBhv"
		    // ControlBehavior items must be indexed by their number of occurance (they do not have an explicit reference),
		    // their order number relates to the ControlIndex inside Control items
		    type = RBPrjObjEntity.TypeControlBehavior
		  case "Ctrl"
		    type = RBPrjObjEntity.TypeControlInstance
		    
		  else
		    System.DebugLog "unknown group tag: "+tag
		  end
		  
		  currEntity.Type = type
		  if name <> "" then
		    currEntity.Name = name
		    currEntity.Declaration = name
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupLeave(tag as String, id as Integer)
		  dim entity as RBPrjObjEntity
		  dim keepEntity as Boolean
		  
		  entity = me.enclosureStack.Pop
		  if entity.Type <> 0 then
		    me.topEntity.Children.Append entity
		    keepEntity = true
		  end
		  
		  select case tag
		    
		  case "sorc", "CPrg", "CPrs"
		    // Source code or Notes
		    me.currSourceTarget = nil
		    
		  case "CIns" // ConstantInstance
		    assert (topEntity.Type = RBPrjObjEntity.TypeConstant, "wrong state (constant)")
		    entity.Declaration = topEntity.Declaration // constant sub-instances have the same type as their enclosure
		    
		  end
		  
		  if keepEntity then
		    cleanupItem entity
		  else
		    entity.Release
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjTree() As RBPrjObjTree
		  return me.tree
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFinished()
		  Ready (me.tree)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessHeader(dataRef as RBPrjDataRef, results as RBPrjParseResults, inputFileRef as FolderItem)
		  me.SetParseResultsObj (results)
		  me.tree = new RBPrjObjTree (inputFileRef)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessItem(type as Integer, tag as String, valueRef as RBPrjDataRef)
		  dim s, s2 as String
		  
		  dim parEntity, currEntity as RBPrjObjEntity
		  currEntity = me.topEntity()
		  
		  currEntity.SetData valueRef
		  
		  select case tag
		    
		  case "name" // ItemName
		    currEntity.Name = valueRef.AsText
		    
		  case "flag" // ItemFlags
		    currEntity.Flags = valueRef.AsInt
		    
		  case "PVal" // Property Definition Value
		    select case type
		    case RBPrjItem.TypeInt
		      s = valueRef.AsIntString
		      s2 = "Integer"
		    case RBPrjItem.TypeDbl
		      s = valueRef.AsDblString
		      s2 = "Double"
		    case RBPrjItem.TypeString
		      s = valueRef.AsText
		      s2 = "String"
		    case else
		      assert (False, "unexpected type for PVal")
		    end select
		    assert (currEntity.Content = "", "PDef content not empty")
		    currEntity.Content = s
		    currEntity.Declaration = s2
		    parEntity = me.topEntity(1)
		    if parEntity.Type = RBPrjObjEntity.TypeControlInstance then
		      // one of these properties contrains the instance's name
		      if currEntity.Name = "Name" then
		        parEntity.Name = s
		      end
		    end
		    
		  case "ntln", "srcl" // NoteLine, SourceLine
		    me.currSourceTarget.Content = me.currSourceTarget.Content + valueRef.AsText + EndOfLine
		    // note: do not filter leading empty lines out here, this will be done in cleanupItem() anyways
		    
		  case "defn" // ItemDef (Constant's default value)
		    currEntity.Content = valueRef.AsText
		    
		  case "type" // ItemType
		    if currEntity.Type = RBPrjObjEntity.TypeConstant then
		      select case valueRef.AsInt
		      case 0
		        s = "String"
		      case 1
		        s = "Number" // not sure here - RB 2005 does not use this value (any more)
		      case 2
		        s = "Number"
		      case 3
		        s = "Boolean"
		      case 4
		        s = "Color"
		      else
		        raiseExc ("unknown type: "+RBPrjHelper.MyStr(valueRef.AsInt))
		      end
		      currEntity.Declaration = s
		    end
		    
		  case "decl" // ItemDeclaration
		    s = valueRef.AsText
		    currEntity.Declaration = s
		    if currEntity.Name = "" then
		      currEntity.Name = extractNameFromDecl (s)
		    end
		    
		  case "parm" // ItemParams
		    s = valueRef.AsText
		    currEntity.Declaration = "(" + s + ")"
		    
		  case "rslt" // ItemResult
		    s = valueRef.AsText
		    if s <> "" then
		      currEntity.Declaration = currEntity.Declaration + " as " + s
		    end
		    
		  case "bCls" // IsClass
		    if currEntity.Type = RBPrjObjEntity.TypeModule then
		      if valueRef.AsInt <> 0 then currEntity.Type = RBPrjObjEntity.TypeClass
		    end
		    
		  case "bNtr" // IsInterface
		    if valueRef.AsInt <> 0 then currEntity.Type = RBPrjObjEntity.TypeInterface
		    
		  case "Supr" // SuperClass
		    s = valueRef.AsText
		    currEntity.SuperClass = s
		    if currEntity.Type = RBPrjObjEntity.TypeWindow then
		      if s = "ContainerControl" then
		        currEntity.Type = RBPrjObjEntity.TypeContainerControl
		      end
		    elseif currEntity.Type = RBPrjObjEntity.TypeControlBehavior then
		      currEntity.Name = s
		    end
		    
		  else
		    'System.DebugLog "unknown item tag: "+tag
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function topEntity(ofsFromTop as Integer = 0) As RBPrjObjEntity
		  dim n as Integer
		  n = Ubound(me.enclosureStack) - ofsFromTop
		  if n >= 0 then
		    return me.enclosureStack(n)
		  end
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Ready(tree as RBPrjObjTree)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SkippingBlock(tag as String, id as Integer, header as RBPrjDataRef)
	#tag EndHook


	#tag Note, Name = About
		// This class collects project data selectively, by storing only the code related
		// information, such as classes, windows, modules, etc., and stores it in a 'RBPrjObjTree' object.
		//
		// It cleans up redundancies and unifies differences between the various kinds (methods versus
		// events, class properties verses control properties, constants versus initializers in properties, etc.)
		//
		// It does not store data from the project header (where Icons and Build Settings
		// are stored), nor editor information nor folders or non-code external items.
		//
		// Hence, the information gathered in the RBPrjObjTree is only useful for code analysis
	#tag EndNote


	#tag Property, Flags = &h0
		currSourceTarget As RBPrjObjEntity
	#tag EndProperty

	#tag Property, Flags = &h0
		enclosureStack() As RBPrjObjEntity
	#tag EndProperty

	#tag Property, Flags = &h0
		tree As RBPrjObjTree
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
