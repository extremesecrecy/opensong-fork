#tag Class
Protected Class RESTWebSocketHandler
Implements REST.RESTProtocolHandler
	#tag Method, Flags = &h0
		Function Action() As String
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Return m_action
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AuthenticationKey() As Variant
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  //An authentication key is not applicable; the websocket connection is treated
		  //as untrusted and therefore only handles 'readonly' actions
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close(ByRef restSocket As REST.RESTSocket)
		  If m_open Then
		    If Not IsNull(restSocket) Then
		      SendClose(restSocket, StatusCode.GoingAway)
		    End If
		    
		    m_open = false
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(protocol As Integer = kProtocolRFC6455)
		  m_parameters = New Dictionary()
		  m_open = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DecodeRFC6455(ByRef restSocket As REST.RESTSocket, payload As String) As Boolean
		  Dim success As Boolean = False
		  Dim mode As OpCode = OpCode.Close
		  Dim masked As Boolean = False
		  
		  Dim frame As MemoryBlock
		  frame = payload
		  If frame.size >= 2 Then
		    
		    Dim mask(3) As UInt8
		    Dim dataLength As UInt64
		    Dim headerLength As UInt8
		    Dim data As String
		    
		    mode = OpCode(frame.Byte(0) And &h0F)
		    masked = (frame.Byte(1) And kFrameMaskFlag) = kFrameMaskFlag
		    dataLength = frame.Byte(1) And kFramePayloadLen
		    
		    If dataLength <= 125 Then
		      headerLength = 2
		    ElseIf dataLength = 126 Then
		      dataLength = _
		      Bitwise.ShiftLeft(frame.Byte(2), 8) + _
		      frame.Byte(3)
		      headerLength = 4
		    ElseIf dataLength = 127 Then
		      dataLength = _
		      Bitwise.ShiftLeft(frame.Byte(2), 56) + _
		      Bitwise.ShiftLeft(frame.Byte(3), 48) + _
		      Bitwise.ShiftLeft(frame.Byte(4), 40) + _
		      Bitwise.ShiftLeft(frame.Byte(5), 32) + _
		      Bitwise.ShiftLeft(frame.Byte(6), 24) + _
		      Bitwise.ShiftLeft(frame.Byte(7), 16) + _
		      Bitwise.ShiftLeft(frame.Byte(8), 8) + _
		      frame.Byte(9)
		      headerLength = 10
		    End If
		    
		    If masked Then
		      mask(0) = frame.Byte(headerLength)
		      mask(1) = frame.Byte(headerLength+1)
		      mask(2) = frame.Byte(headerLength+2)
		      mask(3) = frame.Byte(headerLength+3)
		      headerLength = headerLength + 4
		    End If
		    
		    If headerLength + dataLength = frame.Size Then
		      
		      Dim char As Byte
		      For i As UInt64 = 0 to dataLength-1
		        
		        char = frame.Byte(headerLength + i)
		        If masked Then
		          char = char Xor mask(i Mod 4)
		        End If
		        data = data + ChrB(char)
		      Next
		      
		      m_reqMode = mode
		      m_reqData = data
		      
		      success = True
		    End If
		    
		  End If
		  
		  If success Then
		    If mode = OpCode.Close Then
		      SendClose(restSocket, StatusCode.NormalClosure)
		      restSocket.Close()
		    End If
		  ElseIf Not success or Not masked Then
		    SendClose(restSocket, StatusCode.ProtocolError)
		    restSocket.Close()
		  End If
		  
		  Return success
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EncodeRFC6455(payload As String, mode As OpCode = OpCode.Text, masked As Boolean = False) As String
		  Dim rawPayload As MemoryBlock
		  rawPayload = payload.ConvertEncoding(Encodings.UTF8)
		  Dim dataLength As UInt64 = rawPayload.Size 'LenB(payload)
		  Dim headerLength As UInt8 = 1
		  
		  If dataLength <= 125 Then
		    headerLength = headerLength + 1
		  ElseIf dataLength <= 65535 Then
		    headerLength = headerLength + 3
		  Else
		    headerLength = headerLength + 9
		  End If
		  If masked Then headerLength = headerLength + 4
		  
		  Dim frameSize AS UInt64 = 0
		  Dim mask(3) As UInt8
		  Dim r as New Random 'Initialise random generator
		  Dim frame As New MemoryBlock(headerLength + dataLength)
		  
		  
		  // Setup Header
		  frame.Byte(0) = kFrameFinFlag Or (Integer(mode) And &h7F) 'Use And Mask to limit excessive values for mode
		  
		  If dataLength <= 125 Then
		    frame.Byte(1) = dataLength
		    frameSize = 2
		  ElseIf dataLength <= &hFFFF Then '65535
		    frame.Byte(1) = 126
		    'set byte 2-3
		    frame.Byte(2) = Bitwise.ShiftRight(dataLength, 8) And &hFF
		    frame.Byte(3) = dataLength And &hFF
		    frameSize = 4
		  Else
		    frame.Byte(1) = 127
		    'set byte 2-9
		    frame.Byte(2) = Bitwise.ShiftRight(dataLength, 56) And &hFF
		    frame.Byte(3) = Bitwise.ShiftRight(dataLength, 48) And &hFF
		    frame.Byte(4) = Bitwise.ShiftRight(dataLength, 40) And &hFF
		    frame.Byte(5) = Bitwise.ShiftRight(dataLength, 32) And &hFF
		    frame.Byte(6) = Bitwise.ShiftRight(dataLength, 24) And &hFF
		    frame.Byte(7) = Bitwise.ShiftRight(dataLength, 16) And &hFF
		    frame.Byte(8) = Bitwise.ShiftRight(dataLength, 8) And &hFF
		    frame.Byte(9) = dataLength And &hFF
		    frameSize = 10
		  End If
		  
		  If masked Then
		    frame.Byte(1) = kFrameMaskFlag Or frame.Byte(1)
		    
		    'Generate mask
		    mask(0) = r.InRange(0,255)
		    mask(1) = r.InRange(0,255)
		    mask(2) = r.InRange(0,255)
		    mask(3) = r.InRange(0,255)
		    
		    frame.Byte(frameSize) = mask(0)
		    frame.Byte(frameSize+1) = mask(1)
		    frame.Byte(frameSize+2) = mask(2)
		    frame.Byte(frameSize+3) = mask(3)
		    
		    frameSize = frameSize+4
		  End If
		  
		  If frameSize <> headerLength Then
		    Dim e As RuntimeException
		    e.Message = "Incorrect estimation of WebSocket header length calculation"
		    Raise e
		  End If
		  
		  Dim char As Byte
		  For i As UInt64 = 1 to dataLength
		    
		    char = rawPayload.Byte(i-1) 'AscB(payload.MidB(i, 1))
		    If masked Then
		      char = char Xor mask((i-1) Mod 4)
		    End If
		    frame.Byte(frameSize) = char
		    frameSize = frameSize + 1
		    
		  Next
		  
		  If frameSize <> headerLength+dataLength Then
		    Dim e As RuntimeException
		    e.Message = "Incorrect estimation of WebSocket data length calculation"
		    Raise e
		  End If
		  
		  Return frame
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Header(name As Variant, defaultValue As Variant) As Variant
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Return Nil
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
		  
		  'Methods are not applicable when using WebSockets.
		  'All requests are considered GET
		  Return HttpMethod.Get
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parameter(key As Variant, defaultValue As Variant) As Variant
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
		  
		  Dim success As Boolean = False
		  
		  m_resourceName = ""
		  m_action = ""
		  m_identifier = ""
		  m_parameters.Clear()
		  
		  Dim data As string = restSocket.ReadAll()
		  
		  success = DecodeRFC6455(restSocket, data)
		  If  success Then
		    If m_reqData.Len()>0 Then
		      Dim reqdata As String = m_reqData
		      If reqdata.Left(1) <> "/" Then
		        data = "/" + data
		      End If
		      
		      Call REST.ParseURI(reqdata, m_resourceName, m_action, m_identifier, m_parameters)
		    End If
		  End If
		  
		  Return success
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resource() As String
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Return m_resourceName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SendClose(ByRef restSocket As REST.RESTSocket, closeCode As StatusCode)
		  Dim closing As String = Str(closeCode) + Chr(0) + Chr(0)
		  
		  restSocket.Write(EncodeRFC6455(closing, OpCode.Close))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendData(ByRef restSocket As REST.RESTSocket, ByRef response As REST.RESTResponse)
		  // Part of the REST.RESTProtocolHandler interface.
		  
		  Dim mode As OpCode = OpCode.Text
		  If response.headers.HasKey(REST.kHeaderContentType) And _
		    response.headers.Value(REST.kHeaderContentType) = REST.kContentTypeJpeg Then
		    mode = OpCode.Binary
		  End If
		  
		  restSocket.Write(EncodeRFC6455(response.response, mode))
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private m_action As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_identifier As String
	#tag EndProperty

	#tag Property, Flags = &h0
		m_open As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_parameters As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_reqData As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_reqMode As OpCode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_resourceName As String
	#tag EndProperty


	#tag Constant, Name = kFrameFinFlag, Type = Double, Dynamic = False, Default = \"&h80", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFrameMaskFlag, Type = Double, Dynamic = False, Default = \"&h80", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFramePayloadLen, Type = Double, Dynamic = False, Default = \"&h7F", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kProtocolHybi_10, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kProtocolRFC6455, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant


	#tag Enum, Name = OpCode, Type = Integer, Flags = &h21
		Continuation = 0
		  Text = 1
		  Binary = 2
		  Close = 8
		  Ping = 9
		Pong = 10
	#tag EndEnum

	#tag Enum, Name = StatusCode, Type = Integer, Flags = &h21
		NormalClosure=1000
		  GoingAway=1001
		  ProtocolError=1002
		  UnsupportedDataType=1003
		  InconsistentMessage=1007
		  PolicyViolation=1008
		  MessageTooBig=1009
		  ExtensionSupportExpected=1010
		UnexpectedCondition=1011
	#tag EndEnum


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
			Name="m_open"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
