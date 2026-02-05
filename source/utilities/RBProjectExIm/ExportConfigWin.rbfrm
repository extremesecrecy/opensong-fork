#tag Window
Begin Window ExportConfigWin
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   267
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Vault Export Options"
   Visible         =   True
   Width           =   300
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Vault Contents"
      Enabled         =   True
      Height          =   77
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   260
      Begin RadioButton contentsUseFoldersRad
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Items adopt Folder Hierarchy"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   31
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   39
         Underline       =   ""
         Value           =   True
         Visible         =   True
         Width           =   239
      End
      Begin RadioButton contentsFlatRad
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Items appear Flat in Vault"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   31
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   63
         Underline       =   ""
         Value           =   ""
         Visible         =   True
         Width           =   239
      End
   End
   Begin GroupBox GroupBox2
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Externals Handling"
      Enabled         =   True
      Height          =   101
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   108
      Underline       =   ""
      Visible         =   True
      Width           =   260
      Begin RadioButton externalsSeparateRad
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Externals appear next to Originals"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   31
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   132
         Underline       =   ""
         Value           =   ""
         Visible         =   True
         Width           =   239
      End
      Begin RadioButton externalsPrjItemsInVaultRad
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Externals appear in Vault"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   31
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   156
         Underline       =   ""
         Value           =   True
         Visible         =   True
         Width           =   239
      End
      Begin Checkbox externalsAllItemsInVaultChk
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Include non-project files"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   51
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   181
         Underline       =   ""
         Value           =   ""
         Visible         =   True
         Width           =   198
      End
   End
   Begin PushButton okBut
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   190
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   227
      Underline       =   ""
      Visible         =   True
      Width           =   90
   End
   Begin PushButton cancelBut
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   88
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   227
      Underline       =   ""
      Visible         =   True
      Width           =   90
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #if not TargetMacOS
		    // reverse the button order on Windows and Linux
		    dim buts() as RectControl
		    buts.Append cancelBut
		    buts.Append okBut
		    reverseButtonOrder buts
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function EnterOptions(config as RBPrjExportConfig) As Boolean
		  dim useFolders, separate, allFiles as Boolean
		  
		  if config.GetContentsHierarchy (useFolders) then
		    if useFolders then
		      contentsUseFoldersRad.Value = true
		    else
		      contentsFlatRad.Value = true
		    end
		  end
		  
		  if config.GetExternalsHandling (separate, allFiles) then
		    if separate then
		      externalsSeparateRad.Value = true
		    else
		      externalsPrjItemsInVaultRad.Value = true
		    end
		    externalsAllItemsInVaultChk.Value = allFiles
		  end
		  
		  updateControls
		  
		  self.theConfig = config
		  self.ShowModal
		  return self.accepted
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub finishDlg(accepted as Boolean)
		  if accepted then
		    if contentsFlatRad.Value or contentsUseFoldersRad.Value then
		      theConfig.SetContentsHierarchy (contentsUseFoldersRad.Value)
		    end
		    if externalsSeparateRad.Value or externalsPrjItemsInVaultRad.Value then
		      theConfig.SetExternalsHandling (externalsSeparateRad.Value, externalsAllItemsInVaultChk.Value)
		    end
		  end
		  self.accepted = accepted
		  self.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub reverseButtonOrder(buts() as RectControl)
		  dim ctlIdx, ofs as Integer
		  ofs = buts(Ubound(buts)).Left + buts(Ubound(buts)).Width
		  for ctlIdx = 0 to Ubound(buts)
		    buts(ctlIdx).Left = ofs - buts(ctlIdx).Width
		    ofs = buts(ctlIdx).Left - 12 // space between buttons
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub updateControls()
		  externalsAllItemsInVaultChk.Enabled = externalsPrjItemsInVaultRad.Value
		  okBut.Enabled = _
		  (externalsSeparateRad.Value or externalsPrjItemsInVaultRad.Value) and _
		  (contentsFlatRad.Value or contentsUseFoldersRad.Value)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private accepted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theConfig As RBPrjExportConfig
	#tag EndProperty


#tag EndWindowCode

#tag Events contentsUseFoldersRad
	#tag Event
		Sub Action()
		  updateControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events contentsFlatRad
	#tag Event
		Sub Action()
		  updateControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events externalsSeparateRad
	#tag Event
		Sub Action()
		  updateControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events externalsPrjItemsInVaultRad
	#tag Event
		Sub Action()
		  updateControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events externalsAllItemsInVaultChk
	#tag Event
		Sub Action()
		  updateControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events okBut
	#tag Event
		Sub Action()
		  finishDlg true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cancelBut
	#tag Event
		Sub Action()
		  finishDlg false
		End Sub
	#tag EndEvent
#tag EndEvents
