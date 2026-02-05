#tag Module
Protected Module ColorPaletteBroker
	#tag Method, Flags = &h0
		Sub AddFontColors(font as FontFace, ByRef colrs() as Color)
		  If font = Nil Then Return
		  
		  colrs.Add(font.ForeColor)
		  If font.Border Then colrs.Add(font.BorderColor)
		  If font.Shadow Then colrs.Add(font.ShadowColor)
		  If font.Fill Then colrs.Add(font.FillColor)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFontColors(xNode as XmlNode, ByRef colrs() as Color)
		  If xNode = Nil Then Return
		  Dim c As Color
		  
		  If SmartML.GetValueC(xNode, "@color", c, False) Then
		    colrs.Add(c)
		  End If
		  
		  If SmartML.GetValueB(xNode, "@border", False) Then
		    If SmartML.GetValueC(xNode, "@border_color", c, False) Then
		      colrs.Add(c)
		    End If
		  End If
		  
		  If SmartML.GetValueB(xNode, "@shadow", False) Then
		    If SmartML.GetValueC(xNode, "@shadow_color", c, False) Then
		      colrs.Add(c)
		    End If
		  End If
		  
		  If SmartML.GetValueB(xNode, "@fill", False) Then
		    If SmartML.GetValueC(xNode, "@fill_color", c, False) Then
		      colrs.Add(c)
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddStyleColors(style as SlideStyle, ByRef colrs() as Color)
		  If style = Nil Then Return
		  
		  AddFontColors(style.BodyFont, colrs)
		  AddFontColors(style.TitleFont, colrs)
		  AddFontColors(style.SubtitleFont, colrs)
		  colrs.Add(style.MultilanguageColor)
		  colrs.Add(style.BGColor)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddStyleColors(xNode as XmlNode, ByRef colrs() as Color)
		  If xNode = Nil Then Return
		  Dim c As Color
		  
		  AddFontColors(SmartML.GetNode(xNode, "title"), colrs)
		  AddFontColors(SmartML.GetNode(xNode, "subtitle"), colrs)
		  AddFontColors(SmartML.GetNode(xNode, "body"), colrs)
		  If SmartML.GetValueC(xNode, "body/@multilanguage_color", c, False) Then
		    colrs.Add(c)
		  End If
		  If SmartML.GetValueC(xNode, "background/@color", c, False) Then
		    colrs.Add(c)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearContextTag()
		  If Context.Ubound >= 0 Then
		    Call Context.Pop
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareColorHSV(left As Color, right As Color) As Integer
		  If left = right Then Return 0
		  Dim leftHue, rightHue As Double
		  leftHue = left.Hue
		  rightHue = right.Hue
		  // black, grey and white at the end - hue does not make sense without chroma/saturation
		  If left.Saturation = 0 Then leftHue = 2
		  If right.Saturation = 0 Then rightHue = 2
		  
		  If leftHue > rightHue Then
		    Return 1
		  ElseIf leftHue < rightHue Then
		    Return -1
		  ElseIf left.Saturation > right.Saturation Then
		    Return 1
		  ElseIf left.Saturation < right.Saturation Then
		    Return -1
		  ElseIf left.Value > right.Value Then
		    Return 1
		  ElseIf left.Value < right.Value Then
		    Return -1
		  ElseIf left.Alpha > right.Alpha Then
		    Return 1
		  ElseIf left.Alpha < right.Alpha Then
		    Return -1
		  Else
		    Return 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContextTag() As String
		  If Context.Ubound >= 0 Then
		    Return Context(Context.Ubound)
		  Else
		    Return "item;set;present.settings"
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Included(tag As String, category As String) As Boolean
		  // Checks if the category is included in tag
		  // category is a leaf category
		  // tag is a list of categories, separated by ;
		  // categories are hierarchical, separated by .
		  
		  For i As Integer = 1 To tag.CountFields(";")
		    Dim t As String = tag.NthField(";", i)
		    If category.StartsWithB(t) Then
		      Dim c As String = category.Mid(t.Len + 1, 1)
		      If c = "" Or c = "." Then
		        Return True
		      End If
		    End If
		  Next i
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterColorPaletteSource(source As ColorPaletteSource)
		  If source <> Nil Then Sources.Add(New WeakRef(Source))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RequestColorPalettes(tag As String) As ColorPalette()
		  Dim src As ColorPaletteSource
		  Dim colrPal, colrPals() As ColorPalette
		  Dim Result() As ColorPalette
		  Dim paletteNameDict As New Dictionary
		  Dim i As Integer
		  
		  Try
		    Globals.Status_SupplyColorPallet = True
		    
		    For i = 0 To Sources.Ubound
		      If Sources(i).Value IsA ColorPaletteSource Then
		        src = ColorPaletteSource(Sources(i).Value)
		        colrPals = src.SupplyColorPalette(tag)
		        If colrPals <> Nil Then
		          For Each ColrPal In ColrPals
		            paletteNameDict.Value(colrPal.Name) = paletteNameDict.HasKey(colrPal.Name)  // detect duplicates
		            Result.Add(colrPal)
		          Next Colrpal
		        End If
		      End If
		    Next i
		    
		  Catch e
		    Raise e
		  Finally
		    Globals.Status_SupplyColorPallet = False
		  End Try
		  
		  For Each ditcItem As DictionaryEntry In paletteNameDict
		    If ditcItem.Value Then
		      Dim n As Integer
		      Dim pal, pals() As ColorPaletteBroker.ColorPalette
		      For i = Result.Ubound DownTo 0
		        n = i
		        pals.Add(Result(i))
		        Result.RemoveAt(i)
		      Next i
		      For i = pals.Ubound DownTo 0
		        If pal = Nil Then
		          pal = pals(i)
		        Else
		          pal.Merge(pals(i))
		        End If
		      Next i
		      Result.AddAt(n, pal)
		    End If
		  Next ditcItem
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetContextTag(tag As String)
		  Context.Add(tag)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SortUniqueColors(colrs() As Color) As Color()
		  Dim Result() As Color
		  Dim d As New Dictionary
		  Dim c As Color
		  
		  For Each c In colrs
		    If Not d.HasKey(c) Then
		      Result.Add(c)
		      d.Value(c) = Nil
		    End If
		  Next c
		  Result.Sort(AddressOf CompareColorHSV)
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterColorPaletteSource(source As ColorPaletteSource)
		  If source = Nil Then Return
		  
		  For i As Integer = Sources.Ubound DownTo 0
		    If Sources(i).Value IsA ColorPaletteSource Then
		      If Sources(i).Value Is source Then
		        Sources.RemoveAt(i)
		      End If
		    Else
		      Sources.RemoveAt(i)
		    End If
		  Next i
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Context() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CustomColorSlots() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		Sources() As WeakRef
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
	#tag EndViewBehavior
End Module
#tag EndModule
