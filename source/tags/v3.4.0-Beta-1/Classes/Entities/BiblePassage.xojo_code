#tag Class
Protected Class BiblePassage
	#tag Method, Flags = &h0
		Function Clone() As BiblePassage
		  Dim b As BiblePassage = New BiblePassage(BookNumber, ChapterNumber, FromVerseNumber, ThruVerseNumber, Translation, BookName, Passage)
		  b.SourceBible = SourceBible
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(book As Integer, chapter As Integer, from As Integer, thru As Integer, translationName As String = "", bookName As String = "", passageText As String = "")
		  mBookNumber = book
		  mChapterNumber = chapter
		  mFromVerseNumber = from
		  mThruVerseNumber = thru
		  Translation = translationName
		  Me.BookName = bookName
		  Passage = passageText
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  Return Join(Array (CStr(BookNumber), CStr(ChapterNumber), _
		  CStr(FromVerseNumber), CStr(ThruVerseNumber)), ",")
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BookName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mBookNumber
			End Get
		#tag EndGetter
		BookNumber As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mChapterNumber
			End Get
		#tag EndGetter
		ChapterNumber As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFromVerseNumber
			  
			  
			  // This was the setter
			  'If mThruVerseNumber < value Then
			  'mFromVerseNumber = mThruVerseNumber
			  'mThruVerseNumber = value
			  'Else
			  'mFromVerseNumber = value
			  'End If
			End Get
		#tag EndGetter
		FromVerseNumber As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBookNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChapterNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFromVerseNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mThruVerseNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_bible As iBible
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54657874206F662074686520706173736167652E20456D7074792069732076616C69642E
		Passage As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return m_bible
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  m_bible = value
			End Set
		#tag EndSetter
		SourceBible As iBible
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mThruVerseNumber
			  
			  // This was the setter
			  'If value < mFromVerseNumber Then
			  'mThruVerseNumber = mFromVerseNumber
			  'mFromVerseNumber = value
			  'Else
			  'mThruVerseNumber = value
			  'End If
			End Get
		#tag EndGetter
		ThruVerseNumber As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Translation As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Translation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BookName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Passage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FromVerseNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThruVerseNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BookNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChapterNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
