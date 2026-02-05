#tag Class
Protected Class RBPrjObjTree
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fileRef as FolderItem)
		  me.Constructor
		  me.FileRef = fileRef
		  me.theRoot = new RBPrjObjEntity(nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  theRoot.Release
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Root() As RBPrjObjEntity
		  return me.theRoot
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This class holds all items from a project file in a tree that has the same structure as the original project file had
		(contrary to the 'RBPrjIdents' class, which uses a different structure for facilitating symbol lookups)
	#tag EndNote


	#tag Property, Flags = &h0
		FileRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		theRoot As RBPrjObjEntity
	#tag EndProperty


End Class
#tag EndClass
