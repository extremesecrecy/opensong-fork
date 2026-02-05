#tag Module
Protected Module BibleFactory
	#tag Method, Flags = &h1
		Protected Sub AddSearchFolder(searchFolder As FolderItem)
		  If searchFolder = Nil Then Return
		  If searchFolder = ScriptureFolder Or mSearchFolders.IndexOf(searchFolder) > -1 Then Return
		  If IsValidBibleFolder(searchFolder) Then
		    mSearchFolders.Append searchFolder
		    BuildKnownBibles
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BibleList() As String()
		  //++
		  // This is a readonly property; do not implement the Set method
		  //
		  // Return a list of scripture files found in the current folder
		  //--
		  If knownBibleNames.Ubound > -1 Then
		    Return knownBibleNames
		  End If
		  
		  BuildKnownBibles
		  Return knownBibleNames
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildKnownBibles()
		  //++
		  // Remove all the existing Bibles since they belong to the old folder.
		  //--
		  Redim openedBibles(-1)
		  Redim knownBibleNames(-1)
		  If knownBibleFiles Is Nil Then
		    knownBibleFiles = New Dictionary
		  Else
		    knownBibleFiles.Clear
		  End If
		  
		  // ToDo: this list realy should get constructed by asking registered Bible provider classes, which bibles they offer
		  Dim BibleName As String
		  Dim i As Integer
		  Dim j As Integer
		  Dim max As Integer
		  Dim f As FolderItem
		  Dim xDoc As XmlDocument
		  Dim useFileName As Boolean
		  Dim thisFolder As FolderItem
		  If mSearchFolders.Ubound < 0 Then Return
		  
		  useFileName = App.MainPreferences.GetValueB(Prefs.kBibleIdentifier, False, True)
		  
		  For j = 0 To mSearchFolders.Ubound
		    thisFolder = mSearchFolders(j)
		    max = thisFolder.Count
		    For i = 1 To max
		      f = thisFolder.Item(i)
		      If f = Nil Then Continue
		      If f.IsFileVisible And (Not f.Directory) Then
		        If useFileName Then
		          BibleName = f.NameWithoutExtension
		        Else
		          BibleName = DetermineBibleName(f)
		        End If
		        If BibleName <> "" And Not knownBibleFiles.HasKey(BibleName) Then
		          knownBibleNames.Append(BibleName)
		          knownBibleFiles.Value(BibleName) = f
		        End If
		      End If
		    Next
		  Next
		  
		  Heapsort knownBibleNames
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DetermineBibleName(f As Folderitem) As String
		  Dim BibleName As String
		  Dim xDoc As XmlDocument
		  
		  Try
		    xDoc = New XmlDocument()
		    xdoc.LoadXml(f)
		    If xDoc.DocumentElement <> Nil Then
		      Select Case xDoc.DocumentElement.Name
		      Case "bible"
		        BibleName = xDoc.FirstChild.GetAttribute("sn")
		        If BibleName = "" Then
		          BibleName = f.NameWithoutExtension
		        End If
		      Case "XMLBIBLE"
		        BibleName = f.NameWithoutExtension
		        If BibleName.InStr("_") > 0 Then
		          BibleName = SmartML.GetValue(xDoc.DocumentElement, "INFORMATION/identifier", False, BibleName)
		        End If
		      End Select
		    End If
		  Catch
		    // not a bible, skip
		  End Try
		  Return BibleName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBible(name As String) As iBible
		  //++
		  // This is the "factory" for the object.
		  // Today there is only one type of Bible object, but that will change shortly.
		  //--
		  
		  Dim i As Integer
		  Dim b As iBible
		  Dim names() As String
		  Dim nameFound As Boolean
		  
		  'Sanity check
		  If name = "" Then Return Nil
		  
		  // Does the name correspond to one of the names we see?
		  
		  names = BibleList
		  nameFound = False
		  For i = 0 To UBound(names)
		    If names(i) = name Then
		      nameFound = True
		      exit for
		    End If
		  Next
		  
		  If Not nameFound Then
		    Return Nil
		  End If
		  
		  // Check to see if it is loaded already.
		  
		  For Each b in openedBibles
		    If b.Name = name Then Return b
		  Next
		  
		  If Not knownBibleFiles.HasKey(name) Then Return Nil
		  b = New Bible
		  If Not b.LoadBible(knownBibleFiles.Value(name)) Then
		    Return Nil
		  End If
		  
		  openedBibles.Append b
		  
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValidBibleFolder(searchFolder As FolderItem) As Boolean
		  If searchFolder = Nil Then Return False
		  If searchFolder.Exists And searchFolder.IsFileVisible And _
		    searchFolder.Directory And searchFolder.IsReadable Then
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseCitation(cite As String) As String()
		  //
		  // Parse a citation in standard form (Book, Chapter, start & end verses)
		  // "book chap:from-to"
		  // Book and chapter required, verses optional
		  // Returns the individual elements as an array (book, chapter [, verse, verseAix [, verse2, verse2Aix]])
		  // Although the regex handles an optional bible version field, that is not used
		  // here (it's used by ScripturePickerController).
		  //
		  // If the book has a book number (e.g. 2dn Kings) the number must be given in arabic digits and may be seperated from the book name by whitespace and/or a single dot.
		  // The separator between chapter and verse may be whitespace or one of ':', ';', ',', '.' surrounded by whitespace and may be replaced with whitespace
		  // In order to specify a verse range the chapter must not be specified for the through-verse.
		  //   A dash of various kind (minus, hyphen, M-dash, N-dash, ...), optionally surrounded by whitespace must separate the verse specifcations
		  // If the verse secification denotes a part of a verse, a letter needs to get attached to the digit(s) without any separation (e.g. 4a)
		  //
		  Const kVerseRegEx = "[-:]?(\d+)(\w*)"
		  
		  Dim regexCite As New RegEx
		  Dim regexVerse As New RegEx
		  Dim citeMatch As RegExMatch
		  Dim verseMatch As RegExMatch
		  
		  Dim result() As String
		  Dim verses() As String
		  Dim bibleException As New BibleRefException
		  Dim subExpUbound As Integer
		  
		  //++
		  // The parsing regex was changed to work around an apparent bug in the regex library
		  // that incorrectly excludes extended Latin-1 characters from the [[:alpha:]] and [[:alnum:]] classes
		  // To allow the old regex to be used if it breaks other languages than Turkish (where the error
		  // was first seen), allow a key to be added to the preferences to return to the old behavior.
		  //--
		  regexCite.SearchPattern = kLookupRefRegEx
		  
		  Try
		    citeMatch = regexCite.Search(cite)
		  Catch e
		    bibleException.Message = App.T.Translate("scripture_lookup/bad_reference/format")
		    Raise bibleException
		  End Try
		  If Not (citeMatch Is Nil) Then
		    For i As Integer = 0 To citeMatch.SubExpressionCount - 1
		      App.DebugWriter.Write("citematch " + CStr(i) + " = " + citeMatch.SubExpressionString(i))
		    Next
		    If cite.LeftB(citeMatch.SubExpressionStartB(citeMatch.SubExpressionCount-1)).RTrim.Right(1) = "(" Then
		      // the last subexpression is a version
		      subExpUbound = citeMatch.SubExpressionCount - 2
		    Else
		      subExpUbound = citeMatch.SubExpressionCount - 1
		    End If
		    While subExpUbound > 2 And citeMatch.SubExpressionString(subExpUbound) = ""
		      subExpUbound = subExpUbound - 1
		    Wend
		  End If
		  
		  If subExpUbound < 2 Then
		    bibleException.Message = App.T.Translate("scripture_lookup/bad_reference/format")
		    Raise bibleException
		  End If
		  
		  result.Append DeleteWhiteSpace(citeMatch.SubExpressionString(1)) // Book
		  result.Append citeMatch.SubExpressionString(2) // Chapter
		  //
		  // Book and chapter are done.  Examine remaining for valid form and verses
		  //
		  If subExpUbound = 2 Then Return result
		  
		  regexVerse.SearchPattern = kVerseRegEx
		  ReDim verses(subExpUbound)
		  For i As Integer = 3 To Min(4, subExpUbound)
		    verses(i) = citeMatch.SubExpressionString(i)
		    Try
		      verseMatch = regexVerse.Search(verses(i))
		    Catch e
		      App.DebugWriter.Write "ParseCitation caught a " + RuntimeException(e).ToString, 1
		      RaiseVerseError(verses(i))
		    End Try
		    If verseMatch Is Nil Then RaiseVerseError(verses(i))
		    
		    For j As Integer = 1 To verseMatch.SubExpressionCount - 1
		      result.Append verseMatch.SubExpressionString(j)
		    Next
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RaiseVerseError(ref As String)
		  Dim e As New BibleRefException
		  Dim message As String
		  
		  If App.T Is Nil Then
		    message = "Cannot determine verse from '" + ref + "'"
		  Else
		    message = App.T.Translate("scripture_lookup/bad_reference/verse", ref)
		  End If
		  
		  e.Message = message
		  Raise e
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveSearchFolder(f As FolderItem)
		  If mSearchFolders.Ubound < 1 Then Return
		  Dim i As Integer
		  For i = mSearchFolders.Ubound DownTo 1
		    If mSearchFolders(i) = f Then
		      mSearchFolders.Remove(i)
		      Return
		    ElseIf mSearchFolders(i) = Nil Then
		      mSearchFolders.Remove(i)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SearchFolders() As FolderItem()
		  Return mSearchFolders
		End Function
	#tag EndMethod


	#tag Note, Name = Overview
		BibleFactory is a class to create Bible objects.  The original design of Bible had quite a bit of conditional code
		to support the three formats supported in V1.0.  BibleFactory helps move past that code and simplifies the overall logic.
		
		BibleFactory will return an object that conforms to the iBible interface.  For the initial release, it's really just putting
		a wrapper around the existing Bible object.  Eventually this will break out to other Bible objects.
	#tag EndNote


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return ScriptureFolder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <> Nil Then
			    If IsValidBibleFolder(value) Then
			      ScriptureFolder = value
			      If mSearchFolders.Ubound = -1 Then
			        mSearchFolders.Append value
			      Else
			        mSearchFolders(0) = value
			      End If
			      BuildKnownBibles
			    End If
			  End If
			End Set
		#tag EndSetter
		Protected Folder As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  BuildKnownBibles
			  If knownBibleNames.Ubound > -1 Then
			    Return True
			  End If
			  
			  Return BibleList.Ubound > -1
			End Get
		#tag EndGetter
		HasBible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Note
			This is named as if it was a constant because it actually was, but RB/Xojo does not allow conditional compilation for global constants
		#tag EndNote
		#tag Getter
			Get
			  Dim pattern As String
			  
			  pattern = "^\s*((?:\d+\.?\s*)?\p{L}{2,})[\.\s]\s*(\d+)\s*(?:[\s:;,.]\s*(\d+\w*)\s*(?:\p{Pd}\s*(\d+\w*)\s*)?)?(?:\(\s*(\p{L}[\p{L}\p{N}./-]+)\s*\)\s*)?$"
			  #if RBVersion < 2013.41
			    pattern = pattern. _
			    ReplaceAll("[\p{L}\p{N}./-]", "[[:^punct:][:^space:]./-]"). _
			    ReplaceAll("\p{L}", "[^[:punct:][:space:][:digit:]]"). _
			    ReplaceAll("\p{Pd}", "[" + &u2010 + &u2011 + &u2012 + &u2013 + &u2014 + &u2015 + "-]")
			  #endif
			  
			  Return pattern
			End Get
		#tag EndGetter
		Protected kLookupRefRegEx As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private knownBibleFiles As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private knownBibleNames() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSearchFolders(0) As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected openedBibles() As iBible
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ScriptureFolder As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBible"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
