#tag Class
Protected Class MarsSplitter
Inherits Canvas
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  ' Find out how many pixels the splitter must move until the mouse
		  ' is once again centered over the origin point.
		  ' Resize all the split-controls by this amount.
		  ' Move the splitter itself so it sits underneath the mouse.
		  Dim distance As Integer
		  if me.Enabled then
		    If IsVertical Then
		      distance = X - mXAnchor
		      If Me.Left + distance < MinTopLeft Then
		        distance = MinTopLeft - Me.Left
		      End If
		      If Me.Left + Me.Width + distance > Me.Window.Width - MinBottomRight Then
		        distance = Me.Window.Width - MinBottomRight - Me.Left - Me.Width
		      End If
		      VerticalSplit distance
		    Else
		      distance = Y - mYAnchor
		      If Me.Top + distance < MinTopLeft Then
		        distance = MinTopLeft - Me.Top
		      End If
		      If Me.Top + Me.Height + distance > Me.Window.Height - MinBottomRight Then
		        distance = Me.Window.Height - MinBottomRight - Me.Top - Me.Height
		      End If
		      HorizontalSplit distance
		    End If
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  PickCursor
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if me.Enabled then
		    mXAnchor = X
		    mYAnchor = Y
		    Return True
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  PickCursor
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  ' Draw a little handle at the middle of the splitter region.
		  Dim x,y As Integer
		  If Me.Active And Me.Enabled Then
		    x = Me.Width / 2
		    y = Me.Height / 2
		    DrawHandlePoint(g,x,y)
		    If IsVertical Then
		      DrawHandlePoint(g,x,y-4)
		      DrawHandlePoint(g,x,y-8)
		      DrawHandlePoint(g,x,y+4)
		      DrawHandlePoint(g,x,y+8)
		    Else
		      DrawHandlePoint(g,x+4,y)
		      DrawHandlePoint(g,x+8,y)
		      DrawHandlePoint(g,x-4,y)
		      DrawHandlePoint(g,x-8,y)
		    End If
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub DrawHandlePoint(g As Graphics, x As Integer, y As Integer)
		  g.Pixel(x,y) = &c333333
		  g.Pixel(x+1,y+1) = &cFFFFFF
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HorizontalSplit(distance As Integer)
		  ' Find all the controls to either side of the splitter.
		  ' Adjust their dimensions to match the specified distance.
		  Dim ctr As Integer
		  Dim item As RectControl
		  Dim okToMove As Boolean
		  for ctr = 0 To Me.Window.ControlCount-1
		    If Me.Window.Control( ctr ) IsA RectControl Then
		      item = RectControl( Me.Window.Control( ctr ) )
		      ' is this within the splitter's area of influence?
		      okToMove = Not(item Is Me)
		      okToMove = okToMove And item.Left >= Me.Left
		      okToMove = okToMove And (item.Left + item.Width) <= (Me.Left + Me.Width)
		      okToMove = okToMove And item.Parent = me.Parent
		      
		      // the following block of lines were added by TT on 24Nov05:
		      if item.Top > Me.Top Then
		        okToMove = okToMove And Me.Top + Me.Height >= item.Top
		      else
		        okToMove = okToMove And (item.Top + item.Height) >= Me.Top
		      end
		      
		      If okToMove Then
		        ' is this above the splitter or below?
		        If item.Top > Me.Top Then
		          'below
		          item.Height = item.Height - distance
		          item.Top = item.Top + distance
		        Else
		          item.Height = item.Height + distance
		        End If
		      End If
		    End If
		  Next
		  Me.Top = Me.Top + distance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsVertical() As Boolean
		  Return Height > Width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PickCursor()
		  if me.Enabled then
		    If IsVertical Then
		      Me.MouseCursor = VertSplitterCursor
		    Else
		      Me.MouseCursor = HorzSplitterCursor
		    End If
		  else
		    Me.MouseCursor = nil
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub VerticalSplit(distance As Integer)
		  ' Find all the controls to either side of the splitter.
		  ' Adjust their dimensions to match the specified distance.
		  Dim ctr As Integer
		  Dim item As RectControl
		  Dim okToMove As Boolean
		  For ctr = 0 To Me.Window.ControlCount-1
		    If Me.Window.Control( ctr ) IsA RectControl Then
		      item = RectControl( Me.Window.Control( ctr ) )
		      ' is this within the splitter's area of influence?
		      okToMove = Not(item Is Me)
		      okToMove = okToMove And item.Top >= Me.Top
		      okToMove = okToMove And  (item.Top + item.Height) <= (Me.Top + Me.Height)
		      okToMove = okToMove And item.Parent = Me.Parent
		      
		      // the following block of lines were added by TT on 24Nov05:
		      If item.Left > Me.Left Then
		        okToMove = okToMove And Me.Left + Me.Width >= item.Left
		      else
		        okToMove = okToMove And (item.Left + item.Width) >= Me.Left
		      end
		      
		      If okToMove Then
		        ' is this to the left of the splitter or the right?
		        If item.Left > Me.Left Then
		          'to the right
		          item.Width = item.Width - distance
		          item.Left = item.Left + distance
		        Else
		          item.Width = item.Width + distance
		        End If
		      End If
		    End If
		  Next
		  Me.Left = Me.Left + distance
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Original version by Mars Saxman: http://www.redplanetsw.com/realbasic/#splitter
		
		Changes by Thomas Tempelmann on 24 Nov 05:
		- added some checks to HorizontalSplit and VerticalSplit so that it does only affect directly neighboring controls
	#tag EndNote


	#tag Property, Flags = &h4
		MinBottomRight As Integer
	#tag EndProperty

	#tag Property, Flags = &h4
		MinTopLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mXAnchor As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mYAnchor As Integer
	#tag EndProperty


End Class
#tag EndClass
