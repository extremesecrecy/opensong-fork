#tag Class
Protected Class ImageListbox
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  Dim result As Boolean = False
		  
		  result = RaiseEvent CellBackgroundPaint(g, row, column)
		  
		  If column = m_ImageColumn Then
		    If m_ImageAspect = 0 Then SetImageAspectFromDimensions
		    Dim calcRowHeight As Integer = Round(ColumnAt(column).WidthActual / m_ImageAspect)
		    If calcRowHeight <> DefaultRowHeight Then
		      DefaultRowHeight = calcRowHeight
		    End If
		    
		    If ColumnAt(column).WidthActual > m_ImageMargin And _
		      Me.DefaultRowHeight > m_ImageMargin Then
		      
		      If row < RowCount Then
		        result = RaiseEvent ImagePaint(g, row, column)
		        If Not result Then
		          If Not IsNull(CellTagAt(row, 0)) And CellTagAt(row, 0) IsA StyleImage Then
		            Dim scale As Double = 1.0
		            Dim colwidth As Integer = ColumnAt(column).WidthActual - m_ImageMargin
		            
		            Dim img As StyleImage = CellTagAt(row, 0)
		            Dim pic As Picture = img.GetImage
		            
		            If Not IsNull(pic) Then
		              Dim width As Integer = pic.Width / pic.Height * (DefaultRowHeight - m_ImageMargin)
		              
		              If (width > colwidth) And (width > 0) Then
		                scale = colwidth / width
		                width = colwidth
		              End If
		              
		              g.DrawPicture( pic, (m_ImageMargin/2) + (colwidth - width) / 2, (m_ImageMargin/2) + (DefaultRowHeight - (DefaultRowHeight * scale)) / 2, width, DefaultRowHeight * scale, 0, 0, pic.Width, pic.Height )
		              
		              result = True
		            End If
		          End If
		          
		        End If
		      End If
		      
		    End If
		    
		  End If
		  Return result
		End Function
	#tag EndEvent

	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If row < 0 Or row > RowCount - 1 Or column < 0 Or column > ColumnCount - 1 Then
		    Return True
		  End If
		  
		  App.DebugWriter.Write StringUtils.Sprintf("%s (%s): (%d,%d) editable=%s, ListIndex=%d, Selected=%s, Ctrl=%s, Shhift=%s", _
		  CurrentMethodName, Name, row, column, Str(CellType(row,column)=Listbox.TypeEditable Or ColumnType(column) = Listbox.TypeEditable), _
		  SelectedRowIndex, Str(Selected(row)), Str(Keyboard.ControlKey), Str(Keyboard.ShiftKey)), 8
		  
		  If (CellType(row, column) = Listbox.TypeEditable Or ColumnType(column) = Listbox.TypeEditable) _
		    And row = SelectedRowIndex _
		    And Selected(row) _
		    And Keyboard.ControlKey _
		    Then
		    Selected(row) = False
		    App.DebugWriter.Write CurrentMethodName + " (" + Name + "): de-select row"
		    Return True
		  End If
		  Return CellClick(row, column, x, y)
		End Function
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  Dim result As Boolean
		  Dim r, c As Integer
		  
		  Me.currentDropRow = ListBox.RowFromXY(x, y + DefaultRowHeight / 2)
		  
		  For r = 0 to RowCount - 1
		    For c = 0 to ColumnCount - 1
		      If r = currentDropRow Then
		        CellBorderTopAt(r, c) = ListBox.Borders.ThinSolid
		      Else
		        CellBorderTopAt(r, c) = ListBox.Borders.Default
		      End If
		    Next
		  Next
		  
		  result = DragOverRowX(x, y, obj, action, currentDropRow)
		  Return result
		End Function
	#tag EndEvent

	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  Dim img As StyleImage
		  
		  If CellTagAt(row, 0) IsA StyleImage Then
		    img  = CellTagAt(row, 0)
		    drag.PrivateRawData("StIm") = img.GetImageFilename()
		  End If
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  Dim r, c As Integer
		  
		  DropRowObject(obj, action, Me.currentDropRow)
		  
		  For r = 0 to RowCount- 1
		    For c = 0 to ColumnCount - 1
		      CellBorderTopAt(r, c) = ListBox.Borders.Default
		    Next
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  If RowSelectionType = RowSelectionTypes.Single Then
		    mnu_edit_selall.Enabled = False
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  isFocused = True
		  RaiseEvent GotFocus()
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  isFocused = False
		  LostFocus()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  SetImageAspectFromDimensions
		  TargetWidth = Me.Width
		  HeaderType(m_ImageColumn) = Listbox.HeaderTypes.NotSortable  // this gets missed out if ImageColumn is set in the layout only
		  RaiseEvent Open
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function mnu_edit_selall() As Boolean Handles mnu_edit_selall.Action
		  Return DoSelectAll()
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AddImage(image as StyleImage)
		  AddRow("")
		  CellTagAt(LastIndex, 0) = image
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearImage(row As Integer)
		  If row > -1 And row < RowCount Then
		    CellTagAt(row, 0) = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoSelectAll() As Boolean
		  If RowSelectionType = RowSelectionTypes.Single Then Return False
		  For row As Integer = 0 To RowCount
		    Selected(row) = True
		  Next
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImage(row As Integer) As StyleImage
		  Dim result As StyleImage
		  result = Nil
		  
		  If row > -1 And row < RowCount Then
		    result = CellTagAt(row, 0)
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasFocus() As Boolean
		  Return self.isFocused
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasImage(row As Integer) As Boolean
		  Return Row >= 0 And Row <= LastRowIndex And CellTagAt(row, 0) IsA StyleImage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageAspect() As Double
		  Return m_ImageAspect
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImageAspect(KeepHeight As Boolean = False, assigns value As Double)
		  m_ImageAspect = value
		  If KeepHeight Then
		    ColumnAt(m_ImageColumn).WidthActual = Max((DefaultRowHeight - m_ImageMargin) * m_ImageAspect + m_ImageMargin, m_ImageMargin)
		  Else
		    DefaultRowHeight = Max((ColumnAt(m_ImageColumn).WidthActual - m_ImageMargin) / m_ImageAspect + m_ImageMargin, m_ImageMargin)
		  End If
		  Invalidate(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertImage(row As Integer, image As StyleImage)
		  AddRowAt(row, "")
		  CellTagAt(LastIndex, 0) = image
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImage(row As Integer, image as StyleImage)
		  If row > -1 And row < RowCount Then
		    CellTagAt(row, 0) = image
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetImageAspectFromDimensions()
		  m_ImageAspect = ColumnAt(m_ImageColumn).WidthActual / If(DefaultRowHeight = 0,Max(RowHeight,m_ImageMargin,5),DefaultRowHeight)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SwapRows(rowA As Integer, rowB As Integer) As Boolean
		  Dim tags() As Variant
		  Dim value() As String
		  Dim c As Integer
		  Dim result As Boolean
		  
		  result = False
		  
		  If rowA <> rowB And rowA > -1 And rowB > -1 And rowA < RowCount And rowB < RowCount Then
		    For c = 0 to ColumnCount()-1
		      tags.Add(CellTag(rowB, c))
		      value.Add(Cell(rowB, c))
		      
		      CellTagAt(rowB, c) = CellTagAt(rowA, c)
		      CellValueAt(rowB, c) = CellValueAt(rowA, c)
		      
		      CellTagAt(rowA, c) = tags(c)
		      CellValueAt(rowA, c) = value(c)
		    Next
		    
		    result = True
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TargetWidth() As Integer
		  Return m_TargetWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TargetWidth(assigns value as Integer)
		  m_TargetWidth = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalColumnWidth() As Integer
		  Dim totalWidth As Integer
		  Const kColSeparatorWidth As Integer = 0
		  Const kListBoxOverheadWidth As Integer = 2
		  For i As Integer = 0 To Me.LastColumnIndex
		    totalWidth = totalWidth + Me.ColumnAt(i).WidthActual
		  Next
		  totalWidth = totalWidth + (Me.ColumnCount - 1) * kColSeparatorWidth + kListBoxOverheadWidth
		  
		  Return totalWidth
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellClick(row As Integer, column As Integer, X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DragOverRowX(x As Integer, y As Integer, obj As DragItem, action As Integer, row as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DropRowObject(obj As DragItem, action As Integer, row as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ImagePaint(g As Graphics, row As Integer, column As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Note, Name = Info
		Imagelistbox is an extended Listbox adding a image preview column.
		The image is stored in the CellTag of column 0 and displayed in the column identified by ImageColumn and is managed by ImageListBox.
		
		The other columns are freely usable.
	#tag EndNote


	#tag Property, Flags = &h21
		Private currentDropRow As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return m_ImageColumn
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If m_ImageColumn <> value Then
			    m_ImageColumn = value
			    HeaderType(m_ImageColumn) = Listbox.HeaderTypes.NotSortable
			    Invalidate
			  End If
			End Set
		#tag EndSetter
		ImageColumn As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return m_ImageMargin
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If m_ImageMargin <> value Then
			    DefaultRowHeight = DefaultRowHeight - m_ImageMargin + value
			    m_ImageMargin = value
			    Invalidate
			  End If
			End Set
		#tag EndSetter
		ImageMargin As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private isFocused As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_ImageAspect As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_ImageColumn As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_ImageMargin As Integer = 4
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_TargetWidth As Integer
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
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageColumn"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageMargin"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DropIndicatorVisible"
			Visible=true
			Group="Appearance"
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
			Name="GridLinesHorizontalStyle"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Borders"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVerticalStyle"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Borders"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeader"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHorizontalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasVerticalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			InitialValue=""
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			InitialValue=""
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowExpandableRows"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowResizableColumns"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRowDragging"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRowReordering"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowSelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="RowSelectionTypes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontName"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontUnit"
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
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
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
