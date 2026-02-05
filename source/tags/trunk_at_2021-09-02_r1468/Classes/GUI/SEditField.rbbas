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
		  #pragma Unused b
		  
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
		        Beep
		        Return
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
		    Try
		      If v > 0 And Mid(Me.Text, v - 1, 1) = EndOfLine.UNIX Then // Not .Macintosh, which returns 0x0D
		        v = v + 1
		      End If
		    Catch
		    End Try
		  #EndIf
		  
		  #If TargetLinux
		    Try
		      If Mid(Me.Text, v, 1) = EndOfLine.UNIX Then
		        adjustLineNum = -1
		      End If
		    Catch
		    End Try
		  #EndIf
		  
		  Return Max(Super.LineNumAtCharPos(v) + adjustLineNum, 0)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base As MenuItem, x As Integer, y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualMenuAction(hitItem As MenuItem) As Boolean
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
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HideSelection"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LimitText"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiline"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Styled"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			EditorType="Enum"
			InheritedFrom="EditField"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="EditField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="80"
			Type="Integer"
			InheritedFrom="EditField"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
