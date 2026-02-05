#tag Class
Protected Class RBPrjIdentContainer
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(className as String, entity as RBPrjObjEntity)
		  me.Constructor
		  me.Name = className
		  me.Entity = entity
		  me.Members = new Dictionary
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Lists all immediate identifiers of a class, a control or of the global scope
	#tag EndNote


	#tag Property, Flags = &h0
		Entity As RBPrjObjEntity
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Key: Name of identifier
			Value:
			  - if only one item exists: RBPrjEntity
			  - if more than one item exists: RBPrjIdentContainer
		#tag EndNote
		Members As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Name = "" means the global scope
		#tag EndNote
		Name As String
	#tag EndProperty


End Class
#tag EndClass
