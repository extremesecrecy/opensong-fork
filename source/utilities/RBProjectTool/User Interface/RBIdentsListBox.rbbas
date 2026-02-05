#tag Class
Protected Class RBIdentsListBox
Inherits Listbox
	#tag Event
		Sub CollapseRow(row As Integer)
		  dim item as RBPrjObjEntity
		  item = me.CellTag (row, 0)
		  self.expanded.Remove (item)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ExpandRow(row As Integer)
		  dim item as RBPrjObjEntity
		  item = me.CellTag (row, 0)
		  me.expanded.Value (item) = true
		  self.addItems item.Name
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  setup
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub addItems(className as String)
		  dim items(), items2(), item, item2, classItem as RBPrjObjEntity
		  dim isContainer as Boolean
		  dim superName as String
		  
		  items = me.theIdents.AllIdents (className)
		  
		  if me.includeInherited then
		    superName = className
		    do
		      classItem = me.theIdents.LookupClass (superName)
		      if classItem = nil then exit
		      superName = classItem.SuperClass
		      if superName = "" then exit
		      items2 = me.theIdents.AllIdents (superName)
		      for each item2 in items2
		        if not item2.IsPrivate() then // never include privates from super classes
		          '### should detect overidden methods here and mark them in the view somehow
		          items.Append item2
		        end if
		      next
		    loop
		  end
		  
		  // sort the items by their name
		  TTsArraySorter.SortValueArray items, true
		  
		  for each item in items
		    if me.insideView or item.IsPublic then
		      isContainer = me.theIdents.IsContainer (item.Name)
		      if isContainer then
		        me.AddFolder item.Name
		      else
		        me.AddRow item.Name
		      end
		      me.CellTag (me.LastIndex, 0) = item
		      me.Cell (me.LastIndex, 1) = item.TypeName
		      me.Cell (me.LastIndex, 2) = item.SuperClass
		      me.Cell (me.LastIndex, 3) = item.Declaration
		      me.Cell (me.LastIndex, 4) = ReplaceAll (item.Content, EndOfLine, " / ")
		      me.Cell (me.LastIndex, 5) = ReplaceAll (item.Notes, EndOfLine, " / ")
		      if isContainer and (me.autoExpand or me.expanded.HasKey (item)) then
		        me.Expanded(me.LastIndex) = true
		      end
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Populate(tree as RBPrjIdents, includeInherited as Boolean, insideView as Boolean)
		  if tree <> nil then
		    // new tree
		    me.theIdents = tree
		    me.expanded = new Dictionary
		  end
		  
		  me.includeInherited = includeInherited
		  me.insideView = insideView
		  
		  me.DeleteAllRows
		  me.addItems ""
		  
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
		#tag Note
			Key: RBPrjObjEntity
			Value: true
		#tag EndNote
		Private expanded As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private includeInherited As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private insideView As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theIdents As RBPrjIdents
	#tag EndProperty


End Class
#tag EndClass
