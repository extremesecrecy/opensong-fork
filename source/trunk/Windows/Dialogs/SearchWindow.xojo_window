#tag Window
Begin Window SearchWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   480
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   1046
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   0
   Resizeable      =   True
   Title           =   "Search"
   Visible         =   False
   Width           =   534
   Begin SEditField edt_search
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   22
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   29
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   505
   End
   Begin SVRadioGroupBox grp_search_match
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Match:"
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   78
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   97
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   176
      Begin RadioButton rad_match_exact
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Exact word"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_match"
         Italic          =   False
         Left            =   23
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   112
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   140
      End
      Begin RadioButton rad_match_begin
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Begins with"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_match"
         Italic          =   False
         Left            =   23
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   136
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   140
      End
   End
   Begin SVRadioGroupBox grp_search_words
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Verse must have:"
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   78
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   200
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   97
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   176
      Begin RadioButton rad_words_any
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Any word"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_words"
         Italic          =   False
         Left            =   216
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   112
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   105
      End
      Begin RadioButton rad_words_all
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "All words"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_search_words"
         Italic          =   False
         Left            =   216
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   136
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   105
      End
   End
   Begin PushButton btn_search_search
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Search"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   434
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   153
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin ListBox lst_result
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   "100, 350%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   0
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   224
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   213
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   506
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton btn_search_ok
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Ok"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   338
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   449
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin PushButton btn_search_cancel
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   434
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   449
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin Label lbl_search_example
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   34
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "To search for an exact phrase enclose it in double quotes, \r\nlike ""Simon Peter"""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   54
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   507
   End
   Begin Label lbl_search_caption
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Search in bible using keyword:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   6
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   285
   End
   Begin Label lbl_search_result
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "%1 matches were found using the specified keyword(s)."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   188
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   505
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  App.CenterInControlScreen Self
		  '++JRC
		  App.T.TranslateWindow Me, "scripture_search", App.TranslationFonts
		  '--
		  rad_match_exact.Value = True
		  rad_words_all.Value = True
		  
		  lbl_search_result.Caption = ""
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  HS.Resize
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function combineResults(main() as SearchResult, add() as String) As SearchResult()
		  'method takes two sorted lists and combines them
		  Dim returnVal(), temp as SearchResult
		  Dim x,y, comp as Integer
		  
		  
		  'since both lists are sorted all you have to do is combine them
		  while x<= UBound(main) AND y<= UBound(add)
		    
		    temp= new SearchResult(add(y))
		    
		    comp= main(x).compareTo(temp)
		    
		    if comp=0 then
		      main(x).value= main(x).value+temp.value
		      
		      returnVal.Append(main(x))
		      
		      x=x+1
		      y=y+1
		    elseif comp<0 then
		      if rad_words_any.Value then
		        returnVal.Append(main(x))
		      end if
		      
		      x=x+1
		    else
		      if rad_words_any.Value then
		        returnVal.Append(temp)
		      end if
		      
		      y=y+1
		    end if
		    
		  wend
		  
		  if rad_words_any.Value then
		    while x<=UBound(main)
		      returnVal.Append(main(x))
		      x=x+1
		    wend
		    
		    while y<= UBound(add)
		      
		      temp= new SearchResult(add(y))
		      
		      returnVal.Append(temp)
		      y=y+1
		    wend
		  end if
		  
		  return returnVal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  HS = New HalfSizer(Self)
		  // call the Window constructor, or Open events will not fire
		  Super.Window()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoSearch(controller As ScripturePickerController)
		  controllerObject = controller
		  bibleToSearch = controller.CurrentBible
		  //If edt_search.Text <> "" Then search // This updates everything to account for possible changes elsewhere
		  Self.Visible = True
		  ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function mergeSort(list() as SearchResult, leftIndex as Integer, rightIndex as Integer) As SearchResult()
		  Dim left(), right(), returnVal() as SearchResult
		  Dim mid, x, y as Integer
		  
		  'break list into smaller parts
		  if rightIndex-leftIndex =0 then
		    returnVal.Append(list(leftIndex))
		    return returnVal
		  elseif rightIndex<leftIndex then
		    return returnVal
		  end if
		  
		  mid= leftIndex+ (rightIndex-leftIndex)/2
		  
		  'sort smaller lists
		  left= mergeSort(list, leftIndex, mid)
		  right= mergeSort(list, mid+1, rightIndex)
		  
		  'combine lists back together
		  while x<= UBound(left) AND y<= UBound(right)
		    
		    if left(x).value= right(y).value then
		      
		      returnVal.Append(left(x))
		      
		      x=x+1
		    elseif left(x).value > right(y).value then
		      
		      returnVal.Append(left(x))
		      
		      x=x+1
		    else
		      returnVal.Append(right(y))
		      
		      y=y+1
		    end if
		    
		  wend
		  
		  while x<=UBound(left)
		    returnVal.Append(left(x))
		    x=x+1
		  wend
		  
		  while y<= UBound(right)
		    returnVal.Append(right(y))
		    y=y+1
		  wend
		  
		  
		  return returnVal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub search()
		  Dim words(), results(), verse(),  phrase, searchString as String
		  Dim x, y as Integer
		  Dim  temp As SearchResult
		  Dim reg as RegEx
		  Dim found as Boolean
		  
		  'used to tell the difference between list being empty b/c we haven't searched for any words yet and we have searched for words, but haven't found any matches
		  found=false
		  Self.MouseCursor = System.Cursors.Wait
		  lbl_search_result.Caption = ""
		  'get user input
		  searchString= edt_search.Text
		  
		  'remove old search results
		  lst_result.DeleteAllRows
		  Redim resultList(-1)
		  
		  // used to remove puncuation
		  // should be the same as used in the bible indexer (Bible.genIndex)
		  reg = New RegEx
		  #if RBVersion < 2013.041
		    reg.SearchPattern = "\s*[[:punct:]»›‹«„“”‚‘’·…–—" + &u00A0 + "]+\s*" ' Non-word, non-space
		  #else
		    reg.SearchPattern = "\s*[\p{P}\p{S}\p{C}\p{Z}]+\s*" ' Non-word, non-space
		  #endif
		  reg.ReplacementPattern = " "
		  reg.Options.ReplaceAllMatches = true
		  
		  
		  'get phrases (things in double quotes)
		  for x=2 to CountFields(searchString, Chr(34))
		    phrase= Trim(NthField(searchString, Chr(34), x))
		    
		    'remove from main searchString
		    searchString= ReplaceAll(searchString, phrase, "")
		    
		    'search for first word in phrase that is in index
		    y=1
		    do until y> CountFields(phrase, " ") Or Bible(bibleToSearch).validSearch(NthField(phrase, " ", y))=true
		      y=y+1
		      
		    loop
		    
		    if (y<=CountFields(phrase, " ")) then
		      
		      
		      results= Bible(bibleToSearch).search(NthField(phrase, " ", y), false)
		      
		      'remove results that don't contain the entire phrase
		      for y=0 to UBound(results)
		        temp= new SearchResult(results(y))
		        verse= Bible(bibleToSearch).GetPassage(Bible(bibleToSearch).GetBookName(temp.book), Str(temp.chapter), Str(temp.verse), Str(temp.verse))
		        
		        'remove puncuation
		        verse(1)= reg.Replace(verse(1))
		        
		        if InStr(verse(1), phrase)=0 then
		          results.Remove(y)
		          y=y-1
		        end if
		      next y
		      
		      if (UBound(results)>=0) then
		        
		        'add matches to list
		        if (rad_words_all.value AND found=false) then
		          for y=0 to UBound(results)
		            resultList.Append(new SearchResult(Val(Nthfield(results(y), " ", 1)), Val(Nthfield(results(y), " ", 2)), Val(Nthfield(results(y), " ", 3))))
		          next y
		        else
		          resultList= combineResults(resultList, results)
		        end if
		        
		        x=x+1
		        found=true
		      end if
		      
		    end if
		  next x
		  
		  'remove puncuation
		  searchString= reg.Replace(searchString)
		  
		  'get individual words
		  words= searchString.split(" ")
		  
		  'remove words that aren't indexed
		  for x=0 to UBound(words)
		    if Bible(bibleToSearch).validSearch(words(x))=false OR Len(words(x))<1 then
		      words.Remove(x)
		      x=x-1
		    end if
		  next x
		  
		  
		  if UBound(words) >= 0 then
		    
		    'find the word
		    results= Bible(bibleToSearch).search(words(0), rad_match_begin.value)
		    
		    if (found=false) then
		      for x=0 to UBound(results)
		        resultList.Append(new SearchResult(Val(Nthfield(results(x), " ", 1)), Val(Nthfield(results(x), " ", 2)), Val(Nthfield(results(x), " ", 3))))
		      next x
		      
		    else
		      resultList= combineResults(resultList, results)
		    end if
		    
		    for x=1 to UBound(words)
		      
		      'find the word
		      results= Bible(bibleToSearch).search(words(x), rad_match_begin.value)
		      
		      resultList= combineResults(resultList, results)
		      
		    next x
		    
		  end if
		  
		  'sort by priority
		  resultList= mergeSort(resultList, 0, UBound(resultList))
		  
		  'add results to list
		  for x=0 to UBound(resultList)
		    temp = resultList(x)
		    verse= bibleToSearch.GetPassage(temp.book, temp.chapter, temp.verse, temp.verse, False)
		    
		    lst_result.AddRow(bibleToSearch.GetCitation(temp.book, temp.chapter, temp.verse))
		    lst_result.Cell(x, 1)= Join(verse, "/").ReplaceAll(EndOfLine.UNIX, "|")
		  next x
		  If x > 0 Then
		    lst_result.ListIndex = 0
		    lst_result.SetFocus
		  End If
		  
		  lbl_search_result.Caption = App.T.Translate("scripture_search/result/@caption", Str(x))
		  Self.MouseCursor = Nil
		  
		  Catch ex
		    MsgBox "SearchWindow.Search: " + ex.message + ":" + str(ex.errornumber)
		    lbl_search_result.Caption = ""
		    Self.MouseCursor = Nil
		    Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SelectResult()
		  if lst_result.ListIndex > -1 Then
		    if controllerObject <> Nil Then
		      if UBound(resultList) >= lst_result.ListIndex Then
		        controllerObject.SearchComplete(Self, resultList(lst_result.ListIndex))
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected bibleToSearch As iBible
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected controllerObject As ScripturePickerController
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HS As HalfSizer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected resultList() As SearchResult
	#tag EndProperty


