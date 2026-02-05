#tag Class
Protected Class FindClass
	#tag Method, Flags = &h0
		Sub Constructor()
		  FindTitle = True
		  FindAuthor = True
		  FindLyrics = True
		  '++JRC
		  Found = 0
		  FoundPos = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMatch(s As String) As Integer
		  Dim result As Integer = InStr(s, Me.FindString)
		  If result = 0 Then
		    result = InStr(Lowercase(s), Lowercase(Me.FindString))
		  End If
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ChordForm As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ChordKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FindAKA As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindAuthor As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindCapo As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindCCLI As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindChord As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindCopyright As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindHymnNumber As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindKey As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindKeyLine As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindLyrics As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindPresentation As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindString As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FindTempo As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindThemes As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindTimeSig As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindTitle As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindUser1 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindUser2 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindUser3 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Found As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FoundPos As Integer
	#tag EndProperty


	#tag Constant, Name = kAKA, Type = Double, Dynamic = False, Default = \"19", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAuthor, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCapo, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCCLI, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kChord, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCopyright, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHymnNumber, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kKey, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kKeyLine, Type = Double, Dynamic = False, Default = \"18", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLyrics, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPresentation, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSubTitle, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTempo, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kThemes, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTimeSig, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTitle, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUser1, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUser2, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUser3, Type = Double, Dynamic = False, Default = \"17", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ChordForm"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChordKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindAKA"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindAuthor"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindCapo"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindCCLI"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindChord"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindCopyright"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindHymnNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindKey"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindKeyLine"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindLyrics"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindPresentation"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindTempo"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindThemes"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindTimeSig"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindTitle"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindUser1"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindUser2"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindUser3"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Found"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FoundPos"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
