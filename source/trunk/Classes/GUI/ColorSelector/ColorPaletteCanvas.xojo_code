#tag Class
Protected Class ColorPaletteCanvas
Inherits Canvas
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  Dim v As Color
		  If ColorAtPosition(X, Y + mScrollY, v) Then
		    ColorPadClicked(YtoRow(Y), XtoColumn(X), True)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  Invalidate
		  RaiseEvent GotFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim Result As Boolean
		  
		  Result = RaiseEvent KeyDown(Key)
		  If Result Then Return True
		  
		  Dim row, column As Integer
		  Dim origRow As Integer
		  Dim p As Pair
		  Dim pal() As Color
		  Dim c As Color
		  
		  If CurrentCell <> Nil Then
		    row = CurrentCell.X
		    Column = CurrentCell.Y
		  ElseIf SelectedCell <> Nil Then
		    row = SelectedCell.X
		    column = SelectedCell.Y
		  Else
		    row = -1
		    column = -1
		  End If
		  
		  If Not (Keyboard.ShiftKey Or Keyboard.ControlKey Or Keyboard.AltKey Or Keyboard.OSKey) Then
		    Select Case Asc(Key)
		    Case 32  // space
		      If ColorAtRowCol(row, column, c) Then
		        ColorPadClicked(row, column, False)
		        Result = True
		      End If
		    Case 3, 13  // enter, return
		      If ColorAtRowCol(row, column, c) Then
		        ColorPadClicked(row, column, True)
		        Result = True
		      End If
		    Case 28  // left
		      column = column - 1
		      If column = -1 Then
		        If ColorAtRowCol(row - 1, SamplesPerRow - 1, c) Then
		          row = row - 1
		          column = SamplesPerRow - 1
		        End If
		      End If
		      Result = True
		    Case 29  // right
		      column = column + 1
		      If column = SamplesPerRow Then
		        If ColorAtRowCol(row + 1, 0, c) Then
		          row = row + 1
		          column = 0
		        End If
		      End If
		      Result = True
		    Case 30  // up
		      Do
		        row = row - 1
		        If row >= 0 And row <= RowPtr.UBound Then
		          p = RowPtr(row)
		          If p.Right = Nil Then
		            Continue
		          Else
		            pal = RowData(p.Left.IntegerValue)
		            If pal = Nil Then Continue
		            If pal.UBound >= p.Right.IntegerValue + column Then
		              Exit
		            End If
		          End If
		        Else
		          row = -1
		          Exit
		        End If
		      Loop
		      Result = True
		    Case 31  // down
		      Do
		        row = row + 1
		        If row >= 0 And row <= RowPtr.UBound Then
		          p = RowPtr(row)
		          If p.Right = Nil Then
		            Continue 
		          Else
		            pal = RowData(p.Left.IntegerValue)
		            If pal = Nil Then Continue
		            If pal.UBound >= p.Right.IntegerValue + column Then
		              Exit
		            End If
		          End If
		        Else
		          row = -1
		          Exit
		        End If
		      Loop
		      Result = True
		    Case 1  // Home
		      column = 0
		      Result = True
		    Case 4  // End
		      column = -1
		      If row >= 0 And row <= RowPtr.UBound Then
		        p = RowPtr(row)
		        If p.Right.IsNumeric And p.Right.IntegerValue >= 0 Then
		          pal = RowData(p.Left.IntegerValue)
		          column = Max(pal.Ubound - p.Right.IntegerValue, SamplesPerRow - 1)
		        End If
		      End If
		      Result = True
		    End Select
		  ElseIf (Not Keyboard.ShiftKey) And Keyboard.ControlKey And (Not Keyboard.AltKey) And (Not Keyboard.OSKey) Then
		    Select Case Asc(Key)
		    Case 28 // ^Left : Home
		      column = 0
		      Result = true
		    Case 29 // ^Right : End
		      column = -1
		      If row >= 0 And row <= RowPtr.UBound Then
		        p = RowPtr(row)
		        If p.Right.IsNumeric Then
		          If p.Right.IntegerValue >= 0 Then
		            pal = RowData(p.Left.IntegerValue)
		            column = Min(pal.Ubound - p.Right.IntegerValue, SamplesPerRow - 1)
		          End If
		        End If
		      End If
		      Result = True
		    Case 30 // ^Up : first row with entry in curent column
		      origRow = Row
		      Row = -1
		      Do
		        row = row + 1
		        If row >= 0 And row <= origRow Then
		          If RowPtr(row).Right = Nil Then
		            Continue 
		          Else
		            pal = RowData(p.Left.IntegerValue)
		            If pal = Nil Then Continue
		            If pal.UBound >= p.Right.IntegerValue + column Then
		              Exit
		            End If
		          End If
		        Else
		          row = -1
		          Exit
		        End If
		      Loop
		      Result = True
		    Case 31 // ^Down : Last row with entry in curent column
		      origRow = row
		      row = RowPtr.Count
		      Do
		        row = row - 1
		        If row >= origRow And row <= RowPtr.UBound Then
		          p = RowPtr(row)
		          If p.Right = Nil Then
		            Continue
		          Else
		            pal = RowData(p.Left.IntegerValue)
		            If pal = Nil Then Continue
		            If pal.UBound >= p.Right.IntegerValue + column Then
		              Exit
		            End If
		          End If
		        Else
		          row = -1
		          Exit
		        End If
		      Loop
		      Result = True
		    Case 1 // ^Home : r0,c0
		      row = 0
		      column = 0
		      Do
		        p = RowPtr(row)
		        If p.Right <> Nil And p.Right >= 0 Then
		          pal = RowData(p.Left.IntegerValue)
		          If pal <> Nil And pal.Ubound >= 0 Then
		            Exit
		          End If
		        End If
		        row = row + 1
		      Loop Until row > RowPtr.Ubound
		      Result = True
		    Case 4 // ^End : last row, last column
		      row = RowPtr.UBound
		      column = -1
		      Do
		        p = RowPtr(row)
		        If p.Right <> Nil And p.Right.IntegerValue >= 0 Then
		          pal = RowData(p.Left.IntegerValue)
		          If pal <> Nil And pal.Ubound >= 0 Then
		            column = pal.Ubound Mod SamplesPerRow
		            Exit
		          End If
		        End If
		        row = row - 1
		      Loop Until row < 0
		      Result = True
		    End Select
		  End If
		  If ColorAtRowCol(row, column, c) Then
		    CurrentCell = New REALbasic.Point(row, column)
		    ScrollIntoView(row, column)
		    Invalidate
		  End If
		  Return Result
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  Invalidate
		  RaiseEvent LostFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim MouseDownResult As Boolean = RaiseEvent MouseDown(X, Y)
		  If X >= 0 And X < Width And Y >= 0 And Y < Height Then
		    Me.SetFocus
		  End If
		  
		  Dim r, c As Integer
		  r = YtoRow(Y + mScrollY)
		  If r = -1 Then
		    c = -1
		  Else
		    c = XtoColumn(X)
		    If c = -1 Then r = -1
		  End If
		  MouseClickRowCol = r : c
		  Return MouseDownResult Or r <> -1
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  Dim c As Color
		  Dim drag As DragItem
		  Dim pic As Picture
		  If ColorAtPosition(X, Y, c) Then
		    pic = New Picture(SampleWidth, SampleHeight)
		    pic.Graphics.DrawingColor = c
		    pic.Graphics.FillRectangle(0, 0, Pic.Width, pic.Height)
		    drag = New DragItem(Self, X, Y, SampleWidth, SampleHeight, pic)
		    drag.RawData("Colr") = c.ToString
		    drag.Drag
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If MouseDownResult Then RaiseEvent MouseUp(X, Y)
		  MouseDownResult = False
		  
		  If MouseClickRowCol.Left = -1 Then Return
		  
		  Dim r, c As Integer
		  
		  r = YtoRow(Y + mScrollY)
		  If r = -1 Or r <> MouseClickRowCol.Left.IntegerValue Then Return
		  c = XtoColumn(X)
		  If c = -1 Or c <> MouseClickRowCol.Right.IntegerValue Then Return
		  ColorPadClicked(r, c)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  If SampleHeight = 0 Then SampleHeight = kSampleHeight
		  If SampleWidth = 0 Then SampleWidth = kSampleWidth
		  ClearPalette
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If Buffer = Nil Or Buffer.Width <> Width Or Buffer.Height < Height Then
		    Buffer = Me.TrueWindow.BitmapForCaching(Width, Height)
		    Dim h, w, i As Integer
		    Dim c As Color
		    Dim gb As Graphics = Buffer.Graphics
		    Redim RowY(RowPtr.Ubound)
		    
		    LabelHeight = gb.TextHeight
		    
		    h = 2 * kMargin + Max(RowPtr.Ubound, 0) * kGutter
		    
		    For i = 0 To RowPtr.Ubound
		      If RowPtr(i).Right = Nil Then
		        h = h + LabelHeight + kGutter
		      Else
		        h = h + SampleHeight
		      End If
		    Next i
		    
		    If h > Buffer.Height Then
		      Buffer = Me.TrueWindow.BitmapForCaching(Width, h)
		      gb = Buffer.Graphics
		    End If
		    If Buffer.Width <> PaletteWidth  Or Buffer.Height <> PaletteHeight Then
		      PaletteWidth = Buffer.Width
		      PaletteHeight = Buffer.Height
		      RaiseEvent ContentSizeChange(PaletteWidth, PaletteHeight)
		    End If
		    
		    h = kMargin
		    For i = 0 To RowPtr.Ubound
		      RowY(i) = h
		      If RowPtr(i).Right = Nil Then
		        h = h + kGutter
		        gb.DrawingColor = Color.TextColor
		        gb.DrawText(RowData(i).StringValue, kMargin, h + g.FontAscent)
		        h = h + LabelHeight
		      Else
		        w = kMargin
		        For j As Integer = 0 To SamplesPerRow - 1
		          If ColorAtRowCol(i, j, c) Then
		            gb.DrawingColor = c
		            gb.FillRectangle(w, h, SampleWidth, SampleHeight)
		          End If
		          w = w + SampleWidth + kGutter
		        Next j
		        h = h + SampleHeight
		      End If
		      h = h + kGutter
		    Next i
		    
		  End If
		  
		  g.DrawPicture(Buffer, 0, 0, Width, Height, 0, ScrollY, Width, Height)
		  
		  If SelectedCell <> Nil Then
		    Dim x, y As Integer
		    If RCtoXY(SelectedCell.X, SelectedCell.Y, x, y) Then
		      y = y - ScrollY
		      g.DrawingColor = Color.Black 'DarkBevelColor
		      g.DrawRectangle(x - 2, y - 2, kSampleWidth + 4, kSampleHeight + 4)
		    End If
		  End If
		  If Window <> Nil And Window.Focus = Self And CurrentCell <> Nil Then
		    Dim x, y As Integer
		    If RCtoXY(CurrentCell.X, CurrentCell.Y, x, y) Then
		      y = y - ScrollY
		      g.DrawingColor = Color.Black 'DarkBevelColor
		      g.LineDash = Array(1.0, 2.0)
		      g.LineDashOffset = 1.0
		      g.AntiAliased = False
		      g.AntiAliasMode = Graphics.AntiAliasModes.LowQuality
		      If SelectedCell <> Nil And SelectedCell.X = CurrentCell.X And SelectedCell.Y = CurrentCell.Y Then
		        g.DrawRectangle(x - 4, y - 4, kSampleWidth + 8, kSampleHeight + 8)
		      Else
		        g.DrawRectangle(x - 2, y - 2, kSampleWidth + 4, kSampleHeight + 4)
		      End If
		    End If
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ScaleFactorChanged()
		  Buffer = Nil
		  Invalidate
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddCaption(Text As String)
		  RowData.Add(Text)
		  RowPtr.Add(RowData.Ubound : Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddColors(c() As Color)
		  Dim a As Integer = RowData.Ubound + 1
		  If c = Nil Then reDim c(-1)
		  RowData.Add(c)
		  If c.Ubound = -1 Then
		    RowPtr.Add(a : -1)
		  Else
		    Dim b As Integer = 0
		    While b <= c.Ubound
		      RowPtr.Add(a : b)
		      If SelectedCell = Nil Then
		        SelectedCell = New REALbasic.Point(RowPtr.Ubound, b)
		        If CurrentCell = Nil Then CurrentCell = New REALbasic.Point(RowPtr.Ubound, b)
		      End If
		      b = b + SamplesPerRow
		    Wend
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearPalette()
		  Redim RowData(-1)
		  Redim RowPtr(-1)
		  Buffer = Nil
		  SamplesPerRow = (Width - 2 * kMargin + kGutter) \ (SampleWidth + kGutter)
		  SelectedCell = Nil
		  CurrentCell = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorAtPosition(x As Integer, y As Integer, ByRef c As Color) As Boolean
		  Return ColorAtRowCol(YtoRow(y), XtoColumn(x), c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorAtRowCol(row As Integer, column As Integer, ByRef c As Color) As Boolean
		  Try
		    If row < 0 Or row > RowPtr.Ubound Or column < 0 Or column >= SamplesPerRow Then Return False
		    Dim di, ci As Integer
		    Dim p As Pair = RowPtr(row)
		    If p.Right = Nil Then Return False
		    di = p.Left.IntegerValue
		    ci = p.Right.IntegerValue + column
		    If RowData(di).IsArray Then
		      Dim pal() As Color = RowData(di)
		      If ci > pal.Ubound Then
		        Return False
		      Else
		        c =  pal(ci)
		        Return True
		      End If
		    Else
		      Return False
		    End If
		  Catch
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ColorPadClicked(row As Integer, column As Integer, doubleClick As Boolean = False)
		  Dim padColor As Color
		  If ColorAtRowCol(row, column, padColor) Then
		    SelectedCell = New REALbasic.Point(row, column)
		    CurrentCell = New REALbasic.Point(row, column)
		    Invalidate
		    RaiseEvent Action(padColor, DoubleClick)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RCtoXY(row As Integer, column As Integer, ByRef x As Integer, ByRef y As Integer) As Boolean
		  // calculates top left of the color sample area
		  try
		    If row < 0 Or row > RowPtr.Ubound Or column < 0 Or column > SamplesPerRow Then Return False
		    Dim di, ci As Integer
		    Dim p As Pair = RowPtr(row)
		    If p.Right = Nil Then Return False
		    di = p.Left
		    ci = p.Right + column
		    If RowData(di).IsArray Then
		      Dim pal() As Color = RowData(di)
		      If ci > pal.Ubound Then
		        Return False
		      Else
		        // c =  pal(ci)  // c is the coror in this cell
		        y = kMargin + row * kGutter
		        For i As Integer = 0 To row - 1
		          If RowPtr(i).Right = Nil Then
		            y = y + LabelHeight + kGutter
		          Else
		            y = y + SampleHeight
		          End If
		        Next i
		        x = kMargin + column * (kGutter + SampleWidth)
		        Return True
		      End If
		    Else
		      Return False
		    End If
		  Catch
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollIntoView(row As Integer, column As Integer)
		  Dim x, y As Integer
		  Dim capty, paly As Integer = -1
		  Dim rowy, h As Integer = 0
		  Dim p As Pair
		  
		  If RCtoXY(row, column, x, y) Then
		    If y < ScrollY Then 
		      ScrollY = y
		      For i As Integer = 0 To RowPtr.Ubound
		        h = h + RowY(i) - rowy
		        rowy = RowY(i)
		        If rowY >= y Then Exit
		        p = RowPtr(i)
		        If p.Right = Nil Then
		          capty = rowy
		          h = 0
		        Else
		          paly = rowy
		        End If
		      Next i
		      If capty >= 0 And h <= Height Then
		        If capty = kMargin And h + kMargin <= Height Then
		          ScrollY = 0
		        Else
		          ScrollY = capty
		        End If
		      ElseIf paly >= 0 Then
		        ScrollY = capty
		        If paly = kMargin Then
		          ScrollY = 0
		        Else
		          ScrollY = paly
		        End If
		      End If
		    ElseIf y + SampleHeight > ScrollY + Height Then
		      For i As Integer = 0 To RowPtr.Ubound
		        h = h + RowY(i) - rowy
		        rowy = RowY(i)
		        If rowY > y And (capty < 0 Or h >= Height) Then Exit
		        p = RowPtr(i)
		        If p.Right = Nil Then
		          If rowY > y Then Exit
		          capty = rowy
		          h = 0
		        Else
		          paly = rowy
		          If i = RowPtr.Ubound Then
		            h = h + SampleHeight + kMargin
		          End If
		        End If
		      Next i
		      If capty >= 0 And h <= Height Then
		        ScrollY = Max(0, capty + h - Height)
		      ElseIf paly >= 0 Then
		        ScrollY = Max(0, paly - Height)
		      End If
		    End If
		    RaiseEvent ScrollToXY(0, ScrollY)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function XtoColumn(X As Integer) As Integer
		  // 0-based
		  
		  If X < kMargin Or X > kMargin + SamplesPerRow * (SampleWidth + kGutter) - kGutter Then
		    Return -1
		  End If
		  Dim column As Integer = (X - kMargin) \ (SampleWidth + kGutter)
		  If X >= kMargin + column * (SampleWidth + kGutter) + SampleWidth Then
		    Return -1
		  Else
		    Return column
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function YtoRow(Y As Integer) As Integer
		  // 0-based
		  Dim Row As Integer = -1
		  Dim lastRow As Integer = RowY.Ubound
		  
		  Do
		    If Y < RowY(Row + 1) Then
		      If Y >= RowY(Row + 1) - kGutter Then
		        Return -1
		      Else
		        Return Row
		      End If
		    End If
		    Row = Row + 1
		  Loop Until Row = lastRow
		  If Y >= RowY(lastRow) Then
		    If Y <= RowY(lastRow) + If(RowPtr(lastRow).Right = Nil, LabelHeight, SampleHeight) then
		      Return lastRow
		    End If
		  End If
		  Return -1
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action(c As Color, chosen As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContentSizeChange(Width As Integer, Height As Integer)
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

	#tag Hook, Flags = &h0
		Event ScrollToXY(X As Integer, Y As Integer)
	#tag EndHook


	#tag Note, Name = Description
		A canvas that shows color samples in lines, optionally preceded 
		by a caption on a line above.
		It allows you to select a color sample to be used by the parent 
		control or window
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected Buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentCell As REALbasic.Point
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LabelHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MouseClickRowCol As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MouseDownResult As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollY As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PaletteHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PaletteWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RowData() As Variant
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RowPtr() As Pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RowY() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SampleHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SamplesPerRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SampleWidth As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mScrollY
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mScrollY = value
			  Invalidate
			End Set
		#tag EndSetter
		ScrollY As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SelectedCell As REALbasic.Point
	#tag EndProperty


	#tag Constant, Name = kGutter, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMargin, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSampleHeight, Type = Double, Dynamic = False, Default = \"14", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSampleWidth, Type = Double, Dynamic = False, Default = \"12", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
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
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
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
			InitialValue="300"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="200"
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
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Appearance"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
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
			Name="SampleWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SampleHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
