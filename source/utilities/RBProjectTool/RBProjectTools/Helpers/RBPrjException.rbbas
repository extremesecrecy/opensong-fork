#tag Class
Protected Class RBPrjException
Inherits RuntimeException
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(msg as String, where as String, file as FolderItem = nil)
		  me.Constructor
		  me.msg = msg
		  me.where = where
		  if file <> nil then
		    me.file = new FolderItem(file) // create a clone so that it doesn't accidentally get changed
		  end
		  
		  dim s as String
		  s = me.msg
		  if me.where <> "" then
		    s = s + " (in class: " + me.where + ")"
		  end
		  if me.file <> nil then
		    s = s + " (file: " + me.file.Name + ")"
		  end
		  me.Message = s
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msg As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private where As String
	#tag EndProperty


End Class
#tag EndClass
