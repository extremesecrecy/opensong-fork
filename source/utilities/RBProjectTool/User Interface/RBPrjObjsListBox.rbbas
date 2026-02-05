#tag Class
Protected Class RBPrjObjsListBox
Inherits Listbox
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim item as RBPrjObjEntity
		  item = me.CellTag (row, 0)
		  me.addItems item.Children
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  setup
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub addItems(items() as RBPrjObjEntity)
		  dim item as RBPrjObjEntity
		  dim isContainer as Boolean
		  
		  for each item in items
		    isContainer = Ubound(item.Children) >= 0
		    if isContainer then
		      me.AddFolder item.Name
		    else
		      me.AddRow item.Name
		    end
		    me.Cell (me.LastIndex, 1) = item.TypeName
		    me.Cell (me.LastIndex, 2) = item.SuperClass
		    me.Cell (me.LastIndex, 3) = item.Declaration
		    me.Cell (me.LastIndex, 4) = ReplaceAll (item.Content, EndOfLine, " / ")
		    me.Cell (me.LastIndex, 5) = ReplaceAll (item.Notes, EndOfLine, " / ")
		    me.CellTag (me.LastIndex, 0) = item
		    if isContainer and me.autoExpand and (item.Type <> item.TypeControlInstance) then
		      me.Expanded(me.LastIndex) = true
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Populate(tree as RBPrjObjTree, allExpanded as Boolean)
		  me.tree = tree // keep a ref to the tree so that it does not get discarded as long as we use it
		  me.autoExpand = allExpanded
		  me.DeleteAllRows
		  me.addItems tree.Root.Children
		  me.autoExpand = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setup()
		  me.ColumnCount = 6
		  'me.ColumnWidths = "140,80,120,120"
		  me.InitialValue = "Name	Kind	Super	Type/Parms	Value	Notes"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private autoExpand As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private tree As RBPrjObjTree
	#tag EndProperty


End Class
#tag EndClass
