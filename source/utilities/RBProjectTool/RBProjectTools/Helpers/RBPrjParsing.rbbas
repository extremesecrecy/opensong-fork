#tag Interface
Protected Interface RBPrjParsing
	#tag Method, Flags = &h0
		Function CanOpen(f as FolderItem) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanParseExternals() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsParsing(f as FolderItem) As RBPrjParsing
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateExternalItem(prjItemName as String, fileName as String, kinds() as String, values() as String, ByRef fOut as FolderItem) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(f as FolderItem) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(processor as RBPrjProcessing, results as RBPrjParseResults, externalsHandling as Integer, parseOpts as RBPrjItemsTreeParseOptions)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExternalObjectName(objName as String)
		  
		End Sub
	#tag EndMethod


End Interface
#tag EndInterface
