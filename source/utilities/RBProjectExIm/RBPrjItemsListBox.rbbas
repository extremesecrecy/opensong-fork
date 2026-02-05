#tag Class
Protected Class RBPrjItemsListBox
Inherits Listbox
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim item as RBPrjItem
		  dim prevAutoExpand as Integer
		  dim prevExpanding as Boolean
		  
		  prevAutoExpand = me.autoExpand
		  prevExpanding = me.expanding
		  
		  if not me.expanding then
		    me.expanding = true
		    if Keyboard.AsyncMenuShortcutKey then
		      me.autoExpand = 1 // expand the next level only
		    end
		  end
		  
		  item = me.CellTag (row, 0)
		  me.addItems item.Children (me.ordered)
		  
		  me.autoExpand = prevAutoExpand
		  me.expanding = prevExpanding
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  setup
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub addItem(item as RBPrjItem, isExternal as Boolean = false)
		  dim isContainer as Boolean
		  dim nameItem as RBPrjItem
		  dim name as String
		  
		  isContainer = item.HasChildren
		  if isContainer then
		    me.AddFolder item.tag
		  else
		    me.AddRow item.tag
		  end
		  
		  if isContainer then
		    nameItem = item.ChildByTag("name")
		    if nameItem = nil then
		      nameItem = item.ChildByTag("Name")
		    end
		    if nameItem = nil and isExternal and item.tag = "RbBF" then
		      try
		        nameItem = item.ChildByIndex(0).ChildByTag("Name")
		      catch
		        // ignore
		      end
		    end
		    if nameItem <> nil then
		      name = nameItem.PrintableValue
		    end
		  end
		  
		  me.Cell (me.LastIndex, 1) = RBPrjHelper.IntToStr4(item.type)
		  if item.id <> -1 then
		    me.Cell (me.LastIndex, 2) = RBPrjHelper.MyStr(item.id)
		  end
		  me.Cell (me.LastIndex, 3) = name
		  me.Cell (me.LastIndex, 4) = item.PrintableValue
		  me.CellTag (me.LastIndex, 0) = item
		  
		  if me.autoExpand <> 0 then
		    me.autoExpand = me.autoExpand - 1
		    me.Expanded (me.LastIndex) = true
		    me.autoExpand = me.autoExpand + 1
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addItems(items() as RBPrjItem)
		  dim item as RBPrjItem
		  
		  for each item in items
		    me.addItem item
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentTree() As RBPrjItemsTree
		  return me.tree
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub openItem(item as RBPrjItem)
		  dim idx as Integer
		  if item <> nil then
		    openItem (item.parent)
		    for idx = 0 to me.ListCount-1
		      if me.CellTag (idx, 0) = item then
		        me.Expanded (idx) = true
		        exit
		      end
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Populate(root as RBPrjItemsTree, ordered as Boolean)
		  dim t as RBPrjItemsTree
		  
		  me.tree = root // keep a ref to the tree so that it does not get discarded as long as we use it
		  me.ordered = ordered
		  me.autoExpand = 0
		  me.expanding = false
		  me.DeleteAllRows
		  
		  me.addItem root.RootItem
		  
		  for each t in root.Externals
		    me.addItem t.RootItem, true
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setup()
		  me.ColumnCount = 5
		  me.ColumnWidths = "160,40,80,120"
		  me.InitialValue = "Tag	Type	ID	Name	Value"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowItem(item as RBPrjItem)
		  dim idx as Integer
		  
		  openItem (item.parent)
		  
		  for idx = 0 to me.ListCount-1
		    if me.CellTag (idx, 0) = item then
		      me.ListIndex = idx
		      exit
		    end
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private autoExpand As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private expanding As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ordered As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private tree As RBPrjItemsTree
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Listbox"
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
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Listbox"
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
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Listbox"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			InheritedFrom="Listbox"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
