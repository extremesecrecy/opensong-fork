#tag Class
Protected Class FindClass
	#tag Method, Flags = &h0
		Sub ConstructFieldsToSearch()
		  FieldsToSearch.RemoveAllRows
		  If FindString.IsEmpty Then
		    If FindChord Then FieldsToSearch.Append("chord")
		  Else
		    If FindTitle Then FieldsToSearch.Append("title")
		    If FindAuthor Then FieldsToSearch.Append("author")
		    If FindCopyright Then FieldsToSearch.Append("copyright")
		    If FindCCLI Then FieldsToSearch.Append("ccli")
		    If FindPresentation Then FieldsToSearch.Append("presentation")
		    If FindLyrics Then FieldsToSearch.Append("lyrics")
		    If FindChord Then FieldsToSearch.Append("chord")
		    If FindThemes Then FieldsToSearch.Append("theme")
		    If FindTimeSig Then FieldsToSearch.Append("time_sig")
		    If FindTempo Then FieldsToSearch.Append("tempo")
		    If FindKey Then FieldsToSearch.Append("key")
		    If FindAKA Then FieldsToSearch.Append("aka")
		    If FindKeyLine Then FieldsToSearch.Append("key_line")
		    If FindUser1 Then FieldsToSearch.Append("user1")
		    If FindUser2 Then FieldsToSearch.Append("user2")
		    If FindUser3 Then FieldsToSearch.Append("user2")
		    If FindHymnNumber Then FieldsToSearch.Append("hymn_number")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  FindTitle = True
		  FindAuthor = True
		  FindLyrics = True
		  FoundFieldTag = ""
		  FoundPos = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CoveredAllItems() As Boolean
		  App.DebugWriter.Write(CurrentMethodName + ": ItemSeenCount = " + Str(ItemSeenCount), 7)
		  Return ItemSeenCount = ItemCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTagIndex(tag as String) As Integer
		  Return FieldsToSearch.IndexOf(tag)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMatch(s As String, Tag As String = "") As Boolean
		  Dim offset As Integer
		  
		  If FieldsToSearch(PassStartTagIdx) = Tag Then
		    offset = Max(0,PassStartPos)
		  Else
		    offset = 0
		  End If
		  
		  Try
		    FoundPos = s.IndexOf(offset, FindString, ComparisonOptions.CaseInsensitive, app.LocaleForSearch)
		  Catch e As RuntimeException
		    FoundPos = -1
		  End Try
		  
		  If FoundPos <> -1 Then
		    FoundLen = FindString.Length
		    FoundFieldTag = Tag
		  Else
		    FoundLen = 0
		    FoundFieldTag = ""
		  End If
		  Return FoundPos <> -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterFoundPosition(Idx As Integer, Forward As Boolean)
		  Dim foundTagIdx As Integer = GetTagIndex(FoundFieldTag)
		  FoundIdx = Idx
		  If PassStartIdx >= LowIdx - 1 And PassStartIdx <= HighIdx + 1 Then
		    If Forward Then
		      While Idx < PassStartIdx
		        Idx = Idx + ItemCount
		      Wend
		      If Idx = HighIdx Then
		        If foundTagIdx = HighTagIdx Then
		          If FoundPos > HighPos Then
		            HighPos = FoundPos + FoundLen
		          End If
		        ElseIf foundTagIdx > HighTagIdx Then
		          HighTagIdx = foundTagIdx
		          HighPos = FoundPos + FoundLen
		        End If
		      ElseIf Idx > HighIdx Then
		        HighIdx = Idx
		        HighTagIdx = foundTagIdx
		        HighPos = FoundPos + FoundLen
		      End If
		    Else
		      While Idx > PassStartIdx
		        Idx = Idx - ItemCount
		      Wend
		      If Idx = LowIdx Then
		        If foundTagIdx = LowTagIdx Then
		          If FoundPos < LowPos Then
		            LowPos = FoundPos
		          End If
		        ElseIf foundTagIdx < LowTagIdx Then
		          LowTagIdx = foundTagIdx
		          LowPos = FoundPos
		        End If
		      ElseIf Idx < LowIdx Then
		        LowIdx = Idx
		        LowTagIdx = foundTagIdx
		        LowPos = FoundPos
		      End If
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterItemCompleted(SeenItem As Integer, Forward As Boolean)
		  RegisterStopOfSearch(SeenItem, -1, -1, Forward, True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterStartOfSearch(Idx As Integer, TagIdx As Integer, Pos As Integer, Forward As Boolean)
		  // If Idx is not in the range 0..ItemCount-1 then start at "point zero". If it is -1 this usually means there are no items to search.
		  // TagIdx = -1 means no particular tag: restart from the one last found, the first or the last depending on Idx, FoundIdx, Forward
		  // Pos = -1 means no particular position: restart from start or end depending on Forward
		  
		  Dim tagsWithPosition() As String = Array("lyrics","chord")
		  
		  // sanitize
		  If Idx < 0 Or Idx >= ItemCount Then Idx = -1
		  If TagIdx < 0 Or TagIdx > FieldsToSearch.LastIndex Then TagIdx = -1
		  If Pos < -1 Then Pos = -1
		  If Idx = -1 Then TagIdx = -1
		  If TagIdx = -1 Then Pos = -1
		  
		  If ItemCount > 0 And FoundIdx >= 0 Then
		    If FoundIdx >= 0 Then
		      Dim foundTagIdx As Integer = GetTagIndex(FoundFieldTag)
		      If foundTagIdx >= 0 _
		        And (Idx = FoundIdx Or Idx = -1) _
		        And (TagIdx = foundTagIdx Or TagIdx = -1) _
		        And Pos = -1 _
		        Then
		        // continue search from last found
		        Idx = FoundIdx
		        TagIdx = foundTagIdx
		        If FoundPos >= 0 Then
		          Pos = FoundPos
		          // The start field might have multiple find positions - set position to continue from
		          If Forward And FoundLen > 0 Then
		            Pos = FoundPos + FoundLen
		          End If
		        Else
		          Pos = -1
		        End If
		        If tagsWithPosition.IndexOf(FoundFieldTag) = -1 Then
		          If Forward Then
		            // move forward to the next position
		            Pos = 0
		            TagIdx = TagIdx + 1
		            If TagIdx > FieldsToSearch.LastIndex Then
		              TagIdx = 0
		              Idx = idx + 1
		              If idx >= ItemCount Then
		                idx = idx - ItemCount
		              End If
		            End If
		          Else
		            // move backward to the previous position
		            Pos = -1
		            TagIdx = -1
		            idx = idx - 1
		            If idx < 0 Then
		              idx = idx + ItemCount
		            End If
		          End If
		        End If
		      End If
		    End If
		  End If
		  
		  If idx = -1 Then  // no position given, start searching from the "point zero" (the spot between the last item and the first item, when looked at the items as a ring buffer)
		    ResetSearchState
		    If Forward Then
		      idx = 0
		      TagIdx = -1
		      Pos = -1
		    Else
		      idx = ItemCount - 1
		      TagIdx = -1
		      Pos = -1
		    End If
		  End If
		  
		  PassStartIdx = Idx
		  PassStartTagIdx = TagIdx
		  PassStartPos = Pos
		  If PassStartPos = -1 Then
		    If Forward Then
		      PassStartPos = 0
		    End If
		  End If
		  
		  If PassStartTagIdx = -1 Then
		    If Forward Then
		      PassStartTagIdx = 0
		    Else
		      PassStartTagIdx = FieldsToSearch.Ubound
		    End If
		  End If
		  
		  // set coverage information if first search
		  If StartIdx = -1 Then
		    StartIdx = PassStartIdx
		    StartTagIdx = PassStartTagIdx
		    StartPos = PassStartPos
		    
		    LowIdx = StartIdx
		    LowTagIdx = StartTagIdx
		    LowPos = StartPos
		    LowState = 0
		    
		    HighIdx = StartIdx
		    HighTagIdx = StartTagIdx
		    HighPos = StartPos
		    HighState = 0
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterStopOfSearch(Idx As Integer, TagIdx As Integer, Pos As Integer, Forward As Boolean, Complete As Boolean)
		  Idx = AbsMod(Idx, ItemCount)
		  If Forward Then
		    If Idx < StartIdx Then
		      Idx = Idx + ItemCount
		    End If
		  Else
		    If Idx > StartIdx Then
		      Idx = Idx + ItemCount
		    End If
		    If Idx < 0 Then
		      Idx = Idx + ItemCount
		      StartIdx = StartIdx + ItemCount
		      LowIdx = LowIdx + ItemCount
		      HighIdx = HighIdx + ItemCount
		      PassStartIdx = PassStartIdx + ItemCount
		    End If
		  End If
		  
		  If PassStartIdx < LowIdx And PassStartIdx + ItemCount < HighIdx Then
		    PassStartIdx = PassStartIdx + ItemCount
		  End If
		  
		  If Forward Then
		    If Idx < StartIdx Then
		      Idx = Idx + ItemCount
		    ElseIf Idx = StartIdx And HighIdx > StartIdx And (StartTagIdx > 0 Or (StartTagIdx = 0 And StartPos > 0)) Then
		      Idx = Idx + ItemCount
		    End If
		    If Complete And PassStartIdx = Idx And (PassStartTagIdx > 0 Or (PassStartTagIdx = 0 And PassStartPos > 0)) Then
		      Complete = False
		    End If
		    If Complete And Idx >= HighIdx Then
		      HighIdx = Idx
		      HighTagIdx = -1
		      HighPos = -1
		      HighState = 2
		    ElseIf Idx > HighIdx Then
		      HighIdx = Idx
		      HighTagIdx = TagIdx
		      HighPos = Pos
		      HighState = 1
		    ElseIf Idx = HighIdx Then
		      If tagIdx > HighTagIdx Then
		        HighTagIdx = TagIdx
		        HighPos = Pos
		        HighState = 1
		      ElseIf TagIdx = HighTagIdx Then
		        If Pos > HighPos Then
		          HighPos = Pos
		          HighState = 1
		        End If
		      End If
		    End If
		    If HighState = 1 And HighTagIdx = FieldsToSearch.LastIndex And FieldsToSearch(HighTagIdx) <> "lyrics" And FieldsToSearch(HighTagIdx) <> "chord" Then
		      HighState = 2
		    End If
		  Else
		    If Idx > PassStartIdx Then Idx = Idx - ItemCount
		    If Complete And PassStartIdx = Idx And Not (PassStartTagIdx = -1 Or (PassStartTagIdx = FieldsToSearch.LastIndex And PassStartPos = -1)) Then
		      Complete = False
		    End If
		    If Complete And Idx <= LowIdx Then
		      LowIdx = Idx
		      LowTagIdx = -1
		      LowPos = -1
		      LowState = 2
		    ElseIf Idx < LowIdx Then
		      LowIdx = Idx
		      LowTagIdx = TagIdx
		      LowPos = Pos
		      LowState = -1
		    ElseIf Idx = LowIdx Then
		      If TagIdx < LowTagIdx Then
		        LowTagIdx = TagIdx
		        LowPos = Pos
		        LowState = -1
		      ElseIf TagIdx = LowTagIdx Then
		        If Pos < LowPos Then
		          LowPos = Pos
		          LowState = -1
		        End If
		      End If
		    End If
		    If LowState = -1 And LowTagIdx = 0 And (LowPos = 0 Or (FieldsToSearch(HighTagIdx) <> "lyrics" And FieldsToSearch(HighTagIdx) <> "chord")) Then
		      LowState = 2
		    End If
		  End If
		  
		  // normalize to the range 0 to 2 * ItemCount - 1
		  If LowIdx < 0 Then
		    LowIdx = LowIdx + ItemCount
		    HighIdx = HighIdx + ItemCount
		  End If
		  If HighIdx < LowIdx Then
		    HighIdx = HighIdx + ItemCount
		  End If
		  
		  If LowIdx = HighIdx And (LowState = 2 Xor HighState = 2) Then
		    If HighState = 2 Then
		      LowState = 2
		    Else
		      HighState = 2
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetCoverage(ItemCnt As Integer)
		  ItemCount = ItemCnt
		  
		  StartIdx = -1  // indicates "new" search
		  LowIdx = -1
		  HighIdx = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetSearchState()
		  FoundIdx = -1
		  FoundFieldTag = ""
		  FoundPos = -1
		  FoundLen = 0
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ChordForm As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ChordKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FieldsToSearch() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FindAKA As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindAuthor As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindCapo As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindCCLI As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindChord As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindCopyright As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindHymnNumber As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindKey As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindKeyLine As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindLyrics As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindPresentation As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindString As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FindTempo As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindThemes As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindTimeSig As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindTitle As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindUser1 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindUser2 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FindUser3 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Identifies the string passed to IsMatch.
			Used to keep state
			If the tag passed to IsMatch is equal to FieldTag, the new search starts at FoundPos + FoundLen, else the search starts at te beginning
		#tag EndNote
		FoundFieldTag As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FoundIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FoundLen As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FoundPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HighIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HighPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			0  = not seen
			-1 = seen from start to TagIdx, Pos
			1 = seen from TagIdx,Pos to end
			2 = completely seen
			
		#tag EndNote
		Protected HighState As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HighTagIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemCount As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Partially seen does not count
			  
			  Dim low, high As Integer
			  
			  If LowIdx = -1 Or HighIdx = -1 Then
			    Return 0
			  End If
			  
			  low = LowIdx
			  high = HighIdx
			  
			  If HighState <> 2 Then
			    high = high - 1
			  End If
			  If LowState <> 2 Then
			    low = low + 1
			  End If
			  
			  If LowIdx = HighIdx And low <> high Then
			    If LowState = 2 Or HighState = 2 Then
			      Return 1
			    ElseIf LowState = 0 Or HighState = 0 Then
			      Return 0
			    ElseIf LowTagIdx > HighTagIdx Or (LowTagIdx = HighTagIdx And LowPos >= HighPos) Then
			      Return 1
			    Else
			      Return 0
			    End If
			  Else
			    Return high - low + 1
			  End If
			End Get
		#tag EndGetter
		ItemSeenCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected LowIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LowPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LowState As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LowTagIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PassStartIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PassStartPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PassStartTagIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StartIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StartPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StartTagIdx As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ChordForm"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChordKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindAKA"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindAuthor"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindCapo"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindCCLI"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindChord"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindCopyright"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindHymnNumber"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindKey"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindKeyLine"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindLyrics"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindPresentation"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindTempo"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindThemes"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindTimeSig"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindTitle"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindUser1"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindUser2"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FindUser3"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FoundPos"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
			Name="FoundFieldTag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FoundIdx"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FoundLen"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ItemCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ItemSeenCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassStartIdx"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassStartPos"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassStartTagIdx"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartIdx"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartPos"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartTagIdx"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
