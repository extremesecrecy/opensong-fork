#tag Class
Class ShowURLText
Inherits Label
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if x>0 and x<me.Width and y>0 and y<me.Height then
		    me.Textcolor = ColorActive
		    return true
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if x>0 and x<me.Width and y>0 and y<me.Height then
		    me.Textcolor = ColorActive
		    me.Underline = true
		  else
		    me.Textcolor = ColorReady
		    me.Underline = false
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  if not System.MouseDown then
		    me.Underline = true
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  me.Underline = false
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  me.Textcolor = ColorReady
		  if x>0 and x<me.Width and y>0 and y<me.Height then
		    ShowURL me.URL
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.Textcolor = ColorReady
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		URL As String
	#tag EndProperty


	#tag Constant, Name = ColorActive, Type = Color, Dynamic = False, Default = \"&cC00000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ColorReady, Type = Color, Dynamic = False, Default = \"&c0000C0", Scope = Private
	#tag EndConstant


End Class
#tag EndClass
