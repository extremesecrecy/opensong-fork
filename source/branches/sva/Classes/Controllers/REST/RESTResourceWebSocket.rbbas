#tag Class
Protected Class RESTResourceWebSocket
Implements REST.RESTResource
	#tag Method, Flags = &h0
		Function Name() As String
		  // Part of the REST.RESTResource interface.
		  
		  Return "ws"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Process(ByRef restSocket As REST.RESTSocket, protocolHandler As REST.RESTProtocolHandler) As REST.RESTresponse
		  // Part of the REST.RESTResource interface.
		  
		  Dim response As REST.RESTResponse = Nil
		  Dim action As String = protocolHandler.Action()
		  
		  If action.Len() = 0 Then
		    Dim reqVersion As Integer = protocolHandler.Header("Sec-WebSocket-Version", 0)
		    Dim reqConnection() As String = Lowercase(protocolHandler.Header("Connection", "")).ReplaceAll(" ", "").Split(",")
		    Dim reqUpgrade As String = Lowercase(protocolHandler.Header("Upgrade", ""))
		    
		    If reqConnection.IndexOf("upgrade")>=0 and reqUpgrade = "websocket" Then
		      
		      If reqVersion >= RESTWebSocketHandler.kProtocolHybi_10 Then
		        Dim clientKey As String = protocolHandler.Header("Sec-WebSocket-Key", "")
		        Dim serverKey As String = EncodeBase64(SHA1.Hash(clientKey + kWebSocketGUID))
		        
		        response  = New REST.RESTResponse("", HttpStatus.SwitchingProtocols)
		        response.headers.Value("Upgrade") = "websocket"
		        response.headers.Value("Connection") = "Upgrade"
		        response.headers.Value("Sec-WebSocket-Accept") = serverKey
		        
		        restSocket.ProtocolUpgrade(New REST.RESTWebSocketHandler())
		      Else
		        response = New REST.RESTResponse("WebSocket version not supported", HttpStatus.BadRequest)
		        response.headers.Value("Sec-WebSocket-Version") = RESTWebSocketHandler.kProtocolRFC6455
		      End If
		      
		    Else
		      response = New REST.RESTResponse("Incomplete WebSocket handshake", HttpStatus.BadRequest)
		    End If
		  ElseIf protocolHandler IsA RESTWebSocketHandler Then
		    
		    Dim success As Boolean = False
		    
		    'Process WebSocket actions
		    Dim resource As String = LowerCase(protocolHandler.Identifier())
		    
		    Select Case action
		    Case "subscribe"
		      success = App.StatusNotifierSubscribe(resource, CStr(restSocket.Handle))
		    Case "unsubscribe"
		      success = App.StatusNotifierUnsubscribe(resource, CStr(restSocket.Handle))
		    End Select
		    
		    If success Then
		      response = New REST.RESTResponse("OK")
		    Else
		      response = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		    End If
		    
		  Else
		    response = New REST.RESTResponse("The requested action is not available without the use of a WebSocket connection.", HttpStatus.NotFound)
		  End If
		  
		  Return response
		End Function
	#tag EndMethod


	#tag Constant, Name = kWebSocketGUID, Type = String, Dynamic = False, Default = \"258EAFA5-E914-47DA-95CA-C5AB0DC85B11", Scope = Private
	#tag EndConstant


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
