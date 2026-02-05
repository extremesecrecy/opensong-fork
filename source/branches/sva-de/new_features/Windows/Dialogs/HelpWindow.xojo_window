#tag Window
Begin Window HelpWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   11
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   528
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Help Topics"
   Visible         =   True
   Width           =   695
   Begin TabPanel nil_help_tabs
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   459
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   21
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Presentation Keys\rLyrics/Chords\rPresentation Field"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   665
      Begin TextArea edt_help_keys
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   True
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "Courier New"
         FontSize        =   12.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   419
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "nil_help_tabs"
         Italic          =   False
         Left            =   31
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "<h1>Presentation Keys</h1>\r\n\r\nThe Presentation is controlled with the following keys:\r\n\r\nEsc Key: End the presentation.\r\nUp Arrow, 8 on Numpad, Backspace: Go to Previous Slide.\r\nDown Arrow, 2 on Numpad, Space Key: Go to Next Slide.\r\nLeft Arrow, 4 on Numpad: Go to Previous item in set.\r\nRight Arrow, 6 on Numpad: Go to Next item in set.\r\nQ Key: Insert a new song into the presentation.\r\nA Key: Insert a new Alert.\r\nS Key: Insert a new scripture into the presentation.\r\nW Key: Fade to White screen.\r\nK Key: Fade to Black screen.\r\nL Key: Display OpenSong Logo.\r\nH Key: Hide Text, Show Background image only.\r\nF Key: Freezes Presentation(i.e. prevents displaying new slide, allowing you to change current slide\r\nwithout affecting the presentation, press N to unfreeze).\r\nN Key: Normal mode(get out of black screen, etc.)\r\nB Key: Go to Bridge(as denoted by a [B#] in song\r\neditor). If there is more than one Bridge,\r\nthen pressing the B key will move to the next Bridge.\r\nC Key: Go to Chorus(as denoted by a [C#] in song editor). If there is more than one chorus,\r\nthen pressing the C key will move to the next chorus.\r\nT Key: Go to Tag(as denoted by a [T#] in song editor). If there is more than one Tag,\r\nthen pressing the T key will move to the next Tag.\r\nP Key: Go to Pre-Chorus(as denoted by a [P#] in song editor). If there is more than one Pre-Chorus,\r\nthen pressing the P key will move to the next Pre-Chorus.\r\n1-9 Key: Go to Verse#(as denoted by a [V#] in song editor).\r\n\r\nNote the Numpad keys function depends on the state of the NumLock key.\r\n"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   645
      End
      Begin TextArea edt_help_lyrics
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   True
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "Courier New"
         FontSize        =   12.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   419
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "nil_help_tabs"
         Italic          =   False
         Left            =   31
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "<h1>OpenSong Lyrics / Chords Format</h1>\r\n\r\nSongs are broken down into the following line types: Section lines, Chord lines, Lyric lines, and Comment lines. A simple song might look something like this:\r\n<pre><b>\r\n;Remember to sing the verse twice.\r\n[V]\r\n.G                C\r\n This is a verse, this is a verse.\r\n.D          G\r\n That is so cool.\r\n\r\n[C]\r\n.G               C/D  D     C\r\n Sing the chorus now, yeah, yeah,\r\n.G           C       D/F# G\r\n This is the dumbest song ever.</b></pre>\r\n\r\nLets look at each line type...\r\n\r\n<h2>Section Lines</h2>\r\n\r\nSection lines are delimited by braces: [ and ]. A ""section"" includes any lines following this section line until the next section line or the end of the song. Sections are not displayed in the Presenter, but they are used to determine the order of the slides. Any text inside the braces is acceptable, but the following have special effects:\r\n\r\n<b><i>[V]: </i></b>Verses. Lead sheets will automatically remove the ""V"" and print the remaining number with a circle around it. Examples: [V1], [V2], [V3].\r\n\r\n<b><i>[C]: </i></b>Chorus. Lead sheets will automatically display ""Chorus"" followed by any extra text (see examples). ""Chorus"" will be printed with a square around it. Examples: [C], [C2], [CModulation].\r\n\r\n<b><i>[P]: </i></b>Pre-chorus. Lead sheets will automatically display ""Pre-chorus"" followed by any extra text (see examples). ""Pre-chorus"" will be printed with horizontal lines above it and below it. Examples: [P], [P2].\r\n\r\n<b><i>[B]: </i></b>Bridge. Lead sheets will automatically display ""Bridge"" followed by any extra text (see examples). ""Bridge"" will be printed with a rounded square around it. Examples: [B], [B2].\r\n\r\n<b><i>[T]: </i></b>Tag. Lead sheets will automatically display ""Tag"" followed by any extra text (see examples). ""Tag"" will be printed with a rounded square around it. Examples: [T], [T2].\r\n\r\n<h2>Chord Lines</h2>\r\n\r\nChord lines start with a period: ""."". The first letter of each chord should line up with the lyrics under it. Chord lines don't display on the Presenter, only on lead sheets.\r\n\r\n<h2>Lyric Lines</h2>\r\n\r\nLyric lines start with a space: "" "". Lyrics generally line up with a previous chord line, but not necessarily.\r\n\r\n<b><i>""__""</i></b> If a word needs to be stretched to fit the chords, use underscores: ""_"". For example:\r\n<b><pre>\r\n.Gsus7 C    G\r\n Wel___come home.</pre></b>\r\n\r\nUnderscores are replaced by an appropriate ""-"" centered between the word parts. \r\n\r\n<b>""  ""</b> Multiple spaces between words are just fine. Underscores and multiple spaces are automatically removed in the Presenter. When printing lead sheets, both are dropped and dynamically adjusted to fit.\r\n\r\n<b>""|""</b> Vertical bars are replaced with spaces on lead sheets, and new lines in the Presenter.\r\n\r\n<b>""||""</b> Double vertical bars are replaced by ""new slide"" in the Presenter and ignored when printing lead sheets. Double vertical bars must be at the end of the line.\r\n\r\n<h3>Multiple Lyric Lines for One Chord Line!?</h3>\r\n\r\nMany songs have multiple verses which all share the same chords. Rather than repeat the chords in each verse section, we can group them by verse line rather than by verse number (like a hymnal). In this case, rather than start each lyric line with a space, start each lyric line with the verse number. Note that aligning multiple lyric lines with one chord line is a little trickier. It should look something like this:\r\n\r\n<b><i>(Don't try to sing it; the timing is terrible. *grin*)</i><pre>\r\n[V]\r\n.G     C               G\r\n1This  is verse        one;\r\n2This  is not verse    two;\r\n3Where did verse three go;\r\n4Ever__lasting is not  verse four;\r\n\r\n.G     D    C                D            G\r\n1Hear  my   song as I sing,  ""Mon_________key.""\r\n2Open  your ears to my       wonderful    song.\r\n3Why   are  we still         singing this song?\r\n4This  is   not the way that songs should sound.</pre>\r\n</b>\r\nAs far as the Presenter is concerned, the first character of each lyric line (i.e. 1, 2, 3, etc.) is appended to the section it is in. In other words, a section line of [V] with following lyric lines starting with 1, 2, 3, etc. would look like V1, V2, V3, etc.\r\n\r\n<h2>Comment Lines</h2>\r\n\r\nThere isn't much to a comment line. Comment lines are any lines that start with a semi-colon: "";"". Comment lines are skipped in the Presenter, and displayed using the Comment font in Lead Sheets.\r\n\r\n<h2>Column Breaks</h2>\r\n\r\nIf a line contains only three dashes (""---""), lyrics sheets will print with a second column starting at the column break."
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   645
      End
      Begin TextArea edt_help_presentation
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowStyledText =   True
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "Courier New"
         FontSize        =   12.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   419
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "nil_help_tabs"
         Italic          =   False
         Left            =   31
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "<h1>OpenSong Presentation Field</h1>\r\rThe presentation field contains a list of sections from the song's lyrics/chords field. Each section is seperated by a space. For example:\r<b>\rV1 C V2 C V3 C\r</b>\rThis example would display the first verse on the first slide, the chorus on the second slide, the second verse on the third slide, and so on.\r\rKeep in mind that if your song uses multi-lyric lines for a single chord line, that each lyric line's prefix is appended to it's section. See the ""Lyric Lines"" section under the ""Lyrics / Chords Format"" help for more information.\r\r<h3>Empty Presentation Field</h3>\r\rIf the presentation field is empty, then the Presenter will order the slides based on the order in the Lyrics / Chords field."
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   44
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   645
      End
   End
   Begin PushButton btn_help_print
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Print..."
      Default         =   False
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   494
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   486
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin PushButton btn_help_close
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Close"
      Default         =   False
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   596
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   486
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  nil_help_tabs.Value = 0
		  App.T.TranslateWindow Me, "help_topics", App.TranslationFonts
		  
		  edt_help_keys.Text = App.T.Translate("help_topics/keys")
		  HTMLFormatField edt_help_keys
		  edt_help_lyrics.Text = App.T.Translate("help_topics/format")
		  HTMLFormatField edt_help_lyrics
		  edt_help_presentation.Text = App.T.Translate("help_topics/presentation")
		  HTMLFormatField edt_help_presentation
		  
		  // resize windows approaching A4 paper proportions, still fitting nicely on the screen
		  Dim controlScreen As OpenSongUtils.OS_Screen = App.ControlScreen
		  #If RBVersion < 2012 Or TargetLinux
		    Me.Height = Min(Sqrt(2) * Me.Width, controlScreen.AvailableHeight - 100)
		    Me.Top = controlScreen.AvailableTop + (controlScreen.AvailableHeight - Me.Height) / 2 + 10
		  #Else
		    Dim winBounds As Xojo.Rect = Me.Bounds
		    winBounds.Height = Min((winBounds.Height - Me.Height) + Sqrt(2) * Me.Width, controlScreen.AvailableHeight - 80)
		    winBounds.Top = controlScreen.AvailableTop + (controlScreen.AvailableHeight - winBounds.Height) / 2
		    Me.Bounds = winBounds
		  #EndIf
		  
		  App.CenterInControlScreen(Me)
		  Timer.CallLater(50, AddressOf FixLinuxLayout)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub FixLinuxLayout()
		  // This code fixes an issue on Linux where the OK & Cancel buttons end up underneath the tab panel
		  #If TargetLinux
		    Dim tabTop As Integer = nil_help_tabs.Top
		    Dim tabHeight As Integer = nil_help_tabs.Height
		    Dim margin As Integer = Self.Height - (btn_help_close.top + btn_help_close.Height)
		    If tabTop + tabHeight > btn_help_close.top Then
		      nil_help_tabs.LockBottom = False
		      Self.Height = tabTop + tabHeight + btn_help_close.Height + (2 * margin)
		      nil_help_tabs.LockBottom = True
		    End If
		  #EndIf
		  
		  // this fixes an issue on Windows where the window does not keep it's new position when set in Open event
		  #If TargetWin32
		    App.CenterInControlScreen(Self)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HTMLFormatField(field As TextArea)
		  Dim i, j, k As Integer
		  Dim tag As String
		  
		  field.SelectionStart = 1
		  field.SelectionLength = Len(field.Text)
		  #If TargetLinux
		    field.SelectionFontName = "Ubuntu"
		  #Else
		    field.SelectionFontName = "Arial"
		  #EndIf
		  
		  i = InStr(field.Text, "<")
		  While i >= 1
		    j = InStr(i, field.Text, ">")
		    If j >= 1 Then
		      tag = Lowercase(Mid(field.Text, i+1, j-i-1))
		      field.SelectionStart = i - 1
		      field.SelectionLength = j - i + 1
		      field.SelectedText = ""
		      
		      k = InStr(i, field.Text, "</" + tag + ">")
		      If k >= 1 Then
		        field.SelectionStart = k - 1
		        field.SelectionLength = Len(tag) + 3
		        field.SelectedText = ""
		        
		        field.SelectionStart = i - 1
		        field.SelectionLength = k - i
		        If tag = "b" Then
		          field.SelectionBold = True
		        ElseIf tag = "i" Then
		          field.SelectionItalic = True
		        ElseIf tag = "u" Then
		          field.SelectionUnderline = True
		        ElseIf tag = "l" Then
		          field.SelectionAlignment = TextAlignments.Left
		        ElseIf tag = "c" Then
		          field.SelectionAlignment = TextAlignments.Center
		        ElseIf tag = "r" Then
		          field.SelectionAlignment = TextAlignments.Right
		        ElseIf tag = "h1" Then
		          field.SelectionBold = True
		          field.SelectionItalic = False
		          field.SelectionAlignment = TextAlignments.Left
		          field.SelectionFontSize = field.FontSize * 2.5
		        ElseIf tag = "h2" Then
		          field.SelectionBold = True
		          field.SelectionItalic = True
		          field.SelectionAlignment = TextAlignments.Left
		          field.SelectionFontSize = field.FontSize * 2
		        ElseIf tag = "h3" Then
		          field.SelectionBold = True
		          field.SelectionFontSize = field.FontSize * 1.5
		        ElseIf tag = "pre" Then
		          field.SelectionFontName = "Courier New"
		        End If
		        
		        field.SelectionStart = 0
		        field.SelectionLength = 0
		        i = InStr(i, field.Text, "<")
		      Else
		        i = 0
		      End If
		    Else
		      i = 0
		    End If
		  Wend
		  field.SelectionStart = 0
		  field.SelectionLength = 0
		  field.SelectedText = EndOfLine
		End Sub
	#tag EndMethod


	#tag Constant, Name = kFootHtml, Type = String, Dynamic = False, Default = \"</body>\n</html>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHeadHtml, Type = String, Dynamic = False, Default = \"<html>\n<head>\n<style type\x3D\"text/css\">\nbody { font-family: \"Arial\"\x2C \"Ubuntu\"\x2C \"sans-serif\"; font-size: 10pt; }\nh1 { font-size: 1.25em; font-weight: bold; text-align: center; }\nh3 { font-weight: bold; font-style: italic; text-align: center; }\n</style>\n</head>\n<body>", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events nil_help_tabs
	#tag Event
		Sub Change()
		  If Me.Value = 3 Then
		    Close
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_help_print
	#tag Event
		Sub Action()
		  Dim g As Graphics
		  Dim stp As StyledTextPrinter
		  
		  g = OpenPrinterDialog
		  If g <> Nil Then
		    If nil_help_tabs.Value = 0 Then
		      stp = edt_help_lyrics.StyledTextPrinter(g, 7 * 72)
		    ElseIf nil_help_tabs.Value = 1 Then
		      stp = edt_help_presentation.StyledTextPrinter(g, 7 * 72)
		    Else
		      Return
		    End If
		    stp.Width = 7 * 72
		    Do Until stp.EOF
		      stp.DrawBlock .75 * 72, .75 * 72, 9.5 * 72
		      If Not stp.EOF Then g.NextPage
		    Loop
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_help_close
	#tag Event
		Sub Action()
		  Self.Close
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
