#tag Interface
Protected Interface ScriptureReceiver
	#tag Method, Flags = &h0
		Sub LiveDisplay(slide As XmlNode, slides As XmlNodeList = Nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScriptureSelected(scripture As XmlNode)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Overview
		Implemented by any part of code that needs to know about changes to scripture
		
		LiveDisplay: Implement to receive a slide-by-slide notification
		    of a LiveDisplay command (triggered by the Insert/LiveDisplay button on ScripturePickerWindow
		
		ScriptureSelected: Provides the totality of the Scripture that has been selected
		
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Interface
#tag EndInterface
