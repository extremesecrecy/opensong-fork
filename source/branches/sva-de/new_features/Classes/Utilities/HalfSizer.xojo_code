#tag Class
Protected Class HalfSizer
	#tag Method, Flags = &h0
		Sub AddHeight(rect As RectControl, ratio As Double = .5, parent As Object = Nil)
		  Dim item As HalfSizerItem
		  
		  item = FindManagedControl(rect)
		  
		  If item = Nil Then
		    If parent = Nil Then parent = ParentWindow
		    item = New HalfSizerItem(rect, parent)
		    ManagedControls.Add item
		  End If
		  
		  item.RatioHeight = ratio
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLeft(rect As RectControl, ratio As Double = .5, parent As Object = Nil)
		  Dim item As HalfSizerItem
		  
		  item = FindManagedControl(rect)
		  
		  If item = Nil Then
		    If parent = Nil Then parent = ParentWindow
		    item = New HalfSizerItem(rect, parent)
		    ManagedControls.Add item
		  End If
		  
		  item.RatioLeft = ratio
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLeftTop(rect As RectControl, leftRatio As Double = .5, topRatio As Double = .5, parent As Object = Nil)
		  Dim item As HalfSizerItem
		  
		  item = FindManagedControl(rect)
		  
		  If item = Nil Then
		    If parent = Nil Then parent = ParentWindow
		    item = New HalfSizerItem(rect, parent)
		    ManagedControls.Add item
		  End If
		  
		  item.RatioLeft = leftRatio
		  item.RatioTop = topRatio
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLeftTopWidthHeight(rect As RectControl, leftRatio As Double = .5, topRatio As Double = .5, widthRatio As Double = .5, heightRatio As Double = .5, parent As Object = Nil)
		  Dim item As HalfSizerItem
		  
		  item = FindManagedControl(rect)
		  
		  If item = Nil Then
		    If parent = Nil Then parent = ParentWindow
		    item = New HalfSizerItem(rect, parent)
		    ManagedControls.Add item
		  End If
		  
		  item.RatioLeft = leftRatio
		  item.RatioTop = topRatio
		  item.RatioWidth = widthRatio
		  item.RatioHeight = heightRatio
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLeftWidth(rect As RectControl, leftRatio As Double = .5, widthRatio As Double = .5, parent As Object = Nil)
		  Dim item As HalfSizerItem
		  
		  item = FindManagedControl(rect)
		  
		  If item = Nil Then
		    If parent = Nil Then parent = ParentWindow
		    item = New HalfSizerItem(rect, parent)
		    ManagedControls.Add item
		  End If
		  
		  item.RatioLeft = leftRatio
		  item.RatioWidth = widthRatio
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTop(rect As RectControl, ratio As Double = .5, parent As Object = Nil)
		  Dim item As HalfSizerItem
		  
		  item = FindManagedControl(rect)
		  
		  If item = Nil Then
		    If parent = Nil Then parent = ParentWindow
		    item = New HalfSizerItem(rect, parent)
		    ManagedControls.Add item
		  End If
		  
		  item.RatioTop = ratio
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTopHeight(rect As RectControl, topRatio As Double = .5, heightRatio As Double = .5, parent As Object = Nil)
		  Dim item As HalfSizerItem
		  
		  item = FindManagedControl(rect)
		  
		  If item = Nil Then
		    If parent = Nil Then parent = ParentWindow
		    item = New HalfSizerItem(rect, parent)
		    ManagedControls.Add item
		  End If
		  
		  item.RatioTop = topRatio
		  item.RatioHeight = heightRatio
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddWidth(rect As RectControl, ratio As Double = .5, parent As Object = Nil)
		  Dim item As HalfSizerItem
		  
		  item = FindManagedControl(rect)
		  
		  If item = Nil Then
		    if parent = Nil Then parent = ParentWindow
		    item = New HalfSizerItem(rect, parent)
		    ManagedControls.Add item
		  End If
		  
		  item.RatioWidth = ratio
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(parent As Window)
		  Me.ParentWindow = parent
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindManagedControl(r As RectControl) As HalfSizerItem
		  
		  For i As Integer= 0 To ManagedControls.Ubound
		    If ManagedControls(i).Control = r Then Return ManagedControls(i)
		  Next i
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize()
		  For Each item As HalfSizerItem In ManagedControls
		    item.Adjust
		  Next item
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ManagedControls() As HalfSizerItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ParentWindow As Window
	#tag EndProperty


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
