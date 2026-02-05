#tag Class
Protected Class RBPrjTextFileWriter
Inherits RBPrjProcessingHelper
Implements RBPrjProcessing
	#tag Method, Flags = &h0
		Function BlockEnter(tag as String, id as Integer, header as RBPrjDataRef) As Boolean
		  assert (Ubound(me.blockLines) = -1, "internal error in BlockEnter")
		  
		  if me.out_stream = nil then
		    me.blockLines.Append me.formatLine
		  end
		  
		  if me.optionShowAll then
		    writeItem ("B", tag, header.AsHexString ())
		  end
		  me.indent = me.indent + 1
		  me.currBlockIsEncrypted = header.ptr.Long(header.ofs+20) <> 0
		  me.blockContainerID = 0
		  me.groupLevel = 0
		  return true // must enter even encrypted blocks
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlockLeave(tag as String, id as Integer, optionalName as String, extFileRef as FolderItem)
		  me.indent = me.indent - 1
		  if me.optionShowAll then
		    writeItem ("b", tag, "")
		  end
		  
		  assert me.groupLevel = 0, "me.groupLevel=0"
		  
		  me.flushTempLines ()
		  
		  BlockComplete (me.blockLines, optionalName, tag, id, me.currBlockIsEncrypted, me.blockContainerID, extFileRef)
		  redim me.blockLines(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function buildFirstHdrLine(sfx1 as String) As String
		  return _
		  RBPrjTextFileWriter.FileFirstLinePrefix + sfx1 + RBPrjTextFileWriter.FileFirstLineDelim + _
		  Str(FileVersion) + RBPrjTextFileWriter.FileFirstLineDelim + _
		  " - <" + RBPrjSupport.ReferenceWebsite + ">"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneForExternalsProcessing(f as FolderItem) As RBPrjProcessing
		  return new RBPrjTextFileWriter (me.filter_file, not me.optionShowGroupIDs, me.optionOptimizeOutput, me.optionSimplifiedOutput)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(filter_file as FolderItem, suppressGrpIDs as Boolean, optimizedFormat as Boolean, simplifiedOutput as Boolean)
		  me.Constructor
		  
		  me.optionShowGroupIDs = not suppressGrpIDs
		  me.optionShowAll = true
		  me.optionOptimizeOutput = optimizedFormat // reorganizes leaf groups and source lines
		  me.optionSimplifiedOutput = simplifiedOutput // leaves away some information that makes it easier to read but unable to recreate a prj from it
		  
		  me.filter_file = filter_file
		  if filter_file <> nil then
		    readFilters filter_file
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExternalsProcessingFinished()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub flushTempLines()
		  // flushes collected temp lines to file or appends to the "blockLines" array
		  
		  dim s as String
		  if me.out_stream <> nil then
		    if Ubound(me.tempLines) >= 0 then
		      me.out_stream.WriteLine (Join (me.tempLines, me.out_stream.Delimiter))
		    end
		  else
		    for each s in me.tempLines
		      blockLines.Append s
		    next
		  end
		  
		  redim me.tempLines(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupEnter(tag as String, id as Integer)
		  dim s as String
		  
		  if RBPrjHelper.Equal (tag, "Icon") then
		    me.textIsNonPrintable = me.textIsNonPrintable + 1
		  end
		  
		  me.flushTempLines () // flush previously collected "temp lines" because we only collect these for the innermost group
		  
		  me.groupEntered = true
		  
		  if me.optionShowAll then
		    if me.optionShowGroupIDs then
		      s = RBPrjHelper.MyStr (id)
		    end
		    writeItem ("G", tag, s)
		  end
		  
		  me.groupLevel = me.groupLevel + 1
		  me.indent = me.indent + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GroupLeave(tag as String, id as Integer)
		  dim s, s2, optStr as String
		  dim linesToAppend() as String
		  dim needsClosure as Boolean
		  dim origIndent as Integer
		  
		  if me.optionOptimizeOutput and me.groupEntered then
		    origIndent = me.indent
		    optStr = makeOptimizedGroup (tag, linesToAppend, needsClosure)
		    me.indent = origIndent
		  end
		  
		  me.indent = me.indent - 1
		  me.groupLevel = me.groupLevel - 1
		  
		  if me.optionShowAll then
		    if me.optionShowGroupIDs then
		      s = RBPrjHelper.MyStr (id)
		    else
		      s = ""
		    end
		    if optStr = "" then
		      writeItem ("g", tag, s)
		    else
		      if s <> "" then
		        s = s + " "
		      end
		      if needsClosure then
		        s2 = "d"
		      else
		        s2 = "D"
		      end
		      writeItem (s2, tag, s + optStr)
		    end
		  end
		  
		  for each s in linesToAppend
		    me.tempLines.Append s
		  next
		  
		  if needsClosure then
		    me.tempLines.Append indented() + SourceGroupClosure
		  end
		  
		  me.flushTempLines()
		  
		  me.groupEntered = false
		  
		  if RBPrjHelper.Equal (tag, "Icon") then
		    me.textIsNonPrintable = me.textIsNonPrintable - 1
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function indented() As String
		  return Left("                                            ", me.indent)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function makeOptimizedGroup(tag as String, ByRef linesToAppendOut() as String, ByRef needsClosure as Boolean) As String
		  dim isSourceLine, isBreakpoint, prevWasSrcl, isFirstLine as Boolean
		  dim s, s2, optStr as String
		  dim linesToAppend() as String
		  dim lineIdx, minIndent as Integer
		  
		  minIndent = me.indent
		  
		  if not me.optionSimplifiedOutput then
		    assert (RBPrjHelper.Equal (NthField (LTrim(me.tempLines(0)), TypeValueSeparator, 1), tag+TagTypeSeparator+"G"), "makeOptimizedGroup: internal error")
		  end
		  
		  if tag = "sorc" then
		    
		    // optimize source lines: remove the tag/type headers from "srcl" lines and add source code indentation
		    
		    isFirstLine = true
		    for lineIdx = 1 to Ubound(me.tempLines)
		      s = LTrim (me.tempLines(lineIdx))
		      
		      isSourceLine = false
		      if RBPrjHelper.Equal (LeftB (s, 4), "srcl") then
		        if me.optionSimplifiedOutput then
		          isSourceLine = true
		        else
		          isSourceLine = RBPrjHelper.Equal (MidB (s, 6, 1), "S") // does not allow base64 encoded lines (which should not occour in source lines anyways)
		        end
		      end
		      if not isSourceLine and RBPrjHelper.Equal (Left (s, 4), "srbp") then
		        // it's a breakpoint inside the list of source lines - move these to the header
		        isBreakpoint = true
		        isSourceLine = true
		      else
		        isBreakpoint = false
		      end
		      if prevWasSrcl and not isSourceLine and not isBreakpoint then
		        // did not work out as expected - abort
		        return ""
		      elseif isSourceLine and not isBreakpoint then
		        s = Mid (s, Instr(s, TypeValueSeparator)+Len(TypeValueSeparator))
		        s2 = LTrim(s)
		        if RTrim (s2) = SourceGroupClosure or Left(s2,1) = CommentPrefix or LenB(s) <> LenB(s2) then
		          // can't optimize this (e.g. can not handle preserve blanks in source lines when reformatting it)
		          return ""
		        end
		        linesToAppend.Append s
		      elseif RBPrjHelper.Equal (Left (s, 4), "ntln") then
		        // this is not source code, it is a note -> abort
		        return ""
		      else
		        // a non-source line. Add them as items to the group start line
		        if InStr (s, GroupItemDelimiter) > 0 then
		          // can't optimize this
		          return ""
		        end
		        if LenB(optStr) = 0 then
		          optStr = s
		        else
		          optStr = optStr + GroupItemDelimiter + s
		        end
		      end
		      prevWasSrcl = isSourceLine
		    next
		    
		    if not isSourceLine then
		      // did not work out as expected - abort
		      return ""
		    end
		    
		    call RBSourceReformatting.IndentSource (linesToAppend, true, chr(9)+chr(9)) // add two TABs in front of each source line
		    
		    linesToAppendOut = linesToAppend
		    needsClosure = true
		    
		  else
		    
		    // optimize non-source groups
		    
		    isFirstLine = true
		    for each s in me.tempLines
		      if InStr (s, GroupItemDelimiter) > 0 then
		        // can't optimize this
		        return ""
		      end
		      if isFirstLine then
		        isFirstLine = false // this is the "group start" token
		      else
		        s = LTrim (s)
		        if LenB(optStr) = 0 then
		          optStr = s
		        else
		          optStr = optStr + GroupItemDelimiter + s
		        end
		      end
		    next
		    
		  end
		  
		  redim me.tempLines(-1)
		  
		  if not needsClosure then
		    optStr = optStr + ")"
		  end
		  return "(" + optStr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFinished()
		  if me.out_stream <> nil then
		    writeItem ("p", "RbBF", "")
		  end
		  
		  me.flushTempLines ()
		  
		  FileEnd ()
		  
		  if me.out_stream <> nil then
		    me.out_stream.WriteLine FileLastLine
		    me.out_stream.Close
		    me.out_stream = nil
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessHeader(dataRef as RBPrjDataRef, results as RBPrjParseResults, inputFileRef as FolderItem)
		  dim f, f2 as FolderItem
		  
		  SetParseResultsObj (results)
		  
		  redim me.blockLines(-1)
		  redim me.tempLines(-1)
		  me.groupEntered = false
		  
		  if me.outFileRef <> nil then
		    f = me.outFileRef
		    f2 = me.outFileRef
		  else
		    f = inputFileRef.Parent.TrueChild(inputFileRef.Name+RBPrjHelper.TextFileSuffix)
		    f2 = inputFileRef
		  end
		  
		  me.inputFileRef = inputFileRef
		  
		  if me.optionOptimizeOutput then
		    me.formatLine = FileFormatIDv2
		  else
		    me.formatLine = FileFormatIDv1
		  end
		  
		  if FileStart (f2, dataRef) then
		    me.out_stream = nil
		    writeItem ("P", "RbBF", dataRef.AsHexString())
		  else
		    me.out_stream = TextOutputStream.Create(f)
		    me.out_stream.Delimiter = EndOfLine
		    me.out_stream.WriteLine RBPrjHelper.UTF8BOM + buildFirstHdrLine (FileFirstLineSuffix1)
		    me.out_stream.WriteLine FileHdrOrigName + inputFileRef.Name
		    // add other file properties
		    me.out_stream.WriteLine me.formatLine
		    writeItem ("P", "RbBF", dataRef.AsHexString())
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessItem(type as Integer, tag as String, valueRef as RBPrjDataRef)
		  dim s, myType as String
		  dim suppressOutput as Boolean
		  
		  if me.optionShowAll or me.kind_accepted.HasKey (RBPrjHelper.Str4ToInt(tag)) then
		    
		    if type = RBPrjItem.TypeInt then
		      // it's a number
		      myType = "N"
		      s = valueRef.AsIntString
		      if me.optionSimplifiedOutput then
		        // suppress "Enco/N: 134217984" entries because they're quite redundant (but not entirely: when they miss in the prj file, RB assumes system encoding, not UTF8!)
		        if RBPrjHelper.Equal (tag, "Enco") and s = "134217984" then
		          suppressOutput = true
		        end
		      end
		    elseif type = RBPrjItem.TypeDbl Then
		      myType = "n"
		      s = valueRef.AsDblString
		    elseif type = RBPrjItem.TypeString then
		      if me.textIsNonPrintable > 0 or not valueRef.IsPrintable() then
		        if false then
		          // text contains control codes -> write base64 encoded
		          myType = "s"
		          s = EncodeBase64 (valueRef.AsText, 0)
		        else
		          // text contains control codes -> write hex encoded
		          myType = "h"
		          s = valueRef.AsHexString
		        end
		      else
		        // it's printable text
		        myType = "S"
		        s = valueRef.AsText
		      end
		    elseif type = RBPrjItem.TypeRect then
		      myType = "R"
		      s = RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+0))+","+RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+4))+","+RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+8))+","+RBPrjHelper.MyStr(valueRef.ptr.Long(valueRef.ofs+12))
		    elseif type = RBPrjItem.TypeEncrypted then
		      // happens when we have an encrypted item
		      myType = "e"
		      s = EncodeBase64 (valueRef.AsText, 0)
		    else
		      // it's something else I don't know yet
		      myType = "?"+RBPrjHelper.IntToStr4(type)
		      s = valueRef.AsHexString
		      me.reportError ("Unknown value type "+RBPrjHelper.IntToStr4(type)+" passed with tag "+tag)
		    end
		    
		    if not suppressOutput then
		      writeItem (myType, tag, s)
		    end
		    
		    if me.groupLevel = 0 and RBPrjHelper.Equal (tag, "Cont") then
		      me.blockContainerID = Val (s)
		    end
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub readFilters(f as FolderItem)
		  dim ts as TextInputStream
		  dim tagn as Integer
		  dim s as String
		  
		  ts = TextInputStream.Open (f)
		  if ts = nil then
		    raiseExc ("open failed", f)
		  end
		  
		  me.kind_accepted = new Dictionary
		  
		  while not ts.EOF
		    s = ts.ReadLine
		    if Left(s, 1) = " " then
		      s = Left (Trim(s)+"   ",4)
		      tagn = RBPrjHelper.Str4ToInt(s) // this allows us to use the Dictionary case-sensitive
		      me.kind_accepted.Value(tagn) = true
		    end
		  wend
		  
		  ts.Close
		  me.optionShowAll = false // let's show only what the filter list allows
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetOutputFile(outFile as FolderItem)
		  // This fileref overrides the one passed in ProcessHeader
		  me.outFileRef = outFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub writeItem(type as String, tag as String, value as String)
		  dim s as String
		  
		  assert (Instr(value, chr(10))=0 and Instr(value, chr(13))=0, "text contains line delimiter -> must be encoded!")
		  
		  if me.optionSimplifiedOutput then
		    // do not include the type as it's sometimes altering and not important for review only uses
		    s = indented () + tag + TypeValueSeparator + value
		  else
		    s = indented () + tag + TagTypeSeparator + type + TypeValueSeparator + value
		  end
		  
		  me.tempLines.Append s
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event BlockComplete(lines() as String, name as String, tag as String, id as Integer, encrypted as Boolean, blockContainerID as Integer, extFileRef as FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FileEnd()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FileStart(f as FolderItem, dataRef as RBPrjDataRef) As Boolean
	#tag EndHook


	#tag Note, Name = About
		// Creates a file with the textual representation of the project.
		// This is useful for looking at a binary prj file's contents
		// There's also a class that can import this format again (RBPrjTextFileReader),
		//   which is used by the RBVExIm tool (http://www.tempel.org/RBProjectTools)
	#tag EndNote

	#tag Note, Name = File Formats
		This class can generate lossless text files from a project,
		similar to prj files in XML, just more compact and user-readable
		
		The rbvx format used to be documented here:
		  <http://rbdocs.com/rbprj/rbvx>
		However, this page is lost now. There is currently no other page with
		that information, sorry.
		So, look in the archives:
		  <http://web.archive.org/web/20060709215649/http://www.rbdocs.com/rbprj/rbvx>
	#tag EndNote


	#tag Property, Flags = &h21
		Private blockContainerID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private blockLines() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private currBlockIsEncrypted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private filter_file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private formatLine As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private groupEntered As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private groupLevel As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private indent As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected inputFileRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private kind_accepted As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private optionOptimizeOutput As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected optionShowAll As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected optionShowGroupIDs As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected optionSimplifiedOutput As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private outFileRef As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private out_stream As TextOutputStream
	#tag EndProperty

	#tag Property, Flags = &h21
		Private tempLines() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private textIsNonPrintable As Integer
	#tag EndProperty


	#tag Constant, Name = CommentPrefix, Type = String, Dynamic = False, Default = \"#", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileFirstLineDelim, Type = String, Dynamic = False, Default = \"#", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileFirstLinePrefix, Type = String, Dynamic = False, Default = \"##RBvx-", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileFirstLineSuffix1, Type = String, Dynamic = False, Default = \"PrjText", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileFormatIDv1, Type = String, Dynamic = False, Default = \"##Format:1#", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileFormatIDv2, Type = String, Dynamic = False, Default = \"##Format:2#", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileHdrOrigName, Type = String, Dynamic = False, Default = \"##OrigFileName:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileHdrOrigRelPath, Type = String, Dynamic = False, Default = \"##OrigRelPath:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileHdrVaultEnd, Type = String, Dynamic = False, Default = \"##VaultHdrEnd#", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileLastLine, Type = String, Dynamic = False, Default = \"##RBvx-End#", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FileVersion, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = GroupItemDelimiter, Type = String, Dynamic = False, Default = \"\x2C ", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SourceGroupClosure, Type = String, Dynamic = False, Default = \")", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TagTypeSeparator, Type = String, Dynamic = False, Default = \"/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeValueSeparator, Type = String, Dynamic = False, Default = \": ", Scope = Public
	#tag EndConstant


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
End Class
#tag EndClass
