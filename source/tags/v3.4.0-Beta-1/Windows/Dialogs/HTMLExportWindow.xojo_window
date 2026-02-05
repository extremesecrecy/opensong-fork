#tag Window
Begin Window HTMLExportWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   351
   ImplicitInstance=   False
   LiveResize      =   "True"
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
   Begin GroupBox grp_css_handling
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "CSS Style Sheet Handling"
      Enabled         =   True
      Height          =   68
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
      Top             =   14
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
         Top             =   34
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
         Top             =   56
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   532
      End
   End
   Begin GroupBox grp_css_options
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "CSS Style Sheet Options"
      Enabled         =   True
      Height          =   68
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
      Top             =   94
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
         Top             =   136
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
         Top             =   114
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
      Height          =   68
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   650
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
      Top             =   24
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
         Left            =   664
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
         Top             =   44
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
         Left            =   664
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
         Top             =   66
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
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   174
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin PushButton btn_ok
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
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
      Top             =   311
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btn_cancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   408
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
      Top             =   311
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
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
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   227
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin TextField edt_cssfile
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   196
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   428
   End
   Begin PushButton btn_cssfile_browse
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Browse..."
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   460
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   196
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin TextField edt_outdir
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   249
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   428
   End
   Begin PushButton btn_outdir_browse
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Browse..."
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   460
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   249
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
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
		  
		  Dim styleSheet As FolderItem
		  If prefs <> Nil Then
		    b = prefs.OutputFolder <> Nil And prefs.OutputFolder.Exists
		    If b Then
		      If Not prefs.PrintStyle Then
		        b = prefs.StyleSheet <> Nil And prefs.StyleSheet.Exists And prefs.StyleSheet.IsReadable
		      End If
		    End If
		    If b Then
		      If Not prefs.EmbedCSS Then
		        styleSheet = prefs.OutputFolder.Child(prefs.TargetStyleSheetName)
		        b = prefs.TargetStyleSheetName <> "" And styleSheet <> Nil And styleSheet.IsWriteable
		      End If
		    End If
		  End If
		  btn_ok.Enabled = b
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
		  
		  prefs.TargetStyleSheetName = prefs.TargetStyleSheetName.Trim
		  If prefs.TargetStyleSheetName = "" And prefs.StyleSheet <> Nil Then
		    prefs.TargetStyleSheetName = prefs.StyleSheet.Name
		  End If
		  
		  If prefs.PrintStyle Then
		    edt_cssfile.Text = prefs.TargetStyleSheetName
		  Else
		    If prefs.StyleSheet <> Nil Then
		      edt_cssfile.Text = prefs.StyleSheet.NativePath
		    End If
		  End If
		  
		  If prefs.OutputFolder <> Nil Then
		    edt_outdir.Text = prefs.OutputFolder.NativePath
		  End If
		  
		  Cancelled = True
		  
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

	#tag Method, Flags = &h21
		Private Sub ValueChanged_EmbedCSS()
		  EnableOkIfAble
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ValueChanged_PrintStyle()
		  If prefs.PrintStyle Then
		    If prefs.TargetStyleSheetName = "" Then
		      If prefs.StyleSheet <> Nil Then
		        prefs.TargetStyleSheetName = prefs.StyleSheet.Name
		      End If
		    End If
		    edt_cssfile.Text = prefs.TargetStyleSheetName
		  Else
		    If prefs.StyleSheet <> Nil Then
		      edt_cssfile.Text = prefs.StyleSheet.NativePath
		    Else
		      edt_cssfile.Text = ""
		    End If
		  End If
		  EnableOkIfAble
		End Sub
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
		  If prefs.EmbedCSS = Me.Value Then
		    prefs.EmbedCSS = Not Me.Value
		    ValueChanged_EmbedCSS
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_css_embed
	#tag Event
		Sub Action()
		  If prefs.EmbedCSS = Not Me.Value Then
		    prefs.EmbedCSS = Me.Value
		    ValueChanged_EmbedCSS
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_css_print
	#tag Event
		Sub Action()
		  If prefs.PrintStyle = Not Me.Value Then
		    prefs.PrintStyle = Me.Value
		    ValueChanged_PrintStyle
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_css_default
	#tag Event
		Sub Action()
		  If prefs.PrintStyle = Me.Value Then
		    prefs.PrintStyle = Not Me.Value
		    ValueChanged_PrintStyle
		  End If
		  
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
		  Cancelled = False
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
#tag Events edt_cssfile
	#tag Event
		Sub TextChange()
		  If prefs.PrintStyle Then
		    prefs.TargetStyleSheetName = edt_cssfile.Text.Trim
		  Else
		    If edt_cssfile.Text.Trim = "" Then
		      prefs.StyleSheet = Nil
		    Else
		      Try
		        prefs.StyleSheet = PathToFolderItem(edt_cssfile.Text)
		        If prefs.StyleSheet <> Nil Then
		          prefs.TargetStyleSheetName = prefs.StyleSheet.Name
		        End If
		      catch
		        prefs.StyleSheet = Nil
		      End Try
		    End If
		  End If
		  EnableOkIfAble
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_cssfile_browse
	#tag Event
		Sub Action()
		  Dim NewStyleSheet As FolderItem
		  Dim cssFilter As FileType
		  
		  If prefs <> Nil Then
		    If prefs.PrintStyle Then
		      Dim dlg As New SaveAsDialog
		      
		      dlg.ActionButtonCaption = App.T.Translate(kTranslationRoot + kOK)
		      dlg.CancelButtonCaption = App.T.Translate(kTranslationRoot + kCancel)
		      dlg.Title = App.T.Translate(kTranslationRoot + kCssFile +"/@caption")
		      dlg.PromptText = App.T.Translate(kTranslationRoot + kCssFile)
		      dlg.InitialDirectory = prefs.OutputFolder
		      If prefs.TargetStyleSheetName <> "" Then
		        NewStyleSheet = prefs.OutputFolder.Child(prefs.TargetStyleSheetName)
		        dlg.SuggestedFileName = NewStyleSheet.Name
		      End If
		      cssFilter = FileTypes.CSSFiles
		      cssFilter.Name = App.T.Translate(kTranslationRoot + kFilterCSS)
		      dlg.Filter = cssFilter
		      
		      If Globals.UseSheetDialogs Then
		        NewStyleSheet = dlg.ShowModalWithin(self)
		      Else
		        NewStyleSheet = dlg.ShowModal
		      End If
		      If NewStyleSheet = Nil Then Return // User cancelled
		      
		      prefs.TargetStyleSheetName = NewStyleSheet.Name
		      edt_cssfile.Text = prefs.TargetStyleSheetName
		    Else
		      Dim dlg As New OpenDialog
		      
		      dlg.ActionButtonCaption = App.T.Translate(kTranslationRoot + kOK)
		      dlg.CancelButtonCaption = App.T.Translate(kTranslationRoot + kCancel)
		      dlg.Title = App.T.Translate(kTranslationRoot + kCssFile +"/@caption")
		      dlg.PromptText = App.T.Translate(kTranslationRoot + kCssFile)
		      If prefs.StyleSheet <> Nil Then
		        dlg.InitialDirectory = prefs.StyleSheet.Parent
		        dlg.SuggestedFileName = prefs.StyleSheet.Name
		      Else
		        NewStyleSheet = prefs.DefaultStyleSheet
		        If NewStyleSheet <> Nil Then
		          dlg.InitialDirectory = NewStyleSheet.Parent
		          dlg.SuggestedFileName = NewStyleSheet.Name
		        End If
		      End If
		      cssFilter = FileTypes.CSSFiles
		      cssFilter.Name = App.T.Translate(kTranslationRoot + kFilterCSS)
		      dlg.Filter = cssFilter
		      
		      If Globals.UseSheetDialogs Then
		        NewStyleSheet = dlg.ShowModalWithin(self)
		      Else
		        NewStyleSheet = dlg.ShowModal
		      End If
		      If NewStyleSheet = Nil Then Return // User cancelled
		      
		      prefs.StyleSheet = NewstyleSheet
		      edt_cssfile.Text = prefs.StyleSheet.NativePath
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_outdir
	#tag Event
		Sub TextChange()
		  If edt_outdir.Text.Trim = "" Then
		    prefs.OutputFolder = Nil
		  Else
		    Try
		      prefs.OutputFolder = PathToFolderItem(edt_outdir.Text)
		      If Not prefs.OutputFolder.Directory Then
		        prefs.OutputFolder = Nil
		      End If
		    catch
		      prefs.OutputFolder = Nil
		    End Try
		  End If
		  EnableOkIfAble
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  If prefs.OutputFolder <> Nil And prefs.OutputFolder.Directory Then
		    edt_outdir.Text = prefs.OutputFolder.NativePath
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_outdir_browse
	#tag Event
		Sub Action()
		  Dim dlg As New SelectFolderDialog
		  Dim NewOutputFolder As FolderItem
		  
		  dlg.ActionButtonCaption = App.T.Translate(kTranslationRoot + kOK)
		  dlg.CancelButtonCaption = App.T.Translate(kTranslationRoot + kCancel)
		  dlg.PromptText = App.T.Translate(kTranslationRoot + kOutDir)
		  dlg.Title = App.T.Translate(kTranslationRoot + kOutDir + "/@caption")
		  If prefs <> Nil Then
		    dlg.InitialDirectory = prefs.OutputFolder
		  Else
		    dlg.InitialDirectory = SpecialFolder.Documents
		  End If
		  
		  If Globals.UseSheetDialogs Then
		    NewOutputFolder = dlg.ShowModalWithin(self)
		  Else
		    NewOutputFolder = dlg.ShowModal
		  End If
		  If NewOutputFolder = Nil Then Return // User cancelled
		  
		  prefs.OutputFolder = NewOutputFolder
		  edt_outdir.Text = prefs.OutputFolder.NativePath
		  EnableOkIfAble
		End Sub
	#tag EndEvent
#tag EndEvents
