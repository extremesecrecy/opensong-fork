#tag Class
Protected Class RBPrjBinaryFileWriter
Inherits RBPrjProcessingHelper
Implements RBPrjProcessing
	#tag Method, Flags = &h0
		Function BlockEnter(tag as String, id as Integer, header as RBPrjDataRef) As Boolean
		  me.itemCount = me.itemCount + 1
		  me.positionStack.Append me.out_stream.Position
		  
		  // for now, this code assumes that the header is properly set up. Later we might change this code
		  // so that it can regenerate the header on its own, but until then we better make sure all's proper
		  assert (header.len = 32, "block header must be 32 bytes long")
		  assert (header.ptr.Long(header.ofs+0) = RBPrjItem.TypeBlock, "wrong id in block header")
		  assert (header.ptr.StringValue(header.ofs+4,4) = tag, "wrong tag in block header")
		  assert (header.ptr.Long(header.ofs+8) = id, "wrong id in block header")
		  
		  me.out_stream.Write header.AsBinaryString // block header, needs some updating later, though
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlockLeave(tag as String, id as Integer, optionalName as String, extFileRef as FolderItem)
		  dim startPos, diff, remain, n as Integer
		  
		  startPos = me.positionStack.Pop
		  
		  // add padding (fill up to $400 byte block's length)
		  
		  diff = me.out_stream.Position - startPos
		  remain = &H0400 - (diff MOD &H0400)
		  if remain <> &H0400 then
		    if remain < 12 then
		      remain = remain + &H0400
		    end
		    diff = diff + remain
		    n = (remain - 12)
		    me.out_stream.WriteInt32 RBPrjItem.TypePadding // Padding: length, filling made of asterisks ("*")
		    me.out_stream.WriteInt32 RBPrjItem.TypePadding
		    me.out_stream.WriteInt32 n
		    while n > 0
		      me.out_stream.Write "****"
		      n = n - 4
		    wend
		  end
		  
		  // set length of block at block header
		  
		  assert ((diff mod &H400) = 0, "block len wrong")
		  me.patchLongs startPos+16, Array (diff)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  '### this should be used but does not work yet: return RBPrjSupport.NewFileWriter (f, me)
		  dim p as RBPrjBinaryFileWriter
		  p = new RBPrjBinaryFileWriter (me.forcedFolder, me.addedSuffix)
		  p.parent = me
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(forcedFolder as FolderItem, addedFileSuffix as String)
		  me.addedSuffix = addedFileSuffix
		  me.forcedFolder = forcedFolder
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  if me.out_stream <> nil then
		    me.out_stream.Close
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalsProcessingFinished()
		  me.parent = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FilesCreated() As FolderItem()
		  return me.writtenFiles
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupEnter(tag as String, id as Integer)
		  // Grouping: length, ID, items(), "EndG", ID
		  
		  me.itemCount = me.itemCount + 1
		  #pragma Warning "identify data with no ids for groups and set id = me.itemCount" // e.g data from .rbvcp
		  me.itemCountStack.Append id
		  me.positionStack.Append me.out_stream.Position
		  
		  me.out_stream.Write tag
		  me.out_stream.WriteInt32 RBPrjItem.TypeGroup
		  me.out_stream.WriteInt32 0
		  me.out_stream.WriteInt32 id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupLeave(tag as String, id as Integer)
		  dim startPos, diff as Integer
		  
		  startPos = me.positionStack.Pop
		  diff = me.out_stream.Position - startPos - 12
		  
		  patchLongs startPos+8, Array (diff)
		  
		  me.out_stream.Write "EndG"
		  me.out_stream.WriteInt32 RBPrjItem.TypeInt
		  me.out_stream.WriteInt32 me.itemCountStack.Pop
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastOutputFile() As FolderItem
		  return me.lastOutFileRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub patchLongs(pos as Integer, values() as Integer)
		  dim posNow, v as Integer
		  posNow = me.out_stream.Position
		  me.out_stream.Position = pos
		  for each v in values
		    me.out_stream.WriteInt32 v
		  next
		  me.out_stream.Position = posNow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFinished()
		  me.out_stream.WriteInt32 RBPrjItem.TypeEOF
		  
		  if me.out_stream <> nil then
		    me.out_stream.Close
		    me.out_stream = nil
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessHeader(dataRef as RBPrjDataRef, results as RBPrjParseResults, inputFileRef as FolderItem)
		  dim f as FolderItem
		  dim fType as String
		  
		  SetParseResultsObj (results)
		  
		  // for now, this code assumes that the header is properly set up. Later we might change this code
		  // so that it can regenerate the header on its own, but until then we better make sure all's proper
		  assert (StrComp (dataRef.ptr.StringValue(dataRef.ofs, 4).DefineEncoding(Encodings.ASCII), "RbBF", 0) = 0, "not a valid prj header")
		  assert (dataRef.len >= 20, "block header must be at least 20 bytes long")
		  assert (dataRef.ptr.Long(dataRef.ofs+16) = dataRef.len, "block header's length must be equal to long value at ofs 16")
		  
		  if me.forcedFolder <> nil then
		    assert (me.forcedFolder.Exists and me.forcedFolder.Directory, "forcedFolder does not exist")
		    f = me.forcedFolder.TrueChild (inputFileRef.Name)
		  elseif inputFileRef <> nil then
		    f = inputFileRef.Parent.TrueChild (inputFileRef.Name)
		  else
		    raiseExc ("No output path specified")
		  end
		  
		  f = RBPrjHelper.AddedBeforeExtension (f, me.addedSuffix)
		  dim fName as String = f.Name
		  if fName.Right(4) = ".xml" then
		    // replace .xml extension with .rbp
		    f = f.Parent.TrueChild (fName.Left (fName.Len-4)+".rbp")
		  end
		  
		  me.lastOutFileRef = f
		  if me.parent <> nil then
		    // it's an external item
		    fType = "RBext"
		  else
		    fType = "RBprj"
		  end
		  RBPrjHelper.DeleteFile f, true
		  me.out_stream = BinaryStream.Create (f)
		  if me.out_stream = nil then
		    // if we get here, it might be because the FileTypes are not defined in the project!
		    raiseExc ("Can not create file", f)
		  end
		  me.out_stream.LittleEndian = false
		  me.out_stream.Write dataRef.AsBinaryString // project header (starting with "RbBF")
		  
		  if me.parent = nil then
		    me.writtenFiles.Append f
		  else
		    me.parent.writtenFiles.Append f
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessItem(type as Integer, tag as String, valueRef as RBPrjDataRef)
		  dim i, n as Integer
		  
		  me.itemCount = me.itemCount + 1
		  
		  if type = RBPrjItem.TypeInt then
		    assert (valueRef.len = 4, "len must be 4 for ints")
		    me.out_stream.Write tag
		    me.out_stream.WriteInt32 type
		    me.out_stream.WriteInt32 valueRef.ptr.Long(valueRef.ofs)
		  elseif type = RBPrjItem.TypeDbl Then
		    assert (valueRef.len = 8, "len must be 8 for double")
		    me.out_stream.Write tag
		    me.out_stream.WriteInt32 type
		    me.out_stream.WriteDouble valueRef.ptr.DoubleValue(valueRef.ofs)
		  elseif type = RBPrjItem.TypeString then
		    me.out_stream.Write tag
		    me.out_stream.WriteInt32 type
		    me.out_stream.WriteInt32 valueRef.len
		    me.out_stream.Write valueRef.AsBinaryString
		    n = 4 - (valueRef.len MOD 4)
		    if n = 4 then
		      n = 0
		    end
		    for i = 1 to n
		      me.out_stream.Write " "
		    next
		  elseif type = RBPrjItem.TypeRect then
		    assert (valueRef.len = 16, "len must be 16 for rects")
		    me.out_stream.Write tag
		    me.out_stream.WriteInt32 type
		    for i = 0 to 3
		      me.out_stream.WriteInt32 valueRef.ptr.Long(valueRef.ofs+i*4)
		    next
		  elseif type = RBPrjItem.TypeEncrypted then
		    me.out_stream.Write valueRef.AsBinaryString
		    n = 4 - (valueRef.len MOD 4)
		    if n = 4 then
		      n = 0
		    end
		    for i = 1 to n
		      me.out_stream.WriteInt8 0
		    next
		  else
		    // it's something else I don't know yet
		    raiseExc ("Unknown value type "+RBPrjHelper.IntToStr4(type)+" passed with tag "+tag)
		  end
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		// Writes complete binary project files
	#tag EndNote


	#tag Property, Flags = &h21
		Private addedSuffix As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private forcedFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private itemCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private itemCountStack() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastOutFileRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private out_stream As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected parent As RBPrjBinaryFileWriter
	#tag EndProperty

	#tag Property, Flags = &h21
		Private positionStack() As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected writtenFiles() As FolderItem
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
