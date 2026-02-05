#tag Class
Protected Class SColorCanvas
Inherits Canvas
	#tag Event
		Sub Close()
		  If CanvasColorPicker <> Nil Then
		    CanvasColorPicker.Close
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  App.DebugWriter.Write(CurrentMethodName +": (" + Str(X) + ", " + Str(Y) + ")", 8)
		  
		  //
		  // MacOS should respond on MouseUp, not MouseDown
		  //
		  #If TargetMacOS
		    Return True
		  #EndIf
		  
		  If Enabled Then
		    If IsContextualClick Then
		      If InputBox.Ask(App.T.Translate("questions/clear/@caption")) Then
		        IsColorSet = False
		        Action
		        Invalidate
		        Return True
		      Else
		        Invalidate
		        Return False
		      End If
		    Else
		      Return True  // action on MouseUp, if still on the control
		    End If
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If Not Enabled Then
		    Return
		  End If
		  
		  If X < 0 Or X > Width Or Y < 0 Or Y > Height Then
		    Return
		  End If
		  
		  If IsContextualClick Then
		    #If TargetMacOS
		      If InputBox.Ask(App.T.Translate("questions/clear/@caption")) Then
		        IsColorSet = False
		        Action
		        Invalidate
		        Return
		      Else
		        Invalidate
		        Return 
		      End If
		    #EndIf
		  Else
		    App.DebugWriter.Write(CurrentMethodName +": (" + Str(X) + ", " + Str(Y) + ")", 8)
		    Dim c As Color = MyColor
		    
		    Dim useSystemDlg As Boolean = TargetMacOS
		    useSystemDlg = App.MainPreferences.GetValue(prefs.kColorSelectorDialog, If(useSystemDlg, "system", "custom")) = "system"
		    If Keyboard.AltKey Or Keyboard.ShiftKey Then useSystemDlg = Not useSystemDlg
		    
		    #If TargetMacOS And RBVersion > 2016
		      
		      // this shows a non-modular dialog
		      If useSystemDlg Then
		        Self.SetFocus
		        If CanvasColorPicker = Nil Then
		          CanvasColorPicker = New DesktopColorPicker
		          AddHandler CanvasColorPicker.ColorSelected, AddressOf cpOnColorSelected
		          AddHandler CanvasColorPicker.Closed, AddressOf cpOnClose
		        End If
		        CanvasColorPicker.HasAlpha = True
		        CanvasColorPicker.Show(c, "Color")
		        
		        Return
		      End If
		      
		    #EndIf
		    
		    If DoSelectColor(c, "Color", X, Y, useSystemDlg) Then
		      SetColor c
		      Action
		    Else
		      Invalidate
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  If IsColorSet Then
		    g.ForeColor = MyColor
		    g.FillRect 0, 0, Width, Height
		    
		    g.ForeColor = DarkBevelColor
		    g.DrawRect 0, 0, Width, Height
		  Else
		    g.ForeColor = LightBevelColor
		    g.FillRect 0, 0, Width, Height
		    
		    g.ForeColor = DarkBevelColor
		    g.DrawRect 0, 0, Width, Height
		    g.DrawLine 0, 0, Width, Height
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearColor()
		  IsColorSet = False
		  Invalidate
		  Action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub cpOnClose(cp As DesktopColorPicker)
		  #Pragma Unused cp
		  
		  RemoveHandler CanvasColorPicker.ColorSelected, AddressOf cpOnColorSelected
		  RemoveHandler CanvasColorPicker.Closed, AddressOf cpOnClose
		  CanvasColorPicker = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub cpOnColorSelected(dcp As DesktopColorPicker, c As Color)
		  #Pragma Unused dcp
		  
		  SetColor(c)
		  Action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DoSelectColor(ByRef c As Color, dlgTitle As String, x As Integer = 0, y As Integer = 0, useSystemDlg As Boolean = False) As Boolean
		  If useSystemDlg Then
		    
		    #If RBVersion >= 2021.11 And Not TargetMacOS
		      Dim dcp As New DesktopColorPicker
		      dcp.HasAlpha = mAlphaAllowed
		      AddHandler dcp.ColorSelected, AddressOf cpOnColorSelected
		      dcp.Show(c, dlgTitle, x, y)
		      dcp.Close
		      RemoveHandler dcp.ColorSelected, AddressOf cpOnColorSelected
		      dcp = Nil
		      If IsColorSet Then c = MyColor
		      Return IsColorSet
		      
		    #Else
		      Return Color.SelectedFromDialog(c, dlgTitle, mAlphaAllowed)
		    #EndIf
		    
		  Else
		    
		    Dim csw As New ColorSelectorWindow
		    Dim pals() As ColorPaletteBroker.ColorPalette
		    Dim pal As ColorPaletteBroker.ColorPalette
		    Dim result As Boolean = False
		    
		    App.DebugWriter.Write(CurrentMethodName +": start prepairing for ColorSelectorWindow", 7)
		    pals = ColorPaletteBroker.RequestColorPalettes(ColorPaletteBroker.ContextTag)
		    For Each pal In pals
		      If Not mAlphaAllowed Then pal.StripAlpha()
		      csw.AddPalette(pal.Name, pal.Caption, pal.AsVarArray)
		    Next pal
		    csw.SetActivePalette("OpenSong")
		    
		    Dim ColorSlots() As Variant = csw.GetSlotColors()
		    If ColorPaletteBroker.CustomColorSlots.Ubound <> ColorSlots.Ubound Then
		      Redim ColorPaletteBroker.CustomColorSlots(ColorSlots.Ubound)
		    End If
		    For i As Integer = 0 To ColorSlots.Ubound
		      ColorSlots(i) = ColorPaletteBroker.CustomColorSlots(i)
		    Next i
		    csw.SetSlotColors(ColorSlots)
		    App.DebugWriter.Write(CurrentMethodName +": done prepairing for ColorSelectorWindow", 7)
		    
		    If csw.SelectColorModal(c, "H", mAlphaAllowed) Then
		      c = csw.SelectedColor
		      result = True
		    End If
		    ColorPaletteBroker.CustomColorSlots = csw.GetSlotColors()
		    Return result
		    
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColor(ByRef c As Color) As Boolean
		  If IsColorSet Then
		    c = MyColor
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Repaint(g As Graphics)
		  #Pragma Unused g
		  Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColor(c As Color)
		  IsColorSet = True
		  
		  MyColor = c
		  If Not VerifyAlpha Then
		    RaiseEvent Action
		  End If
		  
		  Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VerifyAlpha() As Boolean
		  If mAlphaAllowed Or MyColor.Alpha = 0 Then
		    Return True
		  Else
		    MyColor = RGB(MyColor.Red, MyColor.Green, MyColor.Blue)
		    Return False
		  End If
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mAlphaAllowed
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAlphaAllowed = value
			  If Not mAlphaAllowed Then
			    If Not VerifyAlpha Then
			      Invalidate
			      RaiseEvent Action
			    End If
			  End If
			End Set
		#tag EndSetter
		AllowAlpha As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private CanvasColorPicker As DesktopColorPicker
	#tag EndProperty

	#tag Property, Flags = &h0
		IsColorSet As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAlphaAllowed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MyColor As Color
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
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
			Name="TabIndex"
			Visible=true
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
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
			Name="Visible"
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
			Name="AllowAlpha"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="IsColorSet"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MyColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
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
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
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
	#tag EndViewBehavior
End Class
#tag EndClass
