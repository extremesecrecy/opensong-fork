#tag Module
Protected Module REST
	#tag Method, Flags = &h0
		Function CrLf() As String
		  Return Encodings.ASCII.Chr(13) + Encodings.ASCII.Chr(10)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseURI(data As String, ByRef resource As String, ByRef action As String, ByRef identifier As String, ByRef parameters As Dictionary) As Integer
		  Dim iPart As Integer = 0
		  
		  If IsNull(parameters) Then
		    parameters = New Dictionary()
		  End If
		  
		  For Each part As String In data.Split("/")
		    
		    part = part.Trim()
		    Select Case iPart
		    Case 0
		      'Skip, there always is a leading slash
		      'Abort when that is not the case
		      If part <> "" Then
		        Exit For
		      End If
		    Case 1
		      resource = LowerCase(part)
		    Case 2
		      action = LowerCase(part)
		      
		    Case 3
		      Select Case part.InStr(":")
		      Case 0
		        'This is an identifier
		        identifier = part
		      Case 1
		        'This is an identifier, starting with ":" (Ruby style REST)
		        identifier = part.Mid(2)
		      Else
		        'Skip id and handles as param
		        parameters.Value(part.Left(part.InStr(":")-1)) = part.Mid(part.InStr(":")+1)
		      End Select
		      
		    Else
		      
		      If part.CountFields(":") > 1 Then
		        parameters.Value(part.Left(part.InStr(":")-1)) = part.Mid(part.InStr(":")+1)
		      Else
		        parameters.Value(part) = true
		      End If
		      
		    End Select
		    
		    iPart = iPart + 1
		  Next
		  
		  Return iPart
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UrlDecode(s As String) As String
		  // takes a Unix-encoded string and decodes it to a UTF8 string.
		  
		  // Based on DecodeFromUnixString
		  // By Sascha René Leib, published 11/08/2003 on the Athenaeum
		  // http://web.archive.org/web/20060520231659/http://realbasic.thezaz.com/Athenaeum/Browse.php?by=category&category=2
		  
		  Dim r As String
		  Dim c As Integer ' current char
		  Dim i As Integer ' loop var
		  
		  Const PERCENTAGE = 37
		  
		  For i= 1 To lenB(s)
		    c = AscB(midB(s, i, 1))
		    
		    If c = PERCENTAGE Then ' %
		      Dim charB1 As Integer = Val("&h" + MidB(s, i+1, 2))
		      If charB1 < 127 Then
		        'Ascii character
		        r = r + ChrB(charB1)
		        i = i + 2
		      ElseIf (charB1 >= 192 And charB1 <= 223) And _
		        AscB(MidB(s, i+3, 1)) = PERCENTAGE Then
		        'UTF8 character
		        Dim charB2 As Integer = Val("&h" + MidB(s, i+4, 2))
		        Dim charMB As Integer = ((charB1 - 192) * 64) + (charB2 - 128)
		        r = r + Encodings.UTF8.Chr(charMB)
		        i = i + 5
		      Else
		        'Not supported
		        Return ""
		      End If
		    Else
		      r = r + ChrB(c)
		    End If
		  Next ' i
		  
		  Return r.DefineEncoding(Encodings.UTF8)
		End Function
	#tag EndMethod


	#tag Note, Name = Readme
		This module and underlying classes provide a RESTful API to OpenSong.
		This API enables remote control and user interface implementations on
		other platforms than those supported by RealBasic.
		For al full description of the API itself, see http://www.opensong.org/home/api
		For details on REST, https://en.wikipedia.org/wiki/Representational_state_transfer is a good start.
		
		Architecture description
		-------------------------
		
		REST
		The REST module provides several utility functions and contants.
		It primarily acts as container and namespace for the REST functional classes.
		
		RESTServer
		The RESTServer is a web server with support for the HTTP and Websocket protocol. It is the entry point for all requests. The object acts as server that accepts connections and manages resources.
		A resource is the first part of the url accepted by the OpenSong webserver, e.g. '/presentation' or '/song'. A resource handling object must implement the RESTResource interface. 
		Each RESTResource implementation needs to be registered to the RESTServer using the AddResource call.
		There is no limitation to the number of resources that can be used as long as each resource has a unique name.
		
		The RESTServer maintains a pool of RESTSocket instances, for handling of incomming connections. The RESTSocket handles basic data communication over a TCPSocket.
		The communicated protocol is not encoded in RESTSocket, but is dispatched to a RESTProtocolHandler implementation.
		There are two protocols available: HTTP, implemented by RESTHttpHandler and WebSocket, implemented by RESTWebSocketHandler.
		
		The initial protocol used by the RESTSocket is HTTP. The protocol can be switched to WebSocket by calling the ProtocolUpgrade method, which is according the WebSocket protocol.
		The upgrade is executed right after completion of the handing of the incoming data.
		
		Credits:
		The REST Server is inspired by the HTTP Server Classes for REALbasic 2006r3
		by The ZAZ Studios, http://www.thezaz.com/opensource/realbasic/server/http/
	#tag EndNote


	#tag Constant, Name = kAccessControlAllowCredentials, Type = String, Dynamic = False, Default = \"Access-Control-Allow-Credentials", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAccessControlAllowHeaders, Type = String, Dynamic = False, Default = \"Access-Control-Allow-Headers", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAccessControlAllowMethods, Type = String, Dynamic = False, Default = \"Access-Control-Allow-Methods", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAccessControlAllowOrigin, Type = String, Dynamic = False, Default = \"Access-Control-Allow-Origin", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAccessControlRequestHeaders, Type = String, Dynamic = False, Default = \"Access-Control-Request-Headers", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAccessControlRequestMethod, Type = String, Dynamic = False, Default = \"Access-Control-Request-Method", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kContentTypeHtml, Type = String, Dynamic = False, Default = \"text/html", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kContentTypeJpeg, Type = String, Dynamic = False, Default = \"image/jpeg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kContentTypeText, Type = String, Dynamic = False, Default = \"text/plain", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kContentTypeXml, Type = String, Dynamic = False, Default = \"text/xml", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHeaderAllow, Type = String, Dynamic = False, Default = \"Allow", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHeaderAuthorization, Type = String, Dynamic = False, Default = \"Authorization", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHeaderContentLength, Type = String, Dynamic = False, Default = \"Content-Length", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHeaderContentType, Type = String, Dynamic = False, Default = \"Content-Type", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHeaderOrigin, Type = String, Dynamic = False, Default = \"Origin", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHeaderWWWAuthenticate, Type = String, Dynamic = False, Default = \"WWW-Authenticate", Scope = Public
	#tag EndConstant


	#tag Enum, Name = HttpMethod, Type = Integer, Flags = &h0
		Get
		  Post
		  Options
		  Head
		  Put
		Delete
	#tag EndEnum

	#tag Enum, Name = HttpStatus, Flags = &h0
		OK=200
		  SwitchingProtocols=101
		  BadRequest=400
		  Unauthorized=401
		  Forbidden=403
		  NotFound=404
		  MethodNotAllowed=405
		  InternalServerError=500
		NotImplemented=501
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
