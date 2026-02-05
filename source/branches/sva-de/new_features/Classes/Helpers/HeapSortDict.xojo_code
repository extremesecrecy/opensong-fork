#tag Class
Protected Class HeapSortDict
	#tag Method, Flags = &h21
		Private Sub Heapify(a() As Variant, keys() As Integer, parentIndex As Integer, lastIndex As Integer)
		  dim childIndex as integer
		  dim temp as variant
		  childIndex = parentIndex*2
		  // if item has no children, do nothing
		  if childIndex > lastIndex then
		    return
		  end
		  // point at largest child
		  if childIndex+1 <= lastIndex then
		    if ShouldSwapItems(a(keys(childIndex)).StringValue, a(keys(childIndex + 1)).StringValue) Then
		      childIndex = childIndex+1
		    end
		  end
		  // if needs swapping, swap and continue heapifying
		  if ShouldSwapItems(a(keys(parentIndex)).StringValue, a(keys(childIndex)).StringValue) then
		    'temp = a(childIndex)
		    'a(childIndex) = a(parentIndex)
		    'a(parentIndex) = temp
		    temp = keys(childIndex)
		    keys(childIndex) = keys(parentIndex)
		    keys(parentIndex) = temp
		    heapify(a, keys, childIndex, lastIndex)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShouldSwapItems(a As String, b As String) As Boolean
		  Return StrComp(Lowercase(a), Lowercase(b), 1) = -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort(d As Dictionary, o() As Integer)
		  //++
		  // Sort the keys of Dictionary d (assumed to be Strings)
		  // into alphabetic order.  Since the Dictionary type doesn't
		  // support direct sorting, return the sorted list by Integer indices
		  // in Integer Array o
		  //
		  // HeapSort algorithm implementation in RealBasic shamelessly
		  // stolen from StringUtils
		  //
		  // This implementation created 7-Feb-2007
		  // (ironic footnote: one year to the day after the CompareHymnBookOrder
		  // was added to StringUtils to support heapsorting a list of song names)
		  //
		  // Ed Palmer, original version
		  //--
		  Dim i, u As Integer
		  Dim temp As Variant
		  Dim keys() As Variant
		  
		  u = d.Count - 1
		  Redim o(u)
		  Redim keys(u)
		  
		  For i = 0 To u
		    o(i) = i
		    keys(i) = d.key(i)
		  Next
		  
		  For i = u DownTo 0
		    heapify(keys, o, i, u)
		  Next
		  For i = u DownTo 1
		    'temp = a(i)
		    'a(i) = a(0)
		    'a(0) = temp
		    temp = o(i)
		    o(i) = o(0)
		    o(0) = temp
		    heapify(keys, o, 0, i - 1)
		  Next
		  Return
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
