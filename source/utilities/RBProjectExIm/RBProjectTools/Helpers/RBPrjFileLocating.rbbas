#tag Interface
Protected Interface RBPrjFileLocating
	#tag Method, Flags = &h0
		Function LocateMissingFile(fileName as String, itemName as String) As FolderItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RelocateFile(f as FolderItem, fileName as String, itemName as String) As FolderItem
		  
		End Function
	#tag EndMethod


End Interface
#tag EndInterface
