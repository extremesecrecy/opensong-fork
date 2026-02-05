#tag Module
Protected Module RBSourceReformatting
	#tag Method, Flags = &h1
		Protected Function GetIndentations(sourceLinesIn() as String, indentsOut() as Integer) As Boolean
		  // Returns true if the indentation appeared to work out fine (= balanced).
		  
		  dim currLineIdx, currIndentLevel, nextIndent, indentation as Integer
		  
		  redim indentsOut (Ubound (sourceLinesIn))
		  
		  currIndentLevel = 0
		  for currLineIdx = 0 to Ubound (sourceLinesIn)
		    indentation = SourceIndentChange (LTrim (sourceLinesIn (currLineIdx)), nextIndent)
		    currIndentLevel = currIndentLevel + indentation
		    indentsOut (currLineIdx) = currIndentLevel
		  next
		  
		  return currIndentLevel = 0 and nextIndent = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IndentSource(sourceLines() as String, removeLeadingBlanks as Boolean, prefix as String = "") As Boolean
		  dim line, s as String
		  dim i, indents() as Integer
		  dim isBalanced as Boolean
		  
		  isBalanced = GetIndentations (sourceLines, indents)
		  
		  for i = 0 to Ubound(sourceLines)
		    s = Left ("                                                                                                       ", indents(i)*2)
		    line = sourceLines(i)
		    if removeLeadingBlanks then
		      line = LTrim (line)
		    end
		    sourceLines(i) = prefix + s + line
		  next
		  
		  return isBalanced
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IndentSource(sourceIn as String, removeLeadingBlanks as Boolean, ByRef isBalanced as Boolean, prefix as String = "") As String
		  dim sourceLines(), sourceOut as String
		  
		  sourceLines = sourceIn.Split (EndOfLine)
		  isBalanced = IndentSource (sourceLines, removeLeadingBlanks, prefix)
		  sourceOut = Join (sourceLines, EndOfLine)
		  
		  return sourceOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LastIdentifierBeforeComments(s As String) As String
		  // contributed by Carlos M <rblists@rbtips.com>
		  
		  Dim rg As RegEx
		  Dim myMatch As RegExMatch
		  Dim txtData As String
		  Dim c1, c2, pos As Integer
		  
		  rg = New RegEx
		  txtData = s
		  
		  rg.Options.ReplaceAllMatches = True
		  
		  // STEP 1 - Check if there's any comment char
		  If InStrB(txtData, "'") > 0 OR InStrB(txtData, "//") > 0 Then
		    
		    // Remove any quotes and values inside quotes
		    rg.Options.Greedy = False
		    rg.SearchPattern = """(.*)"""
		    rg.ReplacementPattern = """"
		    txtData = rg.Replace(txtData)
		    
		    // Remove comment
		    c1 = InStr(txtData, "'")
		    c2 = InStr(txtData, "//")
		    If (c1 > 0) AND (c2 > 0) Then
		      pos = Min(c1, c2)
		    Else
		      pos = Max(c1, c2)
		    End If
		    
		    If pos > 0 Then txtData = Left(txtData, pos-1)
		    
		  End If
		  
		  // STEP 2 - Remove spaces from end
		  txtData = RTrim(txtData)
		  
		  // STEP 3 - Get the last char/word
		  rg.SearchPattern = "([\w.]+)$"
		  myMatch = rg.search(txtData)
		  
		  If myMatch <> Nil Then
		    Return myMatch.SubExpressionString(1)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RebuildIndentation(sourceIn as String, ByRef cursorPos as Integer, ByRef isBalanced as Boolean) As String
		  dim sourceLines(), sourceOut as String
		  
		  sourceLines = sourceIn.Split (EndOfLine)
		  
		  isBalanced = ReformatSourceCode (sourceLines, cursorPos, 2, 0)
		  
		  sourceOut = Join (sourceLines, EndOfLine)
		  
		  return sourceOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ReformatSourceCode(sourceLines() as String, ByRef cursorPos as Integer, blanksPerIndentLevel as Integer, baseBlanks as Integer) As Boolean
		  // Takes a string array containing REALbasic source lines and re-indents them in place
		  // 'cursorPos' will be updated so that it stays on the same character; pass 'SelStart' here when text comes from an EditField
		  // 'blanksPerIndentLevel' should be 1 or 2 to specify how much spaces are used per indentation level
		  // 'baseBlanks' is what is additionally added as indentation to each line
		  // Returns true only if the indentation appeared to work out fine.
		  
		  dim currLineIdx, origLineLength, currOffset, currIndentLevel, nextIndent, indentation as Integer
		  dim newLineLength, origIndent, newIndent as Integer
		  dim origSrcLine, leftTrimmedSrcLine, s as String
		  dim cursorSet as Boolean
		  
		  for currLineIdx = 0 to Ubound (sourceLines)
		    origSrcLine = sourceLines(currLineIdx)
		    leftTrimmedSrcLine = LTrim (origSrcLine)
		    
		    indentation = SourceIndentChange (leftTrimmedSrcLine, nextIndent)
		    
		    currIndentLevel = currIndentLevel + 2 * indentation
		    
		    // Now modify the current line, along with updating 'cursorPos'
		    // note: do not try to optimize here by using LenB etc, since this would break the cursorPos updating
		    
		    origLineLength = Len (origSrcLine)
		    newIndent = currIndentLevel + baseBlanks
		    newLineLength = Len (leftTrimmedSrcLine)
		    if cursorPos >= currOffset then
		      if cursorPos > currOffset + origLineLength then
		        // cursor is in a line further down
		        cursorPos = cursorPos + (newIndent + newLineLength) - origLineLength
		      elseif not cursorSet then
		        // cursor is in this line - make sure it does stay in valid limits
		        cursorSet = true
		        if cursorPos <= currOffset + newIndent then
		          // set the cursor in the beginning of the line (after the indentation)
		          cursorPos = currOffset + newIndent
		        else
		          origIndent = origLineLength - Len (LTrim (origSrcLine))
		          cursorPos = cursorPos + newIndent - origIndent
		          if cursorPos > currOffset + (newIndent + newLineLength) then
		            cursorPos = currOffset + (newIndent + newLineLength)
		          end
		        end
		      end
		      currOffset = currOffset + origLineLength + Len (EndOfLine)
		    end
		    s = Left ("                                                                                                       ", newIndent)
		    sourceLines(currLineIdx) = s + leftTrimmedSrcLine
		    
		  next
		  
		  return currIndentLevel = 0 and nextIndent = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SourceIndentChange(leftTrimmedSrcLine as String, ByRef nextIndent as Integer) As Integer
		  dim i, indentation as Integer
		  dim ch, firstword, lastword as String
		  dim isContinuation, isMoreContinuation, checkForThen as Boolean
		  
		  indentation = nextIndent
		  if indentation > 1 then
		    // this is a "_" continuation
		    if indentation > 90 then
		      nextIndent = nextIndent - 100
		      indentation = nextIndent
		      nextIndent = -indentation
		      isMoreContinuation = true
		    else
		      nextIndent = -indentation
		    end
		    isContinuation = true
		  else
		    nextIndent = 0
		  end
		  
		  // get the first word
		  i = 0
		  firstword = ""
		  do
		    i = i + 1
		    ch = MidB (leftTrimmedSrcLine, i, 1)
		    if (ch < "a" or ch > "z") and (i > 1 or ch <> "#") then exit
		    firstword = firstword + ch
		  loop
		  
		  checkForThen = false
		  
		  select case firstword
		    
		  case "if"
		    checkForThen = true
		    
		  case "elseif"
		    indentation = indentation - 1
		    checkForThen = true
		    
		  case "function", "sub", "select", "for", "do", "while", "try", "#if", "Protected", "Private"
		    nextIndent = nextIndent + 1
		    
		  case "end", "next", "loop", "wend", "#endif"
		    indentation = indentation - 1
		    
		  case "case", "else", "exception", "finally", "#else", "#elseif", "catch"
		    indentation = indentation - 1
		    nextIndent = nextIndent + 1
		    
		  case "rem"
		    // no checking for "then" in this case
		    
		  else
		    if isContinuation then
		      ch = MidB (leftTrimmedSrcLine, 1, 1) // first char in line
		      if ch <> "'" and ch <> "/" then // check if the line is a comment line
		        checkForThen = true
		      end
		    end
		    
		  end select
		  
		  lastword = LastIdentifierBeforeComments (leftTrimmedSrcLine)
		  
		  if checkForThen then
		    if lastword = "then" then
		      nextIndent = nextIndent + 1
		    end
		  end
		  
		  if lastword = "_" then
		    // Line continues in the next line - indent it double
		    if isMoreContinuation then
		      nextIndent = nextIndent + 100
		    elseif isContinuation then
		      nextIndent = nextIndent + 102
		    else
		      nextIndent = nextIndent + 2
		    end
		  elseif isMoreContinuation then
		    nextIndent = nextIndent - 2
		  end
		  
		  return indentation
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is a collection of functions that reformat REALbasic source code
		by adjusting the indentation for if, then, end, while, wend and so on.
		
		Contributors:
		 Barry Traver, Carlos M, Ed Kleban, Thomas Tempelmann
		
		Last update: April 6, 2008
		
		Feel free to use it any way you like (consider it public domain)
		
		If you improve this code, please send to tt@tempel.org
	#tag EndNote

	#tag Note, Name = Change History
		April 6, 2008, by TT:
		- fixed indentation when there were multiple continuation lines in succession
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
