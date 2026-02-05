#tag Class
Protected Class SFontCanvas
Inherits SBufferedCanvas
	#tag Event
		Sub GotFocus()
		  HasFocus = True
		  Invalidate
		  RaiseEvent GotFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Enabled Then
		    If Key = " " Then
		      Dim newFont As FontFace
		      
		      If MyFont = Nil Then MyFont = New FontFace
		      newFont = FontChooser.Ask(MyFont, AdvancedOptions)
		      If newFont <> Nil Then
		        SetFont newFont
		        Action
		      End If
		      Return True
		    End If
		  End If
		  Return KeyDown(Key)
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  HasFocus = False
		  Invalidate
		  RaiseEvent LostFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim b As Boolean
		  
		  HasMouseDown = True
		  If TabStop Then SetFocus
		  
		  b = MouseDown(X, Y)
		  Repaint
		  Return True  // prepare for MouseUp event
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If X >= 0 And X <= Width And Y >= 0 And Y <= Height Then
		    Dim newFont As FontFace
		    
		    If Enabled And AcceptMouseDown Then
		      If MyFont = Nil Then MyFont = New FontFace
		      newFont = FontChooser.Ask(MyFont, AdvancedOptions)
		      If newFont <> Nil Then
		        SetFont newFont
		        Action
		      End If
		    End If
		  End If
		  HasMouseDown = False
		  Repaint
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  Dim c As Color
		  
		  g.AntiAlias = True
		  g.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  
		  // Change the fill color depending on the enabled state
		  If Self.Enabled Then
		    g.ForeColor = LightBevelColor
		  Else
		    g.ForeColor =  DisabledTextColor
		  End If
		  
		  g.FillRect 0, 0, Width, Height
		  
		  If MyFont <> Nil And Self.Enabled Then
		    c = MyFont.ForeColor
		    If (c.Red > 128 And c.Green > 128) Or _
		      (c.Green > 128 And c.Blue > 128) Or _
		      (c.Red > 128 And c.Blue > 128) Then
		      g.ForeColor = DarkBevelColor
		      g.FillRect 0, 0, Width, Height
		    End If
		    
		    MyFont.OntoGraphics g
		    
		    Call DrawFontString(g, MyFont.Name + " " + Str(MyFont.Size), 0, 0, MyFont, g.Width, "center", g.Height, "middle")
		    
		    If (c.Red > 128 And c.Green > 128) Or _
		      (c.Green > 128 And c.Blue > 128) Or _
		      (c.Red > 128 And c.Blue > 128) Then
		      g.ForeColor = RGB(0, 0, 0)
		      g.DrawRect 0, 0, Width, Height
		      Return
		    End If
		    
		  End If
		  
		  If (HasFocus Or HasMouseDown) And UseFocusRing Then
		    g.ForeColor = HighlightColor
		  Else
		    g.ForeColor = DarkBevelColor
		  End If
		  g.DrawRect 0, 0, Width, Height
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function ChooseFont() As Boolean
		  Dim newFont As FontFace
		  
		  If Enabled And AcceptMouseDown Then
		    If MyFont = Nil Then MyFont = New FontFace
		    newFont = FontChooser.Ask(MyFont, AdvancedOptions)
		    If newFont <> Nil Then
		      SetFont newFont
		      Action
		      Return True
		    Else
		      Refresh False
		    End If
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFont() As FontFace
		  Return MyFont
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFont(newFont As FontFace)
		  MyFont = newFont
		  Repaint
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook


	#tag Property, Flags = &h0
		AcceptMouseDown As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		AdvancedOptions As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HasFocus As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HasMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MyFont As FontFace
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptMouseDown"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AdvancedOptions"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
