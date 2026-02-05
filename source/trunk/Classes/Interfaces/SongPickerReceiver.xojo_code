#tag Interface
Protected Interface SongPickerReceiver
	#tag Method, Flags = &h0, Description = 546869732069732063616C6C6564206166746572206120736F6E672069732073656C656374656420696E2074686520536F6E675069636B657257696E646F772E
		Sub SongSelected(f As FolderItem, presentationOrder As String)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Description
		The SongPickerReceiver is not a true Notifier/Receiver (though it could be easily expanded to become one).
		
		The interface is used to allow for a callback into the object that called 
		SongPickerWindow so that the Picker can stay active while allowing for multiple songs to be selected.
		This eliminates the "flash" and reset on the window when composing a set.
		
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Interface
#tag EndInterface
