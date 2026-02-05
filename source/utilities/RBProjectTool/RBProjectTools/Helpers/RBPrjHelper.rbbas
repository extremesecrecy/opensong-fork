#tag Module
Protected Module RBPrjHelper
	#tag Method, Flags = &h1
		Protected Function AddedBeforeExtension(f as FolderItem, addTxt as String) As FolderItem
		  dim dotOfs, nameLen, extensionLen as Integer
		  dim name as String
		  
		  // locate the extension
		  dotOfs = lastInStr (f.Name, ".")
		  if dotOfs = 0 then
		    nameLen = Len (f.Name)
		    extensionLen = 0
		  else
		    nameLen = dotOfs-1
		    extensionLen = Len (f.Name) - dotOfs + 1
		  end
		  
		  name = Left(f.Name, nameLen) + addTxt + Right (f.Name, extensionLen)
		  
		  return f.Parent.TrueChild(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AddedBeforeExtension(origName as String, addTxt as String) As String
		  dim dotOfs, nameLen, extensionLen as Integer
		  
		  // locate the extension
		  dotOfs = lastInStr (origName, ".")
		  if dotOfs = 0 then
		    nameLen = Len (origName)
		    extensionLen = 0
		  else
		    nameLen = dotOfs-1
		    extensionLen = Len (origName) - dotOfs + 1
		  end
		  
		  return Left(origName, nameLen) + addTxt + Right (origName, extensionLen)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AreDataForksIdentical(f1 as FolderItem, f2 as FolderItem) As Boolean
		  dim bs1, bs2 as BinaryStream
		  dim chunkSize, remaining as Integer
		  dim areIdentical as Boolean
		  
		  if f1 = nil or f2 = nil or not f1.Exists or not f2.Exists then
		    if f1 = nil then f1 = f2
		    RaiseExc ("Can't compare nonexisting files", "AreDataForksIdentical", f1)
		  end
		  
		  remaining = f1.Length
		  if remaining <> f2.Length then
		    return false
		  end
		  
		  bs1 = BinaryStream.Open (f1, false)
		  bs2 = BinaryStream.Open (f2, false)
		  Assert (bs1 <> nil, "Open failed", "AreDataForksIdentical", f1)
		  Assert (bs2 <> nil, "Open failed", "AreDataForksIdentical", f2)
		  
		  chunkSize = &H10000 // 64KB
		  areIdentical = true
		  while remaining > 0
		    if StrComp (bs1.Read (chunkSize, nil), bs2.Read (chunkSize, nil), 0) <> 0 then
		      areIdentical = false
		      exit
		    end
		  wend
		  
		  bs2.Close
		  bs1.Close
		  
		  return areIdentical
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Assert(condition as Boolean, msg as String, where as String, f as FolderItem = nil)
		  if not condition then
		    RaiseExc (msg, where, f)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DeleteFile(f as FolderItem, moveToTrash as Boolean = false)
		  // This works around a very odd problem in RB where it _sometimes_ fails to delete a file
		  // (this may have happened only because files were not closed properly, and those cases
		  // should be all fixed now)
		  //
		  // Another task of this function is to move the file to a place where it can be recovered from
		  // in case something went wrong with writing the new file.
		  // Hence, the to-be-deleted file is moved to the Trash
		  
		  dim f2 as FolderItem
		  if f.Exists then
		    if moveToTrash then
		      f2 = new FolderItem (f)
		      f2.MoveFileTo SpecialFolder.Trash
		    end
		    f.Delete
		    if f.Exists then
		      // this is a work-around for a unidentified bug (on OSX) that prevents a file sometimes from getting deleted
		      'f2 = Getfolderitem (f.AbsolutePath) // does not help, either
		      'f2.Delete
		      System.DebugLog "RBPrjHelper.DeleteFile -- Error: normal delete method failed!"
		      #if TargetMacOS
		        dim sh as new Shell
		        sh.Execute ("rm "+f.ShellPath) // this appears to work, though
		      #endif
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DisplayPath(f as FolderItem) As String
		  if RBPrjHelper.RunningOnMacOSX then
		    return f.ShellPath
		  else
		    return f.AbsolutePath
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Encoding(code as Integer) As TextEncoding
		  dim enc as TextEncoding
		  if code = 0 then
		    enc = Encodings.UTF8 // +++ or does RB use SystemDefault? Check on Windows!
		  else
		    dim base, format, variant as Integer
		    base = Bitwise.BitAnd(code,&HFFFF)
		    variant = Bitwise.BitAnd(Bitwise.ShiftRight(code,16,32),&H3FF)
		    format = Bitwise.BitAnd(Bitwise.ShiftRight(code,26,32),&H3F)
		    enc = GetTextEncoding(base, variant, format)
		    if enc.code <> code then
		      // oops - we seem to have deciphered the code incorrectly
		      break
		    end
		  end
		  return enc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EndsIn(s as String, ending as String) As Boolean
		  return Right (s, Len (ending)) = ending
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Equal(s1 as Integer, s2 as String) As Boolean
		  return s1 = str4ToInt (s2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Equal(s1 as String, s2 as String) As Boolean
		  return StrComp (s1, s2, 0) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Hex8(i as Integer) As String
		  // 8-digit hex string
		  return Right("0000000"+Hex(i),8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HexToStr(hexStr as String) As String
		  dim i, n as Integer
		  dim result as String
		  dim mb as MemoryBlock
		  
		  n = LenB(hexStr) \ 2
		  mb = New MemoryBlock (n)
		  for i = 0 to n-1
		    mb.Byte(i) = Val("&H"+MidB(hexStr,i*2+1,2))
		  next
		  result = mb.StringValue (0, mb.Size)
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IntToStr4(i as Integer) As String
		  dim mb as MemoryBlock
		  mb = New MemoryBlock(4)
		  mb.LittleEndian = false
		  mb.Long(0) = i
		  return mb.StringValue(0,4)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsOneOf(target as String, choices() as String) As Boolean
		  for each item as String in choices
		    if StrComp (target, item, 0) = 0 then
		      return true
		    end if
		  next
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function lastInStr(source as String, find as String) As Integer
		  dim newIdx, prevIdx as Integer
		  do
		    prevIdx = newIdx
		    newIdx = InStr(prevIdx+1, source, find)
		  loop until newIdx = 0
		  return prevIdx
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LocateExternalFile(refDir as FolderItem, extItemRefTags() as String, extItemRefValues() as String, ByRef existingRefOut as FolderItem, ByRef primaryRefOut as FolderItem)
		  dim tag as String
		  dim mode, i as Integer
		  dim f as FolderItem
		  
		  for mode = 1 to 3
		    for i = 0 to Ubound (extItemRefTags)
		      tag = extItemRefTags(i)
		      if mode = 1 and tag = "ppth" or mode = 2 and tag = "path" or mode = 3 and tag = "alis" then
		        // "ppth" first (relative), then "path" (absolute), finally "alis" (both)
		        f = locateExternalFile (refDir, extItemRefValues(i), tag)
		        if f <> nil then
		          if f.Exists then
		            if not f.Directory then
		              exit // found it
		            end
		          elseif primaryRefOut = nil then
		            // the item does not exist, but remember its path in case we only want to return a list of the external item locations
		            primaryRefOut = f
		          end
		        end
		        f = nil
		      end
		    next
		    if f <> nil then
		      exit // found it
		    end
		  next
		  
		  existingRefOut = f
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function locateExternalFile(refDir as FolderItem, path as String, tag as String) As FolderItem
		  dim f as FolderItem
		  dim i as Integer
		  
		  if RBPrjHelper.Equal (tag, "alis") then
		    // Alias record (Mac OS only)
		    f = refDir.GetRelative (path)
		  elseif RBPrjHelper.Equal (tag, "ppth") then
		    // relative shell path as text, with path separators always "\", even on Mac OS
		    f = refDir
		    for i = 1 to CountFields (path, "\")
		      if f <> nil and f.Exists then
		        f = f.Child (NthField (path, "\", i))
		      end
		    next
		  else
		    // absolute path as text
		    try
		      f = GetFolderItem (path, FolderItem.PathTypeAbsolute)
		    exception exc2 as UnsupportedFormatException
		      f = nil
		    end
		  end
		  
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MakeVaultDirName(fName as String, isExternalItem as Boolean) As String
		  dim prjName as String
		  if isExternalItem then
		    prjName = "Externals"
		  else
		    prjName = fName
		    if Right(prjName,3) = ".rb" then
		      prjName = Left (prjName, Len(prjName)-3)
		    elseif Right(prjName,4) = ".rbp" or Right(prjName,4) = ".xml" then
		      prjName = Left (prjName, Len(prjName)-4)
		    end
		  end
		  return prjName + VaultDirSfx
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MakeVaultFileName(name as String, tag as String, id as Integer, isExternal as Boolean, extFileRef as FolderItem) As String
		  // Output format: 4 chars for tag, "_", 8 chars for id as hex number, "_", name, suffix
		  
		  dim outStr as String
		  
		  Assert (LenB (tag) = 4, "illegal 'tag' value", "MakeVaultFileName")
		  
		  if isExternal then
		    outStr = extFileRef.Name
		  else
		    outStr = tag + VaultFileNameDivider + RBPrjHelper.Hex8 (id) + VaultFileNameDivider + name // always add the 2nd "_" here, even if name=""!
		  end
		  
		  return outStr + TextFileSuffix
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MyStr(i as Integer) As String
		  return Format (i, "-#")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RaiseExc(msg as String, where as String, f as FolderItem = nil)
		  raise new RBPrjException (msg, where, f)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReadLinesFromTextFile(f as FolderItem, ByRef linesOut() as String, amountIn as Integer = 0)
		  // Reads a text file and removes optional UTF8-BOM sequence at its beginning
		  // if 'amountIn' <> 0, it'll only read as many lines (i.e. -1 will read no lines, just test to open the file)
		  
		  dim tis as TextInputStream
		  dim delim, allTxt, partTxt, noLines() as String
		  dim i as Integer
		  
		  linesOut = noLines // preset
		  
		  tis = TextInputStream.Open (f)
		  if tis = nil then
		    RaiseExc ("open failed", "", f)
		  end
		  tis.Encoding = Encodings.UTF8
		  
		  if amountIn <> 0 then
		    // read only a few lines
		    for i = 1 to amountIn
		      linesOut.Append tis.ReadLine
		      if tis.EOF then
		        exit
		      end
		    next
		  else
		    // read all at once
		    allTxt = tis.ReadAll
		    
		    // determine the line delimiters used in this file
		    partTxt = LeftB (allTxt, 256) // let's only check the first 256 chars - the first line should not be that long ever
		    if InStrB (partTxt, chr(13)+chr(10)) > 0 then
		      delim = chr(13)+chr(10)
		    elseif InStrB (partTxt, chr(13)) > 0 then
		      delim = chr(13)
		    else
		      delim = chr(10)
		    end
		    
		    linesOut = allTxt.Split (delim)
		  end
		  
		  if tis.LastErrorCode <> 0 then
		    tis.Close
		    RaiseExc ("read failed", "", f)
		  end
		  tis.Close
		  
		  // remove the optional UTF-8 BOM header from the first line
		  if Ubound (linesOut) >= 0 then
		    if LeftB (linesOut(0), 3) = RBPrjHelper.UTF8BOM then
		      linesOut(0) = MidB (linesOut(0), 4).DefineEncoding (Encodings.UTF8)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RunningOnMacOSX() As Boolean
		  #if TargetMacOS
		    dim n as Integer
		    if sysv_val = 0 then
		      if System.Gestalt("sysv", n) then
		        sysv_val = n
		      end
		    end
		  #endif
		  return sysv_val >= &H1000
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SplitVaultFileName(vaultFilename as String, ByRef name as String, ByRef tag as String, ByRef id as Integer) As Boolean
		  // Format: 4 chars for tag, "_", 8 chars for id as hex number, "_", name, suffix
		  
		  if CountFields (vaultFileName, VaultFileNameDivider) <> 3 then
		    return false
		  end
		  
		  tag = NthField (vaultFilename, VaultFileNameDivider, 1)
		  id = Val ("&H"+NthField (vaultFilename, VaultFileNameDivider, 2))
		  name = NthField (vaultFilename, VaultFileNameDivider, 3)
		  
		  dim n as Integer
		  n = Len(TextFileSuffix)
		  if Right (name, n) <> TextFileSuffix then
		    return false
		  end
		  name = Left (name, Len(name) - n)
		  
		  return LenB(tag) = 4
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Str4ToInt(s as String) As Integer
		  dim mb as MemoryBlock
		  if LenB(s) <> 4 then
		    RaiseExc ("str4 values must be 4 chars long", "RBPrjHelper")
		  end
		  mb = New MemoryBlock(4)
		  mb.LittleEndian = false
		  mb.StringValue(0,4) = s
		  return mb.Long(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StrToHex(str as String, mayAbbreviate as Boolean = false) As String
		  dim i, n as Integer
		  dim result, s as String
		  const maxChars = 512
		  dim mb as MemoryBlock
		  
		  n = LenB(str)
		  if mayAbbreviate and n > maxChars\2 then
		    n = maxChars\2 // each byte uses two chars as a hex text
		    s = "..."
		  end
		  // create the hex string in a preallocated buffer because this is much faster than string concatenation once there are a few 100 characters:
		  mb = New MemoryBlock (n * 2)
		  for i = 1 to n
		    mb.StringValue ((i-1)*2, 2) = Right("0"+Hex(AscB(MidB(str, i, 1))), 2)
		  next
		  result = mb.StringValue (0, mb.Size) + s
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UTF8BOM() As String
		  return ChrB(&HEF)+ChrB(&HBB)+ChrB(&HBF)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteTextFileFromLines(f as FolderItem, ByRef lines() as String, lineDelimiters as String = "")
		  // Writes the lines to a text file and inserts a UTF8-BOM identifier at its beginning when it's not already there
		  
		  dim tos as TextOutputStream
		  
		  if Ubound (lines) >= 0 then
		    if LeftB (lines(0), 3) <> RBPrjHelper.UTF8BOM then
		      lines(0) = RBPrjHelper.UTF8BOM + lines(0)
		    end
		  end
		  
		  if lineDelimiters = "" then
		    lineDelimiters = EndOfLine
		  end
		  
		  RBPrjHelper.DeleteFile f
		  
		  tos = TextOutputStream.Create (f)
		  if tos = nil then
		    RaiseExc ("Can not create file", "", f)
		  end
		  tos.Write Join (lines, lineDelimiters)
		  tos.Close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private sysv_val As Integer
	#tag EndProperty


	#tag Constant, Name = OtherFileSuffix, Type = String, Dynamic = False, Default = \".rbvf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PrjMainContents, Type = String, Dynamic = False, Default = \"Contents", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ProjectStateFileName, Type = String, Dynamic = False, Default = \"ProjectState.localonly", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PropertyLists, Type = String, Dynamic = False, Default = \"Application:\rCanvas:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\x2CUseFocusRing\x2CBackdrop\x2CAcceptFocus\x2CAcceptTabs\x2CEraseBackground\rCheckBox:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CCaption\x2CEnabled\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\x2CValue\x2CDataSource\x2CDataField\rComboBox:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CEnabled\x2CInitialValue\x2CListIndex\x2CUseFocusRing\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\x2CDataSource\x2CDataField\x2CAutoComplete\rContainerControl:Name\x2CSuper\x2CControlOrder\x2CInitialParent\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CVisible\x2CEnabled\x2CAutoDeactivate\x2CHelpTag\x2CUseFocusRing\x2CAcceptFocus\x2CAcceptTabs\x2CEraseBackground\rContextualMenu:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CUseMacCMM\rDatabaseQuery:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CSQLQuery\x2CDatabase\rDataControl:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CCaption\x2CTextAlign\x2CTextColor\x2CEnabled\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\x2CDatabase\x2CTableName\x2CSQLQuery\x2CReadOnly\x2CCommit\rEditField:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CBorder\x2CMultiline\x2CScrollbarHorizontal\x2CScrollbarVertical\x2CStyled\x2CPassword\x2CUseFocusRing\x2CTextColor\x2CBackColor\x2CEnabled\x2CFormat\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\x2CText\x2CMask\x2CReadOnly\x2CLimitText\x2CAcceptTabs\x2CAlignment\x2CDataSource\x2CDataField\rGroupBox:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CCaption\x2CEnabled\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\rLine:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CTop\x2CLeft\x2CWidth\x2CHeight\x2CX1\x2CX2\x2CY1\x2CY2\x2CTabPanelIndex\x2CVisible\x2CBorderWidth\x2CLineColor\rListbox:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\x2CColumnCount\x2CColumnWidths\x2CHasHeading\x2CUseFocusRing\x2CInitialValue\x2CHeadingIndex\x2CScrollbarHorizontal\x2CScrollBarVertical\x2CGridLinesHorizontal\x2CGridLinesVertical\x2CDefaultRowHeight\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\x2CHierarchical\x2CEnableDrag\x2CEnableDragReorder\x2CRequiresSelection\x2CSelectionType\x2CColumnsResizable\x2CDataSource\x2CDataField\rMoviePlayer:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CAutoResize\x2CBorder\x2CSpeaker\x2CHasStep\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CMovie\x2CPlayerType\x2CController\x2CAutoPlay\x2CLooping\x2CPalindrome\rNotePlayer:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CInstrument\rOLEContainer:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CProgramID\x2CLicenseKey\rOval:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\x2CFillColor\x2CBorderWidth\x2CBorderColor\rPagePanel:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CPanelCount\x2CPanels\x2CValue\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\rPopupMenu:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CEnabled\x2CInitialValue\x2CListIndex\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\x2CDataSource\x2CDataField\rProgressBar:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\x2CValue\x2CMaximum\rPushButton:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CCaption\x2CDefault\x2CCancel\x2CEnabled\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\rRadioButton:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CCaption\x2CEnabled\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\x2CValue\rRectangle:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\x2CFillColor\x2CBorderWidth\x2CTopLeftColor\x2CBottomRightColor\rRectControl:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CInitialParent\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\rRoundRectangle:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\x2CFillColor\x2CBorderWidth\x2CBorderColor\x2COvalWidth\x2COvalHeight\rScrollbar:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CEnabled\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CMinimum\x2CValue\x2CMaximum\x2CLineStep\x2CPageStep\x2CLiveScroll\x2CAcceptFocus\rSerial:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CBaud\x2CBits\x2CParity\x2CStop\x2CXON\x2CCTS\x2CDTR\rServerSocket:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CPort\x2CMinimumSocketsAvailable\x2CMaximumSocketsConnected\rSlider:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CEnabled\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CMinimum\x2CValue\x2CMaximum\x2CLineStep\x2CPageStep\x2CLiveScroll\rStaticText:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CText\x2CTextAlign\x2CTextColor\x2CMultiline\x2CEnabled\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\x2CDataSource\x2CDataField\rTabPanel:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CWidth\x2CHeight\x2CLockLeft\x2CLockTop\x2CLockRight\x2CLockBottom\x2CTabPanelIndex\x2CFacing\x2CTabDefinition\x2CPanels\x2CSmallTabs\x2CValue\x2CVisible\x2CHelpTag\x2CAutoDeactivate\x2CEnabled\x2CTextFont\x2CTextSize\x2CBold\x2CItalic\x2CUnderline\rTCPSocket:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CAddress\x2CPort\rThread:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CPriority\x2CStackSize\rTimer:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CMode\x2CPeriod\rUDPSocket:Name\x2CIndex\x2CSuper\x2CControlOrder\x2CLeft\x2CTop\x2CRouterHops\x2CSendToSelf\x2CPort\rWindow:Name\x2CInterfaces\x2CSuper\x2CPlacement\x2CWidth\x2CHeight\x2CMinWidth\x2CMinHeight\x2CMaxWidth\x2CMaxHeight\x2CFrame\x2CComposite\x2CHasBackColor\x2CBackColor\x2CBackdrop\x2CTitle\x2CVisible\x2CFullScreen\x2CMenuBarVisible\x2CCloseButton\x2CResizeable\x2CLiveResize\x2CMaximizeButton\x2CMinimizeButton\x2CBalloonHelp\x2CMacProcID\x2CMenuBar", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TextFileSuffix, Type = String, Dynamic = False, Default = \".rbvx", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VaultDirSfx, Type = String, Dynamic = False, Default = \".rbvault", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VaultFileNameDivider, Type = String, Dynamic = False, Default = \"_", Scope = Protected
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
End Module
#tag EndModule
