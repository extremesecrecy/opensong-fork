#tag Class
Protected Class RESTResourcePresent
Implements REST.RESTResource
	#tag Method, Flags = &h21
		Private Function GetSlide(identifier As String) As REST.RESTResponse
		  Dim result As REST.RESTresponse = Nil
		  Dim xml As XmlDocument
		  Dim root, slide As XmlNode
		  Dim slide_group, xslide As XmlNode
		  Dim slideIndex As Integer = Max(CDbl(identifier), 1)
		  
		  If IsNull(PresentWindow.CurrentSet) Then
		    result = New REST.RESTresponse("The requested slide is not available, no active presentation.", HttpStatus.NotFound)
		  Else
		    result = New REST.RESTresponse
		    
		    xml = result.CreateXmlResponse(Name(), "slide", identifier)
		    root = xml.DocumentElement()
		    
		    xslide = SetML.GetSlide(PresentWindow.CurrentSet, slideIndex)
		    If Not IsNull(xslide) Then
		      
		      slide_group = xslide.Parent.Parent
		      slide = root.AppendChild(xml.CreateElement("slide"))
		      
		      SmartML.CloneChildren slide_group, slide
		      SmartML.CloneAttributes slide_group, slide
		      
		      Dim slide_slides As XmlNode = SmartML.GetNode(slide, "slides", True)
		      SmartML.RemoveChildren(slide_slides)
		      Dim slides_slide As XmlNode = slide_slides.AppendChild(xml.CreateElement("slide"))
		      SmartML.CloneChildren xslide, slides_slide
		      SmartML.CloneAttributes xslide, slides_slide
		      
		    End If
		    
		    result.response = xml.ToString
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSlideImage(identifier As String, preview As Boolean, width As Integer, height As Integer, quality As Integer) As REST.RESTResponse
		  Dim result As REST.RESTResponse
		  Dim imageData As MemoryBlock = Nil
		  
		  Dim scaleW As Boolean = (width = 0 Or height <> 0)
		  Dim scaleH As Boolean = (width <> 0 Or height = 0)
		  Dim defaultW As Integer = 320
		  Dim defaultH As Integer = 240
		  
		  If preview Then
		    If PresentWindow.HelperActive Then
		      defaultW = PresentHelperWindow.cnv_preview_next.Width
		      defaultH = PresentHelperWindow.cnv_preview_next.Height
		    End If
		  Else
		    Dim presentScreen As Integer = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "monitors/@present") - 1
		    If presentScreen < 0 Or presentScreen + 1 > OSScreenCount() Then presentScreen = 0
		    
		    defaultW = OSScreen(presentScreen).Width
		    defaultH = OSScreen(presentScreen).Height
		  End If
		  
		  If width = 0 Then width = defaultW
		  If height = 0 Then height = defaultH
		  If scaleW Then width = width * height / defaultH
		  If scaleH Then height = height * width / defaultW
		  
		  width = Min(Max(width, 0), 4096)
		  height = Min(Max(height, 0), 4096)
		  quality = Min(Max(quality, 0), 100)
		  
		  If Not preview And identifier = "current" Then
		    imageData = PresentWindow.CurrentPicture.GetData(Picture.FormatJPEG, quality)
		  Else
		    Dim slide As XmlNode = SetML.GetSlide(PresentWindow.CurrentSet, CDbl(identifier))
		    If Not IsNull(slide) Then
		      Dim image As Picture = New Picture(width, height, OSScreen(0).Depth)
		      Try
		        SetML.DrawSlide image.Graphics, slide, SetML.GetStyle(slide)
		        imageData = image.GetData(Picture.FormatJPEG, quality)
		      Catch e As NilObjectException
		        imageData = Nil
		      End Try
		    End If
		  End If
		  
		  If Not IsNull(imageData) Then
		    result = New REST.RESTResponse(imageData)
		    result.headers.Value(REST.kContentType) = REST.kContentTypeJpeg
		    result.headers.Value("Expires") = "Tue, 09 Feb 2011 14:02:00 GMT"    // a certain date in the past ...
		    result.headers.Value("Cache-Control") = "no-cache, must-revalidate"  // HTTP/1.1
		    result.headers.Value("Pragma") = "no-cache"
		  Else
		    result = New REST.RESTResponse("The requested slide is not available.", HttpStatus.NotFound)
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStatus() As REST.RESTResponse
		  Dim result As New REST.RESTResponse
		  Dim xml As XmlDocument
		  Dim root, active, present, screen, slide As XmlNode
		  
		  xml = result.CreateXmlResponse(Name(), "status")
		  root = xml.DocumentElement()
		  present = root.AppendChild(xml.CreateElement("presentation"))
		  If Globals.Status_Presentation Then
		    SmartML.SetValueN(present, "@running", 1)
		  Else
		    SmartML.SetValueN(present, "@running", 0)
		  End If
		  
		  If Globals.Status_Presentation Then
		    Dim mode As String
		    Select Case PresentWindow.Mode
		    Case "B"
		      mode = "black"
		    Case "F"
		      mode = "freeze"
		    Case "H"
		      mode = "hidden"
		    Case "L"
		      mode = "logo"
		    Case "N"
		      mode = "normal"
		    Case "W"
		      mode = "white"
		    End Select
		    SmartML.SetValue(present, "screen", mode)
		    screen = SmartML.GetNode(present, "screen")
		    SmartML.SetValue(screen, "@mode", PresentWindow.Mode)
		    
		    slide = present.AppendChild(xml.CreateElement("slide"))
		    SmartML.SetValue(slide, "@itemnumber", Str(PresentWindow.CurrentSlide))
		    If Not IsNull(PresentWindow.XCurrentSlide) Then
		      SmartML.SetValue(slide, "name", SmartML.GetValue(PresentWindow.XCurrentSlide.Parent.Parent, "@name"))
		      SmartML.SetValue(slide, "title", SmartML.GetValue(PresentWindow.XCurrentSlide.Parent.Parent, "title"))
		    End If
		  End If
		  
		  result.response = xml.ToString
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleClose(protocolHandler As REST.RESTProtocolHandler) As REST.RESTResponse
		  Dim result As REST.RESTResponse = Nil
		  
		  If protocolHandler.Method() = HttpMethod.Options Then
		    result = New REST.RESTResponse()
		    If protocolHandler.Header(REST.kAccessControlRequestMethod, "") <> "POST" Then
		      result.headers.Value(REST.kHeaderAllow) = "POST"
		    End If
		    
		  ElseIf protocolHandler.Method() = HttpMethod.Post Then
		    If PresentWindow.PerformAction(PresentWindow.ACTION_EXIT_NOPROMPT) Then
		      result = New REST.RESTResponse("OK")
		    Else
		      result =  New REST.RESTresponse("The requested action failed.",  HttpStatus.InternalServerError)
		    End If
		    
		  Else
		    result = New REST.RESTresponse("The request method is not allowed, use POST.", HttpStatus.MethodNotAllowed)
		    result.headers.Value(REST.kHeaderAllow) = "POST"
		  End If
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleScreen(protocolHandler As REST.RESTProtocolHandler) As REST.RESTresponse
		  Dim result As REST.RESTResponse = Nil
		  Dim supported As Boolean = False
		  
		  Select Case protocolHandler.Identifier()
		  Case "normal", _
		    "toggle_black", _
		    "black", _
		    "toggle_white", _
		    "white", _
		    "toggle_hide", _
		    "hide", _
		    "toggle_logo", _
		    "logo", _
		    "toggle_freeze", _
		    "freeze", _
		    "alert"
		    supported = True
		  Else
		    supported = False
		  End Select
		  
		  If supported Then
		    If protocolHandler.Method() = HttpMethod.Options Then
		      
		      result = New REST.RESTResponse()
		      If protocolHandler.Header(REST.kAccessControlRequestMethod, "") <> "POST" Then
		        result.headers.Value(REST.kHeaderAllow) = "POST"
		      End If
		      
		    ElseIf protocolHandler.Method() = HttpMethod.Post Then
		      Dim success As Boolean = False
		      
		      Select Case protocolHandler.Identifier()
		      Case"normal"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_NORMAL)
		      Case"toggle_black", _
		        "black"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_BLACK)
		      Case"toggle_white", _
		        "white"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_WHITE)
		      Case"toggle_hide", _
		        "hide"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_HIDE)
		      Case"toggle_logo", _
		        "logo"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_LOGO)
		      Case"toggle_freeze", _
		        "freeze"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_FREEZE)
		      Case"alert"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_ALERT, protocolHandler.Parameter("message", ""))
		      Else
		        'Just to be sure
		        supported = False
		      End Select
		      
		      If supported Then
		        If success Then
		          result = New REST.RESTResponse("OK")
		        Else
		          result = New REST.RESTResponse("The requested action failed.", HttpStatus.InternalServerError)
		        End If
		      Else
		        result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		      End If
		      
		    Else
		      result = New REST.RESTresponse("The request method is not allowed, use POST.", HttpStatus.MethodNotAllowed)
		      result.headers.Value(REST.kHeaderAllow) = "POST"
		    End If
		  Else
		    result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleSection(protocolHandler As REST.RESTProtocolHandler) As REST.RESTresponse
		  Dim result As REST.RESTResponse = Nil
		  Dim supported As Boolean = False
		  
		  Select Case protocolHandler.Identifier()
		  Case"next", _
		    "previous"
		    supported = True
		  Else
		    supported = False
		  End Select
		  
		  If supported Then
		    If protocolHandler.Method() = HttpMethod.Options Then
		      result = New REST.RESTResponse()
		      If protocolHandler.Header(REST.kAccessControlRequestMethod, "") <> "POST" Then
		        result.headers.Value(REST.kHeaderAllow) = "POST"
		      End If
		      
		    ElseIf protocolHandler.Method() = HttpMethod.Post Then
		      Dim success As Boolean = False
		      
		      Select Case protocolHandler.Identifier()
		      Case"next"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_NEXT_SECTION)
		      Case"previous"
		        success = PresentWindow.PerformAction(PresentWindow.ACTION_PREV_SECTION)
		      Else
		        'Just to be sure
		        supported = False
		      End Select
		      
		      If supported Then
		        If success Then
		          result = New REST.RESTResponse("OK")
		        Else
		          result = New REST.RESTResponse("The requested action failed.", HttpStatus.InternalServerError)
		        End If
		      Else
		        result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		      End If
		      
		    Else
		      result = New REST.RESTresponse("The request method is not allowed, use POST.", HttpStatus.MethodNotAllowed)
		      result.headers.Value(REST.kHeaderAllow) = "POST"
		    End If
		  Else
		    result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleSlide(protocolHandler As REST.RESTProtocolHandler) As REST.RESTresponse
		  Dim result As REST.RESTResponse = Nil
		  Dim isPostAction As Boolean = False
		  
		  Select Case protocolHandler.Identifier()
		  Case "next", _
		    "previous", _
		    "first" ,_
		    "last", _
		    "song", _
		    "scripture"
		    isPostAction = True
		  Else
		    isPostAction = False
		  End Select
		  
		  If protocolHandler.Method() = HttpMethod.Options Then
		    result = New REST.RESTResponse()
		    If isPostAction then
		      If protocolHandler.Header(REST.kAccessControlRequestMethod, "") <> "POST" Then
		        result.headers.Value(REST.kHeaderAllow) = "POST"
		      End If
		    End If
		    
		  Else
		    If protocolHandler.Identifier() = "" Or _
		      protocolHandler.Identifier() = "list" Then
		      
		      result = ListSlides()
		      
		    ElseIf protocolHandler.Identifier() <> "" And _
		      Not isPostAction Then
		      
		      If protocolHandler.Parameter("preview", false) Then
		        result = GetSlideImage(protocolHandler.Identifier(), true, _
		        protocolHandler.Parameter("width", 0), _
		        protocolHandler.Parameter("height", 0), _
		        protocolHandler.Parameter("quality", 50))
		        
		      ElseIf protocolHandler.Parameter("image", false) Then
		        result = GetSlideImage(protocolHandler.Identifier(), false, _
		        protocolHandler.Parameter("width", 0), _
		        protocolHandler.Parameter("height", 0), _
		        protocolHandler.Parameter("quality", 85))
		        
		      ElseIf IsNumeric(protocolHandler.Identifier()) Then
		        If protocolHandler.Method() = HttpMethod.Post Then
		          If PresentWindow.PerformAction(PresentWindow.ACTION_SLIDE, protocolHandler.Identifier()) Then
		            result = New REST.RESTResponse("OK")
		          Else
		            result = New REST.RESTResponse("The requested action failed.", HttpStatus.InternalServerError)
		          End If
		        Else
		          result = GetSlide(protocolHandler.Identifier())
		        End If
		        
		      Else
		        result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		      End If
		      
		    Else
		      If protocolHandler.Method() = HttpMethod.Post Then
		        Dim supported, success As Boolean
		        supported = True
		        success = False
		        
		        Select Case protocolHandler.Identifier()
		        Case "next"
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_NEXT_SLIDE)
		        Case "previous"
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_PREV_SLIDE)
		        Case "first"
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_FIRST_SLIDE)
		        Case"last"
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_LAST_SLIDE)
		          
		        Case "song"
		          result = InsertSong(protocolHandler.Parameter("folder", ""), _
		          protocolHandler.Parameter("song", ""), _
		          protocolHandler.Parameter("after", -1), _
		          protocolHandler.Parameter("order", ""))
		          
		        Case"scripture"
		          Return New REST.RESTResponse("Todo.", HttpStatus.NotImplemented)
		          
		        Else
		          supported = False
		        End Select
		        
		        If supported Then
		          If success Then
		            result = New REST.RESTResponse("OK")
		          Else
		            If IsNull(result) Then
		              result = New REST.RESTResponse("The requested action failed.", HttpStatus.InternalServerError)
		            End If
		          End If
		        Else
		          result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		        End If
		        
		      Else
		        result = New REST.RESTresponse("The request method is not allowed, use POST.", HttpStatus.MethodNotAllowed)
		        result.headers.Value(REST.kHeaderAllow) = "POST"
		      End If
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleSong(protocolHandler As REST.RESTProtocolHandler) As REST.RESTresponse
		  Dim result As REST.RESTResponse
		  Dim supported As Boolean = False
		  
		  Select Case protocolHandler.Identifier()
		  Case"current"
		    supported = True
		  Else
		    If Val(protocolHandler.Identifier()) > 0 Then
		      supported = True
		    End If
		  End Select
		  
		  If supported Then
		    If protocolHandler.Method() = HttpMethod.Options Then
		      result = New REST.RESTResponse()
		      If protocolHandler.Header(REST.kAccessControlRequestMethod, "") <> "POST" Then
		        result.headers.Value(REST.kHeaderAllow) = "POST"
		      End If
		      
		    ElseIf protocolHandler.Method() = HttpMethod.Post Then
		      Dim success As Boolean = False
		      
		      Select Case protocolHandler.Identifier()
		      Case"current"
		        
		        If protocolHandler.Parameter("chorus", false) Then
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_CHORUS)
		        ElseIf protocolHandler.Parameter("bridge", false) Then
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_BRIDGE)
		        ElseIf protocolHandler.Parameter("prechorus", false) Then
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_PRECHORUS)
		        ElseIf protocolHandler.Parameter("tag", false) Then
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_TAG)
		        ElseIf protocolHandler.Parameter("verse", "") <> "" Then
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_VERSE, protocolHandler.Parameter("verse", "V1"))
		        Else
		          supported = False
		        End If
		        
		      Else
		        
		        Dim index As Integer = Val(protocolHandler.Identifier())
		        If index > 0 Then
		          success = PresentWindow.PerformAction(PresentWindow.ACTION_SONG, index)
		        Else
		          result = New REST.RESTResponse("The requested song is not available.", HttpStatus.NotFound)
		        End If
		        
		      End Select
		      
		      If supported Then
		        If success Then
		          result = New REST.RESTResponse("OK")
		        Else
		          result = New REST.RESTResponse("The requested action failed.", HttpStatus.InternalServerError)
		        End If
		      Else
		        result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		      End If
		      
		    Else
		      result = New REST.RESTresponse("The request method is not allowed, use POST.", HttpStatus.MethodNotAllowed)
		      result.headers.Value(REST.kHeaderAllow) = "POST"
		    End If
		  Else
		    result = New REST.RESTResponse("The requested action is not available.", HttpStatus.NotFound)
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InsertSong(folder As String, song As String, after As Integer, order As String) As REST.RESTResponse
		  Dim result As REST.RESTResponse = Nil
		  
		  Dim f As FolderItem = MainWindow.Songs.GetFileInFolderSafe(song, folder)
		  If f <> Nil Then
		    If PresentWindow.InsertSongIntoSet(f, after, order, False, False) Then
		      result = New REST.RESTResponse("OK")
		    Else
		      result = New REST.RESTResponse("The requested action failed.", HttpStatus.InternalServerError)
		    End If
		  Else
		    result = New REST.RESTresponse("The requested action is not available.", HttpStatus.NotFound)
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ListSlides() As REST.RESTResponse
		  Dim result As REST.RESTresponse = Nil
		  Dim xml As XmlDocument
		  Dim root, slide As XmlNode
		  Dim slide_group, xslide As XmlNode
		  Dim index As Integer = 1
		  
		  If IsNull(PresentWindow.CurrentSet) Then
		    result = New REST.RESTresponse("The requested set is not available, no active presentation.", HttpStatus.NotFound)
		  Else
		    result = New REST.RESTresponse
		    
		    xml = result.CreateXmlResponse(Name(), "slide")
		    root = xml.DocumentElement()
		    
		    xslide = SetML.GetSlide(PresentWindow.CurrentSet, index)
		    While Not IsNull(xslide)
		      
		      If xslide.PreviousSibling Is Nil Then
		        Dim xPrevSlideGroup As XmlNode = xslide.Parent.Parent.PreviousSibling
		        If xPrevSlideGroup <> Nil Then
		          
		          If SmartML.GetValue(xPrevSlideGroup, "@type", False) = "style" Then
		            slide = root.AppendChild(xml.CreateElement("slide"))
		            SmartML.SetValue(slide, "@name", SmartML.GetValue(slide_group, "@name"))
		            SmartML.SetValue(slide, "@type", "style")
		          End If
		          
		        End If
		      End If
		      
		      slide_group = xslide.Parent.Parent
		      slide = root.AppendChild(xml.CreateElement("slide"))
		      SmartML.SetValueN(slide, "@identifier", index) 'SmartML.GetValueN(slide_group, "@ItemNumber"))
		      SmartML.SetValue(slide, "@name", SmartML.GetValue(slide_group, "@name"))
		      SmartML.SetValue(slide, "@type", SmartML.GetValue(slide_group, "@type"))
		      
		      If slide_group.GetAttribute("type") = "song" Then
		        SmartML.SetValue(slide, "@presentation", SmartML.GetValue(slide_group, "presentation"))
		      End If
		      
		      SmartML.SetValue(slide, "title", SmartML.GetValue(slide_group, "title"))
		      SmartML.SetValue(slide, "subtitle", SmartML.GetValue(slide_group, "subtitle"))
		      
		      xslide = SetML.GetNextSlide(xslide)
		      index = index + 1
		    Wend
		    
		    result.response = xml.ToString
		    
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  // Part of the REST.RESTResource interface.
		  
		  Return "presentation"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Process(protocolHandler As REST.RESTProtocolHandler) As REST.RESTresponse
		  // Part of the REST.RESTResource interface.
		  
		  Dim result As REST.RESTresponse
		  Dim action As String = protocolHandler.Action()
		  Dim identifier As String = protocolHandler.Identifier()
		  
		  If action = "status" Then
		    result = GetStatus
		    
		  Else
		    If Globals.Status_Presentation Then
		      Select Case action
		      Case "song", _
		        "songs"
		        result =HandleSong(protocolHandler)
		        
		      Case "slide", _
		        "slides"
		        result =HandleSlide(protocolHandler)
		        
		      Case "section", _
		        "sections"
		        result =HandleSection(protocolHandler)
		        
		      Case "screen"
		        result =HandleScreen(protocolHandler)
		        
		      Case "close"
		        result =HandleClose(protocolHandler)
		        
		      Else
		        result = New REST.RESTresponse("The requested action is not available.", HttpStatus.NotFound)
		      End Select
		    Else
		      result = New REST.RESTresponse("There is no running presentation, requested action cannot be executed.", HttpStatus.Forbidden)
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
