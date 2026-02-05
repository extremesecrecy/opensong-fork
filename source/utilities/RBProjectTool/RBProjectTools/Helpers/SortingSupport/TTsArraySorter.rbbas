#tag Module
Protected Module TTsArraySorter
	#tag Method, Flags = &h21
		Private Sub arrayQuickSort2(firstIdx as Integer, lastIdx as Integer, lexical as Boolean, arr() as TTsSortableValue)
		  Dim f, q as Integer
		  f = firstIdx
		  while f < lastIdx
		    q = partition2 (f, lastIdx, lexical, arr)
		    arrayQuickSort2 (f, q, lexical, arr)
		    f = q + 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function isLess(leftVal as Variant, rightVal as Variant, lexical as Boolean) As Boolean
		  if leftVal.IsNumeric then
		    if rightVal.IsNumeric then
		      return leftVal.DoubleValue < rightVal.DoubleValue
		    else
		      return true
		    end
		  elseif rightVal.IsNumeric then
		    return false
		  elseif lexical then
		    Select Case StrComp (Uppercase(leftVal), Uppercase(rightVal), 0)
		    Case -1
		      return true
		    Case 1
		      return false
		    case else
		      return StrComp (leftVal, rightVal, 1) < 0
		    End Select
		    return StrComp (leftVal, rightVal, 1) < 0
		  else
		    return StrComp (leftVal, rightVal, 0) < 0
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function partition2(p0 as Integer, r as Integer, lexical as Boolean, arr() as TTsSortableValue) As Integer
		  Dim p, j, mid as Integer, tmp as TTsSortableValue
		  dim midVal as Variant
		  mid = (p0 + r) / 2
		  p = p0 - 1
		  j = r + 1
		  do
		    midVal = arr(mid).SortValue
		    do
		      j = j - 1
		    loop until j = mid or isLess (arr(j).SortValue, midVal, lexical)
		    do
		      p = p + 1
		    loop until p = mid or isLess (midVal, arr(p).SortValue, lexical)
		    if p < j then
		      if p > mid then
		        mid = p
		      end
		      if j < mid then
		        mid = j
		      end
		      // swap:
		      tmp = arr(p)
		      arr(p) = arr(j)
		      arr(j) = tmp
		      if p = mid then
		        mid = j
		        j = j + 1
		      elseif j = mid then
		        mid = p
		        p = p - 1
		      end
		    else
		      if mid = r then
		        return mid-1
		      else
		        return mid
		      end
		    end
		  loop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortValueArray(arr() as TTsSortableValue, lexical as Boolean)
		  arrayQuickSort2 (0, Ubound(arr), lexical, arr)
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		The Sort function here sorts objects by the Variant value they return
		
		Numeric values are sorted by their numeric values, all others by their string value
	#tag EndNote


End Module
#tag EndModule
