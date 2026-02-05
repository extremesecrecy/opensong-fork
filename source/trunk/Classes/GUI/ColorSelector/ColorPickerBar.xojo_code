#tag Class
Protected Class ColorPickerBar
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If RaiseEvent MouseDown(X, Y) Then
		    MouseHandledBySub = True
		    Return True
		  End If
		  
		  LastDragPos = -10000
		  
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
		  
		  App.DebugWriter.Write(CurrentMethodName + " (" + Str(X) + ", " + Str(Y) + ")", 7)
		  If If(IsHorizontal(), X <> LastDragPos, Y <> LastDragPos) Then
		    LastDragPos = If(IsHorizontal(), X, Y)
		    
		    Dim oldValue As Double = mValue
		    SetValue(Max(Min(X, Width - 1), 0), Max(Min(Y, Height - 1), 0))
		    If mValue <> oldValue Then
		      RaiseEvent Action(Value)
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
		    App.DebugWriter.Write(CurrentMethodName + " (" + Str(X) + ", " + Str(Y) + ")", 7)
		    If X >= 0 And X < Width And Y >= 0 And Y < Height Then
		      SetValue(X, Y)
		      RaiseEvent Action(Value)
		    End If
		  End If
		  
		  LastDragPos = -10000
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Finger = New GraphicsPath
		  Finger.MoveToPoint(0, 0)
		  Finger.AddLineToPoint(kFingerEdge, 0)
		  Finger.AddLineToPoint(kFingerEdge + Floor(Round(kFingerEdge / Sqrt(2))), kFingerEdge)
		  Finger.AddLineToPoint(kFingerEdge, kFingerEdge + kFingerEdge)
		  Finger.AddLineToPoint(0, kFingerEdge + kFingerEdge)
		  Finger.AddLineToPoint(0, 0)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  Dim needBufferRedraw As Boolean
		  Dim BufferW, BufferH As Integer
		  Const pi As Double = 3.14159265358979323846
		  
		  If IsHorizontal() Then
		    BufferW = Width
		    BufferH = Height - 2 * kMargin
		  Else
		    BufferW = Width - 2 * kMargin
		    BufferH = Height
		  End If
		  If Buffer = Nil Or Buffer.Width <> BufferW Or Buffer.Height <> BufferH Then
		    Buffer = Me.TrueWindow.BitmapForCaching(BufferW, BufferH)
		    needBufferRedraw = true
		  Else
		    needBufferRedraw = (mAxis <> BufferAxis) Or (BufferAxis <> Asc("H") And BaseColor <> BufferBaseColor)
		  End If
		  
		  If needBufferRedraw Then
		    Dim s As RGBSurface = Buffer.RGBSurface
		    Dim x, y As Integer
		    Dim xMax As Integer = Buffer.Width - 1
		    Dim yMax As Integer = Buffer.Height - 1
		    Dim v As Double
		    Dim c As Color
		    
		    BufferAxis = mAxis
		    BufferBaseColor = BaseColor
		    
		    If IsHorizontal() Then
		      For x = 0 To xMax
		        v = x / xMax
		        Select Case mAxis
		        Case Asc("R")
		          c = RGB(Floor(Round(v*255)), BaseColor.Green, BaseColor.Blue)
		        Case Asc("G")
		          c = RGB(BaseColor.Red, Floor(Round(v*255)), BaseColor.Blue)
		        Case Asc("B")
		          c = RGB(BaseColor.Red, BaseColor.Green, Floor(Round(v*255)))
		          
		        Case Asc("H")
		          c = HSV(v, 1, 1)
		        Case Asc("S")
		          c = HSV(BaseColor.Hue, v, BaseColor.Value)
		        Case Asc("V")
		          c = HSV(BaseColor.Hue, BaseColor.Saturation, v)
		          
		        Case Asc("C")
		          c = CMY(v, BaseColor.Magenta, BaseColor.Yellow)
		        Case Asc("M")
		          c = CMY(BaseColor.Cyan, v, BaseColor.Yellow)
		        Case Asc("Y")
		          c = CMY(BaseColor.Cyan, BaseColor.Magenta, v)
		        End Select
		        For y = 0 To yMax
		          s.Pixel(x, y) = c
		        Next y
		      Next x
		    Else
		      For y = 0 To yMax
		        v = (yMax - y) / yMax
		        Select Case mAxis
		        Case Asc("R")
		          c = RGB(Floor(Round(v*255)), BaseColor.Green, BaseColor.Blue)
		        Case Asc("G")
		          c = RGB(BaseColor.Red, Floor(Round(v*255)), BaseColor.Blue)
		        Case Asc("B")
		          c = RGB(BaseColor.Red, BaseColor.Green, Floor(Round(v*255)))
		          
		        Case Asc("H")
		          c = HSV(v, 1, 1)
		        Case Asc("S")
		          c = HSV(BaseColor.Hue, v, BaseColor.Value)
		        Case Asc("V")
		          c = HSV(BaseColor.Hue, BaseColor.Saturation, v)
		          
		        Case Asc("C")
		          c = CMY(v, BaseColor.Magenta, BaseColor.Yellow)
		        Case Asc("M")
		          c = CMY(BaseColor.Cyan, v, BaseColor.Yellow)
		        Case Asc("Y")
		          c = CMY(BaseColor.Cyan, BaseColor.Magenta, v)
		        End Select
		        For x = 0 To xMax
		          s.Pixel(x, y) = c
		        Next x
		      Next y
		    End If
		    
		  End If
		  
		  If IsHorizontal() Then
		    g.DrawPicture Buffer, 0, kMargin
		    
		    g.PenSize = 1
		    g.SaveState()
		    #if TargetLinux And RBVersion > 2025
		      Dim FingerPic As New Picture(2 * kFingerEdge, 2 * kFingerEdge)
		      Dim f As Graphics = FingerPic.Graphics
		      f.Rotate(pi / 2, kFingerEdge, kFingerEdge)
		      f.DrawingColor = Color.LightGray
		      f.FillPath(Finger)
		      f.DrawingColor = Color.Black
		      f.DrawPath(Finger)
		      g.DrawPicture(FingerPic, Position - kFingerEdge, kMargin - kFingerEdge)
		      f.ClearRect(0, 0, FingerPic.Width, FingerPic.Height)
		      f.Rotate(-pi / 2, kFingerEdge, kFingerEdge)
		      f.DrawingColor = Color.LightGray
		      f.FillPath(Finger)
		      f.DrawingColor = Color.Black
		      f.DrawPath(Finger)
		      g.DrawPicture(FingerPic, Position - kFingerEdge, Height - kMargin + kFingerEdge)
		    #else
		      g.Rotate(pi / 2, 0, kFingerEdge + kFingerEdge)
		      g.Translate(Position - kFingerEdge, kMargin - kFingerEdge)
		      g.DrawingColor = Color.LightGray
		      g.FillPath(Finger)
		      g.DrawingColor = Color.Black
		      g.DrawPath(Finger)
		      g.Rotate(pi, kFingerEdge, 0)
		      g.Translate(0, -(Height - (kMargin - kFingerEdge)))
		      g.DrawingColor = Color.LightGray
		      g.FillPath(Finger)
		      g.DrawingColor = Color.Black
		      g.DrawPath(Finger)
		    #endif
		    g.RestoreState()
		  Else
		    g.DrawPicture Buffer, kMargin, 0
		    
		    g.PenSize = 1
		    g.SaveState()
		    #if TargetLinux And RBVersion > 2025
		      Dim FingerPic As New Picture(2 * kFingerEdge, 2 * kFingerEdge)
		      Dim f As Graphics = FingerPic.Graphics
		      f.DrawingColor = Color.LightGray
		      f.FillPath(Finger)
		      f.DrawingColor = Color.Black
		      f.DrawPath(Finger)
		      g.DrawPicture(FingerPic, kMargin - kFingerEdge, Position - kFingerEdge)
		      f.ClearRect(0, 0, FingerPic.Width, FingerPic.Height)
		      f.Rotate(pi, kFingerEdge, kFingerEdge)
		      f.DrawingColor = Color.LightGray
		      f.FillPath(Finger)
		      f.DrawingColor = Color.Black
		      f.DrawPath(Finger)
		      g.DrawPicture(FingerPic, Width - kMargin - kFingerEdge, Position - kFingerEdge)
		    #else
		      g.Translate(kMargin - kFingerEdge, Position - kFingerEdge)
		      g.DrawingColor = Color.LightGray
		      g.FillPath(Finger)
		      g.DrawingColor = Color.Black
		      g.DrawPath(Finger)
		      g.Rotate(pi, 0, kFingerEdge)
		      g.Translate(-(Width - (kMargin - kFingerEdge)), 0)
		      g.DrawingColor = Color.LightGray
		      g.FillPath(Finger)
		      g.DrawingColor = Color.Black
		      g.DrawPath(Finger)
		    #endif
		    g.RestoreState()
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub ScaleFactorChanged()
		  Buffer = Nil
		  Invalidate
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function IsHorizontal() As Boolean
		  Return Width > Height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(x As Integer, y As Integer)
		  App.DebugWriter.Write(CurrentMethodName + " (" + Str(X) + ", " + Str(Y) + ") : ("+Str(Width) + ", " + Str(Height) + "), Axis = " + Axis, 7)
		  If x >= 0 And x < Width And y >= 0 And y < Height Then
		    Dim h, w As Integer
		    Dim v As Double
		    w = Buffer.Width - 1
		    h = Buffer.Height - 1
		    
		    If IsHorizontal() Then
		      y = y - kMargin
		    Else
		      x = x - kMargin
		    End If
		    x = Min(Max(x, 0), w)
		    y = Min(Max(y, 0), h)
		    If IsHorizontal() Then
		      v = (w - x) / w
		    Else
		      v = (h - y) / h
		    End If
		    
		    Dim s As RGBSurface = Buffer.RGBSurface
		    Dim c As Color = s.Pixel(x, y)
		    App.DebugWriter.Write(CurrentMethodName + " BaseColor old = " + BaseColor.ToString + ", new = " + c.ToString, 7)
		    
		    Select Case mAxis
		    Case Asc("R")
		      Value = c.Red
		    Case Asc("G")
		      Value = c.Green
		    Case Asc("B")
		      Value = c.Blue
		      
		    Case Asc("H")
		      // don't loos the hue due to sturation or brightness
		      Value = v
		      CurrentHue = mValue
		      c = HSV(CurrentHue, CurrentSaturation, CurrentBrightness)
		    Case Asc("S")
		      Value = v
		      CurrentSaturation = mValue
		      c = HSV(CurrentHue, CurrentSaturation, CurrentBrightness)
		    Case Asc("V")
		      Value = v
		      CurrentBrightness = mValue
		      c = HSV(CurrentHue, CurrentSaturation, CurrentBrightness)
		      
		    Case Asc("C")
		      Value = c.Cyan
		    Case Asc("M")
		      Value = c.Magenta
		    Case Asc("Y")
		      Value = c.Yellow
		    End Select
		    
		    BaseColor = c
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action(Value As Double)
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
		This is the companion to the ColorPlane and represents the 3rd axis
		Its backdrop shows the colors when modifying the selected axis with the other two axis fixed
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Chr(mAxis)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAxis = Asc(Left(value, 1))
			End Set
		#tag EndSetter
		Axis As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		BaseColor As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BufferAxis As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BufferBaseColor As Color
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

	#tag Property, Flags = &h21
		Private Finger As GraphicsPath
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastDragPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAxis As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MouseHandledBySub As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Position As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mValue = value
			  App.DebugWriter.Write(CurrentMethodName + " Value is " + Str(Value), 7)
			  
			  Dim v As Double
			  Select Case mAxis
			  Case Asc("R"), Asc("G"), Asc("B")
			    v = mValue / 256
			  Case Else
			    v = mValue
			  End Select
			  If IsHorizontal Then
			    Position = Floor(Round(v * Width))
			  Else
			    Position = Height - Floor(Round(v * Height))
			  End If
			  App.DebugWriter.Write(CurrentMethodName + " Position set to " + Str(v) + " * " + Str(If(Width > Height, Width, Height)) + " = " + Str(Position), 7)
			  Invalidate
			End Set
		#tag EndSetter
		Value As Double
	#tag EndComputedProperty


	#tag Constant, Name = kFingerEdge, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMargin, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant


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
			Name="Position"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Axis"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BaseColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
