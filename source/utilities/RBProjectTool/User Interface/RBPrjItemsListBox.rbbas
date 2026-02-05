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
		  dim cellItem As RBPrjItem
		  if item <> nil then
		    openItem (item.parent)
		    for idx = 0 to me.ListCount-1
		      cellItem = me.CellTag (idx, 0)
		      if cellItem = item then
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
		  dim cellItem As RbPrjItem
		  
		  openItem (item.parent)
		  
		  for idx = 0 to me.ListCount-1
		    cellItem = me.CellTag (idx, 0)
		    if cellItem = item then
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


End Class
#tag EndClass
