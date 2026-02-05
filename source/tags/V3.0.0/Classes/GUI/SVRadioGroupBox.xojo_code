#tag Class
Protected Class SVRadioGroupBox
Inherits GroupBox
	#tag Event
		Sub Open()
		  Organize
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Organize()
		  Dim r() As Control
		  Dim i As Integer
		  Dim rc As RectControl
		  Dim offset As Integer
		  
		  Dim p As Picture
		  Dim w As Window = Me.Window
		  p = w.BitmapForCaching(Me.Width, Me.Height)
		  p.Graphics.TextFont = Me.TextFont
		  p.Graphics.TextSize = Me.TextSize
		  offset = p.Graphics.TextHeight / 2 + 0.5
		  System.DebugLog CurrentMethodName + ": TextHeight, offset" + CStr(p.Graphics.TextHeight) + ", " + CStr(offset)
		  
		  For i = 0 To w.ControlCount - 1
		    If w.Control(i) IsA RectControl Then
		      If RectControl(w.Control(i)).Parent = Control(Me) Then
		        If Not ((w.Control(i) IsA RadioButton) Or w.Control(i) IsA CheckBox) Then
		          Return
		        End If
		        r.Append w.Control(i)
		      End If
		    End If
		  Next
		  
		  If r.Ubound < 0 Then Return
		  Dim tops() As Integer
		  Dim totalHeight As Integer
		  
		  For i = 0 To r.Ubound
		    tops.Append RectControl(r(i)).Top
		    totalHeight = totalHeight + RectControl(r(i)).Height
		  Next
		  
		  If totalHeight > Me.Height - offset Then Return
		  
		  tops.SortWith(r)
		  
		  Dim curTop As Integer = Me.Top + (Me.Height / 2) - (totalHeight / 2) + offset
		  
		  For i = 0 To r.Ubound
		    rc = RectControl(r(i))
		    rc.Top = curTop
		    curTop = curTop + rc.Height
		  Next
		  
		  Me.Invalidate
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Note, Name = Untitled
		Use to organize radio buttons within a group box vertically.
		
		The Organize method can be used to redo the layout if needed.
		
		Does not examine or change .Left property of the RadioButton.
		
		No different than a standard GroupBox when it has a child other than a RadioButton.
		
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Appearance"
			InitialValue="Untitled"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
