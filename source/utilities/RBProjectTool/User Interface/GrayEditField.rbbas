#tag Class
Protected Class GrayEditField
Inherits TextArea
	#tag Event
		Sub EnableMenuItems()
		  EditSelectAll.Enable
		  EnableMenuItems
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if not DebugBuild then me.editInProgress = 0 // make sure it's reset
		  if not KeyDown (Key) then
		    if not Keyboard.CommandKey and key = me.CompletionChar then
		      // completion key, so "fill" the editfield with the full text
		      me.autoComplete
		      return true
		    end
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  if not DebugBuild then me.editInProgress = 0 // make sure it's reset
		  if me.CompleteOnLostFocus then
		    me.autoComplete
		  else
		    me.removeGray
		  end if
		  LostFocus
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.black = &c000000
		  me.gray = &c909090
		  me.CompletionChar = chr(13)
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub SelChange()
		  if me.editInProgress = 0 then
		    me.refreshText
		    SelChange
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub TextChange()
		  // Pressing the Forward Delete key does not invoke SelChance,
		  // but the gray text gets modified by it.
		  // So we take care of this case here (as well as pasting text via clipboard)
		  if me.editInProgress = 0 then
		    me.refreshText
		    TextChange
		  end
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function addGray() As String
		  dim cPos, cLen, i as integer
		  dim t as string
		  dim grayList() as String
		  
		  // In this routine, we handle typing (overiding the editfield's
		  // normal typing routines). This way we can adjust for the gray
		  // text as needed. It's a little slow, but users shouldn't be
		  // typing more than a few characters in these kind of editfields
		  // anyway.
		  
		  me.editInProgress = me.editInProgress + 1
		  
		  // save cursor position and grab non-gray text
		  cPos = me.selStart
		  cLen = me.selLength
		  
		  t = me.getNonGray
		  if len(t) > 0 then
		    GetChoices (grayList)
		    for i = 0 to ubound(grayList)
		      if startStr(grayList(i), t) then
		        // Here we replace entire text and color it black
		        me.selLength = 0
		        me.textColor = me.black
		        me.text = grayList(i)
		        
		        // Here we color the non-typed part and color it gray (that's grey for non-USAmericans)
		        me.selStart = len(t)
		        me.selLength = len(me.Text) - me.selStart
		        me.selTextColor = me.gray
		        
		        // Finally, put the cursor no further than at end of black text
		        if cPos+cLen > len(t) then
		          if cPos > len(t) then
		            cPos = len(t)
		            cLen = 0
		          else
		            cLen = len(t) - cPos
		          end
		        end
		        me.selStart = cPos
		        me.selLength = cLen
		        me.editInProgress = me.editInProgress - 1
		        return t
		      end if
		    next
		  end
		  me.selStart = cPos
		  me.selLength = cLen
		  // nothing matched, so set all to black
		  setBlack t
		  me.editInProgress = me.editInProgress - 1
		  return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub autoComplete()
		  // This makes all the text black and sets the cursor at its end
		  me.editInProgress = me.editInProgress + 1
		  me.selStart = 0
		  me.selLength = len(me.text)
		  me.selTextColor = black
		  if me.CompletionSelectsAll then
		    me.selStart = 0
		    me.selLength = len(me.text)
		  else
		    me.selStart = len(me.text)
		    me.selLength = 0
		  end
		  me.editInProgress = me.editInProgress - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getNonGray() As String
		  dim t as string
		  dim i, origStart, origLen as integer
		  
		  me.editInProgress = me.editInProgress + 1
		  origStart = me.selStart
		  origLen = me.selLength
		  t = nthField(me.text, EndOfLine, 1)
		  for i = 1 to len(me.text)
		    me.selStart = i - 1
		    me.selLength = i
		    // exit at first non-black
		    if me.selTextColor <> me.black then
		      t = mid(me.text, 1, i-1)
		      exit
		    end if
		  next
		  me.selStart = origStart
		  me.selLength = origLen
		  me.editInProgress = me.editInProgress - 1
		  return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PartialText() As String
		  return me.getNonGray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub refreshText()
		  dim i as integer
		  dim blackText as String
		  
		  // If the user changes the cursor position, we adjust it
		  // so it can't be placed within gray text. We have a
		  // boolean which tells us if one of *our* routines has moved
		  // the cursor so we can ignore those events
		  
		  blackText = me.addGray()
		  i = me.selStart
		  if i > len(blackText) then
		    me.selStart = len(blackText)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub removeGray()
		  // opposite of autoComplete(): leaves the black text and removes the untyped gray text behind it
		  setBlack getNonGray()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setBlack(t as String)
		  dim cPos, cLen as Integer
		  me.editInProgress = me.editInProgress + 1
		  cPos = me.selStart
		  cLen = me.selLength
		  me.text = t
		  me.selStart = 0
		  me.selLength = len(me.text)
		  me.selTextColor = black
		  me.selStart = cPos
		  me.selLength = cLen
		  me.editInProgress = me.editInProgress - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function startStr(theSource as string, theFind as string) As Boolean
		  // This routine returns true if the find string
		  // matches the *begining* of the source string
		  return left(theSource, len(theFind)) = theFind
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event EnableMenuItems()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetChoices(ByRef choices() as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key as String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelChange()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChange()
	#tag EndHook


	#tag Note, Name = About
		Formerly "GrayEditClass"
		Original version of this class was created in May 1999 by Stone Table Software.
		Download link of original version:
		  <http://www.stonetablesoftware.com/rbpage/index.html>
		
		Improved by Thomas Tempelmann 22 Nov 2005 in the following ways:
		- Modified the code a little so that Keydown is less involved. Instead,
		   we let the text get modified by the framework and then update it
		   afterwards.
		- Removed the EditPaste handler and instead have multi-lines handled
		   by getNonGray now.
		- Made all local methods and properties "protected",
		- Changed "GrayList" array from being 1-based into 0-based.
		- Added public properties CompletionChar, CompletionSelectsAll and
		   CompleteOnLostFocus to allow customization.
		- Added this note.
		
		Changes on 22 Nov 2005:
		- instead of using an array for the possibl items, Events are used
	#tag EndNote


	#tag Property, Flags = &h21
		Private black As color
	#tag EndProperty

	#tag Property, Flags = &h0
		CompleteOnLostFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CompletionChar As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CompletionSelectsAll As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private editInProgress As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private gray As color
	#tag EndProperty


End Class
#tag EndClass
