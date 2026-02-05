#tag Class
Protected Class SearchResult
	#tag Method, Flags = &h0
		Function compareTo(sr as SearchResult) As Integer
		  'returns <0 if Me<sr, 0 if Me==sr, >0 if Me>sr
		  
		  Dim one, two As Integer
		  
		  one = book * 1000000 + chapter * 1000 + verse
		  two = sr.book * 1000000 + sr.chapter * 1000 + sr.verse
		  
		  Return one - two
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(tbook as Integer, tchap as Integer, tver as Integer)
		  book= tbook
		  chapter= tchap
		  verse= tver
		  value=10 '10 is base value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(verse as String)
		  'format for incoming string must be three integers with a space inbetween them
		  
		  Me.book= Val(Nthfield(verse, " ", 1))
		  Me.chapter= Val(Nthfield(verse, " ", 2))
		  Me.verse= Val(Nthfield(verse, " ", 3))
		  Me.value=10
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		book As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		chapter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		value As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		verse As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="book"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="chapter"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="value"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="verse"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
