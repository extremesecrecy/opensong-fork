#tag Class
Protected Class SEditField
Inherits TextArea
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim State As Boolean = SelLength > 0
		  Dim c As New Clipboard
		  Dim m as MenuItem
		  
		  m = new MenuItem( App.T.Translate("shared/cut/@caption"), ACTION_CUT )
		  m.Enabled = State And Me.Enabled And Not Me.ReadOnly
		  base.Append(m)
		  
		  m = new MenuItem( App.T.Translate("shared/copy/@caption"), ACTION_COPY )
		  m.Enabled = State
		  base.Append(m)
		  
		  m = new MenuItem( App.T.Translate("shared/paste/@caption"), ACTION_PASTE )
		  m.Enabled = Me.Enabled And Not Me.ReadOnly And c.TextAvailable
		  base.Append(m)
		  
		  m = new MenuItem( App.T.Translate("shared/clear/@caption"), ACTION_CLEAR )
		  m.Enabled = State And Me.Enabled
		  base.Append(m)
		  
		  base.Append( new MenuItem( MenuItem.TextSeparator ) )
		  
		  m = new MenuItem( App.T.Translate("shared/selectall/@caption"), ACTION_SELECTALL )
		  m.Enabled = Len(Text) > 0
		  base.Append(m)
		  
		  Call ConstructContextualMenu(base, x, y)
		  
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
		Sub GotFocus()
		  SelStart = 0
		  SelLength = Len(Text)
		  RaiseEvent GotFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If RaiseEvent KeyDown(Key) Then
		    Return True
		  End If
		  #If TargetWin32
		    If Keyboard.ControlKey And Not (Keyboard.AltKey Or Keyboard.ShiftKey Or Keyboard.OSKey) Then
		      Select Case Key
		      Case Chr(1)  // Crtl+A
		        Return DoSelectAll
		      Case Chr(3)  // Crtl+C
		        Return DoCopy
		      Case Chr(22)  // Ctrl+V
		        Return DoPaste
		      Case Chr(24)  // Ctrl+X
		        Return DoCut
		      End Select
		    ElseIf Keyboard.AltKey And Not (Keyboard.ControlKey Or Keyboard.ShiftKey Or Keyboard.OSKey) Then
		      Select Case Key
		      Case Chr(ASC_KEY_INSERT)
		        Return DoCopy
		      End Select
		    ElseIf Keyboard.ShiftKey And Not (Keyboard.ControlKey Or Keyboard.AltKey Or Keyboard.OSKey) Then
		      Select Case Key
		      Case Chr(ASC_KEY_INSERT)
		        Return DoPaste
		      Case Chr(ASC_KEY_DEL)
		        Return DoCut
		      End Select
		    End If
		  #EndIf
		  
		  Return false
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  SelLength = 0
		  SelStart = 0
		  RaiseEvent LostFocus
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  If TextColor = Color.Black Then TextColor = Color.TextColor
		  If BackgroundColor = Color.White Then 
		    #if TargetWindows then
		      If Not BackColorInitialized Then
		        InitBackColors()
		        If Not BackColorInitialized Then
		          EditBackColor = BackColor  // retrieving colors failed. Use this instance as pattern for all
		          BackColorInitialized = True
		        End If
		      End If
		      BackgroundColor = EditBackColor
		    #ElseIf TargetLinux
		      If Color.IsDarkMode Then
		        // FillColor is not the right one, but getting the right one is near impossible.
		        // and it should not be done. for now, FollColor (the window background color)
		        // must do (That is what MacOS uses, by making the background transparent)
		        BackgroundColor = Color.FillColor
		      End If
		    #endif
		  End If
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub TextChange()
		  // filter out harmful control characters
		  Dim str As String
		  
		  // This sanity check on SelStart and SelLength is needed because there
		  // is a reproduceable but not predictable issue with the program seeing a 
		  // different value than is actually in the object per the debugger.
		  Dim sl As Integer = SelLength
		  Dim ss As Integer = SelStart
		  If sl > Text.Len + 1 Then sl = 0
		  If ss > Text.Len Then ss = 0
		  SelStart = ss
		  SelLength = sl
		  
		  If SelLength = 0 Then
		    If SelStart > 0 Then
		      str = Text.Mid(SelStart, 1)
		      If str.CleanXML.Len = 0 Then
		        SelStart = SelStart - 1
		        SelLength = 1
		        SelText = ""
		      End If
		    End If
		  Else
		    str = SelText.CleanXML
		    If str <> SelText Then
		      SelText = str
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
		  If Me.Enabled And Not Me.ReadOnly Then
		    Dim c As New Clipboard
		    
		    If SelText.Len > 0 Then
		      c.SetText SelText.FormatLocalEndOfLine
		      SelText = ""
		    End If
		    
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DoPaste() As Boolean
		  Dim c As New Clipboard
		  
		  If Me.Enabled And Not Me.ReadOnly Then
		    If c.TextAvailable Then
		      Try
		        SelText = ConvertEncoding(c.Text, encodings.UTF8)
		      Catch ex
		        App.DebugWriter.Write("Can't convert string to paste, string is '" + c.text + "'", 1)
		      End Try
		    End If
		    
		    Return True
		  Else
		    Return False
		  End If
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
		Shared Sub InitBackColors()
		  If BackColorInitialized Then Return
		  
		  ReadOnlyBackColor = Color.FillColor
		  EmptyBackColor = Color.FillColor
		  EditBackColor = Color.FillColor
		  
		  #if TargetWin32 then
		    If not Color.IsDarkMode Then
		      Declare Function GetSysColor Lib "user32" (nIndex As Int32) As UInt32
		      Declare Function GetSysColorBrush Lib "user32" (nIndex As Int32) As Integer
		      Try
		        Dim cIdx As Int32 = 5  // COLOR_WINDOW
		        If GetSysColorBrush(cIdx) <> 0 Then  // this returns 0 if cIdx is not supported
		          Dim ci As Uint32 = GetSysColor(cIdx)
		          EditBackColor = Color(ci)
		          BackColorInitialized = True
		        End If
		      Catch
		        EditBackColor = Color.FillColor
		      End Try
		    End If
		  #endif
		  
		End Sub
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

	#tag Method, Flags = &h0
		Sub SetUseState(NewState As UseState)
		  // on Linux, changing RectControl.BackColor has no effect after it was first drawn
		  // (Xojo 2025r2.1, Linux Mint 22.1, Cinnamon)
		  // so, keep the default, i.e. do not change it here
		  // keep the default also on macOS
		  
		  #if TargetWindows then
		    If Not BackColorInitialized Then
		      InitBackColors()
		      If Not BackColorInitialized Then
		        EditBackColor = BackColor  // retrieving colors failed. use this instance as pattern for all
		        BackColorInitialized = True
		      End If
		    End If
		  #endif
		  Select Case NewState
		  Case UseState.Editable
		    If Not Enabled Then Enabled = True
		    If ReadOnly Then ReadOnly = False
		    #if TargetWindows then
		      If BackColor <> EditBackColor Then
		        BackColor = EditBackColor
		      End If
		    #endif
		  Case UseState.ReadOnly
		    If Not Enabled Then Enabled = True
		    If Not ReadOnly Then ReadOnly = True
		    #if TargetWindows then
		      If BackColor <> ReadOnlyBackColor Then
		        backColor = ReadOnlyBackColor
		      End If
		    #endif
		  Case UseState.Empty
		    If Enabled Then Enabled = False
		    If ReadOnly Then ReadOnly = False
		    #if TargetWindows then
		      If BackColor <> EmptyBackColor Then
		        backColor = EmptyBackColor
		      End If
		    #endif
		    // The following was intended as a safeguard, but it has the side effect of tagging the song or set as edited.
		    // Although I could try to save and resore the edit state, this would introduce a dependency to MainWindow,
		    // and it would depend on the TextChanged event beeing handled synchronously
		    'If Text <> "" Then
		    'Text = ""
		    'End If
		  End Select
		End Sub
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
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
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


	#tag Property, Flags = &h0
		Shared BackColorInitialized As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared EditBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared EmptyBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared ReadOnlyBackColor As Color
	#tag EndProperty


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


	#tag Enum, Name = UseState, Type = Integer, Flags = &h0
		Editable
		  ReadOnly
		Empty
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
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
			Name="AllowSpellChecking"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="boolean"
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
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
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
			Name="Format"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="MaximumCharactersAllowed"
			Visible=true
			Group="Behavior"
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
			Name="Text"
			Visible=true
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
			EditorType="Color"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
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
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
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
			Name="ValidationMask"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
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
