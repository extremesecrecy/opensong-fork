#tag Class
Protected Class ColorPickerPlane
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If RaiseEvent MouseDown(X, Y) Then
		    MouseHandledBySub = True
		    Return True
		  End If
		  
		  MouseHandledBySub = false
		  If IsContextualClick Or Keyboard.ShiftKey Or Keyboard.ControlKey Or Keyboard.AltKey Or Keyboard.OSKey Then
		    Return False
		  Else
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If MouseHandledBySub Then
		    RaiseEvent MouseDrag(X, Y)
		  End If
		  
		  Dim xx, yy As Integer
		  xx = Max(Min(X, Width), 0)
		  yy = Max(Min(Y, Height), 0)
		  If xx <> ColorX Or yy <> ColorY Then
		    Dim OldValue As Color = mSelectedColor
		    SelectColor(xx, yy)
		    Repaint
		    If mSelectedColor <> OldValue Then
		      RaiseEvent Action(mSelectedColor)
		    End If
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If MouseHandledBySub Then
		    RaiseEvent MouseUp(X, Y)
		    MouseHandledBySub = False  // Reset
		  Else
		    If Enabled And X >= 0 And X < Width And Y >= 0 And Y < Height Then
		      SelectColor(X, Y)
		      RaiseEvent Action(mSelectedColor)
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  Dim needBufferRedraw As Boolean
		  
		  If Buffer = Nil Or Buffer.Width <> Width Or Buffer.Height <> Height Then
		    Buffer = Me.TrueWindow.BitmapForCaching(Width, Height)
		    needBufferRedraw = True
		  Else
		    needBufferRedraw = mFixedAxis <> BufferAxis Or mFixedValue <> BufferAxisValue
		  End If
		  
		  Dim s As RGBSurface = Buffer.RGBSurface
		  
		  If needBufferRedraw Then
		    Dim x, y As Integer
		    Dim fixed As Integer
		    Dim xMax As Integer = Buffer.Width - 1
		    Dim yMax As Integer = Buffer.Height - 1
		    Dim a, b As Integer
		    Dim r, t As Double
		    
		    Select Case mFixedAxis
		    Case Asc("R"), Asc("G"), Asc("B")
		      fixed = Floor(Round(FixedValue))
		    End Select
		    
		    For x = 0 To xMax
		      Select Case mFixedAxis
		      Case Asc("R"), Asc("G"), Asc("B")
		        a = Round(x / xMax * 255)
		      Case Else
		        r = x / xMax
		      End Select
		      
		      For y = 0 To yMax
		        Select Case mFixedAxis
		        Case Asc("R"), Asc("G"), Asc("B")
		          b = Round((yMax - y) / yMax * 255)
		        Case Else
		          t = (yMax - y) / yMax
		        End Select
		        
		        Select Case mFixedAxis
		        Case Asc("R")
		          s.Pixel(x, y) = RGB(fixed, a, b)
		        Case Asc("G")
		          s.Pixel(x, y) = RGB(a, fixed, b)
		        Case Asc("B")
		          s.Pixel(x, y) = RGB(a, b, fixed)
		          
		        Case Asc("H")
		          s.Pixel(x, y) = HSV(FixedValue, r, t)
		        Case Asc("S")
		          s.Pixel(x, y) = HSV(r, FixedValue, t)
		        Case Asc("V")
		          s.Pixel(x, y) = HSV(r, t, FixedValue)
		          
		        Case Asc("C")
		          s.Pixel(x, y) = CMY(FixedValue, r, t)
		        Case Asc("M")
		          s.Pixel(x, y) = CMY(r, FixedValue, t)
		        Case Asc("Y")
		          s.Pixel(x, y) = CMY(r, t, FixedValue)
		        End Select
		      Next y
		    Next x
		    
		    BufferAxis = mFixedAxis
		    BufferAxisValue = mFixedValue
		  End If
		  
		  g.DrawPicture Buffer, 0, 0
		  
		  Dim c As Color
		  c = s.Pixel(ColorX, ColorY)
		  If sRGBtoGreyScale(c) > 0.5 Then
		    g.DrawingColor = Color.Black
		  Else
		    g.DrawingColor = Color.White
		  End If
		  
		  Const r As Integer = 4
		  g.DrawOval(ColorX - r, ColorY - r, 2*r, 2*r)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ScaleFactorChanged()
		  Buffer = Nil
		  Invalidate
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function IsHSV() As Boolean
		  Return InStrB("HSV", FixedAxis) > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Repaint()
		  Buffer = Nil
		  Invalidate False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectColor(x As Integer, y As Integer)
		  If Buffer <> Nil And x >= 0 And x < Buffer.Width And y >= 0 And y < Buffer.Height Then
		    Dim s As RGBSurface = Buffer.RGBSurface
		    
		    ColorX = x
		    ColorY = y
		    mSelectedColor = s.Pixel(x, y)
		    
		    If mFixedAxis <> Asc("H") Then CurrentHue = mSelectedColor.Hue
		    If mFixedAxis <> Asc("S") Then CurrentSaturation = mSelectedColor.Saturation
		    If mFixedAxis <> Asc("V") Then CurrentBrightness = mSelectedColor.Value
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColor(c As Color, hue As Double, saturation As Double, value As Double)
		  If IsHSV Then
		    mSelectedColor = c
		    Select Case mFixedAxis
		    Case Asc("H")
		      ColorX = Round(saturation * (Width - 1))
		      ColorY = Round((1 - value) * (Height - 1))
		      mFixedValue = hue
		    Case Asc("S")
		      ColorX = Round(hue * (Width - 1))
		      ColorY = Round((1 - value) * (Height - 1))
		      mFixedValue = saturation
		    Case Asc("V")
		      ColorX = Round(hue * (Width - 1))
		      ColorY = Round((1 - saturation) * (Height - 1))
		      mFixedValue = value
		    End Select
		  Else
		    SelectedColor = c
		  End If
		  CurrentHue = hue
		  CurrentSaturation = saturation
		  CurrentBrightness = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sRGBdeGamma(c As Double) As Double
		  // expects a value between 0 and 1
		  
		  If c < 0.04045 Then
		    Return c / 12.92
		  Else
		    Return Pow((c + 0.055) / 1.055, 2.4)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sRGBtoGreyScale(c as Color) As Double
		  ' Y'UV und Y'IQ. etwas andere Gamma-Kompression als in sRGB
		  ' Y' = 0.2989 R' + 0.5870 G' + 0.1140 B'
		  '
		  ' Y = .2126 * R^gamma + .7152 * G^gamma + .0722 * B^gamma
		  ' L* = 116 * Y ^ 1/3 - 16
		  Dim Y As Double
		  Dim Lstar As Double
		  
		  Y = 0.2126 * sRGBdeGamma(c.Red / 255) + .7152 * sRGBdeGamma(c.Green / 255) + .0722 * sRGBdeGamma(c.Blue / 255)
		  Lstar = 1.16 * Pow(Y, 1/3) - 0.16  // 0..1 not 0..100
		  Return Lstar
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action(c As Color)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
	#tag EndHook


	#tag Note, Name = Description
		This control shows a color plane. The color of the backdrop represents the color you get with 
		a fixed axis of your selected color model and the other two axis represented by the coordinates 
		of that point.
		The ColorPickerBar is the companion to the ColorPlane, representing the 3rd axis.
		Its backdrop shows the colors when modifying that 3rd axis with the other two axis fixed.
		Depending on the color model, the two controls are interdependent in one, or in both directions 
		i.e. if you change the position in one, the other needs to be updated to reflect the new settings.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected Buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BufferAxis As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BufferAxisValue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ColorX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ColorY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentBrightness As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentHue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentSaturation As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Chr(mFixedAxis)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFixedAxis = Asc(Left(value, 1))
			  Invalidate
			End Set
		#tag EndSetter
		FixedAxis As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFixedValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFixedValue = value
			  Invalidate
			End Set
		#tag EndSetter
		FixedValue As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mFixedAxis As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFixedValue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MouseHandledBySub As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedColor As Color
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSelectedColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectedColor = value
			  CurrentHue = mSelectedColor.Hue
			  CurrentSaturation = mSelectedColor.Saturation
			  CurrentBrightness = mSelectedColor.Value
			  
			  Select Case mFixedAxis
			  Case Asc("R")
			    ColorX = Round((mSelectedColor.Green / 255) * (Width - 1))
			    ColorY = Round(((255 - mSelectedColor.Blue) / 255) * (Height - 1))
			  Case Asc("G")
			    ColorX = Round((mSelectedColor.Red / 255) * (Width - 1))
			    ColorY = Round(((255 - mSelectedColor.Blue) / 255) * (Height - 1))
			  Case Asc("B")
			    ColorX = Round((mSelectedColor.Red / 255) * (Width - 1))
			    ColorY = Round(((255 - mSelectedColor.Green) / 255) * (Height - 1))
			    
			  Case Asc("H")
			    ColorX = Round(mSelectedColor.Saturation * (Width - 1))
			    ColorY = Round((1 - mSelectedColor.Value) * (Height - 1))
			    CurrentHue = mFixedValue
			  Case Asc("S")
			    ColorX = Round(mSelectedColor.Hue * (Width - 1))
			    ColorY = Round((1 - mSelectedColor.Value) * (Height - 1))
			    CurrentSaturation = mFixedValue
			  Case Asc("V")
			    ColorX = Round(mSelectedColor.Hue * (Width - 1))
			    ColorY = Round((1 - mSelectedColor.Saturation) * (Height - 1))
			    CurrentBrightness = mFixedValue
			    
			  Case Asc("C")
			    ColorX = Round(mSelectedColor.Magenta * (Width - 1))
			    ColorY = Round((1 - mSelectedColor.Yellow) * (Height - 1))
			  Case Asc("M")
			    ColorX = Round(mSelectedColor.Cyan * (Width - 1))
			    ColorY = Round((1 - mSelectedColor.Yellow) * (Height - 1))
			  Case Asc("Y")
			    ColorX = Round(mSelectedColor.Cyan * (Width - 1))
			    ColorY = Round((1 - mSelectedColor.Magenta) * (Height - 1))
			    
			  End Select
			End Set
		#tag EndSetter
		SelectedColor As Color
	#tag EndComputedProperty


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
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
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
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="FixedAxis"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FixedValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectedColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
