#tag Class
Protected Class BiblePassage
	#tag Method, Flags = &h0
		Function Clone() As BiblePassage
		  Dim b As BiblePassage = New BiblePassage(BookNumber, ChapterNumber, FromVerseNumber, ThruVerseNumber, Translation, BookName, Passage)
		  b.SourceBible = SourceBible
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(book As Integer, chapter As Integer, from As Integer, thru As Integer, translationName As String = "", bookName As String = "", passageText As String = "")
		  BookNumber = book
		  ChapterNumber = chapter
		  FromVerseNumber = from
		  ThruVerseNumber = thru
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

	#tag Property, Flags = &h0
		BookNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ChapterNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FromVerseNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_bible As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54657874206F662074686520706173736167652E20456D7074792069732076616C69642E
		Passage As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If m_bible.Value = Nil Then Return Nil
			  Return iBible(m_bible.Value)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  m_bible = WeakRef(value)
			End Set
		#tag EndSetter
		SourceBible As iBible
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ThruVerseNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Translation As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Translation"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BookName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BookNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChapterNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FromVerseNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Passage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThruVerseNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
