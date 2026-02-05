#tag Window
Begin Window HTMLExportWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   351
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "HTML Export Options"
   Visible         =   False
   Width           =   600
   Begin SVRadioGroupBox grp_css_handling
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "CSS Style Sheet Handling"
      Enabled         =   True
      Height          =   87
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   19
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
      Begin RadioButton rad_css_link
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Link to style sheet"
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_css_handling"
         Italic          =   False
         Left            =   34
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   532
      End
      Begin RadioButton rad_css_embed
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Embed style sheet"
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_css_handling"
         Italic          =   False
         Left            =   34
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   73
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   532
      End
   End
   Begin SVRadioGroupBox grp_css_options
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "CSS Style Sheet Options"
      Enabled         =   True
      Height          =   87
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   117
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
      Begin RadioButton rad_css_print
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Use style sheet based on print settings"
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_css_options"
         Italic          =   False
         Left            =   34
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   172
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   532
      End
      Begin RadioButton rad_css_default
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Use specified style sheet"
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_css_options"
         Italic          =   False
         Left            =   34
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   147
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   532
      End
   End
   Begin GroupBox grp_multiple_export
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Multiple Export"
      Enabled         =   True
      Height          =   87
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   653
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   1
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   266
      Begin RadioButton rad_single
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Single file for all songs"
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_multiple_export"
         Italic          =   False
         Left            =   667
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   31
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   229
      End
      Begin RadioButton rad_unique
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Unique file per song"
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grp_multiple_export"
         Italic          =   False
         Left            =   667
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   56
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   229
      End
   End
   Begin Label lbl_cssfile
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Style Sheet:"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   229
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin PushButton btn_ok
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   480
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   309
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btn_cancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   368
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   309
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label lbl_outdir
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Output folder:"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   261
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin SPopupMenu pop_cssfile
      AutoDeactivate  =   True
      Bold            =   False
      Changing        =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   192
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   228
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   388
   End
   Begin SPopupMenu pop_outdir
      AutoDeactivate  =   True
      Bold            =   False
      Changing        =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   192
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   261
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   388
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  If prefs= Nil Then
		    Dim r As New NilObjectException
		    Raise r
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  App.T.TranslateWindow(Self, kTranslationRoot, App.TranslationFonts)
		  prefs = Nil
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub EnableOkIfAble()
		  Dim b As Boolean
		  If prefs <> Nil Then
		    b = (prefs.StyleSheet <> Nil)
		    b = b Or prefs.PrintStyle
		    b = b And (prefs.OutputFolder <> Nil)
		    btn_ok.Enabled = ((prefs.StyleSheet <> Nil) Or prefs.PrintStyle) And (prefs.OutputFolder <> Nil)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowDialog(exportPrefs As HTMLExportOptions, within As Window = Nil) As Boolean
		  If exportPrefs = Nil Then
		    Dim r As New NilObjectException
		    r.Message = "No HTMLExportOptions specified to HTMLExportWindow"
		    Raise r
		    Return True 'Cancelled
		  End If
		  
		  prefs = exportPrefs.Clone
		  '#if DebugBuild
		  'prefs.StyleSheet = Nil
		  'prefs.OutputFolder = Nil
		  '#endif
		  
		  rad_css_embed.Value = prefs.EmbedCSS
		  rad_css_link.Value = Not prefs.EmbedCSS
		  
		  rad_css_print.Value = prefs.PrintStyle
		  rad_css_default.Value = Not prefs.PrintStyle
		  
		  rad_unique.Value = prefs.UniqueFiles
		  rad_single.Value = Not prefs.UniqueFiles
		  
		  
		  pop_outdir.Changing = True
		  If pop_outdir.ListCount > 2 Then pop_outdir.RemoveRow 0
		  If prefs.OutputFolder <> Nil Then
		    pop_outdir.InsertRow (0, prefs.OutputFolder.DisplayName)
		  Else
		    pop_outdir.InsertRow (0, App.T.Translate(kTranslationRoot + kNoFile))
		  End If
		  pop_outdir.ListIndex = 0
		  pop_outdir.Changing = False
		  
		  pop_cssfile.Changing = True
		  If pop_cssfile.ListCount > 2 Then pop_cssfile.RemoveRow 0
		  If prefs.StyleSheet <> Nil Then
		    pop_cssfile.InsertRow(0, prefs.StyleSheet.DisplayName)
		  Else
		    pop_cssfile.InsertRow(0, App.T.Translate(kTranslationRoot + kNoFile))
		  End If
		  pop_cssfile.ListIndex = 0
		  pop_cssfile.Changing = False
		  
		  Cancelled = False
		  
		  EnableOkIfAble
		  
		  If within = Nil Then
		    ShowModal
		  Else
		    ShowModalWithin(within)
		  End If
		  
		  If Not Cancelled Then
		    exportPrefs.CopyFrom(prefs)
		  End If
		  
		  Return Cancelled
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Cancelled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private prefs As HTMLExportOptions
	#tag EndProperty


	#tag Constant, Name = kCancel, Type = String, Dynamic = False, Default = \"/shared/cancel/@caption", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCssFile, Type = String, Dynamic = False, Default = \"/cssfile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFilterCSS, Type = String, Dynamic = False, Default = \"/filter_css", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNoFile, Type = String, Dynamic = False, Default = \"/nofile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOK, Type = String, Dynamic = False, Default = \"/shared/ok/@caption", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOutDir, Type = String, Dynamic = False, Default = \"/outdir", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOutFile, Type = String, Dynamic = False, Default = \"/outfile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTranslationRoot, Type = String, Dynamic = False, Default = \"export_options", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events rad_css_link
	#tag Event
		Sub Action()
		  prefs.EmbedCSS = Not Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_css_embed
	#tag Event
		Sub Action()
		  prefs.EmbedCSS = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_css_print
	#tag Event
		Sub Action()
		  pop_cssfile.Enabled = Not me.Value
		  prefs.PrintStyle = me.Value
		  EnableOkIfAble
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_css_default
	#tag Event
		Sub Action()
		  pop_cssfile.Enabled = Me.Value
		  prefs.PrintStyle = Not Me.Value
		  EnableOkIfAble
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_single
	#tag Event
		Sub Action()
		  prefs.UniqueFiles = Not Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_unique
	#tag Event
		Sub Action()
		  prefs.UniqueFiles = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_ok
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_cancel
	#tag Event
		Sub Action()
		  Cancelled = True
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_cssfile
	#tag Event
		Sub Change()
		  //++
		  // Assuming "Select" is the last entry
		  //--
		  
		  If Me.ListIndex = Me.ListCount - 1 Then
		    Dim f As FolderItem
		    Dim dlg As New OpenDialog
		    Dim cssFilter As FileType
		    dlg.ActionButtonCaption = App.T.Translate(kTranslationRoot + kOK)
		    dlg.CancelButtonCaption = App.T.Translate(kTranslationRoot + kCancel)
		    dlg.Title = App.T.Translate(kTranslationRoot + kCssFile +"/@caption")
		    dlg.PromptText = App.T.Translate(kTranslationRoot + kCssFile)
		    cssFilter = FileTypes.CSSFiles
		    cssFilter.Name = App.T.Translate(kTranslationRoot + kFilterCSS)
		    dlg.Filter = cssFilter
		    If prefs.StyleSheet <> Nil Then
		      dlg.InitialDirectory = prefs.StyleSheet.Parent
		    Else
		      dlg.InitialDirectory = App.AppFolder.Child("OpenSong Settings")
		    End If
		    f = dlg.ShowModalWithin(Self)
		    If f <> Nil Then
		      prefs.StyleSheet = f
		      Me.RemoveRow(0)
		      Me.InsertRow(0,f.Name)
		    End If
		    Me.ListIndex = 0
		  End If
		  EnableOkIfAble
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Changing = True
		  Me.AddSeparator
		  Me.AddRow(App.T.Translate("shared/select/@caption") + "...")
		  Me.ListIndex = Me.ListCount - 1
		  Me.Changing = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_outdir
	#tag Event
		Sub Open()
		  Me.Changing = True
		  Me.AddSeparator
		  Me.AddRow(App.T.Translate("shared/select/@caption") + "...")
		  Me.ListIndex = Me.ListCount - 1
		  Me.Changing = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  //++
		  // Assuming "Select" is the last entry
		  //--
		  
		  If Me.ListIndex = Me.ListCount - 1 Then
		    Dim f As FolderItem
		    Dim dlg As New SelectFolderDialog
		    dlg.ActionButtonCaption = App.T.Translate(kTranslationRoot + kOK)
		    dlg.CancelButtonCaption = App.T.Translate(kTranslationRoot + kCancel)
		    dlg.PromptText = App.T.Translate(kTranslationRoot + kOutDir)
		    dlg.Title = App.T.Translate(kTranslationRoot + kOutDir + "/@caption")
		    If prefs.OutputFolder <> Nil Then
		      dlg.InitialDirectory = prefs.OutputFolder
		    Else
		      dlg.InitialDirectory = SpecialFolder.Documents
		    End If
		    
		    f = dlg.ShowModalWithin(Self)
		    If f <> Nil Then
		      prefs.OutputFolder = f
		      Me.RemoveRow(0)
		      Me.InsertRow(0,f.Name)
		    End If
		    Me.ListIndex = 0
		  End If
		  
		  EnableOkIfAble
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
