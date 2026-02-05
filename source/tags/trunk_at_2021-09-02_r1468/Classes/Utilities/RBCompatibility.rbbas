#tag Module
Protected Module RBCompatibility
	#tag Method, Flags = &h0
		Function NativePath(Extends fi As FolderItem) As String
		  #If RBVersion < 2013
		    Return fi.AbsolutePath
		  #Else
		    #pragma Warning "This extension function 'NativePath' appears to be ignored by your version of Xojo; still you'd better remove it."
		    Break
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Modul description
		
		Functions to gain compatibility to newer versions of Xojo
	#tag EndNote


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
End Module
#tag EndModule
