#tag Class
Protected Class SEditField
Inherits TextArea
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  If Me.Enabled Then
		    Dim State As Boolean = SelLength > 0
		    Dim c As New Clipboard
		    Dim m as MenuItem
		    
		    m = new MenuItem( App.T.Translate("shared/cut/@caption"), ACTION_CUT )
		    m.Enabled = State
		    base.Append(m)
		    
		    m = new MenuItem( App.T.Translate("shared/copy/@caption"), ACTION_COPY )
		    m.Enabled = State
		    base.Append(m)
		    
		    m = new MenuItem( App.T.Translate("shared/paste/@caption"), ACTION_PASTE )
		    m.Enabled = c.TextAvailable
		    base.Append(m)
		    
		    m = new MenuItem( App.T.Translate("shared/clear/@caption"), ACTION_CLEAR )
		    m.Enabled = State
		    base.Append(m)
		    
		    base.Append( new MenuItem( MenuItem.TextSeparator ) )
		    
		    m = new MenuItem( App.T.Translate("shared/selectall/@caption"), ACTION_SELECTALL )
		    m.Enabled = Len(Text) > 0
		    base.Append(m)
		    
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
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
		  
		  mnu_edit_clear.Enabled = State
		  mnu_edit_cut.Enabled = State
		  mnu_edit_copy.Enabled = State
		  mnu_edit_selall.Enabled = Len(Text) > 0
		  
		  mnu_copy_paste.Enabled = c.TextAvailable
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
		    c.SetText SelText
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoCut() As Boolean
		  Dim c As New Clipboard
		  
		  If SelText.Len > 0 Then
		    c.SetText SelText
		    SelText = ""
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoPaste() As Boolean
		  Dim c As New Clipboard
		  Dim f As FontFace
		  
		  If c.TextAvailable Then
		    Try
		      SelText = ConvertEncoding(c.Text, encodings.UTF8)
		    Catch ex
		      App.DebugWriter.Write("Can't convert string to paste, string is '" + c.text + "'", 1)
		    End Try
		    
		    If Left(Name, 3) = "edf" Then // Fixed font EditField
		      f = SmartML.GetValueF(App.MyMainSettings.DocumentElement, "fonts/fixed_width")
		      SelTextFont = f.Name
		      SelTextSize = f.Size
		      SelBold = f.Bold
		      SelItalic = f.Italic
		      SelUnderline = f.Underline
		    End If
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
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HideSelection"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LimitText"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineHeight"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineSpacing"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiline"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Styled"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
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
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="80"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
