#tag Class
Protected Class SEditFieldNumeric
Inherits SEditField
	#tag Event
		Sub GotFocus()
		  RaiseEvent GotFocus
		  
		  InitialValue = CurrentValue
		  
		  SelStart = 0
		  SelLength = Len(Text)
		  RaiseEvent GotFocus
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  RaiseEvent LostFocus
		  //
		  // Validate the field is a number
		  //
		  Dim IsError As Boolean = False
		  Dim oldValue As Double = CurrentValue
		  Text = Text.Trim  // IsNumeric is picky about blanks
		  If Not IsNumeric(Text) Then
		    InputBox.Message(App.T.Translate("errors/number_please"))
		    SetValue InitialValue
		    SetFocus
		  Else
		    If dirty Then
		      CurrentValue = CDbl(Text)
		      ValueToText
		      CurrentValue = CDbl(Text)  // now we changed it, round it according to DisplayFormat
		    End If
		    If EnforceRange Then
		      If CurrentValue < Minimum Then
		        IsError = True
		        CurrentValue = Minimum
		        ValueToText
		      ElseIf CurrentValue > Maximum Then
		        IsError = True
		        CurrentValue = Maximum
		        ValueToText
		      End If
		    End If
		    ValueToText
		  End If
		  
		  If CurrentValue <> oldValue Then
		    RaiseEvent ValueChange
		  End
		  
		  RaiseEvent LostFocus
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TextChange()
		  dirty = True
		  RaiseEvent TextChange
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  SignalRangeErrors = True
		  Minimum = -2.25073858507201e-308
		  Maximum = 1.79769313486231e308
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(NewValue As Double)
		  //
		  // Set the value of the control.
		  // Store in CurrentValue and
		  // then set the text appropriately
		  //
		  Dim ex As New OutOfBoundsException
		  If EnforceRange Then
		    If SignalRangeErrors And (NewValue < Minimum Or NewValue > Maximum) Then
		      ex.Message = App.T.Translate("errors/range_error", CStr(NewValue))
		      Raise ex
		    Else
		      If NewValue < Minimum Then NewValue = Minimum
		      If NewValue > Maximum Then NewValue = Maximum
		    End If
		  End If
		  CurrentValue = NewValue
		  ValueToText
		  InitialValue = CurrentValue
		  RaiseEvent ValueChange
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As Double
		  //
		  // Return the CurrentValue of the control
		  //
		  
		  Dim value As Double
		  value = CurrentValue
		  If dirty Then
		    // return the current, temporary value if possible
		    // without altering Text, and therefore CurrentValue
		    // if Text is non-numeric, CurrentValue is returned instead 
		    Dim currText As String = Text.Trim  // IsNumeric is picky about blanks
		    If IsNumeric(currText) Then
		      value = CDbl(currText)
		      If DisplayFormat <> "" Then
		        currText = Format(value, DisplayFormat)
		        value = CDbl(currText)  // round it according to DisplayFormat
		      End If
		    End If
		  End If
		  If EnforceRange Then
		    If value < Minimum Then
		      value = Minimum
		    ElseIf value > Maximum Then
		      value = Maximum
		    End If
		  End If
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ValueToText()
		  If DisplayFormat <> "" Then
		    Text = Format(CurrentValue, DisplayFormat)
		    Dim formattedValue As Double = CDbl(Text)
		    If formattedValue = Floor(formattedValue) And InStr(DisplayFormat, ".#") <> 0 Then
		      Text = StringUtils.RTrim(Text, StringUtils.DecimalSeparator)
		    End If
		  Else
		    Text = CStr(CurrentValue)
		  End If
		  dirty = False
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChange()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueChange()
	#tag EndHook


	#tag Note, Name = Description
		Subclasses the SEditField to limit input to valid numbers
		This can be used when the format for the number isn't fixed.
		Validation takes place when the field loses focus, not during input.
	#tag EndNote


	#tag Property, Flags = &h1
		#tag Note
			Raise Event ValueChange when you're done changing this property
		#tag EndNote
		Protected CurrentValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			A change has been made to the text
		#tag EndNote
		dirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			DisplayFormat contains the format to be used in displaying
			the value of the control.  This is used instead of the base class's
			Format property in order to keep OpenSong from trying to
			re-format the string on input.
		#tag EndNote
		DisplayFormat As String
	#tag EndProperty

	#tag Property, Flags = &h4
		EnforceRange As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			This is the value of the control when the control gets focus.
		#tag EndNote
		Protected InitialValue As Double
	#tag EndProperty

	#tag Property, Flags = &h4
		Maximum As Double
	#tag EndProperty

	#tag Property, Flags = &h4
		Minimum As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			If True, Raise a exception if the set value violates the min/max for the control
			If False, just set to the min or max as appropriate
		#tag EndNote
		SignalRangeErrors As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UnicodeMode"
			Visible=true
			Group="Selection Behavior"
			InitialValue="0"
			Type="TextArea.UnicodeModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Native"
				"1 - Characters"
				"2 - Codepoints"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
			EditorType="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHorizontalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasVerticalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowStyledText"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontName"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextAlignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="TextAlignments"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowSpellChecking"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximumCharactersAllowed"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValidationMask"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HideSelection"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineHeight"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineSpacing"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="80"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiline"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
			EditorType="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=false
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayFormat"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			InitialValue=""
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			InitialValue=""
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnforceRange"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Maximum"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Minimum"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SignalRangeErrors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="dirty"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
