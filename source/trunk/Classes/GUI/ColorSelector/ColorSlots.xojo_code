#tag Class
Protected Class ColorSlots
Inherits Canvas
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  App.DebugWriter.Write(CurrentMethodName, 8)
		  If MouseEventSlot <> -1 Then
		    Dim idx As Integer
		    If XYtoSlot(X, Y, idx) Then
		      If idx = MouseEventSlot Then
		        SelectedSlot = idx
		        FocusSlot = idx
		        Invalidate
		        SlotClicked(idx, True)
		      End If
		    End If
		  Else
		    RaiseEvent DoubleClick(X, Y)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  Dim slot As Integer
		  Dim Result As Boolean = True
		  If XYtoSlot(X, Y, slot) Then
		    If slot <> DragSlot Then Result = False
		  End If
		  If slot <> MouseEventSlot Then MouseEventSlot = -1
		  App.DebugWriter.Write(CurrentMethodName + " X=" + Str(x) + ", Y=" + Str(y) + ", obj=" + Introspection.GetType(obj).name + ", action=" + Str(action) + " drop enabled = " + If(Result, "No", "Yes"), 8)
		  Return Result
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  App.DebugWriter.Write(CurrentMethodName + " obj=" + Introspection.GetType(obj).name + ", action=" + Str(action),8)
		  Dim mx, my As Integer
		  If obj.RawDataAvailable("Colr") Then
		    App.DebugWriter.Write(CurrentMethodName + " Colr available", 8)
		    mx = MouseX - Left
		    my = MouseY - Top
		    Dim slot As Integer
		    If XYtoSlot(mx, mY, slot) Then
		      App.DebugWriter.Write(CurrentMethodName + " on slot " + Str(slot), 8)
		      Dim DragData() As String = obj.RawData("Colr").Split("|")
		      If DragSlot = -1 Then
		        // if MouseUp event was handled before DropObject, DragSlot was reset. Restore
		        If DragData.LastIndex = 2 And DragData(2) = Str(Handle) Then
		          DragSlot = Val(DragData(1))
		        End If
		      End If
		      If slot = DragSlot Then
		        App.DebugWriter.Write(CurrentMethodName + " Dropped on drag slot " + Str(slot) + ", disreagarded DragOver?", 8)
		        Return
		      End If
		      Dim c As Color
		      c = Color.FromString(DragData(0))
		      Entries(slot) = c
		      HasColor(slot) = True
		      If DragSlot >= 0 Then
		        If action = DragItem.DragActionDefault Then
		          If Keyboard.AsyncControlKey Then
		            action = DragItem.DragActionCopy
		          Else
		            action = DragItem.DragActionMove
		          End If
		        End If
		        If action = DragItem.DragActionMove Then
		          HasColor(DragSlot) = False
		        End If
		      End If
		      SelectedSlot = slot
		      FocusSlot = slot
		      Repaint
		    End If
		  End If
		  DragSlot = -1
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  App.DebugWriter.Write(CurrentMethodName, 8)
		  Invalidate
		  RaiseEvent GotFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim Result As Boolean
		  
		  Result = RaiseEvent KeyDown(Key)
		  If Result Then Return True
		  
		  Dim row, column, slot As Integer
		  
		  If FocusSlot >= 0 Then
		    row = FocusSlot \ Columns
		    column = FocusSlot Mod Columns
		    slot = FocusSlot
		  ElseIf SelectedSlot >= 0 Then
		    row = SelectedSlot \ Columns
		    column = SelectedSlot Mod Columns
		    slot = SelectedSlot
		  Else
		    row = -1
		    column = -1
		    slot = -1
		  End If
		  
		  #If TargetLinux
		    If Key = "c" And Keyboard.AsyncKeyDown(&h72) Then Key = Chr(ASC_KEY_INSERT)
		  #EndIf
		  
		  If Not (Keyboard.ShiftKey Or Keyboard.ControlKey Or Keyboard.AltKey Or Keyboard.OSKey) Then
		    Select Case Asc(Key)
		    Case 32  // space
		      If slot >= 0 Then
		        SlotClicked(slot, False)
		        Result = True
		      End If
		    Case 3, 13  // enter, return
		      If slot >= 0 Then
		        SlotClicked(slot, True)
		        Result = True
		      End If
		    Case 127 // del
		      If slot >= 0 Then HasColor(slot) = False
		      Repaint
		      Result = True
		    Case 5 // ins
		      Dim c As Color
		      If RaiseEvent AskForPaletteColor(c) Then
		        Entries(slot) = c
		        HasColor(slot) = True
		        Repaint
		      End If
		    Case 28  // left
		      if column > 0 Then FocusSlot = slot - 1
		      Result = true
		    Case 29  // right
		      If column < Columns - 1 Then FocusSlot = slot + 1
		      Result = True
		    Case 30  // up
		      If row > 0 Then FocusSlot = slot - Columns
		      Result = True
		    Case 31  // down
		      If row < Rows - 1 Then FocusSlot = slot + Columns
		      Result = True
		    Case 1  // Home
		      FocusSlot = FocusSlot - column
		      Result = true
		    Case 4  // End
		      FocusSlot = FocusSlot - column + Columns - 1
		      Result = True
		    Case Else
		      'For i As integer = 0 to 255
		      'If Keyboard.AsyncKeyDown(i) Then
		      'App.DebugWriter.Write CurrentMethodName + ": key = " + Str(Asc(key)) + " KeyCode = " + Str(i)
		      'Exit
		      'End If
		      'Next
		    End Select
		  ElseIf (Not Keyboard.ShiftKey) And Keyboard.ControlKey And (Not Keyboard.AltKey) And (Not Keyboard.OSKey) Then
		    Select Case Asc(Key)
		    Case 28 // ^Left : Home
		      FocusSlot = FocusSlot - column
		      Result = True
		    Case 29 // ^Right : End
		      FocusSlot = FocusSlot - column + Columns - 1
		      Result = True
		    Case 30 // ^Up : first row with entry in curent column
		      FocusSlot = column
		      Result = True
		    Case 31 // ^Down : Last row with entry in curent column
		      FocusSlot = (Rows - 1) * Columns + column
		      Result = True
		    Case 1 // ^Home : r0,c0
		      FocusSlot = 0
		      Result = True
		    Case 4 // ^End : last row, last column
		      FocusSlot = Rows * Columns - 1
		      Result = True
		    End Select
		  ElseIf Keyboard.ShiftKey And (Not Keyboard.ControlKey) And (Not Keyboard.AltKey) And (Not Keyboard.OSKey) Then
		    Select Case Asc(Key)
		    Case 5  // ins
		      Dim c As Color
		      If RaiseEvent AskForPaletteColor(c, 1) Then
		        Entries(slot) = c
		        HasColor(slot) = True
		        Repaint
		      End If
		    End Select
		    
		  End If
		  If Result Then Invalidate
		  Return Result
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  App.DebugWriter.Write(CurrentMethodName, 8)
		  Invalidate
		  RaiseEvent GotFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  App.DebugWriter.Write(CurrentMethodName + " X=" + Str(x) + ", Y=" + Str(y), 8)
		  DragSlot = -1
		  If RaiseEvent MouseDown(X, Y) Then
		    Return True
		  End If
		  If X >= 0 And X < Width And Y >= 0 And Y < Height Then
		    Me.SetFocus
		  End If
		  
		  If XYtoSlot(X, Y, MouseEventSlot) Then
		    Return True
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  App.DebugWriter.Write(CurrentMethodName + " X=" + Str(x) + ", Y=" + Str(y), 8)
		  
		  Dim dragColor As DragItem
		  Dim c As Color
		  Dim dragPicture As Picture
		  
		  If Enabled And XYtoSlot(X, Y, DragSlot) And DragSlot = MouseEventSlot And HasColor(MouseEventSlot) Then
		    dragPicture = New Picture(SampleWidth - 2, SampleHeight - 2)
		    c = Entries(MouseEventSlot)
		    dragPicture.Graphics.DrawingColor = c
		    dragPicture.Graphics.FillRectangle(0, 0, SampleWidth, SampleHeight)
		    // X and Y from the event lead to correct position in DragItem Top,Left on DropObject
		    // Slot Left, Top start the drag visually correct
		    // using MouseX, MouseY in DropObject lead to acceptable result
		    dragColor = New DragItem(Self, SlotX(MouseEventSlot), SlotY(MouseEventSlot), dragPicture.Width, dragPicture.Height, dragPicture)
		    dragColor.RawData("Colr") = String.FromArray(Array(c.ToString, Str(MouseEventSlot), Str(Handle)), "|")
		    dragColor.Drag
		    App.DebugWriter.Write(CurrentMethodName + " dragging Colr started", 8)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  App.DebugWriter.Write(CurrentMethodName + " X=" + Str(x) + ", Y=" + Str(y) + ", MouseEventSlot=" + Str(MouseEventSlot), 8)
		  DragSlot = -1
		  If MouseEventSlot <> -1 Then
		    Dim idx As Integer
		    If XYtoSlot(X, Y, idx) Then
		      If idx = MouseEventSlot Then
		        SelectedSlot = idx
		        FocusSlot = idx
		        Invalidate
		        SlotClicked(idx, False)
		        App.DebugWriter.Write(CurrentMethodName + ": SlotClicked idx=" + Str(idx), 8)
		      End If
		    End If
		  Else
		    RaiseEvent MouseUp(X, Y)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  If SampleWidth = 0 Then SampleWidth = 16
		  If SampleHeight = 0 Then SampleHeight = SampleWidth / 4 * 5
		  If HGutter = 0 Then HGutter = 5
		  If VGutter = 0 Then VGutter = 5
		  If LeftMargin = 0 Then LeftMargin = 2  // margins need to be at least 2 in order to accomodate the focus rectangle
		  If TopMargin = 0 Then TopMargin = 2
		  If Rows = 0 Then Rows = Max(1, (Height - TopMargin) \ (SampleHeight + VGutter))
		  If Columns = 0 Then Columns = Max(1, (Width - LeftMargin) \ (Samplewidth + HGutter))
		  
		  ReDim Entries(Rows * Columns - 1)
		  Redim HasColor(Entries.Ubound)
		  
		  DragSlot = -1
		  AcceptRawDataDrop("Colr")
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim w, h As Integer
		  Dim x, y As Integer
		  Dim gb As Graphics
		  
		  w = Columns * (SampleWidth + HGutter) - HGutter
		  h = Rows * (SampleHeight + VGutter) - VGutter
		  If Buffer <> Nil And (Buffer.Width <> w Or Buffer.Height <> h) Then
		    Buffer = Nil
		  End If
		  If Buffer = Nil Then
		    Buffer = TrueWindow.BitmapForCaching(w, h)
		    gb = Buffer.Graphics
		    
		    gb.ClearRectangle(0, 0, Buffer.Width, Buffer.Height)
		    y = 0
		    For r As Integer = 0 To Rows - 1
		      x = 0
		      For c As Integer = 0 To Columns - 1
		        gb.DrawingColor = Color.DarkBevelColor
		        gb.DrawRectangle(x, y, SampleWidth, SampleHeight)
		        If HasColor(r * Columns + c) Then
		          Dim colr As Color = Entries(r * Columns + c)
		          If colr.Alpha <> 0 Then
		            #if TargetLinux
		              If CheckerBoard = Nil Or CheckerBoard.Width < SampleWidth - 2 Or CheckerBoard.Height < SampleHeight - 2 Then
		                CheckerBoard = TrueWindow.BitmapForCaching(SampleWidth, SampleHeight)
		                Dim pg As Graphics = CheckerBoard.Graphics
		                pg.DrawingColor = HSV(0, 0, 0.85)
		                pg.FillRectangle(0, 0, SampleWidth, SampleHeight)
		                pg.DrawingColor = HSV(0, 0, 0.5)
		                Dim cx As Integer = 0
		                do
		                  Dim cy As Integer = 0
		                  do
		                    pg.FillRectangle(cx, cy, 5, 5)
		                    pg.FillRectangle(cx + 5, cy + 5, 5, 5)
		                    
		                    cy = cy + 10
		                  loop until cy >= SampleHeight
		                  cx = cx + 10
		                loop until cx >= SampleWidth
		              End If
		              gb.DrawPicture(CheckerBoard, x + 1, y + 1, SampleWidth - 2, SampleHeight - 2)
		            #else
		              If CheckerBoardBrush = Nil Then
		                CheckerBoard = TrueWindow.BitmapForCaching(10,10)
		                Dim pg As Graphics = CheckerBoard.Graphics
		                
		                pg.DrawingColor = HSV(0, 0, 0.85)
		                pg.FillRectangle(0, 0, 10, 10)
		                pg.DrawingColor = HSV(0, 0, 0.5)
		                pg.FillRectangle(0, 0, 5, 5)
		                pg.FillRectangle(5, 5, 5, 5)
		                
		                CheckerBoardBrush = New PictureBrush
		                CheckerBoardBrush.Image = CheckerBoard
		                CheckerBoardBrush.Mode = PictureBrush.Modes.Tile
		              End If
		              gb.Brush = CheckerBoardBrush
		              gb.FillRectangle(x + 1, y + 1, SampleWidth - 2, SampleHeight - 2)
		              gb.Brush = Nil
		            #endif
		          End If
		          gb.DrawingColor = colr
		          gb.FillRectangle(x + 1, y + 1, SampleWidth - 2, SampleHeight - 2)
		        Else
		          gb.DrawLine(x, y, x + SampleWidth - 1, y + SampleHeight - 1)
		        End If
		        x = x + SampleWidth + VGutter
		      Next c
		      y = y + SampleHeight + HGutter
		    Next r
		  End If
		  
		  'g.DrawingColor = Color.DarkBevelColor
		  'g.DrawRectangle(0, 0, Width, Height)
		  
		  g.DrawPicture(Buffer, LeftMargin, TopMargin, Buffer.Width, Buffer.Height)
		  
		  If SelectedSlot >= 0 Then
		    x = (SelectedSlot Mod Columns) * (SampleWidth + HGutter) + LeftMargin
		    y = (SelectedSlot \ Columns) * (SampleHeight + VGutter) + TopMargin
		    g.DrawingColor = Color.TextColor
		    g.DrawRectangle(x, y, SampleWidth, SampleHeight)
		  End If
		  If Window <> Nil And Window.Focus = Self And FocusSlot >= 0 Then
		    x = (FocusSlot Mod Columns) * (SampleWidth + HGutter) + LeftMargin
		    y = (FocusSlot \ Columns) * (SampleHeight + VGutter) + TopMargin
		    g.DrawingColor = Color.TextColor
		    g.LineDash = Array(1.0, 2.0)
		    g.LineDashOffset = 1.0
		    g.AntiAliased = False
		    g.AntiAliasMode = Graphics.AntiAliasModes.LowQuality
		    g.DrawRectangle(x - 2, y - 2, SampleWidth + 4, SampleHeight + 4)
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
		Protected Sub Repaint()
		  Buffer = Nil
		  Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SlotClicked(slot As Integer, doubleClick As Boolean)
		  If Not Keyboard.ControlKey And Not Keyboard.AltKey And Not Keyboard.OSKey Then
		    If HasColor(slot) Then
		      RaiseEvent Action(Entries(slot), False)
		    Else
		      Dim c As Color
		      Dim src As Integer = 0
		      If Keyboard.ShiftKey Then src = 1
		      If RaiseEvent AskForPaletteColor(c, src) Then
		        Entries(slot) = c
		        HasColor(slot) = true
		      End If
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlotX(slot As Integer) As Integer
		  If slot < 0 Then Return LeftMargin
		  Dim c As Integer = slot Mod Columns
		  Return LeftMargin + c * (SampleWidth + HGutter)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlotY(slot As Integer) As Integer
		  If slot < 0 Then Return TopMargin
		  Dim r As Integer = slot \ Columns
		  Return TopMargin + r * (SampleHeight + VGutter)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XYtoSlot(X As Integer, Y As Integer, ByRef slot As Integer) As Boolean
		  Dim r, c As Integer
		  
		  X = X - LeftMargin
		  Y = Y - TopMargin
		  
		  c = X \ (SampleWidth + HGutter)
		  If c < 0 Or c >= Columns Or X > c * (SampleWidth + HGutter) + SampleWidth Then c = -1
		  
		  r = Y \ (SampleHeight + VGutter)
		  If r < 0 Or r >= Rows Or Y > r * (SampleHeight + VGutter) + SampleHeight Then r = -1
		  
		  If r = -1 Or c = -1 Then
		    slot = -1
		  Else
		    slot = r * Columns + c
		  End If
		  Return slot >= 0
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action(c As Color, doubleClick As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 52657475726E205472756520696620796F752070726F7669646564206120636F6C6F72
		Event AskForPaletteColor(ByRef c As Color, source As Integer = 0) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DoubleClick(X As Integer, Y As Integer)
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

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
	#tag EndHook


	#tag Note, Name = Colr Drag'n'Drop
		Colors can be draged and droped onto certain controls of the color sellection window. 
		Colors in color slots can be moved. In order to do so, the DragItem object needs to carry 
		the information, where the color was dragged from. The object does not provide proper means 
		to do so, without unwanted side effects. for this reason, the information is stowed into 
		the RawData member in the form of fields in the string.
		Field separator is te character "|"
		
		1. Color as given by Color.ToString
		2. originating slot no, i.e. the slot to be cleared in case of DragActionMove
		3. the handle of the control the drag originated from
		
		If a control does not support DragActionMove, it can simply ignore field 2 and 3.
		
		Any control handling a drop must extract the fields, even if it only needs fieled 1, in a 
		way that is agnostic to whether there are more fields or not.
		
		"Colr" is used as the RawData DataType.
		I could not find any convention that would make it possible to drag colors to other 
		applications or drop colors from othe applications.
		
		Currently, it is not possible to drag colors from the color selection dialog to other
		dialogs, for which the color dialog has been called, in particular to SColorCanvas controls.
	#tag EndNote

	#tag Note, Name = Description
		This is an area of n x m patches (calles slots) which are initially empty and you can fill them with a color sample.
		
		You can drag colors from related controls to the slots to fill them.
		You can drag the slots to reorder them
		You can use drag and drop with the system's modifyier to copy a clor into a new slot instead or moving the slot.
		
		You can use the keyboard to navigating the slots using the arrow keys, home and end, with or without modifyer keys.
		space is equal to a click
		enter and return are equal to a double click
		del empties a slot
		ins uses the event AskForPaletteColor to retrieve a color from it's context
		
	#tag EndNote


	#tag Property, Flags = &h0
		Buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CheckerBoard As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		CheckerBoardBrush As PictureBrush
	#tag EndProperty

	#tag Property, Flags = &h0
		Columns As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DragSlot As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Entries() As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		FocusSlot As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		HasColor() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HGutter As Integer = 5
	#tag EndProperty

	#tag Property, Flags = &h0
		LeftMargin As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MouseEventSlot As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Rows As Integer = 2
	#tag EndProperty

	#tag Property, Flags = &h0
		SampleHeight As Integer = 20
	#tag EndProperty

	#tag Property, Flags = &h0
		SampleWidth As Integer = 16
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectedSlot As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TopMargin As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		VGutter As Integer = 5
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
			InitialValue=""
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
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
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
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
			Name="AllowAutoDeactivate"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Rows"
			Visible=true
			Group="Appearance"
			InitialValue="2"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Columns"
			Visible=true
			Group="Appearance"
			InitialValue="10"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LeftMargin"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopMargin"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HGutter"
			Visible=true
			Group="Appearance"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="VGutter"
			Visible=true
			Group="Appearance"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SampleWidth"
			Visible=true
			Group="Appearance"
			InitialValue="16"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SampleHeight"
			Visible=true
			Group="Appearance"
			InitialValue="20"
			Type="Integer"
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
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Buffer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectedSlot"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FocusSlot"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
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
	#tag EndViewBehavior
End Class
#tag EndClass
