#tag Class
Protected Class RESTHttpHandler
Implements REST.RESTProtocolHandler
	#tag Method, Flags = &h0
		Function Action() As String
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Return m_action
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddHeader(name As String, value As Variant)
		  If value.IsArray Then
		    Dim values As String
		    Dim valueArr() As Variant = value
		    
		    For Each item As Variant in valueArr
		      If item.StringValue() <> "" Then
		        
		        If value <> "" Then
		          value = value + ", "
		        End If
		        
		        value = value + item.StringValue()
		      End If
		    Next
		    
		    m_sendHeaders.Value(name) = values
		  Else
		    m_sendHeaders.Value(name) = value
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AuthenticationKey() As Variant
		  // Part of the REST.RESTProtocolHandler interface.
		  Dim key As String
		  
		  If m_reqHeaders.HasKey(REST.kHeaderAuthorization) Then
		    key = m_reqHeaders.Value(REST.kHeaderAuthorization)
		    
		    If key.StartsWith("Basic ") Then
		      key = key.Mid(7).Trim() 'Strip off Basic
		      key = DecodeBase64(key)
		    End If
		  End If
		  
		  Return key
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close(ByRef restSocket As REST.RESTSocket)
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  //No action needed - HTTP connections don't require sending a closing message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  m_reqHeaders = New Dictionary()
		  m_sendHeaders = New Dictionary()
		  m_parameters = New Dictionary()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Header(key As Variant, defaultValue As Variant = Nil) As Variant
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Dim result As Variant = defaultValue
		  
		  If m_reqHeaders.HasKey(key) Then
		    result = m_reqHeaders.Value(key)
		  End If
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Identifier() As String
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Return m_identifier
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Method() As HttpMethod
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Return m_reqMethod
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parameter(key As Variant, defaultValue As Variant = Nil) As Variant
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Dim result As Variant = defaultValue
		  
		  If m_parameters.HasKey(key) Then
		    result = m_parameters.Value(key)
		  End If
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseRequest(ByRef restSocket As REST.RESTSocket) As Boolean
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Dim success As Boolean = True
		  
		  m_reqHeaders.Clear()
		  m_reqMethod = HttpMethod.Get
		  m_reqURI = ""
		  m_reqData = ""
		  m_resourceName = ""
		  m_action = ""
		  m_identifier = ""
		  m_parameters.Clear()
		  
		  Dim data As String = restSocket.ReadAll()
		  
		  If data.Len()>0 Then
		    Dim arrData(-1) As String = data.Split(REST.CrLf())
		    Dim iData As Integer = 0
		    Dim sData As String
		    Dim isHeader As Boolean = True
		    
		    While iData <= UBound(arrData) and success = True
		      sData = arrData(iData)
		      
		      If isHeader And iData = 0 Then
		        
		        If sData.CountFields(" ") > 1 Then
		          Select Case UpperCase(sData.NthField(" ", 1))
		          Case "GET"
		            m_reqMethod = HttpMethod.Get
		          Case "POST"
		            m_reqMethod = HttpMethod.Post
		          Case "OPTIONS"
		            m_reqMethod = HttpMethod.Options
		          Case "HEAD"
		            m_reqMethod = HttpMethod.Head
		          Case "DELETE"
		            m_reqMethod = HttpMethod.Delete
		          Case "PUT"
		            m_reqMethod = HttpMethod.Put
		          Else
		            success = False
		          End Select
		          
		          m_reqURI = sData.NthField(" ", 2)
		          m_reqURI = REST.UrlDecode(m_reqURI)
		        Else
		          success = False
		        End If
		        
		      ElseIf isHeader Then
		        
		        If sData <> "" Then
		          If sData.CountFields(":") > 1 Then
		            m_reqHeaders.Value(sData.Left(sData.InStr(":")-1)) = sData.Mid(sData.InStr(":")+1).Trim()
		          Else
		            success = False
		          End If
		        Else
		          isHeader = False
		        End If
		        
		      Else
		        
		        m_reqData = m_reqData + sData + REST.CrLf()
		        
		      End If
		      
		      iData = iData+1
		    Wend
		    
		    Call REST.ParseURI(m_reqURI, m_resourceName, m_action, m_identifier, m_parameters)
		  End If
		  
		  Return Success
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resource() As String
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Return m_resourceName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendData(ByRef restSocket As REST.RESTSocket, ByRef response As REST.RESTResponse)
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  For Each key As Variant In response.headers.Keys
		    AddHeader(key.StringValue, response.headers.Value(key))
		  Next
		  
		  SendData(restSocket, response.response, response.status)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SendData(ByRef restSocket As REST.RESTSocket, data As String, status As HttpStatus = HttpStatus.Ok)
		  restSocket.Write "HTTP/1.1 " + StatusStr(status) + REST.CrLf()
		  
		  Dim origin as Variant = Header(REST.kHeaderOrigin)
		  If origin <> Nil Then
		    AddHeader(REST.kAccessControlAllowOrigin, origin.StringValue)
		  Else
		    AddHeader(REST.kAccessControlAllowOrigin, "*")
		  End If
		  
		  If Method() = HttpMethod.Options Then
		    'Remove the actual content to enable a preflighted CORS request
		    'see https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS
		    data = ""
		    
		    AddHeader(REST.kAccessControlAllowCredentials, "true")
		    
		    Dim requestMethod As Variant = Header(REST.kAccessControlRequestMethod)
		    
		    If m_sendHeaders.HasKey(REST.kHeaderAllow) Then
		      AddHeader(REST.kAccessControlAllowMethods, m_sendHeaders.Value(REST.kHeaderAllow).StringValue())
		    ElseIf Not IsNull(requestMethod) Then
		      AddHeader(REST.kAccessControlAllowMethods, requestMethod)
		    Else
		      AddHeader(REST.kAccessControlAllowMethods, "GET")
		    End If
		    
		    If Header(REST.kAccessControlRequestHeaders) <> Nil Then
		      AddHeader(REST.kAccessControlAllowHeaders, REST.kHeaderAuthorization)
		    End If
		  End If
		  
		  AddHeader(REST.kHeaderContentLength, LenB(data))
		  
		  For iHeader As Integer = 0 To m_sendHeaders.Count() -1
		    restSocket.Write m_sendHeaders.Key(iHeader).StringValue + ": " + m_sendHeaders.Value(m_sendHeaders.Key(iHeader).StringValue).StringValue + REST.CrLf()
		  Next
		  
		  restSocket.Write REST.CrLf()
		  
		  If data <> "" And _
		    Method() <> HttpMethod.Head Then
		    restSocket.Write data
		  End If
		  
		  m_sendHeaders.Clear()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StatusStr(status As HttpStatus) As String
		  Dim statusStr As String = "503 Service Unavailable"
		  
		  Select Case status
		  Case HttpStatus.SwitchingProtocols
		    statusStr = "101 Switching Protocols"
		  Case HttpStatus.OK
		    statusStr = "200 OK"
		  Case HttpStatus.BadRequest
		    statusStr = "400 Bad Request"
		  Case HttpStatus.Unauthorized
		    statusStr = "401 Unauthorized"
		  Case HttpStatus.Forbidden
		    statusStr = "403 Forbidden"
		  Case HttpStatus.NotFound
		    statusStr = "404 Not Found"
		  Case HttpStatus.MethodNotAllowed
		    statusStr = "405 Method Not Allowed"
		  Case HttpStatus.InternalServerError
		    statusStr = "500 Internal Server Error"
		  Case HttpStatus.NotImplemented
		    statusStr = "501 Not Implemented"
		  End Select
		  
		  Return statusStr
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private m_action As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_identifier As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_parameters As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_reqData As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_reqHeaders As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_reqMethod As HttpMethod = HttpMethod.Get
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_reqURI As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_resourceName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_sendHeaders As Dictionary
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
