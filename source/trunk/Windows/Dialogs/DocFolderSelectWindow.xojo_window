#tag Window
Begin Window DocFolderSelectWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   374
   ImplicitInstance=   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   305
   MinimizeButton  =   False
   MinWidth        =   400
   Placement       =   3
   Resizeable      =   True
   Title           =   "Select a Folder"
   Visible         =   True
   Width           =   600
   Begin PushButton btn_folder_browse
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Browse..."
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   451
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
      Top             =   290
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   129
   End
   Begin SEditField edt_docsfolder
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      Height          =   22
      HideSelection   =   True
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Multiline       =   False
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   290
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   419
   End
   Begin Label txt_instructions
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   111
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "The folder named in the edit box below will be used for OpenSong's documents. Subfolders Songs, Sets, Background, and Settings will be created, unless they already exist.\r\nWhen you browse for a folder, '%1' will get suggested as a subfolder unless the folder chosen in the browse for folder dialog is empty or the subfolders typical for an OpenSong documents folder exist."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin Label lbl_docsfolder
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Documents folder"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   266
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   419
   End
   Begin PushButton btn_ok
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   382
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   332
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin PushButton btn_cancel
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   490
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   332
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin GroupBox grp_location
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   103
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   15
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   143
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   565
      Begin RadioButton rad_documents_user
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Default: Documents"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_location"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   160
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   555
      End
      Begin RadioButton rad_documents_shared
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Shared Documents"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_location"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   184
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   555
      End
      Begin RadioButton rad_folder_custom
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Custom"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "grp_location"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   208
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   555
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  If Not IsNull(App.T) Then
		    App.T.TranslateWindow(Me, "doc_folder_dialog", App.TranslationFonts)
		  End If
		  StatusOk = False
		  FolderName = ""
		  
		  #If TargetWindows
		    DocumentsFolderPathName = App.AppDocumentsFolderForOpenSong.PathName
		    SharedFolderPathName = SpecialFolder.SharedDocuments.Child(App.STR_OS_DOCUMENTS).PathName
		    
		    Try
		      Dim DisplayName As String = WinAPI.WinFolderDisplayName(SpecialFolder.SharedDocuments)
		      If displayName <> "" Then
		        rad_documents_shared.Caption = displayName
		      End If
		    Catch e
		      App.DebugWriter.Write("Caught exception trying to get Shared Documents localized name: " + e.ToString, 5)
		    End Try
		    
		  #ElseIf TargetMacOS
		    DocumentsFolderPathName = App.AppDocumentsFolderForOpenSong.PathName
		    SharedFolderPathName = SpecialFolder.SharedDocuments.Child(App.STR_OS_DOCUMENTS).PathName
		  #ElseIf TargetLinux
		    DocumentsFolderPathName = App.AppDocumentsFolderForOpenSong.PathName
		    SharedFolderPathName = ""
		  #EndIf
		  
		  If SuggestedCreateFolderName.IsEmpty Then
		    SuggestedCreateFolderName = App.STR_OS_DOCUMENTS
		  End If
		  UpdateInstructions
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function SelectDocFolder(InitialFolder As FolderItem, suggested As String = App.STR_OS_DOCUMENTS) As FolderItem
		  Dim f As FolderItem
		  
		  If suggested = "" Then
		    SuggestedCreateFolderName = App.STR_OS_DOCUMENTS
		  Else
		    SuggestedCreateFolderName = suggested
		  End If
		  UpdateInstructions
		  
		  If App.IsPortable Then
		    Dim e As New RuntimeException
		    Dim translated As Boolean = False
		    If App.T <> Nil Then
		      e.Message = App.T.Translate("error/internal", translated)
		    End If
		    If Not translated Then
		      e.Message = "Internal error. Contact technical support."
		    End If
		    e.Message = e.Message + EndOfLine + "Function " + CurrentMethodName + " is not supposed to be called from a portable installation"
		    Raise e
		  End If
		  
		  f = InitialFolder
		  Try
		    While f <> Nil And Not f.IsFolder
		      If Not f.IsFolder Then
		        f = f.Parent
		      End If
		    Wend
		  Catch ex
		    Break
		    f = Nil
		  End Try
		  If f = Nil Then
		    f = App.DocsFolder
		  End If
		  If f = Nil Then
		    f = App.AppDocumentsFolderForOpenSong
		  End If
		  
		  Self.SetFocus
		  edt_docsfolder.Text = f.PathName
		  edt_docsfolder.SetFocus
		  
		  If App.MainWindowIsOpen Then
		    ShowModalWithin(MainWindow)
		  Else
		    ShowModal
		  End If
		  
		  If StatusOk Then
		    Try
		      f = Nil
		      If FileUtils.CreateFolderTree(f, Self.FolderName) Then
		        f = New FolderItem(Self.FolderName, FileUtils.PathType)
		      Else
		        If f.LastErrorCode <> 0 Then
		          FileUtils.SetLastError(f)
		          InputBox.Message FileUtils.LastError
		        Else 
		          InputBox.Message App.T.Translate("folderdb_errors/error[@code='2']", Self.FolderName)  // Could not create folder '%1'.
		        End If
		      End If
		    Catch ex
		      Break
		      f = Nil
		    End Try
		  Else
		    f = Nil
		  End If
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateInstructions()
		  Dim s As String
		  
		  If App.T <> Nil Then
		    s = App.T.Translate("doc_folder_dialog/instructions/@caption", SuggestedCreateFolderName)
		  Else
		    s = lbl_docsfolder.Text
		    s = s.ReplaceAll("%1", SuggestedCreateFolderName)
		  End If
		  txt_instructions.Text = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateRadioButtons()
		  Try
		    UserInterfaceUpdateInProgress = True
		    
		    Select Case edt_docsfolder.Text
		      
		    Case DocumentsFolderPathName
		      rad_documents_user.Value = True
		      
		    Case SharedFolderPathName
		      rad_documents_shared.Value = True
		      
		    Case Else
		      rad_folder_custom.Value = True
		      
		    End Select
		    
		  Finally
		    UserInterfaceUpdateInProgress = False
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private DocumentsFolderPathName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FolderName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SharedFolderPathName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		StatusOk As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SuggestedCreateFolderName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UserInterfaceUpdateInProgress As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events btn_folder_browse
	#tag Event
		Sub Action()
		  Dim mb As SelectFolderDialog
		  Dim f As FolderItem
		  
		  If FileUtils.IsPathRooted(edt_docsfolder.Text) Then
		    f = FileUtils.PathToFolderItem(edt_docsfolder.Text)
		  Else
		    If rad_documents_shared.Value Then
		      f = SpecialFolder.SharedDocuments
		    Else
		      f = App.AppDocumentsFolderForOpenSong
		    End If
		    If edt_docsfolder.Text <> "" Then
		      f = FileUtils.RelativePathToFolderItem(f, edt_docsfolder.Text)
		    End If
		  End If
		  mb = New SelectFolderDialog
		  mb.InitialFolder = f
		  mb.SuggestedFileName = SuggestedCreateFolderName
		  f = mb.ShowModal
		  
		  If f <> Nil Then
		    If f.Exists Then
		      If f.IsFolder Then
		        Dim s As FolderItem
		        Dim hasOSfolders As Boolean = False
		        
		        s = App.AppFolder.Child(SuggestedCreateFolderName)
		        If f.NativePath.StartsWith(s.NativePath) Then
		          MsgBox(App.T.Translate("errors/docs_folder", f.NativePath))
		          f = Nil
		        Else
		          s = f.Child(App.STR_SONGS)
		          If s.Exists And s.IsFolder Then
		            s = f.Child(App.STR_SETS)
		            If s.Exists And s.IsFolder Then
		              s = f.Child(App.STR_SETTINGS)
		              If s.Exists And s.IsFolder Then
		                hasOSfolders = True
		              End If
		            End If
		          End If
		          If Not hasOSfolders And f.Count > 0 Then
		            If f.Name <> SuggestedCreateFolderName And f.PathName <> App.AppDocumentsFolderForOpenSong.PathName Then
		              f = f.Child(SuggestedCreateFolderName)
		            End If
		          End If
		        End If
		      Else
		        f = Nil
		      End If
		    End If
		    If f <> Nil Then
		      edt_docsfolder.Text = f.PathName
		    End If
		  End If
		  UpdateRadioButtons
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_docsfolder
	#tag Event
		Sub TextChange()
		  UpdateRadioButtons
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_ok
	#tag Event
		Sub Action()
		  StatusOk = True
		  FolderName = edt_docsfolder.Text
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_cancel
	#tag Event
		Sub Action()
		  StatusOk = False
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_documents_user
	#tag Event
		Sub Action()
		  If Not UserInterfaceUpdateInProgress Then
		    edt_docsfolder.Text = DocumentsFolderPathName
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_documents_shared
	#tag Event
		Sub Action()
		  If Not UserInterfaceUpdateInProgress Then 
		    edt_docsfolder.Text = SharedFolderPathName
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  // Shared Documents concept within the OS only exists on Windows and MacOS
		  
		  #If Not (TargetWindows Or TargetMacOS)
		    Me.Enabled = False
		  #EndIf
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
		Name="Foldername"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="StatusOk"
		Visible=false
		Group="Behavior"
		InitialValue="False"
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
