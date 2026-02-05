#tag Class
Protected Class ColorPalette
	#tag Method, Flags = &h0
		Function AsVarArray() As Variant()
		  Dim pal() As Variant
		  Dim currLink As ColorPalette = Self
		  
		  While currLink <> Nil
		    If currLink.ColorSamples = Nil Or currLink.ColorSamples.Ubound = -1 Then
		      If currLink.Link = Nil Then
		        Return(pal)
		      End If
		    Else
		      Dim colr() As Color
		      Redim colr(currLink.ColorSamples.Ubound)
		      For i As Integer = 0 To currLink.ColorSamples.Ubound
		        colr(i) = currLink.ColorSamples(i)
		      Next i
		      pal.Add(colr)
		    End If
		    currLink = currLink.Link
		    If currLink <> Nil And currLink.Caption <> "" Then
		      pal.Add(currLink.Caption)
		    End If
		  Wend
		  Return pal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name As String, Caption As String = "", colrs() As Color)
		  Self.Name = Name
		  Self.Caption = Caption
		  Redim Self.ColorSamples(colrs.Ubound)
		  For i As Integer = 0 To colrs.Ubound
		    Self.ColorSamples(i) = colrs(i)
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name As String, Caption As String = "", subPals() As ColorPalette)
		  Self.Name = Name
		  Self.Caption = Caption
		  
		  Dim pal As ColorPaletteBroker.ColorPalette
		  while SubPals.Ubound >= 0
		    pal = SubPals.Pop
		    pal.Link = Self.Link
		    Self.Link = pal
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name As String, Caption As String = "", pal() As Variant = Nil)
		  Self.Name = Name
		  Self.Caption = Caption
		  FromVarArray(pal)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FromVarArray(pal() As Variant)
		  Redim ColorSamples(-1)
		  Link = Nil
		  
		  Dim CurrLink As ColorPalette = Self
		  
		  For i As Integer = 0 To pal.Ubound
		    If pal(i).IsArray Then
		      Dim colr() As Color = pal(i)
		      If currLink.ColorSamples = Nil Then
		        CurrLink.Link = New ColorPalette
		        CurrLink = CurrLink.Link
		      End If
		      Redim CurrLink.ColorSamples(colr.Ubound)
		      For j As Integer = 0 To colr.Ubound
		        CurrLink.ColorSamples(j) = colr(j)
		      Next j
		    Else
		      CurrLink.Link = New ColorPalette
		      CurrLink = CurrLink.Link
		      CurrLink.Name = pal(i).StringValue
		      CurrLink.Caption = CurrLink.Name
		    End If
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Merge(pal As ColorPalette)
		  // adds captions and colors of pal to self.
		  // If there are colors with no caption, the colors are added before the first caption
		  // If a caption matches an existing caption, the colors are added to this caption
		  // a new caption is added at the end
		  //
		  // if colors are added to existing colors it is done like so
		  // if there is one array, the colors are added to that array, made unique and sorted again
		  // if there is more than one array, existing colors are removed from the new array and the remaining array is added if not empty
		  //
		  // if pal has no ColorSamples, it's Name and Caption get used, unless self has these values set before
		  
		  Dim mPal, lastmPal, nextPal, newPal As ColorPalette
		  Dim palCaption, mCaption As String
		  
		  If pal.ColorSamples = Nil Or pal.ColorSamples.Ubound < 0 Then
		    If Name = "" Then Name = pal.Name
		    If Caption = "" And Name = pal.Name Then Caption = pal.Caption
		    pal = pal.Link
		  End If
		  
		  While pal <> Nil
		    mPal = self
		    mCaption = ""
		    lastmPal = Nil
		    nextPal = pal.Link
		    
		    If pal.Caption <> "" Then
		      palCaption = pal.Caption
		    End If
		    
		    Dim palsWithColor(-1) As ColorPalette
		    While palCaption <> mCaption
		      If mPal.Link = Nil Then lastmPal = mPal
		      mPal = mPal.Link
		      If mPal = Nil Then
		        mCaption = "   "
		        Exit
		      ElseIf mPal.Caption <> "" Then
		        mCaption = mPal.Caption
		      End If
		    Wend
		    While mCaption = palCaption
		      If mPal.ColorSamples <> Nil And mPal.colorSamples.Ubound >= 0 Then
		        palsWithColor.Add(mPal)
		      End If
		      lastmPal = mPal
		      mPal = mPal.Link
		      If mPal = Nil Then
		        mCaption = "   "
		      ElseIf mPal.Caption <> "" Then
		        mCaption = mPal.Caption
		      End If
		    Wend
		    If palsWithColor.Ubound >= 0 Then
		      // we need to add colors to colors in palsWithColor
		      If pal.ColorSamples <> Nil And pal.ColorSamples.Ubound >= 0 Then
		        If palsWithColor.Ubound = 0 Then
		          // add to this array
		          pal = palsWithColor(0)
		          For i As Integer = 0 To pal.ColorSamples.Ubound
		            palsWithColor(0).ColorSamples.Add(pal.ColorSamples(i))
		          Next i
		          palsWithColor(0).ColorSamples = ColorPaletteBroker.SortUniqueColors(palsWithColor(0).ColorSamples)
		        Else
		          // add new array
		          Dim idx As Integer
		          If lastmPal = Nil Then lastmPal = palsWithColor(palsWithColor.Ubound)
		          For i As Integer = 0 To palsWithColor.Ubound
		            For j As Integer = 0 To palsWithColor(i).ColorSamples.Ubound
		              idx = pal.ColorSamples.IndexOf(palsWithColor(i).ColorSamples(j))
		              If idx >= 0 Then
		                pal.ColorSamples.RemoveAt(idx)
		                If pal.ColorSamples.Ubound = -1 Then Exit
		              End If
		            Next j
		          Next i
		          If pal.ColorSamples.Ubound >= 0 And lastmPal <> Nil Then
		            newPal = New ColorPalette("", "", pal.ColorSamples)
		            newPal = lastmPal.Link
		            lastmPal.Link = newPal
		          End If
		        End If
		      End If
		    Else
		      // we need to add the colors of the group
		      If lastmPal = Nil Then
		        // we did not reach the end of mPal in the first while loop, but 
		        // mCaption was never equal to palCaption: how did that happen?
		        // provoke NOE
		        lastmPal = lastmPal.Link
		      End If
		      Do
		        newPal = New ColorPalette(pal.Name, pal.Caption, pal.ColorSamples)
		        newPal.Link = lastmPal.Link
		        lastmPal.Link = newPal
		        If nextPal <> Nil And nextPal.Caption = "" Then
		          pal = nextPal
		          nextPal = pal.Link
		          lastmPal = newPal
		        Else
		          lastmPal = Nil
		        End If
		      Loop Until lastmPal = Nil
		    End If
		    
		    pal = nextPal
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StripAlpha()
		  // used to set te alpha channel to fully opaque and to remove those samples that by this became duplicates
		  // walkes the chain starting from self
		  // assumes colors are sorted with Alpha beeing the least significant property
		  
		  Dim pal As ColorPalette = self
		  Dim first As Boolean
		  Dim c, prevC As Color
		  
		  While pal <> Nil
		    If pal.ColorSamples <> Nil Then
		      first = True
		      For i As Integer = pal.ColorSamples.Ubound DownTo 0
		        c = pal.ColorSamples(i)
		        If c.Alpha <> 0 Then
		          c = RGB(c.red, c.Green, c.Blue)
		          pal.ColorSamples(i) = c
		        End If
		        If first Then
		          first = False
		        ElseIf c = prevC Then
		          pal.ColorSamples.RemoveAt(i)
		        End If
		        prevC = c
		      Next i
		    End If
		    pal = pal.Link
		  Wend
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Caption As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ColorSamples() As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Link As ColorPalette
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
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
			Name="Name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
