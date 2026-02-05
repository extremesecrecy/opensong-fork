#tag Class
Protected Class SEditField
Inherits TextArea
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim State As Boolean = SelLength > 0
		  Dim c As New Clipboard
		  Dim m as MenuItem
		  
		  m = new MenuItem( App.T.Translate("shared/cut/@caption"), ACTION_CUT )
		  m.Enabled = State And Me.Enabled
		  base.Append(m)
		  
		  m = new MenuItem( App.T.Translate("shared/copy/@caption"), ACTION_COPY )
		  m.Enabled = State
		  base.Append(m)
		  
		  m = new MenuItem( App.T.Translate("shared/paste/@caption"), ACTION_PASTE )
		  m.Enabled = Me.Enabled And c.TextAvailable
		  base.Append(m)
		  
		  m = new MenuItem( App.T.Translate("shared/clear/@caption"), ACTION_CLEAR )
		  m.Enabled = State And Me.Enabled
		  base.Append(m)
		  
		  base.Append( new MenuItem( MenuItem.TextSeparator ) )
		  
		  m = new MenuItem( App.T.Translate("shared/selectall/@caption"), ACTION_SELECTALL )
		  m.Enabled = Len(Text) > 0
		  base.Append(m)
		  
		  Dim b As Boolean = ConstructContextualMenu(base, x, y)
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If ContextualMenuAction(hitItem) Then
		    Return True
		  End If
		  
		  If hitItem.Tag = ACTION_CUT Then
		    Call DoCut()
		  ElseIf hitItem.Tag = ACTION_COPY Then
		    Call DoCopy()
		  ElseIf hitItem.Tag = ACTION_PASTE Then
		    Call DoPaste()
		  ElseIf hitItem.Tag = ACTION_CLEAR Then
		    Call DoClear()
		  ElseIf hitItem.Tag = ACTION_SELECTALL Then
		    Call DoSelectAll()
		  End If
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  Dim State As Boolean = SelLength > 0
		  Dim c As New Clipboard
		  
		  mnu_edit_clear.Enabled = State And Me.Enabled
		  mnu_edit_cut.Enabled = State And Me.Enabled
		  mnu_edit_copy.Enabled = State
		  mnu_edit_selall.Enabled = Len(Text) > 0
		  
		  mnu_copy_paste.Enabled = c.TextAvailable And Me.Enabled
		End Sub
	#tag EndEvent

	#tag Event
		Sub TextChange()
		  // filter out harmful control characters
		  Dim str As String
		  
		  If Me.SelLength = 0 Then
		    If Me.SelStart > 0 Then
		      str = Me.Text.Mid(Me.SelStart, 1)
		      If str.CleanXML.Len = 0 Then
		        Me.SelStart = Me.SelStart - 1
		        Me.SelLength = 1
		        Me.SelText = ""
		      End If
		    End If
		  Else
		    str = Me.SelText.CleanXML
		    If str <> Me.SelText Then
		      Me.SelText = str
		      Beep
		    End If
		  End If
		  RaiseEvent TextChange
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function mnu_copy_paste() As Boolean Handles mnu_copy_paste.Action
			Return DoPaste()
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_edit_clear() As Boolean Handles mnu_edit_clear.Action
			Return DoClear()
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_edit_copy() As Boolean Handles mnu_edit_copy.Action
			Return DoCopy()
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_edit_cut() As Boolean Handles mnu_edit_cut.Action
			Return DoCut()
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_edit_selall() As Boolean Handles mnu_edit_selall.Action
			Return DoSelectAll()
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Function DoClear() As Boolean
		  SelText = ""
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoCopy() As Boolean
		  Dim c As New Clipboard
		  
		  If SelText.Len > 0 Then
		    c.SetText SelText.FormatLocalEndOfLine
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoCut() As Boolean
		  Dim c As New Clipboard
		  
		  If SelText.Len > 0 Then
		    c.SetText SelText.FormatLocalEndOfLine
		    SelText = ""
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoPaste() As Boolean
		  Dim c As New Clipboard
		  
		  If c.TextAvailable Then
		    Try
		      SelText = ConvertEncoding(c.Text, encodings.UTF8)
		    Catch ex
		      App.DebugWriter.Write("Can't convert string to paste, string is '" + c.text + "'", 1)
		    End Try
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoSelectAll() As Boolean
		  SelStart = 0
		  SelLength = Len(Text)
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineNumAtCharPos(v As Integer) As Integer
		  // Calling the overridden superclass method.
		  // Note that this may need modifications if there are multiple  choices.
		  // Possible calls:
		  // result1 as Integer = LineNumAtCharPos(v As Integer) -- From TextArea
		  // result1 as Integer = LineNumAtCharPos(v As Integer) -- From TextEdit
		  
		  //
		  // Several Feedback cases (514561, for example) report an issue on MacOS with
		  // LineNumAtCharPos. This adjusts for that issue by advancing one character if
		  // the previous character is an EOL.
		  //
		  // Also, Feedback 54077 shows that Linux returns a 1-based result. Adjust to 0-based
		  // to make it consistent with the other platforms.
		  //
		  Dim adjustLineNum As Integer = 0
		  #If TargetMacOS
		    Dim c As String
		    Try
		      If v > 0 And Mid(Me.Text, v - 1, 1) = EndOfLine.UNIX Then // Not .Macintosh, which returns 0x0D
		        v = v + 1
		      End If
		    End Try
		  #EndIf
		  
		  #If TargetLinux
		    Try
		      If Mid(Me.Text, v, 1) = EndOfLine.UNIX Then
		        adjustLineNum = -1
		      End If
		    End Try
		  #EndIf
		  
		  Return Max(Super.LineNumAtCharPos(v) + adjustLineNum, 0)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualMenuAction(hitItem as MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EnableMenuItems()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChange()
	#tag EndHook


	#tag Note, Name = Overview
		Subclassed from EditField, SEditField has additional code to support
		Cut, Paste, Clear and Copy menu items and accelerators.
		
		Assumes that a control with a name starting "edt" is a standard
		EditField, but one starting "edf" is a fixed-font EditField.
	#tag EndNote


	#tag Constant, Name = ACTION_CLEAR, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ACTION_COPY, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ACTION_CUT, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ACTION_PASTE, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ACTION_SELECTALL, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant


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
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
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
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			InitialValue=""
			Type="String"
			EditorType="DataSource"
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
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
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
			Name="HideSelection"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
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
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
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
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
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
			Name="LockRight"
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
			Name="Multiline"
			Visible=true
			Group="Appearance"
			InitialValue=""
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
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			InitialValue=""
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
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
