#tag Class
Protected Class RESTResponse
	#tag Method, Flags = &h0
		Sub Constructor()
		  Me.headers = New Dictionary()
		  Me.headers.Value(REST.kHeaderContentType) = REST.kContentTypeText
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(response As String, status as HttpStatus = HttpStatus.OK, contentType As String = REST.kContentTypeText)
		  Me.headers = New Dictionary()
		  Me.headers.Value(REST.kHeaderContentType) = contentType
		  Me.response = response
		  Me.status = status
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateXmlResponse(resource As String, action As String = "", identifier As String = "", reason As String = "") As XmlDocument
		  Dim xml As New XmlDocument()
		  Dim root As XmlNode
		  
		  xml.Encoding = "UTF8"
		  root = xml.AppendChild(xml.CreateElement("response"))
		  
		  root.SetAttribute("resource", resource)
		  
		  If action.Len() > 0 Then
		    root.SetAttribute("action", action)
		  End If
		  
		  If identifier.Len() > 0 Then
		    root.SetAttribute("identifier", identifier)
		  End If
		  
		  If reason.Len() > 0 Then
		    root.SetAttribute("reason", reason)
		  End If
		  
		  headers.Value(REST.kHeaderContentType) = REST.kContentTypeXml
		  
		  Return xml
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		headers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		response As String
	#tag EndProperty

	#tag Property, Flags = &h0
		status As HttpStatus = HTTPStatus.OK
	#tag EndProperty


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
			Name="response"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="status"
			Visible=false
			Group="Behavior"
			InitialValue="HTTPStatus.OK"
			Type="HttpStatus"
			EditorType="Enum"
			#tag EnumValues
				"200 - OK"
				"101 - SwitchingProtocols"
				"400 - BadRequest"
				"401 - Unauthorized"
				"403 - Forbidden"
				"404 - NotFound"
				"405 - MethodNotAllowed"
				"500 - InternalServerError"
				"501 - NotImplemented"
			#tag EndEnumValues
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
End Class
#tag EndClass
