#tag Class
Protected Class ImageListbox
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  Dim result As Boolean = False
		  
		  If column = m_ImageColumn Then
		    If Me.Column(column).WidthActual <> Me.DefaultRowHeight Then
		      Me.DefaultRowHeight = Me.Column(column).WidthActual
		    End If
		    
		    If Me.Column(column).WidthActual > m_ImageMargin And _
		      Me.DefaultRowHeight > m_ImageMargin Then
		      
		      If row < ListCount() Then
		        If Not IsNull(CellTag( row, 0 )) And CellTag( row, 0 ) IsA StyleImage Then
		          Dim scale As Double = 1.0
		          Dim colwidth As Integer = Me.Column(column).WidthActual - m_ImageMargin
		          
		          Dim img As StyleImage = CellTag( row, 0 )
		          Dim pic As Picture = img.GetImage()
		          
		          If Not IsNull( pic ) Then
		            Dim width As Integer = pic.Width / pic.Height * (Me.DefaultRowHeight - m_ImageMargin)
		            
		            If (width > colwidth) And (width > 0) Then
		              scale = colwidth / width
		              width = colwidth
		            End If
		            
		            g.DrawPicture( pic, (m_ImageMargin/2) + (colwidth - width) / 2, (m_ImageMargin/2) + (Me.DefaultRowHeight - (Me.DefaultRowHeight * scale)) / 2, width, Me.DefaultRowHeight * scale, 0, 0, pic.Width, pic.Height )
		            
		            result = True
		          End If
		        End If
		        
		      End If
		      
		    End If
		    
		  End If
		  If Not result Then result = RaiseEvent CellBackgroundPaint(g, row, column)
		  Return result
		End Function
	#tag EndEvent

	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If row < 0 Or row > Me.ListCount - 1 Or column < 0 Or column > Me.ColumnCount - 1 Then
		    Return True
		  End If
		  
		  App.DebugWriter.Write StringUtils.Sprintf("%s (%s): (%d,%d) editable=%s, ListIndex=%d, Selected=%s, Ctrl=%s, Shhift=%s", _
		  CurrentMethodName, Name, row, column, Str(CellType(row,column)=Listbox.TypeEditable Or ColumnType(column) = Listbox.TypeEditable), _
		  ListIndex, Str(Selected(row)), Str(Keyboard.ControlKey), Str(Keyboard.ShiftKey))
		  
		  If (CellType(row, column) = Listbox.TypeEditable Or  ColumnType(column) = Listbox.TypeEditable) _
		    And row = ListIndex _
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
		  
		  Me.currentDropRow = ListBox.RowFromXY( x, y + DefaultRowHeight / 2 )
		  
		  For r = 0 to ListCount()-1
		    For c = 0 to ColumnCount()-1
		      If r = Me.currentDropRow Then
		        CellBorderTop( r, c ) = ListBox.BorderThinSolid
		      Else
		        CellBorderTop( r, c ) = ListBox.BorderDefault
		      End If
		    Next
		  Next
		  
		  result = DragOverRowX( x, y, obj, action, Me.currentDropRow )
		  Return result
		End Function
	#tag EndEvent

	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  Dim img As StyleImage
		  
		  If CellTag( row, 0 ) IsA StyleImage Then
		    img  = CellTag( row, 0 )
		    drag.PrivateRawData("StIm") = img.GetImageFilename()
		  End If
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  Dim r, c As Integer
		  
		  DropRowObject( obj, action, Me.currentDropRow )
		  
		  For r = 0 to ListCount()-1
		    For c = 0 to ColumnCount()-1
		      CellBorderTop( r, c ) = ListBox.BorderDefault
		    Next
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  If SelectionType = SelectionSingle Then
		    mnu_edit_selall.Enabled = False
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  isFocused = True
		  GetFocus()
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  isFocused = False
		  LostFocus()
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
		  CellTag(LastIndex(), 0) = image
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearImage(row As Integer)
		  If row > -1 And row < Me.ListCount() Then
		    CellTag( row, 0 ) = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoSelectAll() As Boolean
		  If SelectionType = SelectionSingle Then Return False
		  For row As Integer = 0 To ListCount
		    Selected(row) = True
		  Next
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImage(row As Integer) As StyleImage
		  Dim result As StyleImage
		  result = Nil
		  
		  If row > -1 And row < Me.ListCount() Then
		    result = CellTag( row, 0 )
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
		  Return CellTag( row, 0 ) IsA StyleImage And _
		  Not (CellTag( row, 0 ) Is Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertImage(row As Integer, image As StyleImage)
		  InsertRow( row, "" )
		  CellTag( LastIndex(), 0 ) = image
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImage(row As Integer, image as StyleImage)
		  If row > -1 And row < Me.ListCount() Then
		    CellTag( row, 0 ) = image
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SwapRows(rowA As Integer, rowB As Integer) As Boolean
		  Dim tags() As Variant
		  Dim text() As String
		  Dim c As Integer
		  Dim result As Boolean
		  
		  result = False
		  
		  If rowA <> rowB And rowA > -1 And rowB > -1 And rowA < ListCount() And rowB < ListCount() Then
		    For c = 0 to ColumnCount()-1
		      tags.Append( CellTag( rowB, c ) )
		      text.Append( Cell( rowB, c ) )
		      
		      CellTag( rowB, c ) = CellTag( rowA, c )
		      Cell( rowB, c ) = Cell( rowA, c )
		      
		      CellTag( rowA, c ) = tags( c )
		      Cell( rowA, c ) = text( c )
		    Next
		    
		    result = True
		  End If
		  
		  Return result
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
		Event GetFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook


	#tag Note, Name = Info
		Imagelistbox is an extended Listbox adding a image preview column.
		The image is stored in the column identified by ImageColumn and is managed by ImageListBox.
		
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
			    Me.Invalidate()
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
			    m_ImageMargin = value
			    Me.Invalidate()
			  End If
			End Set
		#tag EndSetter
		ImageMargin As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private isFocused As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_ImageColumn As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_ImageMargin As Integer = 4
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
			Name="HasBorder"
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
			Name="HasHeader"
			Visible=true
			Group="Appearance"
			InitialValue="False"
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
			Name="DropIndicatorVisible"
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
			Name="AllowAutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
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
			Name="AllowExpandableRows"
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
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
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
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
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
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
			Name="ImageColumn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageMargin"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue=""
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
	#tag EndViewBehavior
End Class
#tag EndClass
