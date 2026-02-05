#tag Class
Protected Class ExternalRenderer
Inherits TCPSocket
	#tag Event
		Sub DataAvailable()
		  self.ProcessData()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub EndPresent()
		  Disconnect()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FlushMessage()
		  mMsgID = 0
		  mData = new MemoryBlock(12)
		  mData.LittleEndian = false
		  mRead = 0
		  mMsgReady = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Prepare(xmldoc as XMLDocument, width as integer, height as integer)
		  FlushMessage()
		  Disconnect()
		  
		  If not (SmartML.GetValueB(App.MyMainSettings.DocumentElement, "extrender/@enable", False)) Then
		    return
		  End If
		  
		  Port = SmartML.GetValueN(App.MyMainSettings.DocumentElement, "extrender/@port")
		  If Port = 0 Then
		    Port = 8083 
		  End If
		  mTimeout = SmartML.GetValueN(App.MyMainSettings.DocumentElement, "extrender/@timeout") * 1000
		  If mTimeout = 0 Then
		    mTimeout = 3000000
		  End If
		  Address = SmartML.GetValue(App.MyMainSettings.DocumentElement, "extrender/server")
		  If Address = "" Then
		    Address = "localhost"
		  End If
		  
		  // Try for one second to connect.
		  Connect()
		  Poll()
		  dim startms as Double = Microseconds()
		  While not IsConnected and (Microseconds() - startms) < mTimeout
		    Poll()
		  Wend
		  
		  if not IsConnected then
		    return
		  end if
		  
		  Dim xmlstring as String = xmldoc.ToString()
		  Dim data as new MemoryBlock(4)
		  data.LittleEndian = False // Network endian is BigEndian
		  data.Int16Value(0) = width
		  data.Int16Value(2) = height
		  SendCommand(CMD_PREPARE, data + xmlstring)
		  
		  dim command as Int16
		  data = ReadResult(command)
		  if data <> Nil and data.Size() > 0 then
		    xmldoc.LoadXML(ConvertEncoding(data, Encodings.UTF8))
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessData()
		  dim data as string
		  
		  // The last message still has to be processed.
		  if mMsgReady then
		    return
		  end if
		  
		  //System.DebugLog("Incoming data: " + str(BytesAvailable))
		  
		  // Reading the header
		  if mMsgID = 0 and BytesAvailable > 0 then
		    data = Read(Min(BytesAvailable, mData.size - mRead))
		    mData.StringValue(mRead, data.LenB) = data
		    mRead = mRead + data.LenB
		    if mRead = mData.Size then
		      //System.DebugLog("Header complete")
		      mMsgID = mData.Int16Value(4)
		      mCommand = mData.Int16Value(6)
		      if mData.StringValue(0,4) <> SYNC_ID or mMsgID = 0 then
		        System.DebugLog("Incorrect SYNC_ID or message ID, disconnected.")
		        Disconnect()
		        mMsgID = 0
		      else
		        mData = new MemoryBlock(mData.Int32Value(8))
		        mRead = 0
		        //System.DebugLog("Start reading payload: " + str(mData.Size))
		      end if
		    end if
		  end if
		  
		  // Reading the payload
		  if mMsgID <> 0 and BytesAvailable > 0 then
		    if mRead < mData.Size() then
		      data = Read(Min(BytesAvailable, mData.Size - mRead))
		      mData.StringValue(mRead, data.LenB) = data
		      mRead = mRead + data.LenB
		    end if
		    if mRead = mData.Size then
		      if mWaitingMsgID = 0 or mMsgID <> mWaitingMsgID then
		        // Not the data we need.
		        FlushMessage()
		      else
		        mMsgReady = True
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessExtraSheets(xslide As XmlNode, data as MemoryBlock, position as Integer)
		  // If the renderer needs more sheets, he can report this with some extra XML with sheets
		  if data.Size() > 0 then
		    
		    // Get the new document.
		    dim xmldoc as new XmlDocument
		    xmldoc.LoadXML(ConvertEncoding(data, Encodings.UTF8))
		    dim newslides as XmlNode = xmldoc.Child(0)
		    
		    // Now copy the new ones.
		    dim refnode as XmlNode = xslide.NextSibling
		    for idx as integer = 0 to newslides.ChildCount - 1
		      
		      dim importedslide as XmlNode = xslide.OwnerDocument.ImportNode(newslides.Child(idx), true)
		      
		      if refnode <> Nil then
		        xslide.Parent.Insert(importedslide, refnode)
		      else
		        xslide.Parent.AppendChild(importedslide)
		      end if
		      
		      If PresentWindow.HelperActive Then
		        PresentHelperWindow.InsertItem(importedslide, position + idx)
		      end If
		      
		    next idx
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessImageResult(gfx As Graphics, xslide As XmlNode, data as MemoryBlock, position as Integer) As boolean
		  data.LittleEndian = False
		  dim imagesize as Integer = data.Int32Value(0)
		  if imagesize > 0 then
		    //dim ms as double = Microseconds()
		    dim imagedata as MemoryBlock = data.MidB(4, imagesize)
		    //System.DebugLog("Getting image data took " + str((Microseconds() - ms)/1000) + "ms")
		    //ms = Microseconds()
		    dim image as Picture = Picture.FromData(imagedata)
		    //System.DebugLog("Creating picture took " + str((Microseconds() - ms)/1000) + "ms")
		    //ms = Microseconds()
		    gfx.DrawPicture(image, 0, 0, gfx.Width, gfx.Height, 0, 0, image.Width, image.Height)
		    //System.DebugLog("Drawing took " + str((Microseconds() - ms)/1000) + "ms")
		  end if
		  
		  ProcessExtraSheets(xslide, data.StringValue(4 + imagesize, data.Size - 4 - imagesize), position)
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessSlideResult(gfx As Graphics, xslide As XmlNode, data as MemoryBlock, position as Integer) As boolean
		  data.LittleEndian = False
		  dim xmlsize as Integer = data.Int32Value(0)
		  
		  // Get the new document.
		  dim xmldoc as new XmlDocument
		  xmldoc.LoadXML(ConvertEncoding(data.MidB(4, xmlsize), Encodings.UTF8))
		  dim newslide as XmlNode = xmldoc.Child(0)
		  dim attrnode as XmlAttribute
		  
		  // We want to replace the slide not. But there are external references to this node, so we can only
		  // transfer the contents of the new node to the existing node.
		  // First remove existing nodes and attributes
		  while xslide.ChildCount > 0
		    xslide.RemoveChild(xslide.Child(0))
		  wend
		  while xslide.AttributeCount > 0
		    attrnode = xslide.GetAttributeNode(0)
		    if attrnode.Name <> "xmlns" then
		      xslide.RemoveAttributeNode(attrnode)
		    end if
		  wend
		  
		  // Now copy the new ones.
		  for idx as integer = 0 to newslide.ChildCount - 1
		    dim importedslide as XmlNode = xslide.OwnerDocument.ImportNode(newslide.Child(idx), true)
		    xslide.AppendChild(importedslide)
		  next idx
		  for idx as integer = 0 to newslide.AttributeCount - 1
		    attrnode = newslide.GetAttributeNode(idx)
		    xslide.SetAttribute(attrnode.Name, attrnode.Value)
		  next idx
		  
		  ProcessExtraSheets(xslide, data.StringValue(4 + xmlsize, data.Size() - 4 - xmlsize), position)
		  
		  return false // The renderer only replaced the XML. We still have to render.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadResult(byref command as Int16) As MemoryBlock
		  dim startms as Double = Microseconds()
		  dim result as MemoryBlock
		  
		  // The reply time-out is now fixed to 3 seconds. Maybe make this configurable too, for slow renderers?
		  Poll()
		  While not mMsgReady and (Microseconds() - startms) < mTimeout
		    Poll()
		  Wend
		  
		  if mMsgReady then
		    result = mData
		    command = mCommand
		    mWaitingMsgID = 0
		    FlushMessage()
		  end if
		  
		  ProcessData()
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Render(gfx As Graphics, xslide As XmlNode, position as Integer) As boolean
		  Dim externalrenderid as String = SmartML.GetValue(xslide, "@" + TAG_EXTERNAL_RENDER_ID, False)
		  if not IsConnected or externalrenderid = "" then
		    return False
		  end if
		  
		  dim rendered as Boolean = False
		  
		  Dim xmlstring as String = xslide.ToString()
		  SendCommand(CMD_RENDER, xmlstring)
		  
		  dim command as Int16
		  dim data as MemoryBlock = ReadResult(command)
		  
		  if command = CMD_RENDER_RESULT_XML then
		    rendered = ProcessSlideResult(gfx, xslide, data, position)
		  elseif command = CMD_RENDER_RESULT_IMAGE then
		    rendered = ProcessImageResult(gfx, xslide, data, position)
		  end if
		  
		  return rendered
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SendCommand(command as int16, payload as MemoryBlock)
		  // Send out the Message
		  Write(SYNC_ID)
		  Dim data as new MemoryBlock(8)
		  data.LittleEndian = False // Network endian is BigEndian
		  data.Int16Value(0) = mNextMsgID
		  data.Int16Value(2) = command
		  data.Int32Value(4) = payload.Size
		  Write(data.StringValue(0, 8))
		  Write(payload)
		  
		  // Prepare for receiving a reply
		  mMsgReady = False
		  mWaitingMsgID = mNextMsgID
		  
		  // Move to the next id and check for overflow
		  mNextMsgID = mNextMsgID + 1
		  if mNextMsgID = 0 then
		    mNextMsgID = 1
		  end if
		  
		  ProcessData()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCommand As Int16 = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMsgID As Int16 = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMsgReady As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNextMsgID As int16 = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRead As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		mTimeout As Integer = 3000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWaitingMsgID As Int16 = 0
	#tag EndProperty


	#tag Constant, Name = CMD_PREPARE, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CMD_PREPARE_RESULT, Type = Double, Dynamic = False, Default = \"2000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CMD_RENDER, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CMD_RENDER_RESULT_IMAGE, Type = Double, Dynamic = False, Default = \"3003", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CMD_RENDER_RESULT_XML, Type = Double, Dynamic = False, Default = \"3001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SYNC_ID, Type = String, Dynamic = False, Default = \"OSV1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TAG_EXTERNAL_RENDER_ID, Type = String, Dynamic = False, Default = \"externalrenderid", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mTimeout"
			Group="Behavior"
			InitialValue="3000"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
