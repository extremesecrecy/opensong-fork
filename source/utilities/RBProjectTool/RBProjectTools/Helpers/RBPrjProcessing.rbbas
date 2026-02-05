#tag Interface
Protected Interface RBPrjProcessing
	#tag Method, Flags = &h0
		Function BlockEnter(tag as String, id as Integer, header as RBPrjDataRef) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlockLeave(tag as String, id as Integer, optionalName as String, extFileRef as FolderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalsProcessingFinished()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupEnter(tag as String, id as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupLeave(tag as String, id as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFinished()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessHeader(dataRef as RBPrjDataRef, results as RBPrjParseResults, inputFileRef as FolderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessItem(type as Integer, tag as String, valueRef as RBPrjDataRef)
		  
		End Sub
	#tag EndMethod


End Interface
#tag EndInterface
