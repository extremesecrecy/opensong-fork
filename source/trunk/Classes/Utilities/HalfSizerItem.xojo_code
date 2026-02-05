#tag Class
Protected Class HalfSizerItem
	#tag Method, Flags = &h0
		Sub Adjust()
		  Dim newLeft As Double
		  Dim newTop As Double
		  Dim newWidth As Double
		  Dim newHeight As Double
		  
		  Dim leftAdjust As Double
		  Dim topAdjust As Double
		  Dim deltaWidth As Double
		  Dim deltaHeight As Double
		  
		  If ContainerIsWindow Then
		    leftAdjust = 0
		    topAdjust = 0
		    Dim w As Window = Window(Container)
		    deltaWidth = w.Width - OriginalContainerBounds.Width
		    deltaHeight = w.Height - OriginalContainerBounds.Height
		  Else
		    Dim r As RectControl = RectControl(Container)
		    leftAdjust = r.Left - OriginalContainerBounds.Left
		    topAdjust = r.Top - OriginalContainerBounds.Top
		    deltaWidth = r.Width - OriginalContainerBounds.Width
		    deltaHeight = r.Height - OriginalContainerBounds.Height
		  End If
		  
		  If mRatioLeft <> 0 Then
		    newLeft = OriginalControlBounds.Left + leftAdjust + _
		    deltaWidth * mRatioLeft
		    If Control.Left <> newLeft Then
		      Control.Left = newLeft
		    End If
		  End If
		  
		  If mRatioTop <> 0 Then
		    newTop = OriginalControlBounds.Top + topAdjust + _
		    deltaHeight * mRatioTop
		    If Control.Top <> newTop Then
		      Control.Top = newTop
		    End If
		  End If
		  
		  If mRatioWidth <> 0 Then
		    newWidth = OriginalControlBounds.Width + _
		    deltaWidth * mRatioWidth
		    If Control.Width <> newWidth Then
		      Control.Width = newWidth
		    End If
		  End If
		  
		  If mRatioHeight <> 0 Then
		    newHeight = OriginalControlBounds.Height + _
		    deltaHeight * mRatioHeight
		    If Control.Height <> newHeight Then
		      Control.Height = newHeight
		    End If
		  End If
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(c As RectControl, controlContainer As Object)
		  mControl = c
		  If controlContainer IsA Window Then
		    ContainerIsWindow = True
		    Container = controlContainer
		    Dim w As Window = Window(Container)
		    OriginalContainerBounds = New REALbasic.Rect(w.Left, w.Top, w.Width, w.Height)
		  ElseIf controlContainer IsA RectControl Then
		    ContainerIsWindow = False
		    Container = controlContainer
		    Dim r As RectControl = RectControl(Container)
		    OriginalContainerBounds = New REALbasic.Rect(r.Left, r.Top, r.Width, r.Height)
		  Else
		    Dim iag As New InvalidArgumentException
		    iag.Message = "controlContainer must be a Window or RectControl"
		    Raise iag
		    Return
		  End If
		  
		  If c <> Nil Then
		    OriginalControlBounds = New REALbasic.Rect(c.Left, c.Top, c.Width, c.Height)
		  Else
		    Dim noe As New NilObjectException
		    noe.Message = "Control cannot be Nil"
		    Raise noe
		    Return
		  End If
		  Return
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Container As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ContainerIsWindow As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mControl
			End Get
		#tag EndGetter
		Control As RectControl
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mControl As RectControl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRatioHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRatioLeft As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRatioTop As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRatioWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OriginalContainerBounds As REALbasic.Rect
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OriginalControlBounds As REALbasic.Rect
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRatioHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRatioHeight = value
			End Set
		#tag EndSetter
		RatioHeight As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRatioLeft
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRatioLeft = value
			End Set
		#tag EndSetter
		RatioLeft As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRatioTop
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRatioTop = value
			End Set
		#tag EndSetter
		RatioTop As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRatioWidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRatioWidth = value
			End Set
		#tag EndSetter
		RatioWidth As Double
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="RatioHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RatioLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RatioTop"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RatioWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
