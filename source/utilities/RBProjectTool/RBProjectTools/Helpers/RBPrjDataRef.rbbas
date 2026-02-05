#tag Class
Protected Class RBPrjDataRef
	#tag Method, Flags = &h0
		Function AsBinaryString() As String
		  if me.len > 0 then
		    return me.ptr.StringValue (me.ofs, me.len)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsDbl() As Double
		  if me.len <> 8 then
		    raiseExc ("Internal error: AsDbl() with len<>8")
		  end
		  return me.ptr.DoubleValue(me.ofs)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsDblString() As String
		  Dim s as String
		  s = ReplaceAll(Format (me.AsDbl, "-0.######"), ",", ".")
		  if mid(s, len(s)) = "." then
		    s = left(s, len(s)-1)
		  end if
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsHexString(maxBytes as Integer = 0) As String
		  dim i, n as Integer
		  dim result, s as String
		  dim mb as MemoryBlock
		  
		  n = me.len
		  if n = 0 then
		    return ""
		  end
		  
		  if maxBytes > 0 and n > maxBytes then
		    n = maxBytes
		    s = "..."
		  end
		  // create the hex string in a preallocated buffer because this is much faster than string concatenation once there are a few 100 characters:
		  mb = New MemoryBlock (n * 2)
		  n = n - 1
		  for i = 0 to n
		    mb.StringValue (i*2, 2) = Right("0"+Hex(me.ptr.Byte(me.ofs+i)), 2)
		  next
		  result = mb.StringValue (0, mb.Size) + s
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsInt() As Integer
		  if me.len <> 4 then
		    raiseExc ("Internal error: AsInt() with len<>4")
		  end
		  return me.ptr.Long(me.ofs)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsIntString() As String
		  return Format (me.AsInt, "-#")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsText() As String
		  return me.AsBinaryString.DefineEncoding(Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(intVal as Integer)
		  me.Constructor
		  me.ptr = new MemoryBlock (4)
		  me.ptr.LittleEndian = false
		  me.ptr.Long (0) = intVal
		  me.ofs = 0
		  me.len = 4
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(mb as MemoryBlock)
		  me.Constructor
		  if mb <> nil then
		    if mb.LittleEndian then
		      raise new RBPrjException ("mb must be big endian", "RBPrjDataRef")
		    end
		    me.ptr = mb
		    me.ofs = 0
		    me.len = mb.Size
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ptr as MemoryBlock, ofs as Integer, len as Integer)
		  if ptr.LittleEndian then
		    raise new RBPrjException ("mb must be big endian", "RBPrjDataRef")
		  end
		  me.Constructor
		  me.ptr = ptr
		  me.ofs = ofs
		  me.len = len
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(str as String)
		  me.Constructor
		  if LenB(str) > 0 then
		    me.ptr = str
		    me.ptr.LittleEndian = false
		    me.ofs = 0
		    me.len = me.ptr.Size
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPrintable() As Boolean
		  dim i, j, v as Integer
		  j = me.ofs+me.len-1
		  for i = me.ofs to j
		    v = me.ptr.Byte(i)
		    if v < 32 then
		      if v <> 9 then // we consider TABs printable
		        return false
		      end
		    end
		  next
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub raiseExc(msg as String)
		  raise new RBPrjException (msg, "RBPrjDataRef", nil)
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		// This class references a RBPrjItem's data (value)
		//
		// Important note:
		//
		// The value must remain immutable! I.e. never allow to modify the data in place, because there
		// may be other references to this same data and they must not all be modified. Instead, if you
		// want to update the value, create a new instance of this class with its own MemoryBlock holding
		// the data.
	#tag EndNote


	#tag Property, Flags = &h0
		len As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ofs As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ptr As MemoryBlock
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
			Name="len"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ofs"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
