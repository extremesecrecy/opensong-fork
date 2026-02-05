#tag Class
Protected Class RBPrjObjEntity
Implements TTsSortableValue
	#tag Method, Flags = &h0
		Sub Constructor(parObj as RBPrjObjEntity)
		  me.Parent = parObj
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullyQualifiedName() As String
		  dim s as String
		  if me.Parent <> nil then
		    s = me.Parent.FullyQualifiedName
		  end
		  if s <> "" then
		    return s + "." + me.Name
		  else
		    return me.Name
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPrivate() As Boolean
		  return Bitwise.BitAnd (me.Flags, 32) <> 0 or me.Type = TypeEventHandler or me.Type = TypeEventDef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsProtected() As Boolean
		  return Bitwise.BitAnd (me.Flags, 1) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPublic() As Boolean
		  return me.Flags = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NameByType(type as Integer) As String
		  if type = TypeConstant then
		    return "Constant"
		  elseif type = TypeVariable then
		    return "Variable"
		  elseif type = TypeProperty then
		    return "Property"
		  elseif type = TypeMethod then
		    return "Method"
		  elseif type = TypeEventDef then
		    return "EventDefinition"
		  elseif type = TypeEventHandler then
		    return "EventHandler"
		  elseif type = TypeControlBehavior then
		    return "ControlBehavior"
		  elseif type = TypeControlInstance then
		    return "ControlInstance"
		  elseif type = TypeClass then
		    return "Class"
		  elseif type = TypeWindow then
		    return "Window"
		  elseif type = TypeContainerControl then
		    return "ContainerControl"
		  elseif type = TypeModule then
		    return "Module"
		  elseif type = TypeInterface then
		    return "Interface"
		  elseif type = TypeSetter then
		    return "Setter"
		  elseif type = TypeGetter then
		    return "Getter"
		  elseif type = TypeNote then
		    return "Note"
		  else
		    raise new OutOfBoundsException
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  // dispose of object by releasing circular references
		  dim obj as RBPrjObjEntity
		  me.Parent = nil
		  for each obj in me.Children
		    obj.Release
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(data as RBPrjDataRef)
		  me.DataRef = data
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SortValue() As Variant
		  return me.Name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TypeName() As String
		  return me.NameByType(me.Type)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Children() As RBPrjObjEntity
	#tag EndProperty

	#tag Property, Flags = &h0
		Content As String
	#tag EndProperty

	#tag Property, Flags = &h0
		DataRef As RBPrjDataRef
	#tag EndProperty

	#tag Property, Flags = &h0
		Declaration As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Flags As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Notes As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Parent As RBPrjObjEntity
	#tag EndProperty

	#tag Property, Flags = &h0
		SuperClass As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As Integer
	#tag EndProperty


	#tag Constant, Name = TypeClass, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeConstant, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeContainerControl, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeControlBehavior, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeControlInstance, Type = Double, Dynamic = False, Default = \"17", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeEventDef, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeEventHandler, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeGetter, Type = Double, Dynamic = False, Default = \"19", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeInterface, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeMethod, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeModule, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeNote, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeProperty, Type = Double, Dynamic = False, Default = \"21", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeSetter, Type = Double, Dynamic = False, Default = \"18", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeVariable, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeWindow, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