#tag EndWindowCode

#tag Events edt_search
	#tag Event
		Sub GotFocus()
		  btn_search_search.Default = Me.Text <> ""
		  btn_search_ok.Default = Not btn_search_search.Default
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  btn_search_search.Enabled = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  btn_search_search.Enabled = Me.Text <> ""
		  btn_search_search.Default = Me.Text <> ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events grp_search_match
	#tag Event
		Sub Open()
		  If HS <> Nil Then HS.AddWidth Me, .5
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_match_exact
	#tag Event
		Sub GotFocus()
		  btn_search_search.Default = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_match_begin
	#tag Event
		Sub GotFocus()
		  btn_search_search.Default = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events grp_search_words
	#tag Event
		Sub Open()
		  If HS <> Nil Then HS.AddLeftWidth Me, .5, .5
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_words_any
	#tag Event
		Sub GotFocus()
		  btn_search_search.Default = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_words_all
	#tag Event
		Sub GotFocus()
		  btn_search_search.Default = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_search_search
	#tag Event
		Sub Action()
		  search
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_result
	#tag Event
		Sub Change()
		  btn_search_ok.Enabled = (Me.ListIndex > -1)
		  btn_search_ok.Default = (Me.ListIndex > -1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  SelectResult
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  btn_search_search.default=false
		  btn_search_ok.default=true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_search_ok
	#tag Event
		Sub Action()
		  SelectResult
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_search_cancel
	#tag Event
		Sub Action()
		  Self.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
