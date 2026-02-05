#tag Class
Protected Class Translator
	#tag Method, Flags = &h0
		Sub Constructor(f As FolderItem)
		  If f <> Nil And f.Exists Then
		    File = f
		    Document = SmartML.XDocFromFile(f)
		  End If
		  
		  'Else leave File and Document as Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFile() As FolderItem
		  Return file
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNode(path As String) As XmlNode
		  If Document = Nil Then Return Nil
		  If Len(path) = 0 Then Return Nil
		  
		  App.DebugWriter.Write "Translator.GetNode: " + "language/"+path
		  
		  Dim list As XmlNodeList
		  list = Document.Xql("/language/"+path)
		  
		  If list.Length = 0 Then Return Nil
		  Return list.Item(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLoaded() As Boolean
		  If Document <> Nil And Document.DocumentElement <> Nil Then Return True
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPopup(path As String, popCont As PopupMenu)
		  //++
		  // Load the possible selections for a PopupMenu control
		  //
		  // Ed Palmer, November 2007
		  //--
		  Dim valueNodes As XmlNodeList
		  Dim tagNode As XmlAttribute
		  
		  If Left(path, 1) <> "/" Then path = "/" + path
		  path = "/language" + path + "/value"
		  
		  Try
		    valueNodes = Document.Xql(path)
		  Catch e As XmlException
		    App.DebugWriter.Write "Translator.LoadPopup: XML error looking for '" + path + "'", 1
		    App.DebugWriter.Write "Error is '" + RuntimeException(e).Message, 1
		    Return
		  End Try
		  
		  For i As Integer = 0 To valueNodes.Length - 1
		    popCont.AddRow(valueNodes.Item(i).GetText)
		    tagNode = valueNodes.Item(i).GetAttributeNode("tag")
		    If Not (tagNode Is Nil) Then
		      popCont.RowTag(i) = tagNode.Value
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseControlName(c As Control) As String
		  Dim name As String
		  Dim parts() As String
		  
		  name = c.Name
		  if name.Left(1) = "/" Then name = name.mid(2)
		  parts = Split(name, "_")
		  
		  //
		  // First element is control type, should be three characters
		  //
		  // If the last element is numeric, drop it (control "array")
		  //
		  // If there are more than two elements after dropping the numeric,
		  // delete the second one (will be replaced by the parent control's tag)
		  //
		  If UBound(parts) < 1 Then Return name // Can't do anything with a non-conforming name
		  
		  If parts(0).Len <> 3 Then Return name // Leading element is not in correct format
		  
		  If Val(parts(UBound(parts))) > 0 Then parts.Remove(UBound(parts))
		  
		  If UBound(parts) > 1 Then parts.Remove(1)
		  
		  name =  Join(parts, "_")
		  Return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseHierarchicalName(tag As String, cont As RectControl) As String
		  Dim ret As String
		  Dim parent As RectControl
		  Dim contName As String
		  Dim parentParts() As String
		  
		  contName = ParseControlName(cont)
		  ret = tag + contName.mid(5).Lowercase
		  
		  parent = cont.Parent
		  
		  // Validate the parent control
		  If parent Is Nil Or (Not (parent IsA RectControl)) Then
		    App.DebugWriter.Write "Translator.ParseHierarchicalName: Nil parent for '" +_
		    cont.Name + "', returning " + ret, 4
		    Return ret
		  End If
		  
		  // If the parent's name is "nil_something"  then look to its parent
		  If parent.Name.Left(4) = "nil_" Then
		    If parent.Parent Is Nil Or (Not (parent.Parent IsA RectControl)) Then
		      App.DebugWriter.Write "Translator.ParseHierarchicalName: Nil grandparent for '" +_
		      cont.Name + "', returning " + ret, 4
		      Return ret
		    Else
		      parent = parent.Parent
		      App.DebugWriter.Write "Translator.ParseHierarchicalName: Using grandparent for '" +_
		      cont.Name + "', grandparent is '" + parent.Name + "'", 5
		    End If
		  End If
		  
		  // Finally, take the tag (window prefix) and add the third part of the parent to the
		  // second part of the control
		  
		  parentParts = Split(parent.Name, "_")
		  Select Case UBound(parentParts)
		  Case 0
		    App.DebugWriter.Write "Translator.ParseHierarchicalName: parent control for '" +_
		    cont.Name + "' has too few components: " + parent.Name, 1
		    
		  Case 1
		    parentParts.Remove 0
		    ret = Lowercase(Tag + Join(parentParts, "_") + "/" + contName.Mid(5))
		    
		  Case Else
		    parentParts.Remove 0
		    parentParts.Remove 0
		    ret = Lowercase(Tag + Join(parentParts, "_") + "/" + contName.Mid(5))
		  End Select
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Translate(from As String, ByRef found As Boolean, args() As String) As String
		  If Document = Nil Then Return ""
		  If Len(from) = 0 Then Return ""
		  
		  Dim list As XmlNodeList
		  
		  // Every so often, two /'s get in together
		  from = ReplaceAll(from, "//", "/")
		  
		  Try
		    list = Document.Xql("/language/"+from)
		  Catch xml As XmlException
		    Dim msg As String
		    msg = "In Translator.Translate, internal error with language file looking up '" + from + "': " + xml.Line + ": " + xml.Node
		    App.DebugWriter.Write msg, 1
		    MsgBox msg
		  End Try
		  
		  Dim temp As String
		  
		  If list = Nil Or list.Length = 0 Then
		    found = False
		    Return ""
		  End If
		  
		  If list.Item(0) IsA XmlAttribute Then
		    temp = list.Item(0).Value
		  ElseIf list.Item(0).ChildCount = 0 Then
		    found = False
		    Return ""
		  Else
		    temp = list.Item(0).FirstChild.Value
		  End If
		  found = True
		  
		  If Left(temp, 5) = "link(" Then
		    Return Translate(Mid(temp, 6, temp.RTrim.Len-6), found, args)
		  End If
		  
		  Dim i As Integer
		  For i = 0 To UBound(args)
		    temp = ReplaceAll(temp, "%" + Str(i+1), args(i))
		  Next i
		  temp = Trim(temp)
		  
		  Return temp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Translate(from As String, ByRef found As Boolean, ParamArray args As String) As String
		  Return Translate(from, found, args)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Translate(from As String, ParamArray args As String) As String
		  Dim found As Boolean
		  Dim result As String
		  result = Translate(from, found, args)
		  If not found Then
		    // Don't bother flagging the false lookups for '/shared/...'
		    If from.InStr("shared") = 0 Then
		      App.DebugWriter.Write(Chr(9) + "In Translate: Can't find " + from, 4)
		    End If
		  End If
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateMenu(menuTag As String, menu As MenuItem)
		  Dim i As Integer
		  Dim tfrom, tto As String
		  Dim appendDots As Boolean
		  Dim menuNode As XmlNode
		  Dim keyboardShortcut As String
		  Dim numItems As Integer
		  Dim thisItem As MenuItem
		  
		  numItems = menu.Count
		  
		  For i = 0 To numItems - 1
		    thisItem = menu.Item(i)
		    tfrom = Lowercase(Mid(thisItem.Name, InStr(5, thisItem.Name, "_")+1))
		    appendDots = False
		    If Right(thisItem.Text, 3) = "..." Then appendDots = True
		    If tfrom.Len > 1 Then ' skips bag text and separators
		      tto = Translate(menuTag + "/" + tfrom + "/@caption")
		      menuNode = GetNode(menuTag + "/" + tfrom)
		      keyboardShortcut = ""
		      #if TargetWin32 Then
		        keyboardShortcut = SmartML.GetValue(menuNode, "@windowskey", False)
		      #elseif TargetMacOS
		        keyboardShortcut = SmartML.GetValue(menuNode, "@mackey", False)
		      #elseif TargetLinux
		        keyboardShortcut = SmartML.GetValue(menuNode, "@linuxkey", False)
		      #endif
		      If keyboardShortcut <> "" Then 
		        thisItem.KeyboardShortcut = keyboardShortcut
		      End If
		      tto = ReplaceAll(tto, "_", "&")
		      If tto.Len > 0 Then
		        If appendDots Then tto = tto + "..."
		        thisItem.Text = tto
		      End if
		      If thisItem.Count > 0 Then
		        TranslateMenu menuTag + "/" + tfrom, thisItem
		      End If
		    End If
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateWindow(win As Window, tag As String, fonts() As FontFace, doCaptions As Boolean = True, doFonts As Boolean = True)
		  
		  ' If you're getting XML exceptions, chances are that the window title is not a valid XML tag. Fix it.
		  ' fonts: 1 = groups; 2 = labels; 3 = text fields; 4 = headings; 5 = buttons; 6 = fixed-width
		  
		  Dim i, j As Integer
		  Dim cont As Control
		  Dim name, old As String
		  Dim temp As String
		  Dim controlUsage As String
		  Dim parts() As String
		  Dim txFound As Boolean
		  Dim txText As String
		  
		  Dim staticCont As Label
		  Dim groupCont As GroupBox
		  Dim buttonCont As PushButton
		  Dim checkCont As CheckBox
		  Dim radioCont As RadioButton
		  Dim tabCont As TabPanel
		  Dim sbuttonCont As SButton
		  Dim listCont As ListBox
		  Dim editCont As TextArea
		  Dim popCont As PopupMenu
		  Dim sldCont As Slider
		  
		  If UBound(fonts) < 6 Then doFonts = False
		  
		  tag = tag + "/"
		  App.DebugWriter.Write "Translator.TranslateWindow: Begin translating window " + win.Title + " with tag " + tag, 4
		  
		  For i = 0 To win.ControlCount - 1
		    App.DebugWriter.Write "Translator.TranslateWindow: On control " + win.Control(i).Name, 5
		    cont = win.Control(i)
		    name = ParseControlName(cont)
		    controlUsage = name.Left(3)
		    
		    If cont IsA Label Then
		      staticCont = Label(cont)
		      If doCaptions Then
		        name = ParseHierarchicalName(tag, staticCont) + kAttributeCaption
		        temp = Translate(name, txFound)
		        If txFound Then
		          If controlUsage = "lbl" Then
		            staticCont.Caption = temp '+ ":"
		          ElseIf controlUsage = "nte" Then
		            staticCont.Caption = "(" + temp + ")"
		          Else
		            staticCont.Caption = temp
		          End If
		        End If
		        
		        If doFonts And controlUsage = "hdr" Then
		          If fonts(4).Name.Len > 0 Then
		            staticCont.TextFont = fonts(4).Name
		            staticCont.TextSize = ValidTextSize(fonts(4).Size, fonts(4).Name)
		            staticCont.Bold = fonts(4).Bold
		            staticCont.Italic = fonts(4).Italic
		            staticCont.Underline = fonts(4).Underline
		          End If
		        ElseIf doFonts Then
		          If fonts(2).Name.Len > 0 Then
		            staticCont.TextFont = fonts(2).Name
		            staticCont.TextSize = ValidTextSize(fonts(2).Size, fonts(2).Name)
		            staticCont.Bold = fonts(2).Bold
		            staticCont.Italic = fonts(2).Italic
		            staticCont.Underline = fonts(2).Underline
		            If controlUsage = "nte" Then staticCont.TextSize = ValidTextSize(fonts(2).Size - 1, fonts(2).Name)
		          End If
		        End If
		      End If
		      
		      
		    ElseIf cont IsA GroupBox Then
		      groupCont = GroupBox(cont)
		      If doCaptions Then
		        temp = tag + Mid(name, 5) + kAttributeCaption
		        txText = Translate(temp, txFound)
		        If txFound Then
		          groupCont.Caption = txText
		        End If
		      End If
		      If doFonts And fonts(1).Name.Len > 0 Then
		        groupCont.TextFont = fonts(1).Name
		        groupCont.TextSize = ValidTextSize(fonts(1).Size, fonts(1).Name)
		        groupCont.Bold = fonts(1).Bold
		        groupCont.Italic = fonts(1).Italic
		        groupCont.Underline = fonts(1).Underline
		      End If
		      
		      
		    ElseIf cont IsA CheckBox Then
		      checkCont = CheckBox(cont)
		      If doCaptions Then
		        txText = Translate(ParseHierarchicalName(tag, checkCont) + kAttributeCaption, txFound)
		        If txFound Then
		          checkCont.Caption = txText
		        End If
		      End If
		      
		      If doFonts And fonts(2).Name.Len > 0 Then
		        checkCont.TextFont = fonts(2).Name
		        checkCont.TextSize = ValidTextSize(fonts(2).Size, fonts(2).Name)
		        checkCont.Bold = fonts(2).Bold
		        checkCont.Italic = fonts(2).Italic
		        checkCont.Underline = fonts(2).Underline
		      End If
		      
		      
		    ElseIf cont IsA TextArea Then
		      editCont = TextArea(cont)
		      If doFonts And controlUsage = "edf" Then
		        If fonts(6).Name.Len > 0 Then
		          editCont.TextFont = fonts(6).Name
		          editCont.TextSize = ValidTextSize(fonts(6).Size, fonts(6).Name)
		          editCont.Bold = fonts(6).Bold
		          editCont.Italic = fonts(6).Italic
		          editCont.Underline = fonts(6).Underline
		        End If
		        
		      ElseIf doFonts Then
		        If fonts(3).Name.Len > 0 Then
		          editCont.TextFont = fonts(3).Name
		          editCont.TextSize = ValidTextSize(fonts(3).Size, fonts(3).Name)
		          editCont.Bold = fonts(3).Bold
		          editCont.Italic = fonts(3).Italic
		          editCont.Underline = fonts(3).Underline
		        End If
		      End If
		      
		      
		    ElseIf cont IsA PopupMenu Then
		      popCont = PopupMenu(cont)
		      If doFonts And fonts(3).Name.Len > 0 Then
		        popCont.TextFont = fonts(3).Name
		        popCont.TextSize = ValidTextSize(fonts(3).Size, fonts(3).Name)
		        popCont.Bold = fonts(3).Bold
		        popCont.Italic = fonts(3).Italic
		        popCont.Underline = fonts(3).Underline
		      End If
		      
		      
		    ElseIf cont IsA SButton Then
		      sbuttonCont = SButton(cont)
		      If doCaptions Then
		        old = sbuttonCont.Label
		        If controlUsage = "btn" Then
		          parts = Split(sbuttonCont.Name, "_")
		          parts.Remove 0
		          name = ParseHierarchicalName(tag, sbuttonCont) + kAttributeCaption
		          temp = Translate(name, txFound)
		          If Not txFound Then
		            // check if it is in shared
		            temp = Translate(kTagShared + Join(parts, "_") + kAttributeCaption, txFound)
		          End If
		          If txFound Then
		            If old.Right(3) = "..." Then temp = temp + "…"
		            sbuttonCont.Label = temp
		          Else
		            App.DebugWriter.Write(Chr(9) + "In Translate: Can't find " + name, 4)
		          End If
		        End If
		      End If
		      
		      If doFonts And fonts(5).Name.Len > 0 Then sbuttonCont.SetFont fonts(5)
		      
		      
		    ElseIf cont IsA RadioButton Then
		      radioCont = RadioButton(cont)
		      If doCaptions Then
		        txText = Translate(ParseHierarchicalName(tag, radioCont) + kAttributeCaption, txFound)
		        If txFound Then
		          radioCont.Caption = txText
		        End If
		      End If
		      If doFonts And fonts(2).Name.Len > 0 Then
		        radioCont.TextFont = fonts(2).Name
		        radioCont.TextSize = ValidTextSize(fonts(2).Size, fonts(2).Name)
		        radioCont.Bold = fonts(2).Bold
		        radioCont.Italic = fonts(2).Italic
		        radioCont.Underline = fonts(2).Underline
		      End If
		      
		      
		    ElseIf cont IsA ListBox Then
		      listCont = Listbox(cont)
		      If doCaptions Then
		        If listCont.ColumnCount > 1 Then
		          temp = ParseHierarchicalName(tag, listCont)
		          For j = 0 To listCont.ColumnCount - 1
		            txText = Translate(temp + kAttributeHead + Str(j+1), txFound)
		            If txFound Then
		              listCont.Heading(j) = txText
		            End If
		          Next j
		        End If
		        
		        If doFonts And fonts(3).Name.Len > 0 Then
		          listCont.TextFont = fonts(3).Name
		          listCont.TextSize = ValidTextSize(fonts(3).Size, fonts(3).Name)
		          listCont.Bold = fonts(3).Bold
		          listCont.Italic = fonts(3).Italic
		          listCont.Underline = fonts(3).Underline
		        End If
		      End If
		      
		      
		    ElseIf cont IsA TabPanel Then
		      tabCont = TabPanel(cont)
		      If doCaptions Then
		        temp = ParseHierarchicalName(tag, tabCont)
		        For j = 0 To tabCont.PanelCount - 1
		          txText = Translate(temp + kAttributeHead + Str(j+1), txFound)
		          If txFound Then
		            tabCont.Caption(j) = txText
		          End If
		        Next j
		      End If
		      If doFonts And fonts(1).Name.Len > 0 Then
		        //++
		        //There Is a drawing bug In Windows on 2018 r1 And higher that
		        //makes the last tab draw incorrectly If the font Is changed
		        //--
		        #If TargetWindows And RBVersion > 2018.01
		          #Pragma Warning "Workaround to set font for TabPanel...revisit at each new Xojo version (Feedback Case 54743)"
		        #Else
		          tabCont.TextFont = fonts(1).Name
		          tabCont.TextSize = ValidTextSize(fonts(1).Size, fonts(1).Name)
		          tabCont.Bold = fonts(1).Bold
		          tabCont.Italic = fonts(1).Italic
		          tabCont.Underline = fonts(1).Underline
		        #EndIf
		        #If TargetWindows And RBVersion > 2018.01
		          tabCont.Width = tabCont.Width + 1
		          tabCont.Width = tabCont.Width - 1
		        #EndIf
		      End If
		      
		      
		    ElseIf cont IsA PushButton Then
		      buttonCont = PushButton(cont)
		      If doCaptions Then
		        old = buttonCont.Caption
		        If controlUsage = "btn" Then
		          parts = Split(buttonCont.Name, "_")
		          parts.Remove 0
		          name = ParseHierarchicalName(tag, buttonCont) + kAttributeCaption
		          temp = Translate(name, txFound)
		          If Not txFound Then
		            // check if it is in shared
		            temp = Translate(kTagShared + Join(parts, "_") + kAttributeCaption, txFound)
		          End If
		          If txFound Then
		            If old.Right(3) = "..." Then temp = temp + "…"
		            buttonCont.Caption = temp
		          Else
		            App.DebugWriter.Write(Chr(9) + "In Translate: Can't find " + name, 4)
		          End If
		        End If
		      End If
		      If doFonts And fonts(5).Name.Len > 0 Then
		        buttonCont.TextFont = fonts(5).Name
		        buttonCont.TextSize = ValidTextSize(fonts(5).Size, fonts(5).Name)
		        buttonCont.Bold = fonts(5).Bold
		        buttonCont.Italic = fonts(5).Italic
		        buttonCont.Underline = fonts(5).Underline
		      End If
		      
		      
		    ElseIf cont IsA Slider Then
		      sldCont = Slider(Cont)
		      If doCaptions Then
		        txText = Translate(ParseHierarchicalName(tag, sldCont) + "/@helptag", txFound)
		        If txFound Then
		          sldCont.HelpTag = txText
		        End If
		      End If
		    End If
		    
		  Next i
		  
		  If doCaptions Then
		    If win.MenuBar <> Nil Then TranslateMenu "main_menu", win.MenuBar
		    win.Title = Translate(tag + kAttributeTitle)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ValidTextSize(s As Integer, n As String) As Integer
		  If s > 0 Then Return s
		  If s < 0 Then s = 0
		  If Not (n = "System" Or n = "SmallSystem") Then s = 10
		  Return s
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Document As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected File As FolderItem
	#tag EndProperty


	#tag Constant, Name = kAttributeCaption, Type = String, Dynamic = False, Default = \"/@caption", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAttributeHead, Type = String, Dynamic = False, Default = \"/@head", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAttributeTitle, Type = String, Dynamic = False, Default = \"@title", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTagShared, Type = String, Dynamic = False, Default = \"/shared/", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
