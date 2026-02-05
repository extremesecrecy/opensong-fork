#tag Class
Protected Class RBPrjFileReader
Implements RBPrjParsing
	#tag Method, Flags = &h0
		Function CanOpen(f as FolderItem) As Boolean
		  return RBPrjSupport.NewFileParser (f) <> nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanParseExternals() As Boolean
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsParsing(f as FolderItem) As RBPrjParsing
		  return RBPrjSupport.NewFileParser (f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateExternalItem(prjItemName as String, fileName as String, kinds() as String, values() as String, ByRef fOut as FolderItem) As Boolean
		  return false // this parser does let the includer do all the work
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(f as FolderItem) As Boolean
		  me.theParser = RBPrjSupport.NewFileParser (f)
		  if me.theParser <> nil then
		    return me.theParser.Open (f)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(processor as RBPrjProcessing, results as RBPrjParseResults, externalsHandling as Integer, parseOpts as RBPrjItemsTreeParseOptions)
		  RBPrjHelper.Assert (parseOpts = nil, "'options' can only be used with RBPrjItemsTree.Parse", "RBPrjFileReader.Parse")
		  me.theParser.Parse (processor, results, externalsHandling, parseOpts)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExternalObjectName(objName as String)
		  me.theParser.SetExternalObjectName (objName)
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Mother of all project file parsers - chooses the right one by trying all file based parsers and figure them out which one can parse it
	#tag EndNote


	#tag Property, Flags = &h21
		Private theParser As RBPrjParsing
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
