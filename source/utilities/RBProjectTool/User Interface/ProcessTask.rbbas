#tag Class
Protected Class ProcessTask
	#tag Method, Flags = &h0
		Sub Constructor(newItem As FolderItem, newMode As Integer, ParamArray newFlags As Boolean)
		  ReDim Flags(-1)
		  
		  Item = newItem
		  Mode = newMode
		  
		  Dim flag As Boolean
		  For Each flag In newFlags
		    Flags.Append(flag)
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Flags() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Item As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Integer
	#tag EndProperty


End Class
#tag EndClass
