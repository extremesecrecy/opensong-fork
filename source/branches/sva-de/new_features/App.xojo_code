#tag Class
Class App
Inherits Application
	#tag Event
		Sub Activate()
		  If Not m_OpenComplete Then Return
		  DebugWriter.Write("Begin App.Activate", 8)
		  
		  App.DebugWriter.Write(CurrentMethodName + ": Status_Presentation is " + If(Globals.Status_Presentation, "On", "Off"), 7)
		  If Globals.Status_Presentation Then
		    #if Not TargetMacOS
		      App.MinimizeWindow(MainWindow)
		    #endif
		    
		    If PresentWindow.HelperActive Then
		      App.DebugWriter.Write(CurrentMethodName + ": HelperActive: switching to PresentHelperWindow", 7)
		      If (PresentWindow.CurrentSlideContentMask And PresentWindow.kSlideContent_BaseMask) = PresentWindow.kSlideContent_Slide Then
		        #if Not TargetWin32
		          App.RestoreWindow(PresentHelperWindow)
		          App.SetForeground(PresentHelperWindow)
		          PresentHelperWindow.SetFocus
		        #else
		          If PresentHelperWindow.IsWindowMinimized Then
		            App.ShowWin(PresentHelperWindow,SW_RESTORE)
		          Else
		            App.ShowWin(PresentHelperWindow,SW_SHOW)
		          End If
		        #endif
		      End If
		    Else
		      App.DebugWriter.Write(CurrentMethodName + ": Not HelperActive", 7)
		      If (PresentWindow.CurrentSlideContentMask And PresentWindow.kSlideContent_BaseMask) = PresentWindow.kSlideContent_Slide Then
		        App.DebugWriter.Write(CurrentMethodName + ": Show and activate PresentWindow", 7)
		        #if Not TargetWin32
		          App.RestoreWindow(PresentWindow)
		          App.SetForeground(PresentWindow)
		          PresentWindow.SetFocus
		        #else
		          If PresentWindow.IsWindowMinimized Then
		            App.ShowWin(PresentWindow,SW_RESTORE)
		          Else
		            App.ShowWin(PresentWindow,SW_SHOW)
		          End If
		        #endif
		      End If
		    End If
		  End If
		  
		  DebugWriter.Write("End App.Activate", 8)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  App.DebugWriter.Write(CurrentMethodName + ": Enter", 6)
		  m_ProgramExit = True
		  If ZombieGuardDog <> Nil Then
		    ZombieGuardDog.Enabled = False 
		  End If
		  If CheckDocumentFolders(SETTINGS_FOLDER) <> NO_FOLDER Then
		    If MyMainSettings <> Nil Then
		      If Not SmartML.XDocToFile(MyMainSettings, DocsFolder.Child(STR_SETTINGS).Child("MainSettings")) Then SmartML.DisplayError
		    End If
		    If MyPresentSettings <> Nil Then
		      If Not SmartML.XDocToFile(MyPresentSettings, DocsFolder.Child(STR_SETTINGS).Child("PresentSettings")) Then SmartML.DisplayError
		    End If
		  Else
		    If T <> Nil And T.IsLoaded And DocsFolder <> Nil Then
		      MsgBox T.Translate("errors/create_settings_folder", DocsFolder.Child(STR_SETTINGS).NativePath)
		    End If
		  End If
		  
		  Globals.Status_Presentation = False
		  If MainPreferences <> Nil Then
		    If MyPrinterSetup <> Nil Then
		      MainPreferences.SetValue(Prefs.PageSetup, EncodeBase64(MyPrinterSetup.SetupString))
		    End If
		    If MainPreferences.IsModified Then
		      Call MainPreferences.Save
		    End If
		  End If
		  
		  Dim w As Window
		  For i As Integer = WindowCount - 1 DownTo 0
		    w = Window(i)
		    If w <> Nil Then w.Close
		  Next
		  
		  If NDISingleton <> Nil Then
		    NDISingleton.Destroy  // NDISingleton references itself, so setting it to Nil does not call the destructor
		    NDISingleton = Nil
		  End If
		  
		  Profiler.DisableProfiler
		  App.DebugWriter.Write(CurrentMethodName + ": Done", 6)
		  DebugWriter.Done
		  
		  #if TargetLinux And XojoVersion < 2025 then
		    If ZombieGuardDog.RunMode <> Timer.RunModes.Off Then
		      RemoveHandler ZombieGuardDog.Action, AddressOf KillZombieApp
		    End If
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  If app.DebugWriter <> Nil Then
		    App.DebugWriter.Write(CurrentMethodName, 8)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function HandleAppleEvent(theEvent As AppleEvent, eventClass As String, eventID As String) As Boolean
		  #Pragma Unused theEvent
		  #Pragma Unused eventClass
		  #Pragma Unused eventID
		  
		  #If TargetMacOS
		    #Pragma Warning "TODO"
		    
		    // eventID "rapp" fires when the application icon on the dock is clicked. 
		    // TODO: Investigate specifically when this fires and determine what window
		    // activation logic should be used depending upon program state.
		    // https://forum.xojo.com/13498-dock-icon-opens-window/0
		    
		    'If eventID = "rapp" Then
		    'MainWindow.Show
		    'End If
		    
		  #EndIf
		  
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  App.AutoQuit = True
		  m_ProgramExit = False
		  m_OpenComplete = False
		  Dim OK As Boolean
		  
		  'Profiler.EnableProfiler
		  Profiler.BeginProfilerEntry "App::Open"
		  
		  // Set ReleaseCandidate Level
		  // IMPORTANT this value will need to be set to 0
		  // for a FINAL relase
		  ReleaseCandidate = 0
		  
		  #If TargetLinux Then
		    modGTK3.initGtkEntryFix
		    modGTK3.initGtkWidgetHeightFix
		    modGTK3.InitGlobalGTK3Style
		  #EndIf
		  
		  m_statusNotifiers = New Dictionary
		  
		  DebugWriter = New DebugOutput
		  
		  If AppFolder = Nil Then
		    Call MsgBox("Can't find my installation folder.", 16, "Find OpenSong AppFolder")
		  End If
		  
		  If Not AppFolder.Child("OpenSong Settings").Exists Then
		    Call MsgBox("Folder """ + AppFolder.Child("OpenSong Settings").NativePath + """ does not exist", 16, "Find OpenSong Settings")
		  End If
		  
		  If Not AppFolder.Child("OpenSong Settings").Child("Globals").Exists Then
		    Call MsgBox("FolderItem """ + AppFolder.Child("OpenSong Settings").Child("Globals").NativePath + """ does not exist", 16, "Find Globals")
		  End If
		  
		  'Can't translate this until we've loaded the translator
		  'Splash.SetStatus "Loading global settings..."
		  MyGlobals = SmartML.XDocFromFile(AppFolder.Child("OpenSong Settings").Child("Globals"))
		  If MyGlobals = Nil Then
		    MsgBox SmartML.ErrorString + ": " + _
		    AppFolder.Child("OpenSong Settings").NativePath + _
		    " (" + Str(SmartML.ErrorCode) + ")"
		    Quit
		    Return
		  End If
		  
		  Dim parameters() As String = System.CommandLine.Split()
		  IsPortable = parameters.IndexOf("--portable")>-1 Or parameters.IndexOf("/portable")>-1
		  If Not IsPortable Then
		    IsPortable = SmartML.GetValueB(MyGlobals.DocumentElement, "portable/@installation", True, False)
		  End If
		  
		  If parameters.IndexOf("--profiler")>-1 Or parameters.IndexOf("/profiler")>-1 Then
		    Profiler.EndProfilerEntry
		    Profiler.EnableProfiler
		    Profiler.BeginProfilerEntry "App::Open2"
		  End If
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  LoadPreferences
		  'Couldn't load Preferences, Log error and Bail
		  If MainPreferences = Nil Then
		    App.DebugWriter.Write("App.Open: Error Loading Preferences ", 1)
		    Quit
		  End If
		  DebugWriter.Level = MainPreferences.GetValueN(kLogLevel, 3, True)
		  If MainPreferences.GetValueB(kLogOutput + kLogConsole, True, True) Then
		    DebugWriter.SetOutput(Nil)
		  Else
		    DebugWriter.SetOutput(MainPreferences.GetValueFI(kLogOutput), _
		    MainPreferences.GetValueB(kLogOutput + kLogAppend, False, True))
		  End If
		  
		  OK = DebugWriter.Init
		  DebugWriter.Write "-------------------- Begin Run ----------------------"
		  Dim d As New Date
		  DebugWriter.Write d.SQLDateTime
		  d = Nil
		  If IsPortable Then DebugWriter.Write("Running in portable mode", 6)
		  
		  Splash.Show
		  
		  SmartML.Init
		  
		  
		  'Moved translation init to beginning so we can translate error & status Msgs
		  Dim lang As String
		  
		  'Can't translate this until we've loaded the translator
		  'Splash.SetStatus "Loading translation text..."
		  //++
		  // Updated March 2007: Try to prompt the user before giving up.
		  // Possibly avoids user having to manually update Globals or the preferences file.
		  //--
		  lang = MainPreferences.GetValue(Prefs.kLanguage, "") // Check the new location
		  If lang = "" Then
		    lang = SmartML.GetValue(MyGlobals.DocumentElement, "language/@file") //Check the old location
		    If lang = "" Then // Prompt the user
		      App.MouseCursor = Nil
		      lang = SelectLanguage
		      App.MouseCursor = System.Cursors.Wait
		      If lang = "" Then Quit // User cancelled
		    End If
		  End If
		  
		  VideolanPresetList = New Dictionary
		  
		  Do
		    T = Nil
		    T = New Translator(AppFolder.Child("OpenSong Languages").Child(lang))
		    DebugWriter.Write("Translator constucted from " + T.GetFile.NativePath, 6)
		    If Not T.IsLoaded Then
		      App.MouseCursor = Nil
		      If T.ErrorText <> "" Then
		        InputBox.Message "Error loading the language file " + lang + " from " _
		        + AppFolder.Child("OpenSong Languages").Child(lang).NativePath + EndOfLine + EndOfLine _
		        + T.ErrorText
		      End If
		      lang = SelectLanguage // Prompt for new selection
		      If lang = "" Then Quit
		    End If
		    If App.MouseCursor = Nil Then
		      App.MouseCursor = System.Cursors.Wait
		    End If
		  Loop Until T.IsLoaded
		  MainPreferences.SetValue(Prefs.kLanguage, lang)
		  
		  TranslateMe True
		  
		  Splash.SetStatus T.Translate("load_settings/checking_folders") + "..."
		  
		  ' --- CREATE DOCUMENTS FOLDER ---
		  DocsFolder = GetDocsFolder
		  If DocsFolder = Nil Then
		    If Splash.Visible Then
		      Splash.Close
		    End If
		    'User canceled, show error msg and bail
		    InputBox.Message T.Translate("errors/no_docs_folder","...")
		    Quit
		  End If
		  
		  //++
		  // Initialize Factory objects
		  //--
		  Dim result As Integer
		  result = CheckDocumentFolders(SCRIPTURE_FOLDER, True, False)
		  If result <> NO_FOLDER Then
		    BibleFactory.AddSearchFolder(GetDocumentFolderItem(SCRIPTURE_FOLDER), False)
		  End If
		  If DocsFolder.Child("OpenSong Scripture").Exists Then
		    BibleFactory.AddSearchFolder(DocsFolder.Child("OpenSong Scripture"), False)
		  End If
		  If AppFolder.Child("OpenSong Scripture").Exists Then
		    BibleFactory.AddSearchFolder(AppFolder.Child("OpenSong Scripture"), False)
		  End If
		  BibleFactory.BuildKnownBibles
		  
		  Dim scriptureFolder As FolderItem = BibleFactory.ScriptureFolder
		  If ScriptureFolder Is Nil Or Not ScriptureFolder.Exists Or Not BibleFactory.HasBible Then
		    InputBox.Message T.Translate("errors/no_scripture_folder", DocsFolder.Child(STR_SCRIPTURE).NativePath)
		  End If
		  
		  If CheckDefaultFolders(DEFAULTS_FOLDER) <> FOLDER_EXISTS Then
		    InputBox.Message T.Translate("errors/no_defaults_folder", AppFolder.Child(STR_OS_DEFAULTS).NativePath)
		  End If
		  
		  result = CheckDocumentFolders(DOCUMENTS_FOLDER)
		  If result = FOLDER_EMPTY Then
		    'Documents folder is empty, ask the user if want to try to copy the Default Documents to the docs folder
		    '(as long as the defaults folder isn't empty of course ;)
		    If InputBox.AskYN(App.T.Translate("questions/documents_folder_empty/@caption")) Then
		      If Not FileUtils.CopyPath(AppFolder.Child(STR_OS_DEFAULTS), DocsFolder) Then
		        If DocsFolder <> Nil Then
		          InputBox.Message T.Translate("errors/no_docs_folder", DocsFolder.NativePath)
		        Else
		          InputBox.Message T.Translate("errors/no_docs_folder", "")
		        End If
		      End If
		    End If
		  ElseIf result = NO_FOLDER Then
		    If DocsFolder <> Nil Then
		      InputBox.Message T.Translate("errors/no_docs_folder", DocsFolder.NativePath)
		    Else
		      InputBox.Message T.Translate("errors/no_docs_folder", "")
		    End If
		  End If
		  
		  result = CheckDocumentFolders(SETTINGS_FOLDER)
		  If result = FOLDER_EMPTY Then
		    'Settings folder is empty, ask the user if want to try to copy the default Settings to the docs folder
		    '(as long as the defaults folder isn't empty of course ;)
		    If CheckDefaultFolders(SETTINGS_FOLDER) = FOLDER_EXISTS Then
		      If InputBox.AskYN(App.T.Translate("questions/settings_folder_empty/@caption")) Then
		        If Not FileUtils.CopyPath(AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETTINGS), DocsFolder.Child(STR_SETTINGS)) Then
		          InputBox.Message T.Translate("errors/create_settings_folder", DocsFolder.Child(STR_SETTINGS).NativePath)
		          InputBox.Message T.Translate("errors/load_default_settings")
		        End If
		      End If
		    Else
		      InputBox.Message T.Translate("errors/no_settings_folder", AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETTINGS).NativePath)
		    End If
		  ElseIf result = NO_FOLDER Then
		    If DocsFolder <> Nil Then
		      InputBox.Message T.Translate("errors/create_settings_folder", DocsFolder.Child(STR_SETTINGS).NativePath)
		    Else
		      InputBox.Message T.Translate("errors/no_docs_folder", "")
		    End If
		    InputBox.Message T.Translate("errors/load_default_settings")
		  End If
		  
		  result = CheckDocumentFolders(SONGS_FOLDER)
		  If result = FOLDER_EMPTY Then
		    'Songs folder is empty, ask the user if want to try to copy the default songs to the docs folder
		    '(as long as the defaults folder isn't empty of course ;)
		    If CheckDefaultFolders(SONGS_FOLDER) = FOLDER_EXISTS Then
		      If InputBox.AskYN(App.T.Translate("questions/songs_folder_empty/@caption")) Then
		        If Not FileUtils.CopyPath(AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SONGS), DocsFolder.Child(STR_SONGS)) Then
		          InputBox.Message T.Translate("errors/copy_default_songs", DocsFolder.Child(STR_SONGS).NativePath)
		        End If
		      End If
		    Else
		      InputBox.Message T.Translate("errors/no_songs_folder", AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SONGS).NativePath)
		    End If
		  ElseIf result = NO_FOLDER Then
		    If DocsFolder <> Nil Then
		      InputBox.Message T.Translate("errors/create_songs_folder", DocsFolder.Child(STR_SONGS).NativePath)
		    Else
		      InputBox.Message T.Translate("errors/no_docs_folder", "")
		    End If
		  End If
		  
		  result = CheckDocumentFolders(SETS_FOLDER)
		  If result = FOLDER_EMPTY Then
		    'Sets folder is empty, ask the user if want to try to copy the default sets to the docs folder
		    '(as long as the defaults folder isn't empty of course ;)
		    If CheckDefaultFolders(SETS_FOLDER) = FOLDER_EXISTS Then
		      If InputBox.AskYN(App.T.Translate("questions/sets_folder_empty/@caption")) Then
		        If Not FileUtils.CopyPath(AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETS), DocsFolder.Child(STR_SETS)) Then
		          InputBox.Message T.Translate("errors/create_sets_folder", DocsFolder.Child(STR_SETS).NativePath)
		        End If
		      End If
		    Else
		      InputBox.Message T.Translate("errors/no_sets_folder", AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETS).NativePath)
		    End If
		  ElseIf result = NO_FOLDER Then
		    If DocsFolder <> Nil Then
		      InputBox.Message T.Translate("errors/create_sets_folder", DocsFolder.Child(STR_SETS).NativePath)
		    Else
		      InputBox.Message T.Translate("errors/no_docs_folder", "")
		    End If
		  End If
		  
		  result = CheckDocumentFolders(BACKGROUNDS_FOLDER)
		  Dim bgfolder As FolderItem
		  bgfolder = GetDocumentFolderItem(BACKGROUNDS_FOLDER)
		  If result = FOLDER_READONLY Then
		    If bgfolder.Count = 0 Then
		      result = FOLDER_EMPTY
		    End If
		  End If
		  If result = FOLDER_EMPTY Then
		    'Backgrounds folder is empty, ask the user if want to try to copy the default Backgrounds to the docs folder
		    '(as long as the defaults folder isn't empty of course ;)
		    If CheckDefaultFolders(BACKGROUNDS_FOLDER) = FOLDER_EXISTS Then
		      If InputBox.AskYN(App.T.Translate("questions/backgrounds_folder_empty/@caption")) Then
		        If Not FileUtils.CopyPath(AppFolder.Child(STR_OS_DEFAULTS).Child(STR_BACKGROUNDS), bgfolder) Then
		          InputBox.Message T.Translate("errors/create_backgrounds_folder", bgfolder.NativePath)
		        End If
		      End If
		    Else
		      InputBox.Message T.Translate("errors/no_backgrounds_folder", AppFolder.Child(STR_OS_DEFAULTS).Child(STR_BACKGROUNDS).NativePath)
		    End If
		    
		  ElseIf result = NO_FOLDER Then
		    If IsNull(bgfolder) Then
		      InputBox.Message T.Translate("errors/create_backgrounds_folder",STR_BACKGROUNDS)
		    ElseIf Not bgfolder.Exists Or Not bgfolder.IsFolder Then
		      InputBox.Message T.Translate("errors/create_backgrounds_folder",FileUtils.GetDisplayFullPath(bgfolder))
		    ElseIf bgfolder.LastErrorCode <> 0 Then
		      FileUtils.SetLastError(bgfolder)
		      InputBox.Message FileUtils.LastError
		    Else 
		      InputBox.Message T.Translate("errors/fileutils/accessdenied", FileUtils.GetDisplayFullPath(bgfolder))
		    End If
		  End If
		  
		  ' --- LOAD SETTINGS ---
		  'Load default files if settings files in DocsFolder are corrupted (bug #1803741)
		  'The settings folder should be handled in the Installer/Uninstaller as well
		  
		  Do
		    Splash.SetStatus T.Translate("load_settings/main") + "..."
		    
		    result = CheckDocumentFolders(SETTINGS_FOLDER)
		    Dim settingsFolder As FolderItem
		    If result = FOLDER_EXISTS Then
		      settingsFolder = GetDocumentFolderItem(SETTINGS_FOLDER)
		    End If
		    If settingsFolder <> Nil Then
		      MyMainSettings = SmartML.XDocFromFile(settingsFolder.Child("MainSettings"))
		    Else
		      MyMainSettings = Nil
		    End If
		    If MyMainSettings = Nil Then
		      MyMainSettings = SmartML.XDocFromFile(AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETTINGS).Child("MainSettings"))
		      If MyMainSettings = Nil Then
		        SmartML.DisplayError
		        Quit
		      End If
		    End If
		    
		    // process preferences here, because where we loaded them no splash window was open, and translator was not loaded
		    // also we might move some settings from MainSettngs to there
		    UpdatePreferences
		    
		    Splash.SetStatus T.Translate("load_settings/print") + "..."
		    
		    If settingsFolder <> Nil Then
		      MyPrintSettings = SmartML.XDocFromFile(settingsFolder.Child("PrintSettings"))
		    Else
		      MyPrintSettings = Nil
		    End If
		    If MyPrintSettings = Nil Then
		      MyPrintSettings = SmartML.XDocFromFile(AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETTINGS).Child("PrintSettings"))
		      If MyPrintSettings = Nil Then
		        // start with built-in defaults
		        MyPrintSettings = New XmlDocument
		      End If
		      Dim prtSettings As XmlNode = SmartML.GetNode(MyPrintSettings, "print_settings", True)
		      // we copied defaults. Let's adjust paper size and unit of measures
		      // US gets Letter-Size and Inches, everybody else A4 and metric
		      // if @inches is set right before, don't alter paper size and margins
		      If CountryUsesImerialPaperSize(Locale.Current) Then
		        '  <page width="612" height="792" left="72" top="72" right="72" bottom="72" points="true" inches="true"/>
		        If SmartML.GetValueB(prtSettings, "page/@inches", False, False) Then
		          SmartML.SetValueB(prtSettings, "page/@inches", True)
		          SmartML.SetValueB(prtSettings, "page/@points", True)
		          SmartML.SetValueN(prtSettings, "page/@width", 612)
		          SmartML.SetValueN(prtSettings, "page/@height", 792)
		          SmartML.SetValueN(prtSettings, "page/@left", 72)
		          SmartML.SetValueN(prtSettings, "page/@top", 72)
		          SmartML.SetValueN(prtSettings, "page/@right", 72)
		          SmartML.SetValueN(prtSettings, "page/@bottom", 72)
		        End If
		      Else
		        ' <page width="595.32" height="841.92" left="70.92" top="42.48" right="42.48" bottom="42.48" points="true" inches="false"/>
		        If SmartML.GetValueB(prtSettings, "page/@inches", False, True) Then
		          SmartML.SetValueB(prtSettings, "page/@inches", False)
		          SmartML.SetValueB(prtSettings, "page/@points", True)
		          SmartML.SetValueN(prtSettings, "page/@width", 595.32)
		          SmartML.SetValueN(prtSettings, "page/@height", 841.92)
		          SmartML.SetValueN(prtSettings, "page/@left", 70.92)
		          SmartML.SetValueN(prtSettings, "page/@top", 42.48)
		          SmartML.SetValueN(prtSettings, "page/@right", 42.48)
		          SmartML.SetValueN(prtSettings, "page/@bottom", 42.48)
		        End If
		      End If
		      MyPrintSettings.SaveXml DocsFolder.Child("Settings").Child("PrintSettings")
		    End If
		    // Update PritntSettings to use points instead of inches
		    UpdatePrintSettings
		    Try
		      Dim PrtSetupStr As String
		      Dim ps As PrinterSetup
		      PrtSetupStr = DecodeBase64(MainPreferences.GetValue(Prefs.PageSetup, "", False))
		      If PrtSetupStr <> "" Then
		        ps = New PrinterSetup
		        ps.MaxHorizontalResolution = -1
		        ps.MaxVerticalResolution = -1
		        ps.SetupString = PrtSetupStr
		        MyPrinterSetup = ps
		      End If
		    Catch
		    End Try
		    
		    Splash.SetStatus T.Translate("load_settings/presentation") + "..."
		    
		    If settingsFolder <> Nil Then
		      MyPresentSettings = SmartML.XDocFromFile(settingsFolder.Child("PresentSettings"))
		    Else
		      MyPresentSettings = Nil
		    End If
		    If MyPresentSettings = Nil Then
		      MyPresentSettings = SmartML.XDocFromFile(AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETTINGS).Child("PresentSettings"))
		      If MyPresentSettings = Nil Then
		        SmartML.DisplayError
		        Quit
		      End If
		    End If
		    // Move some XML around in MyPresentSettings to align with V1.0 BL13 changes.
		    UpdatePresentSettings
		  Loop Until True
		  
		  ' --- BUILD CAPO LIST ---
		  CapoList.Append "1"
		  CapoList.Append "2"
		  CapoList.Append "3"
		  CapoList.Append "4"
		  CapoList.Append "5"
		  
		  ' --- BUILD FONT LIST ---
		  Splash.SetStatus T.Translate("load_settings/fonts") + "..."
		  UpdateFontList
		  UpdateTranslationFonts
		  
		  ' --- CHECK FOR LATEST SONG AND SET VERSIONS ---
		  Dim songVersion, setVersion As Double
		  songVersion = SmartML.GetValueN(MyMainSettings.DocumentElement, "version/@songs")
		  setVersion = SmartML.GetValueN(MyMainSettings.DocumentElement, "version/@sets")
		  
		  GraphicsX.ThicknessFactor = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "style/@thickness")
		  
		  Profiler.EndProfilerEntry
		  
		  ' --- CHECK FOR A NEWER VERSION ---
		  
		  If Len(SmartML.GetValue(App.MyMainSettings.DocumentElement, "version/@check", False)) < 4 Then _
		  SmartML.SetValueB(App.MyMainSettings.DocumentElement, "version/@check", True)
		  
		  Dim checkVer As CheckVerThread
		  If SmartML.GetValueB(App.MyMainSettings.DocumentElement, "version/@check") Then
		    Splash.SetStatus T.Translate("load_settings/latest_version") + "..."
		    checkVer = new CheckVerThread
		    checkVer.Run
		  End If
		  
		  '++JRC Load Song Activity Log so the user can view the log
		  'reguardless of whether logging is enabled or not
		  'If MainPreferences.GetValueB(App.kActivityLog, True) Then
		  'Load in the Song Activity Log
		  Globals.SongActivityLog = New ActivityLog
		  'TODO Decide where we want to store the log file
		  '+++EMP Use FolderItem and .Child instead of AbsolutePath
		  result = CheckDocumentFolders(SETTINGS_FOLDER)
		  If result <> NO_FOLDER Then
		    If NOT Globals.SongActivityLog.Load(DocsFolder.Child("Settings").Child("ActivityLog.xml")) Then
		      InputBox.Message T.Translate("errors/activity_disabled", DocsFolder.Child("Settings").Child("ActivityLog.xml").NativePath)
		      Globals.SongActivityLog = Nil
		    End If
		  Else
		    If DocsFolder <> Nil Then
		      InputBox.Message T.Translate("errors/activity_disabled", DocsFolder.Child("Settings").Child("ActivityLog.xml").NativePath)
		    Else
		      InputBox.Message T.Translate("errors/no_docs_folder", "")
		    End If
		    Globals.SongActivityLog = Nil
		  End If
		  
		  T.TranslateMenu("main_menu", MainMenu)
		  T.TranslateMenu("songpicker_menu", SongPickerMenu)
		  PlatformSpecific
		  
		  m_ControlServer = New REST.RESTServer()
		  m_ControlServer.AddResource(New REST.RESTResourceSong)
		  m_ControlServer.AddResource(New REST.RESTResourceSet)
		  m_ControlServer.AddResource(New REST.RESTResourcePresent)
		  m_ControlServer.AddResource(New REST.RESTResourceWebSocket)
		  InitControlServer()
		  
		  NDIEnabled = MainPreferences.GetValueB(prefs.kNDIEnableSender, False, True)
		  #If DebugBuild
		    // Do this to get a reference that is easy to find during debugging.
		    // Without this, the only way to find NDI is to search the Runtime objects.
		    If NDIEnabled Then
		      NDISingleton = NDI.NDI
		    End If
		  #EndIf
		  
		  vMixEnabled = MainPreferences.GetValueB(prefs.kvMixEnable)
		  
		  If App.CheckDocumentFolders(App.SETTINGS_FOLDER) <> App.NO_FOLDER Then
		    If Not SmartML.XDocToFile(App.MyPresentSettings, App.DocsFolder.Child(App.STR_SETTINGS).Child("PresentSettings")) Then SmartML.DisplayError
		    If Not SmartML.XDocToFile(App.MyMainSettings, App.DocsFolder.Child(App.STR_SETTINGS).Child("MainSettings")) Then SmartML.DisplayError
		    If Not SmartML.XDocToFile(App.MyPrintSettings, App.DocsFolder.Child(App.STR_SETTINGS).Child("PrintSettings")) Then SmartML.DisplayError
		  End If
		  Call MainPreferences.Save
		  
		  App.MouseCursor = Nil
		  m_OpenComplete = True
		  
		  MainWindow.Show
		  
		  #if TargetLinux And XojoVersion < 2025 then
		    // bugfix for App.AutoQuit not working
		    // with Xojo 2024r4.2 Quit in mainWindow.Close caused a crash / segfault. Now it seens to work
		    ZombieGuardDog = New Timer
		    ZombieGuardDog.Period = 1000
		    ZombieGuardDog.RunMode = Timer.RunModes.Multiple
		    AddHandler ZombieGuardDog.Action, AddressOf KillZombieApp
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  Dim Popup As New ErrorPopup
		  
		  If SplashShowing And Splash <> Nil Then Splash.Hide
		  
		  Popup.SetDescription(error)
		  
		  App.MouseCursor = Nil
		  
		  Popup.ShowModal
		  
		  Quit
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CenterInControlScreen(win As Window)
		  Dim controlScreen As OpenSongUtils.OS_Screen = ControlScreen
		  
		  #If RBVersion < 2012 Or TargetLinux
		    win.Left = controlScreen.AvailableLeft + (controlScreen.AvailableWidth - win.Width) / 2
		    win.Top = controlScreen.AvailableTop + (controlScreen.AvailableHeight  - win.Height) / 2 + 10
		  #Else
		    Dim winBounds As Xojo.Rect
		    winBounds = win.Bounds
		    winBounds.Left = controlScreen.AvailableLeft + (controlScreen.AvailableWidth - winBounds.Width) / 2
		    winBounds.Top = controlScreen.AvailableTop + (controlScreen.AvailableHeight  - winBounds.Height) / 2
		    win.Bounds = winBounds
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckDefaultFolders(which As Integer) As Integer
		  '++JRC This function checks whether or not the default  folders exist or are empty
		  '       Parameters: which as Integer
		  'DEFAULTS_FOLDER = Main Defaults Folder
		  'SONGS_FOLDER = Songs Folder
		  'SETS_FOLDER = Set Folder
		  'BACKGROUNDS_FOLDER = Backgrounds Folder
		  '
		  '       Return Values:
		  'FOLDER_EXISTS = The folder exists and has files
		  'NO_FOLDER = The folder does NOT exist
		  'FOLDER_EMPTY = The folder exists but is empty
		  'INVALID_FOLDER = Invaild folder specified
		  
		  Dim f As FolderItem
		  
		  Select Case which
		  Case DEFAULTS_FOLDER
		    f = AppFolder.Child(STR_OS_DEFAULTS)
		  Case SONGS_FOLDER
		    f = AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SONGS)
		  Case SETS_FOLDER
		    f = AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETS)
		  Case BACKGROUNDS_FOLDER
		    f = AppFolder.Child(STR_OS_DEFAULTS).Child(STR_BACKGROUNDS)
		  Case SETTINGS_FOLDER
		    f = AppFolder.Child(STR_OS_DEFAULTS).Child(STR_SETTINGS)
		  Else 'sanity check
		    Return INVALID_FOLDER
		  End Select
		  
		  If f = Nil Then Return NO_FOLDER
		  If NOT f.Exists Then Return NO_FOLDER
		  IF f.Count = 0 Then Return FOLDER_EMPTY
		  
		  Return FOLDER_EXISTS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckDocumentFolders(which As Integer, Create As Boolean = True, Prompt As Boolean = False) As Integer
		  '++JRC This function checks whether or not the document  folders exist or are empty
		  '       Parameters: which as Integer
		  'DOCUMENTS_FOLDER = Main Documents Folder
		  'SONGS_FOLDER = Songs Folder
		  'SETS_FOLDER = Set Folder
		  'BACKGROUNDS_FOLDER = Backgrounds Folder
		  '       Create as Boolean
		  'Tells the function whether to create the specified folder or not
		  'default is True
		  '       Prompt as Boolean
		  'Tells the function whether to prompt the user before creating specified folder
		  '(not currently used)
		  '       Return Values:
		  'FOLDER_EXISTS = The folder exists and has files
		  'NO_FOLDER = The folder does NOT exist
		  'FOLDER_EMPTY = The folder exists but is empty
		  'INVALID_FOLDER = Invaild folder specified
		  'FOLDER_READONLY = The folder exists and is set read-only
		  '
		  
		  #Pragma Unused Prompt
		  
		  Dim f As FolderItem
		  
		  If DocsFolder = Nil Then Return NO_FOLDER
		  
		  'Try to create Documents folder it doesn't exist
		  If Create Then
		    If NOT FileUtils.CreateFolder(DocsFolder) Then Return NO_FOLDER
		  End If
		  
		  f = GetDocumentFolderItem(which)
		  
		  If f = Nil Then
		    // sanity check
		    If Array(DOCUMENTS_FOLDER, SONGS_FOLDER, SETS_FOLDER, BACKGROUNDS_FOLDER, SETTINGS_FOLDER, SCRIPTURE_FOLDER).IndexOf(which) >= 0 Then
		      Return NO_FOLDER
		    Else
		      Return INVALID_FOLDER
		    End If
		  End If
		  
		  'Try to create folder it doesn't exist
		  If Create Then
		    If NOT FileUtils.CreateFolder(f) Then Return NO_FOLDER
		  End If
		  
		  If Not f.Exists Then Return NO_FOLDER
		  
		  If FileUtils.IsReadonly(f) Then Return FOLDER_READONLY
		  
		  If f.Count = 0 Then Return FOLDER_EMPTY
		  
		  Return FOLDER_EXISTS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FriendlyXMLException(e As XMLException) As String
		  Return e.Message + EndOfLine + " (" + e.Node + ":" + e.Line + ") " + e.Token + " (E" + Str(e.ErrorNumber) + ")"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetDocsFolder() As FolderItem
		  //++
		  // Determine the proper folder for storing the documents (Songs, sets, etc.)
		  // The documents folder is determined as follows:
		  // If it is a portable installation, use AppDocumentsFolder
		  // otherwise
		  // 1. If there is a folder set in the user's preferences, use that if it exists.
		  // 2. If there is nothing in the user's preferences, check the OpenSong Globals
		  //     file.
		  //     a. If there is a relative path specified here, use the built-in DocumentsFolder
		  //         as the top folder.  Store the resultant folder in the user prefs.
		  //     b. If there is an absolute path, use it.  Do not store in the user prefs.
		  // 3. If the folder determined by #1 and #2 doesn't exist, or if the folder is the
		  //     empty string, prompt the user for the folder to use and store this in user prefs.
		  //--
		  
		  Dim f As FolderItem
		  Dim FolderName As String
		  Dim e As RuntimeException
		  Dim appCursor As MouseCursor
		  
		  If IsPortable Then
		    f = AppDocumentsFolder
		    If f = Nil Then
		      e = New RuntimeException
		      e.Message = "GetDocsFolder: AppDocumentsFolder not found for Portable version"
		      Raise e
		    End If
		    Return f
		  End If
		  
		  f = MainPreferences.GetValueFI(Prefs.kDocumentsFolder, Nil, False)
		  If f = Nil Then
		    FolderName = Trim(SmartML.GetValue(MyGlobals.DocumentElement, "documents/@folder"))
		    
		    If FolderName <> "" Then
		      f = PathToFolderItem(FolderName, FileUtils.PathType)
		      If f = Nil Then
		        If FileUtils.IsPathRooted(FolderName) Then
		          // try to create the folder, starting from the root
		          If Not FileUtils.CreateFolderTree(f, FolderName) Then
		            DebugWriter.Write CurrentMethodName + ": Error trying to create folder " + FolderName + " : " + FileUtils.LastError, 1
		            f = Nil
		          End If
		        Else
		          DebugWriter.Write CurrentMethodName + ": Relative path could not be resolved (what is the root?) " + FolderName + " : " + FileUtils.LastError, 1
		        End If
		      End If
		      If f = Nil Or Not f.Exists Then
		        Try
		          If SplashShowing Then Splash.Hide
		          appCursor = App.MouseCursor
		          App.MouseCursor = Nil
		          f = QueryDocsFolder(f)
		          App.MouseCursor = appCursor
		          If SplashShowing Then Splash.Show
		        Catch
		          System.DebugLog "OpenSong: user cancelled document folder selection"
		          Return Nil
		        End Try
		        MainPreferences.SetValueFI(prefs.kDocumentsFolder, f)
		      End If
		    Else // FolderItem in MainPreferences is Nil, FolderName = ""
		      // Nil folderitem in personal prefs, no path in Globals; prompt user
		      Try
		        If SplashShowing Then Splash.Hide
		        appCursor = App.MouseCursor
		        App.MouseCursor = Nil
		        f = QueryDocsFolder(Nil)
		        App.MouseCursor = appCursor
		        If SplashShowing Then Splash.Show
		      Catch
		        System.DebugLog "OpenSong: user cancelled document folder selection"
		        Return Nil
		      End Try
		      
		      If FileUtils.IsChild(f, AppFolder.Child(STR_OS_DEFAULTS)) Then
		        MsgBox(App.T.Translate("errors/docs_folder", FileUtils.GetDisplayFullPath(AppDocumentsFolderForOpenSong)))
		        f = AppDocumentsFolderForOpenSong
		      End If
		      MainPreferences.SetValueFI(Prefs.kDocumentsFolder, f)
		    End If //If FolderName <> ""
		  Else // folder found in MainPreferences, make sure it exists.
		    //++
		    // If the DocumentsFolder saved in preferences doesn't exist,
		    // the Macintosh version apparently will grab a random file.
		    // While this will not catch a case where that file is a directory,
		    // the odds are with us that this will catch it.
		    // EMP, 28 August 2010
		    //--
		    If (Not f.exists) Or (Not f.Directory) Then
		      Try
		        If SplashShowing Then Splash.Hide
		        appCursor = App.MouseCursor
		        App.MouseCursor = Nil
		        f = QueryDocsFolder(Nil)
		        App.MouseCursor = appCursor
		        If SplashShowing Then Splash.Show
		      Catch
		        System.DebugLog "OpenSong: user cancelled document folder selection"
		        Quit
		      End Try
		      MainPreferences.SetValueFI(Prefs.kDocumentsFolder, f)
		    End If
		  End If //If MainPreferences.kDocumentsFolder = Nil
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDocumentFolderItem(which As Integer) As FolderItem
		  // this is a companion function to CheckDocumentFolders. It returns a folder item for the path requested
		  //
		  // Parameter: which as Integer
		  // DOCUMENTS_FOLDER = Main Documents Folder
		  // SONGS_FOLDER = Songs Folder
		  // SETS_FOLDER = Set Folder
		  // BACKGROUNDS_FOLDER = Backgrounds Folder
		  //
		  // Return Value: 
		  // FolderItem for the path, or Nil
		  
		  Dim f As FolderItem = Nil
		  Try
		    Select Case which
		    Case DOCUMENTS_FOLDER
		      f = DocsFolder
		    Case SONGS_FOLDER
		      f = DocsFolder.Child(STR_SONGS)
		    Case SETS_FOLDER
		      f = DocsFolder.Child(STR_SETS)
		    Case BACKGROUNDS_FOLDER
		      Try
		        If Not App.IsPortable Then
		          If App.MainPreferences.GetValueB(Prefs.kUseSeparateBackgrounds, False, False) Then
		            f = App.MainPreferences.GetValueFI(Prefs.kBackgroundsFolder, Nil, True)
		          End If
		        End If
		        If f = Nil Or Not f.Exists Then
		          f = DocsFolder.Child(STR_BACKGROUNDS)
		        End If
		      Catch
		        f = DocsFolder.Child(STR_BACKGROUNDS)
		      End Try
		    Case SETTINGS_FOLDER
		      f = DocsFolder.Child(STR_SETTINGS)
		    Case SCRIPTURE_FOLDER
		      f = DocsFolder.Child(STR_SCRIPTURE)
		    End Select
		  Catch
		  End Try
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFrontControlScreenWindow() As Window
		  // Returns the frontmost window on the control screen
		  // EMP 26 Feb 2006
		  //
		  Dim wc As Integer
		  Dim i As Integer
		  Dim cs As Integer
		  
		  wc = WindowCount - 1
		  cs = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "monitors/@control") - 1
		  If cs < 0 Or cs + 1 > OSScreenCount() Then cs = 0
		  
		  For i = 0 To wc
		    If Window(i).Visible Then
		      If Window(i).Left >= OSScreen(cs).Left _
		        And Window(i).Left < OSScreen(cs).Left + OSScreen(cs).Width _
		        And Window(i).Top >= OSScreen(cs).Top _
		        And Window(i).Top < OSScreen(cs).Top + OSScreen(cs).Height _
		        Then
		        Return Window(i)
		      End If
		    End If
		  Next i
		  Return Nil // Fell through, no one is on the control screen
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageAsString(img As Picture) As String
		  Dim strBase64 As String
		  
		  If img <> Nil Then
		    Dim QualitySetting As ImageQualityEnum = ImageDefaults.ImageQuality
		    Dim data As MemoryBlock = Nil
		    Dim dataIsSet As Boolean = False
		    
		    Try
		      // JPEG looses alpha, so try to save as PNG
		      If Picture.IsExportFormatSupported(Picture.Formats.PNG) Then
		        Dim styleImg As New StyleImage
		        styleImg.SetImage(img)
		        If styleImg.HasUsableAlpha Then
		          data = img.GetData(Picture.FormatPNG)
		          dataIsSet = true
		        End If
		      End If
		      If Not dataIsSet Then
		        //Try to use GDI+ (fallback to QuickTime) (Windows) or Linux, MacOS native
		        Dim quality As Integer = Picture.QualityDefault
		        Select Case QualitySetting
		        Case ImageQualityEnum.FullCompression
		          quality = 0
		        Case ImageQualityEnum.HighCompression
		          quality = 40
		        Case ImageQualityEnum.LittleCompression
		          quality = 65
		        Case ImageQualityEnum.LowCompression
		          quality = 85
		        Case ImageQualityEnum.NoCompression
		          quality = 100
		        Else
		          quality = Picture.QualityDefault 'Default - no one knows :D
		        End Select
		        
		        data = img.GetData(Picture.FormatJPEG, quality)
		      End If
		    Catch
		      //If JPEG fails, use the most safe ...
		      data = img.GetData(Picture.FormatBMP)
		    End Try
		    
		    strBase64 = EncodeBase64(data)
		  End If
		  
		  Return strBase64
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPrefsFolder() As FolderItem
		  //++
		  // Return the appropriate folder for the platform.
		  // Necessary in order to create folder if needed
		  // Also necessary because the folder will have a different
		  // name on certain platforms.
		  //--
		  Dim f As FolderItem
		  
		  f = AppPreferencesFolderForOpenSong
		  
		  If FileUtils.CreateFolder(f) Then
		    Return f
		  Else
		    '++JRC Prevent NilObjectException (bug #1810528)
		    If f <> Nil Then App.DebugWriter.Write("GetPrefsFolder: Error in CreateFolder for " + f.NativePath + ", " + FileUtils.LastError, 1)
		    Return Nil
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPrinterSetup(ShowDialog As Boolean = False, Wnd As Window = Nil) As PrinterSetup
		  //
		  // OpenSong maintains a single PrinterSetup object for the printer.  This routine controls
		  // access to that object.  If ShowDialog is True, then the PrinterSetup dialog will be shown.
		  // If Wnd is not Nil, that Dialog will be attached to the given window (Mac only).
		  //
		  // RealBasic for the Mac has an issue with the PrinterSetup object.  The one returned
		  // from PageSetupDialog is invalid.  It has to be copied into a new one to be used.  For
		  // this reason, a clone is returned on OS X.
		  //
		  // On Windows, a second call to OpenPrinterDialog with the same PrinterSetup object
		  // results in no dialog display and Nil returned for the Graphics object.  Copy it, and
		  // all works fine.  Go figure.
		  //
		  // TODO:
		  // this needs a different approach for Linux since (as of RB2005R4) PrinterSetup
		  // doesn't do anything useful.
		  //
		  
		  Dim TempPS As PrinterSetup
		  Dim NewPS As PrinterSetup
		  Dim status As Boolean
		  
		  If MyPrinterSetup = Nil And Not ShowDialog Then Return Nil
		  
		  TempPS = New PrinterSetup
		  TempPS.MaxHorizontalResolution = -1
		  TempPS.MaxVerticalResolution = -1
		  
		  If MyPrinterSetup <> Nil Then
		    TempPS.SetupString = MyPrinterSetup.SetupString
		  Else
		    OpenSongUtils.InitPageSetupFromSettings(TempPS, MyPrintSettings)
		  End If
		  
		  If ShowDialog Then
		    #If XojoVersion < 2019.02
		      status = TempPS.PageSetupDialog
		    #Else
		      status = TempPS.ShowPageSetupDialog
		    #EndIf
		    
		    If status Then
		      MyPrinterSetup = TempPS // Save the new settings
		      
		      Dim PS As XmlElement
		      PS = MyPrintSettings.DocumentElement
		      SmartML.SetValueB(PS, "page/@points", True) 
		      SmartML.SetValueN(PS, "page/@top", -MyPrinterSetup.PageTop / MyPrinterSetup.VerticalResolution * 72.0)
		      SmartML.SetValueN(PS, "page/@bottom", (MyPrinterSetup.PageHeight - MyPrinterSetup.Height + MyPrinterSetup.PageTop) / MyPrinterSetup.VerticalResolution * 72.0)
		      SmartML.SetValueN(PS, "page/@left", -MyPrinterSetup.PageLeft / MyPrinterSetup.HorizontalResolution * 72.0)
		      SmartML.SetValueN(PS, "page/@right", (MyPrinterSetup.PageWidth - MyPrinterSetup.Width + MyPrinterSetup.PageLeft) / MyPrinterSetup.HorizontalResolution * 72.0)
		      
		      SmartML.SetValueN(PS, "page/@width", MyPrinterSetup.PageWidth / MyPrinterSetup.HorizontalResolution * 72.0)
		      SmartML.SetValueN(PS, "page/@height", MyPrinterSetup.PageHeight / MyPrinterSetup.VerticalResolution * 72.0)
		    Else
		      Return Nil // User cancelled dialog.
		    End If
		  Else // Don't show dialog
		    
		  End If
		  // We have a non-null MyPrinterSetup now.  Copy it and return
		  NewPS = New PrinterSetup
		  NewPS.MaxHorizontalResolution = -1
		  NewPS.MaxVerticalResolution = -1
		  NewPS.SetupString = TempPS.SetupString
		  Return NewPS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitControlServer()
		  If (SmartML.GetValueB(App.MyMainSettings.DocumentElement, "rcserver/@enable", False)) Then
		    Dim port As Integer = SmartML.GetValueN(App.MyMainSettings.DocumentElement, "rcserver/@port")
		    If port >0 Then
		      m_ControlServer.Port = port
		    Else
		      m_ControlServer.Port = 8080
		    End If
		    
		    m_ControlServer.MinimumSocketsAvailable = 2
		    
		    Dim max_connections As Integer = SmartML.GetValueN(App.MyMainSettings.DocumentElement, "rcserver/@max_connections", False)
		    If max_connections > 0 Then
		      m_ControlServer.MaximumSocketsConnected = max_connections
		    Else
		      m_ControlServer.MaximumSocketsConnected = 25
		    End If
		    
		    m_ControlServer.Key(SmartML.GetValue(App.MyMainSettings.DocumentElement, "rcserver/key"))
		    m_ControlServer.Listen()
		  Else
		    m_ControlServer.StopListening()
		    For Each socket As TCPSocket In m_ControlServer.ActiveConnections()
		      Dim restSocket As REST.RESTSocket = REST.RESTSocket(socket)
		      restSocket.Disconnect()
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub KillZombieApp(Sender As Timer)
		  If WindowCount = 0 Then
		    RemoveHandler Sender.Action, AddressOf KillZombieApp
		    Sender.RunMode = Timer.RunModes.Off
		    Quit
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadPreferences()
		  //++
		  // Set up the preferences object to use for reference.
		  //
		  // Edit 21 Apr 2007
		  //    Change filename on non-Mac platforms to have .plist extension
		  //    If MainPreferences is non-Nil, treat this as a reload operation (was NOOP in RC2-16)
		  //--
		  Dim v As String
		  Dim f As FolderItem
		  
		  #if TargetMacOS
		    f = GetPrefsFolder().Child("org.opensong.opensong.plist")
		  #else
		    //++
		    // Kluge alert! Fix V1.0 RC2-16 issue where the file doesn't have an extension
		    //--
		    Dim PrefFile As String
		    PrefFile = "preferences.plist"
		    '++JRC Fixed: f gets eaten by the next call to GetPrefsFolder()
		    f = GetPrefsFolder().Child("preferences")
		    If f = Nil Then
		      'doesn't exist try loading new prefs file
		      f = GetPrefsFolder().Child(PrefFile)
		    Else
		      If f.exists Then
		        f.name = PrefFile 'Rename file
		      Else
		        'doesn't exist try loading new prefs file
		        f = GetPrefsFolder().Child(PrefFile)
		      End If
		    End If
		  #endif
		  
		  If MainPreferences <> Nil Then // Reloading
		    If Not prefsPlist(MainPreferences).Save Then Return
		    MainPreferences = Nil
		  End If
		  
		  MainPreferences = New prefsPlist
		  
		  If Not MainPreferences.Load(f) Then
		    Dim pListErrorWnd As PlistErrorWindow = New PlistErrorWindow()
		    If pListErrorWnd.DoRecover(f) Then
		      Dim e As RuntimeException
		      If f.Exists() Then
		        f.Delete()
		        If f.LastErrorCode <> 0 Then
		          FileUtils.SetLastError(f)
		          e = New RuntimeException(FileUtils.LastError)
		          MainPreferences = Nil
		          Raise e
		        ElseIf f.Exists Then
		          f.LastErrorCode = FolderItem.AccessDenied
		          FileUtils.SetLastError(f)
		          e = New RuntimeException(FileUtils.LastError)
		          MainPreferences = Nil
		          Raise e
		        End If
		      End If
		      MainPreferences = New prefsPlist
		      
		      'Try creating the preferences from scratch.
		      'If that fails, crash anyway...
		      If Not MainPreferences.Load(f) Then
		        e = New RuntimeException(MainPreferences.ErrorString)
		        MainPreferences = Nil
		        Raise e
		      End If
		    Else
		      MainPreferences = Nil
		      Quit()
		    End If
		  End If
		  
		  //++
		  // Set the version of the file if it doesn't exist.  This will give us a way to
		  // determine if new content needs to be added as this list gets used more
		  //--
		  v = MainPreferences.GetValue("/@version", CStr(PREFERENCESVERSION), True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MaximizeInControlScreen(win As Window)
		  Dim controlScreen As Integer
		  Dim theScreen As OpenSongUtils.OS_Screen
		  If App.MyPresentSettings <> Nil Then
		    controlScreen = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "monitors/@control") - 1
		    If controlScreen < 0 Or controlScreen + 1 > OSScreenCount() Then controlScreen = 0
		  Else
		    controlScreen = 0
		  End If
		  theScreen = OSScreen(controlScreen)
		  
		  #If RBVersion < 2012 Or TargetLinux
		    win.Width = theScreen.AvailableWidth - 40
		    win.Height = theScreen.AvailableHeight - 115
		    win.Top = theScreen.AvailableTop + (theScreen.AvailableHeight - win.Height) / 2 + 10
		    win.Left = theScreen.AvailableLeft + (theScreen.AvailableWidth - win.Width) / 2
		  #Else
		    Dim b As New REALbasic.Rect
		    b.Width = theScreen.AvailableWidth
		    b.Height = theScreen.AvailableHeight
		    b.Top = theScreen.AvailableTop
		    b.Left = theScreen.AvailableLeft
		    win.Bounds = b
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MinimizeWindow(Wnd As Window)
		  //++
		  // Provides functionality to minimize a window to the taskbar on Windows or Mac
		  // No functionality yet on Linux (due to testing constraints)
		  //
		  // This routine can be replaced for all platforms by the Window.Minimize method when OpenSong moves
		  // to RealBasic 2006 or later.
		  //
		  // Ed Palmer, May 2006
		  //--
		  
		  #If TargetWindows
		    Dim status As Integer
		    #If Target64Bit
		      Dim lparam As New MemoryBlock(8)
		      lparam.UInt64Value(0) = 0
		    #Else
		      Dim lparam As New MemoryBlock(4)
		      lparam.UInt32Value(0) = 0
		    #EndIf
		    Const WM_SYSCOMMAND = 274
		    Const SC_MINIMIZE = 61472
		    
		    Declare Function SendMessageA Lib "user32" (ByVal hwnd As Integer, ByVal msg As UInteger, ByVal wParam As UInteger, ByVal lParam As Ptr) As Integer
		    
		    status = SendMessageA(wnd.Handle, WM_SYSCOMMAND, SC_MINIMIZE, lparam)
		    
		  #ElseIf TargetMacOS
		    wnd.IsCollapsed = True
		  #Else
		    wnd.Minimize
		  #EndIf
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PlatformSpecific()
		  //++
		  // PlatformSpecific is used to do anything that might be specific to
		  // the operating system OpenSong is running under.
		  //--
		  #If TargetWin32
		    // Windows items go here
		    mnu_file_quit.KeyboardShortcut = ""
		    Globals.UseSheetDialogs = False
		  #elseif TargetMacOS
		    // Macintosh items go here
		    mnu_help_help_topics.KeyboardShortcut = "?"
		    Globals.UseSheetDialogs = MainPreferences.GetValueB(prefs.kUseSheetDialogs, True)
		  #elseif TargetLinux
		    // Linux items go here
		    Globals.UseSheetDialogs = False
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function QueryDocsFolder(path As FolderItem, suggested As String = STR_OS_DOCUMENTS) As FolderItem
		  Dim mb As DocFolderSelectWindow
		  Dim f, f1, defaultsFolder As FolderItem
		  Dim e As RuntimeException
		  Dim ask As Boolean = True
		  
		  defaultsFolder = AppFolder.Child(STR_OS_DEFAULTS)
		  f = path
		  mb = New DocFolderSelectWindow
		  While ask
		    f = mb.SelectDocFolder(f, suggested)
		    If f = Nil Then
		      e = New RuntimeException
		      If T <> Nil Then
		        e.Message = T.Translate("errors/no_docs_folder", "User canceled selection in GetDocsFolder")
		      Else
		        e.Message = "A folder to store OpenSong documents must be selected.  OpenSong must shut down."
		      End If
		      Raise e
		    End If
		    
		    // DocsPath needs to be somewhere other than under OpenSong Defaults.
		    f1 = f
		    ask = False
		    While f1 <> Nil
		      If f1.NativePath = defaultsFolder.NativePath Then
		        MsgBox T.Translate("errors/docs_folder", f.NativePath)
		        ask = True
		        Exit
		      End If
		      f1 = f1.Parent
		    Wend
		  Wend
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreWindow(Wnd As Window)
		  #If TargetWindows Then
		    Dim status As Integer
		    #If Target32Bit
		      Dim lparam As New MemoryBlock(4)
		    #Else
		      Dim lparam As New MemoryBlock(8)
		    #EndIf
		    Const WM_SYSCOMMAND = 274
		    Const SC_RESTORE = &HF120
		    
		    Declare Function SendMessageA Lib "user32" (ByVal hwnd As Integer, ByVal msg As Integer, ByVal wParam As Integer, ByVal lParam As Ptr) As Integer
		    
		    status = SendMessageA(wnd.Handle, WM_SYSCOMMAND, SC_RESTORE, lparam)
		    
		    Return
		    
		  #ElseIf TargetMacOS
		    wnd.IsCollapsed = False
		  #Else
		    Wnd.Restore
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SelectLanguage() As String
		  //++
		  // Allow the user to select a language file from the available translations
		  //--
		  Dim options() As String
		  Dim i As Integer
		  Dim d As FolderItem
		  Dim f As FolderItem
		  
		  d = AppFolder.Child("OpenSong Languages")
		  If Not d.Exists Then Return "" //Bad installation
		  If Not d.Directory Then Return ""
		  
		  options.Append "" // Open dialog with nothing selected
		  
		  For i = 1 To d.Count
		    f = d.Item(i)
		    If f.IsFileVisible And Not f.Directory Then
		      options.Append f.Name
		    End If
		  Next
		  
		  Return InputBox.Pick("Select a language", options)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetForeground(Wnd As Window)
		  #If TargetWin32 Then
		    
		    Declare Sub SetForegroundWindow Lib "user32" (ByVal hwnd As Integer)
		    
		    SetForegroundWindow(wnd.Handle)
		  #ElseIf TargetMacOS Then
		    Dim Status As Integer
		    Declare Function SelectWindow Lib "Carbon" (window As Integer) As Integer
		    Status = SelectWindow(wnd.Handle)
		  #ElseIf TargetLinux Then
		    Declare Sub gtk_window_present Lib "libgtk-3" (windows As Integer)
		    gtk_window_present(Wnd.Handle)
		  #Else
		    Wnd.Show
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowWin(Wnd As Window, Cmd As Integer)
		  #If TargetWin32 Then
		    Declare Sub ShowWindow Lib "user32" (ByVal hwnd As Integer, ByVal nCmdShow As Integer)
		    
		    ShowWindow(wnd.Handle, Cmd)
		    
		    If Cmd = SW_SHOWNA And wnd.FullScreen Then
		      App.DebugWriter.Write(CurrentMethodName + ": SW_SHOWNA and FullScreen", 7)
		      
		      Const SWP_NOSIZE = &H1
		      Const SWP_NOMOVE = &H2
		      Const SWP_NOACTIVATE = &h10
		      Const SWP_SHOWWINDOW = &h40
		      Const SWP_NOOWNERZORDER = &H200
		      Const HWND_TOPMOST = -1
		      Const HWND_NOTOPMOST = -2
		      
		      Declare Function SetWindowPos Lib "user32" (hwnd as Integer, hWndInsertAfter as Integer, x as Integer, y as Integer, cx as Integer, cy as Integer, flags as Integer) as Integer
		      
		      Call SetWindowPos(PresentWindow.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE + SWP_NOMOVE + SWP_NOACTIVATE + SWP_NOOWNERZORDER)
		      Call SetWindowPos(PresentWindow.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE + SWP_NOMOVE + SWP_NOACTIVATE + SWP_SHOWWINDOW + SWP_NOOWNERZORDER)
		    End If
		  #Else
		    #Pragma Unused Wnd
		    #Pragma Unused Cmd
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlideStyleColor(type As String) As Color
		  Try
		    If SlideStyleColorCache = Nil Then SlideStyleColorInit()
		    Dim v As Variant = SlideStyleColorCache.Lookup(type, Color.White)
		    If v.Type = v.TypeColor Then
		      Return v.ColorValue
		    Else
		      Return Color.White
		    End If
		  Catch
		    Return Color.White
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlideStyleColorEnabled() As Boolean
		  Try
		    If SlideStyleColorCache = Nil Then SlideStyleColorInit()
		    Return SlideStyleColorCache.Lookup("enabled", True).BooleanValue
		  Catch
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SlideStyleColorInit()
		  Dim slideColor As Color
		  SlideStyleColorCache = New Dictionary
		  
		  For Each p As Pair In Array( _
		    "verse"      : rgb(213,213,255), _
		    "bridge"     : rgb(138,138,255), _
		    "pre-chorus" : rgb(113,113,255), _
		    "chorus"     : rgb(188,188,255), _
		    "tag"        : rgb(163,163,255), _
		    "custom"     : rgb(255,227,213), _
		    "scripture"  : rgb(255,180,180), _
		    "style"      : rgb(234,234,255), _
		    "image"      : rgb(255,255,180), _
		    "external"   : rgb(213,255,213), _
		    "blank"      : rgb(255,255,255))
		    If Not SmartML.GetValueC(MyMainSettings.DocumentElement, "slide_style_color/" + p.Left + "/@color", slideColor, False) Then
		      slideColor = p.Right
		    End If
		    SlideStyleColorCache.Value(p.Left) = slideColor
		  Next p
		  SlideStyleColorCache.Value("enabled") = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "slide_style_color/@enabled", True, True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SmartVersion(WithNonRelease As Boolean = False) As String
		  Dim t As String
		  
		  t = "v" + App.VersionString
		  If WithNonRelease Then
		    t = t + "." + Str(App.NonReleaseVersion)
		  Else
		    If App.StageCode <> App.Final Then
		      t = t + "-"
		      select case App.StageCode
		      case 0
		        t = t + "Development"
		      case 1
		        t = t + "Alpha"
		      case 2
		        t = t + "Beta"
		      End Select
		    Else
		      If ReleaseCandidate > 0 Then
		        t= t + "-RC" + Str(App.ReleaseCandidate)
		      End If
		    End If
		  End If
		  Return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StatusNotifierSubscribe(subject As String, clientId As String) As Boolean
		  Dim notifiers() As String
		  Dim success As Boolean = False
		  
		  If m_ControlServer.HasResource(subject) Then
		    If m_statusNotifiers.HasKey(subject) Then
		      notifiers = m_statusNotifiers.Value(subject)
		    End If
		    
		    If notifiers.IndexOf(clientId) < 0 Then
		      notifiers.Append(clientId)
		      m_statusNotifiers.Value(subject) = notifiers
		      success = True
		      
		      m_ControlServer.StatusNotification(clientId, subject, "subscribe")
		    End If
		  End If
		  
		  Return success
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StatusNotifierUnsubscribe(subject As String, clientId As String) As Boolean
		  Dim notifiers() As String
		  Dim success As Boolean = False
		  
		  If m_ControlServer.HasResource(subject) Then
		    If m_statusNotifiers.HasKey(subject) Then
		      notifiers = m_statusNotifiers.Value(subject)
		    End If
		    
		    Dim i As Integer = notifiers.IndexOf(clientId)
		    If i >= 0 Then
		      notifiers.Remove(i)
		      m_statusNotifiers.Value(subject) = notifiers
		      success = True
		    End If
		  End If
		  
		  return success
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StatusNotifierUpdate(subject As String, reason As String)
		  If m_statusNotifiers.HasKey(subject) Then
		    Dim notifiers() As String = m_statusNotifiers.Value(subject)
		    
		    For Each clientId As String In notifiers
		      m_ControlServer.StatusNotification(clientId, subject, reason)
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestXML()
		  //++
		  // Test harness for SetValueFI and GetValueFI
		  //--
		  
		  Dim xdoc As New XmlDocument
		  Dim de As XmlNode
		  Dim fi As FolderItem
		  Dim xmlOutput As String
		  
		  de = xdoc.CreateElement("document")
		  xdoc.AppendChild de
		  
		  fi = New FolderItem(SpecialFolder.Documents.Child("PiwigoExport.log"))
		  
		  SmartML.SetValueFI(de, "absolute", fi)
		  SmartML.SetValueFI(de, "relative", fi, SmartML.RelativePath.UserSpecified, Volume(0))
		  SmartML.SetValueFI(de, "app_parent", fi, SmartML.RelativePath.AppParent)
		  SmartML.SetValueFI(de, "app_support", fi, SmartML.RelativePath.AppSupport)
		  SmartML.SetValueFI(de, "mydocuments", fi, SmartML.RelativePath.MyDocuments)
		  SmartML.SetValueFI(de, "opensongdocuments", fi, SmartML.RelativePath.OpenSongDocuments)
		  SmartML.SetValueFI(de, "opensongpreferences", fi, SmartML.RelativePath.OpenSongPreferences)
		  SmartML.SetValueFI(de, "attribute/@filename", fi)
		  SmartML.SetValue(de, "oldstyle", fi.NativePath)
		  xmlOutput = xdoc.Transform(kXmlPrettyPrint)
		  
		  #If RBVersion >= 2013.01
		    Dim xDoc2 As New XmlDocument(xmlOutput)
		    Dim fi2 As New FolderItem
		    
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "absolute")
		    If fi2.NativePath <> fi.NativePath Then Break
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "relative")
		    If fi2.NativePath <> fi.NativePath Then Break
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "app_parent")
		    If fi2.NativePath <> fi.NativePath Then Break
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "app_support")
		    If fi2.NativePath <> fi.NativePath Then Break
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "mydocuments")
		    If fi2.NativePath <> fi.NativePath Then Break
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "opensongdocuments")
		    If fi2.NativePath <> fi.NativePath Then Break
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "opensongpreferences")
		    If fi2.NativePath <> fi.NativePath Then Break
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "attribute/@filename")
		    If fi2.NativePath <> fi.NativePath Then Break
		    fi2 = SmartML.GetValueFI(xDoc2.DocumentElement, "oldstyle")
		    If fi2.NativePath <> fi.NativePath Then Break
		    Break
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateMe(splashShowing As Boolean = False)
		  Dim xnode As XmlNode
		  Dim i As Integer
		  
		  StylePreview = T.GetNode("style_preview")
		  
		  ' --- BUILD TEMPO LIST ---
		  If splashShowing Then Splash.SetStatus T.Translate("load_settings/tempos") + " ..."
		  xnode = T.GetNode("tempo_list").FirstChild
		  For i = UBound(TempoList) DownTo 1
		    TempoList.Remove i
		  Next i
		  While xnode <> Nil
		    TempoList.Append SmartML.GetValue(xnode, "@name")
		    xnode = xnode.NextSibling
		  Wend
		  
		  ' --- BUILD THEME LIST ---
		  If splashShowing Then Splash.SetStatus T.Translate("load_settings/themes") + " ..."
		  xnode = T.GetNode("theme_list").FirstChild
		  For i = UBound(ThemeList) DownTo 1
		    ThemeList.Remove i
		  Next i
		  While xnode <> Nil
		    ThemeList.Append SmartML.GetValue(xnode, "@name")
		    xnode = xnode.NextSibling
		  Wend
		  
		  ' --- BUILD TIME SIG LIST ---
		  If splashShowing Then Splash.SetStatus T.Translate("load_settings/time_signatures") + " ..."
		  xnode = T.GetNode("time_sig_list").FirstChild
		  For i = UBound(TimeSigList) DownTo 1
		    TimeSigList.Remove i
		  Next i
		  While xnode <> Nil
		    TimeSigList.Append SmartML.GetValue(xnode, "@name")
		    xnode = xnode.NextSibling
		  Wend
		  
		  ' --- BUILD TRANSITIONS LIST ---
		  If splashShowing Then Splash.SetStatus T.Translate("load_settings/transitions") + " ..."
		  xnode = T.GetNode("transition_list").FirstChild
		  For i = UBound(TransitionList) DownTo 1
		    TransitionList.Remove i
		  Next i
		  While xnode <> Nil
		    TransitionList.Append SmartML.GetValue(xnode, "@name")
		    xnode = xnode.NextSibling
		  Wend
		  
		  ' --- BUILD IMAGEQUALITY LIST ---
		  If splashShowing Then Splash.SetStatus T.Translate("load_settings/imagequality") + " ..."
		  xnode = T.GetNode("imagequality_list").FirstChild
		  For i = UBound(ImageQualityList) DownTo 0
		    ImageQualityList.Remove i
		  Next i
		  While xnode <> Nil
		    ImageQualityList.Append SmartML.GetValue(xnode, "@name")
		    xnode = xnode.NextSibling
		  Wend
		  
		  ' --- BUILD VIDEOLAN PRESET LIST ---
		  If splashShowing Then Splash.SetStatus T.Translate("load_settings/videolan_preset") + " ..."
		  xnode = T.GetNode("videolan_preset_list").FirstChild
		  VideolanPresetList.Clear()
		  While xnode <> Nil
		    If xnode.Name = "preset" Then
		      VideolanPresetList.Value(SmartML.GetValue(xnode, "@name")) = SmartML.GetValue(xnode, "@parameters")
		    End If
		    xnode = xnode.NextSibling
		  Wend
		  
		  ' --- BUILD TRANSPOSE ACCIDENTALS LIST ---
		  Redim TransposeAccidentalsList(2)
		  TransposeAccidentalsList(1) = App.T.Translate("general_song_editor/transpose/using/sharps/@caption")
		  TransposeAccidentalsList(2) = App.T.Translate("general_song_editor/transpose/using/flats/@caption")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateButtonPaint(useNewPaint As Boolean)
		  // updates the button paint style on all windows according to the global setting
		  // used when the setting in MainSetting changed
		  
		  App.DebugWriter.Write(CurrentMethodName, 7)
		  For i As Integer = 0 To App.WindowCount - 1
		    App.DebugWriter.Write("    Win " + App.Window(i).Title + " / " + Introspection.GetType(App.Window(i)).FullName, 7)
		    For Each cont As Control In App.Window(i).Controls
		      If cont IsA SButton Then
		        App.DebugWriter.Write("        "+ Introspection.GetType(cont).FullName + " " + cont.Name, 7)
		        SButton(cont).NewPaint = useNewPaint
		      End If
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateFontList()
		  Dim i, fntCnt As Integer
		  
		  fntCnt = System.FontCount
		  If FontList.Count <> fntCnt Then
		    FontList.RemoveAll
		    For i = 0 To fntCnt - 1
		      FontList.Add Font(i)
		    Next i
		    FontList.Sort
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdatePreferences()
		  Dim s As String
		  
		  Do // check last scripture and move it from MainSettings to MainPreferences
		    s = App.MainPreferences.GetValue(prefs.kScriptureVersion, ".", False)
		    If s <> "." Then Exit // there is scripture setup at the new location
		    
		    Dim xNode As XmlNode = SmartML.GetNode(App.MyMainSettings.DocumentElement, "last_scripture")
		    s = SmartML.GetValue(xNode, "@version", False, ".")
		    If s = "." Then Exit // there is no scripture setup at the old location
		    
		    App.MainPreferences.SetValue(prefs.kScriptureVersion, SmartML.GetValue(xNode, "@version", False))
		    App.MainPreferences.SetValueN(prefs.kLastScriptureBook, SmartML.GetValueN(xNode, "@book", False))
		    App.MainPreferences.SetValueN(prefs.kLastScriptureChapter, SmartML.GetValueN(xNode, "@chapter", False))
		    App.MainPreferences.SetValueN(prefs.kLastScriptureVerse, SmartML.GetValueN(xNode, "@verse", False))
		    App.MainPreferences.SetValueN(prefs.kLastScriptureThru, SmartML.GetValueN(xNode, "@thru", False))
		    App.MainPreferences.SetValueN(prefs.kScriptureVersePerSlide, SmartML.GetValueN(xNode, "@verse_per_slide", False))
		    App.MainPreferences.SetValueN(prefs.kScriptureCharsPerSlide, SmartML.GetValueN(xNode, "@chars_per_slide", False))
		    App.MainPreferences.SetValueB(prefs.kScriptureShowNumbers, SmartML.GetValueB(xNode, "@show_numbers", False))
		    App.MainPreferences.SetValue(prefs.kScriptureFormat, SmartML.GetValue(xNode, "@format"))
		    
		    SmartML.RemoveNode(App.MyMainSettings.DocumentElement, "last_scripture")
		    
		    Exit
		  Loop
		  
		  s = App.MainPreferences.GetValue(prefs.kVmixLocation, "", False)
		  If s <> "" Then
		    If App.MainPreferences.GetValue(prefs.kvMixFolder, ".", False) = "." Then
		      Dim f As FolderItem
		      f = App.MainPreferences.GetValueFI(prefs.kVmixLocation, Nil, False)
		      App.MainPreferences.SetValueFI(prefs.kvMixFolder, f)
		      If App.MainPreferences.GetValue(prefs.kvMixEnable, ".", False) = "." Then
		        App.MainPreferences.SetValueB(prefs.kvMixEnable, Not IsNull(f))
		      End If
		    End If
		    App.MainPreferences.Remove(prefs.kVmixLocation)
		  Else
		    Call App.MainPreferences.GetValueB(prefs.kvMixEnable, False, True)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdatePresentSettings()
		  Dim settings As XmlElement
		  Dim version, currentVersion As Double
		  
		  If MyPresentSettings.DocumentElement = Nil Then Return
		  
		  settings = MyPresentSettings.DocumentElement // save typing
		  
		  version = SmartML.GetValueN(settings, "@version")
		  currentVersion = 1.2
		  If version >= currentVersion Then Return // Already at current version
		  
		  If version < 1.2 Then
		    // this version check used to be 1.1 but style/@index leaked again
		    // these might accidentally have leaked from their internal use during presentation into the settings
		    // if they did, they may migrate by style settings into songs or set items and disrupt proper style handling
		    SmartML.RemoveNode(settings, "default_style/@index")
		    SmartML.RemoveNode(settings, "scripture_style/@index")
		  End If
		  
		  If version < 1.0 Then
		    //++
		    // Ed Palmer, November 2006 (V1.0 BL13)
		    //
		    // Change the layout of the PresentSettings XML to move certain slide-level
		    // elements (subtitles, descriptive captions, emphasize choruses) to the
		    // <default_style> section of the XML document.
		    //
		    // This helps fix a problem with song-level styles not properly displaying
		    // the subtitles selected for the song instead of the default style.
		    // Actually, it makes the code easier to deal with by making <default_style>
		    // look like any other <style> section, simplifying those areas of the code.
		    //
		    // Also, insert a document-level version number to flag that this is updated.
		    //
		    //--
		    If SmartML.GetValue(settings, "style/@song_subtitles", False) <> "" Then
		      SmartML.SetValue(settings, "default_style/song_subtitle", SmartML.GetValue(settings, "style/@song_subtitles"))
		      SmartML.RemoveNode(settings, "style/@song_subtitles")
		    End If
		    
		    If SmartML.GetValue(settings, "style/@descriptive_subtitle_info", False) <> "" Then
		      SmartML.SetValue(settings, "default_style/subtitle/@descriptive", SmartML.GetValue(settings, "style/@descriptive_subtitle_info", False))
		      SmartML.RemoveNode(settings, "style/@descriptive_subtitle_info")
		    End If
		    
		    If SmartML.GetValue(settings, "style/@highlight_chorus") <> "" Then
		      SmartML.SetValue(settings, "default_style/body/@highlight_chorus", SmartML.GetValue(settings, "style/@highlight_chorus"))
		      SmartML.RemoveNode(settings, "style/@highlight_chorus")
		    End If
		    
		    SmartML.SetValueB(settings, "song_style_preferred", True)
		  End If
		  
		  SmartML.SetValueN(settings, "@version", currentVersion)
		  If Not SmartML.XDocToFile(App.MyPresentSettings, App.DocsFolder.Child("Settings").Child("PresentSettings")) Then SmartML.DisplayError
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdatePrintSettings()
		  //++
		  // Convert the PrintSettings XML file
		  // Update inches (from versions below 1.0 Beta 2 BL10)
		  // to points.
		  //--
		  Dim value As Double, newvalue As Double
		  Dim attributelist() As String
		  Dim attribute As String
		  Dim inches As Boolean
		  Dim points As Boolean
		  Dim settings As XmlNode
		  Dim modified As Boolean = False
		  
		  settings = MyPrintSettings.DocumentElement
		  
		  // font and spacing for 2nd language
		  If Not SmartML.HasNode(settings, "lyrics_language2") Then
		    Dim f As FontFace
		    Dim sizePct As Double
		    f = SmartML.GetValueF(settings, "lyrics")
		    sizePct = SmartML.GetValueN(MyPresentSettings, "body/@multilanguage_size", False)
		    If sizePct = 0 Then
		      sizePct = 0.7
		    Else
		      sizePct = sizePct / 100
		    End If
		    f.Size = f.Size * sizePct
		    If f.Size > 8 Then
		      f.Size = Floor(f.Size)
		    Else
		      f.Size = Ceil(f.Size)
		    End If
		    SmartML.SetValueF(settings, "lyrics_language2", f)
		    SmartML.SetValueN(settings, "layout/lyrics_language2/@space_before", SmartML.GetValueN(settings, "layout/lyrics/@space_before"))
		    SmartML.SetValueN(settings, "layout/lyrics_language2/@space_after", SmartML.GetValueN(settings, "layout/lyrics/@space_after"))
		    modified = True
		  End If
		  
		  points = SmartML.GetValueB(settings, "page/@points", True, False)
		  If points Then
		    // there was a bug dividing inches by 72 to get points instead of multiplying
		    Dim width, height, left, top, right, bottom As Double
		    width = SmartML.GetValueN(settings, "page/@width", False)
		    height = SmartML.GetValueN(settings, "page/@height", False)
		    left = SmartML.GetValueN(settings, "page/@left", False)
		    top = SmartML.GetValueN(settings, "page/@top", False)
		    right = SmartML.GetValueN(settings, "page/@right", False)
		    bottom = SmartML.GetValueN(settings, "page/@bottom", False)
		    If width >= 0 And width < 1 And height >= 0 And height < 1 And left >= 0 And left < 1 And top >= 0 And top < 1 and right >= 0 And right < 1 And bottom >= 0 And bottom < 1 Then
		      SmartML.SetValueN(settings, "page/@width", width * 72 * 72)
		      SmartML.SetValueN(settings, "page/@height", height * 72 * 72)
		      SmartML.SetValueN(settings, "page/@left", left * 72 * 72)
		      SmartML.SetValueN(settings, "page/@top", top * 72 * 72)
		      SmartML.SetValueN(settings, "page/@right", right * 72 * 72)
		      SmartML.SetValueN(settings, "page/@bottom", bottom * 72 * 72)
		      modified = True
		    End If
		  Else
		    inches = SmartML.GetValueB(settings, "page/@inches", True, True)
		    
		    attributelist = Split("top,bottom,left,right,height,width", ",")
		    
		    For Each attribute in attributelist
		      value = CDbl(SmartML.GetValue(settings, "page/@" + attribute))
		      If inches Then
		        newvalue = InchesToPoints(value)
		      Else
		        newvalue = CMtoPoints(value)
		      End If
		      SmartML.SetValueN(settings, "page/@" + attribute, Round(newvalue))
		    Next
		    
		    SmartML.SetValueB(settings, "page/@points", True)
		    SmartML.SetValueB(settings, "page/@inches", inches)
		    modified = True
		  End If
		  
		  If modified Then
		    // Write out the converted file
		    MyPrintSettings.SaveXml DocsFolder.Child("Settings").Child("PrintSettings")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateTranslationFonts()
		  Dim i As Integer
		  For i = UBound(TranslationFonts) DownTo 1
		    TranslationFonts.Remove i
		  Next i
		  TranslationFonts.Append SmartML.GetValueF(MyMainSettings.DocumentElement, "fonts/headings")
		  ValidateFont(TranslationFonts(TranslationFonts.Ubound), False)
		  TranslationFonts.Append SmartML.GetValueF(MyMainSettings.DocumentElement, "fonts/labels")
		  ValidateFont(TranslationFonts(TranslationFonts.Ubound), False)
		  TranslationFonts.Append SmartML.GetValueF(MyMainSettings.DocumentElement, "fonts/text_fields")
		  ValidateFont(TranslationFonts(TranslationFonts.Ubound), False)
		  TranslationFonts.Append SmartML.GetValueF(MyMainSettings.DocumentElement, "fonts/large_headings")
		  ValidateFont(TranslationFonts(TranslationFonts.Ubound), False)
		  TranslationFonts.Append SmartML.GetValueF(MyMainSettings.DocumentElement, "fonts/buttons")
		  ValidateFont(TranslationFonts(TranslationFonts.Ubound), False)
		  TranslationFonts.Append SmartML.GetValueF(MyMainSettings.DocumentElement, "fonts/fixed_width")
		  ValidateFont(TranslationFonts(TranslationFonts.Ubound), True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ValidateFont(f As FontFace, fixed As Boolean = False)
		  // Check that the font "f" is in the system list (if created)
		  // If not, set to something that the system has installed
		  
		  Dim alternatives() As String
		  
		  If FontList.Ubound < 0 Then Return
		  
		  If FontList.IndexOf(f.Name) > -1 Or _
		    f.Name = "System" Or _
		    f.Name = "SmallSystem" Then
		    Return
		  End If
		  
		  Select Case fixed
		  Case False
		    alternatives = Split(kAlternativeFonts, ",")
		    While alternatives.Ubound > -1
		      If FontList.IndexOf(alternatives(0)) > -1 Then
		        f.Name = alternatives(0)
		        Return
		      End If
		      If alternatives(0) = "System" Or alternatives(0) = "SmallSystem" Then
		        f.Name = alternatives(0)
		        Return
		      End If
		      alternatives.Remove 0
		    Wend
		    f.Name = "System"
		    Return
		    
		  Case True
		    alternatives = Split(kAlternativeFixedFonts, ",")
		    While alternatives.Ubound > -1
		      If FontList.IndexOf(alternatives(0)) > -1 Then
		        f.Name = alternatives(0)
		        Return
		      End If
		      alternatives.Remove 0
		    Wend
		    #If TargetLinux Then
		      f.Name = "Monospace"
		    #Else
		      f.Name = "System"
		    #EndIf
		    Return
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function VersionString() As String
		  If App.shortVersion <> "" Then Return App.shortVersion + " (" + str(If(app.nonReleaseVersion > 0, app.nonReleaseVersion, app.majorVersion)) + ")"
		  
		  Return str(App.MajorVersion) + "." + str(App.MinorVersion) + _
		  If (App.bugVersion > 0, "." + str(App.bugVersion), "") + _
		  " (" + str(App.NonReleaseVersion) + ")"
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If IsPortable Then
			    Dim f As FolderItem
			    dim S As string
			    S =  SmartML.GetValue(MyGlobals.DocumentElement, "portable/@absdatapath")
			    if S <> "" then
			      f = PathToFolderItem(S, FileUtils.PathType)
			    else
			      S =  SmartML.GetValue(MyGlobals.DocumentElement, "portable/@relativedatapath")
			      if S = "" then
			        S = "OpenSong Data"
			      end if
			      f = AppFolder.Child(S)
			    end if
			    
			    If FileUtils.CreateFolder(f) Then
			      Return f
			    Else
			      If f <> Nil Then App.DebugWriter.Write("DocumentsFolder: Error in CreateFolder for " + f.NativePath + ", " + FileUtils.LastError, 1)
			      Return Nil
			    End If
			  Else // standard - not portable
			    #If TargetLinux
			      Return SpecialFolder.UserHome
			    #Else
			      Return SpecialFolder.Documents
			    #EndIf
			  End If
			End Get
		#tag EndGetter
		AppDocumentsFolder As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If IsPortable Then
			    Return AppDocumentsFolder
			  Else
			    Return AppDocumentsFolder.Child(STR_OS_DOCUMENTS)
			  End If
			End Get
		#tag EndGetter
		AppDocumentsFolderForOpenSong As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If m_AppFolder <> Nil Then
			    Return m_AppFolder
			  End If
			  
			  '++JRC For compatibilty with RB 2008 debugger
			  'RB insists on outputing the executable in a subfolder (sigh)
			  #If Not TargetMacOS
			    #If DebugBuild And RBVersion <= 2012.051
			      m_AppFolder = GetFolderItem("").Parent
			    #Else
			      m_AppFolder = GetFolderItem("")
			    #EndIf
			  #Else
			    #Pragma BreakOnExceptions Off
			    #If RBVersion > 2015.02
			      Try
			        m_AppFolder = GetFolderItem(SpecialFolder.GetResource(STR_OS_DEFAULTS).Parent.ShellPath, FolderItem.PathTypeShell)
			      Catch rtex
			        System.DebugLog "App.Open: GetResource failed due to '" + rtex.Reason + "'"
			        'Use the old way, maybe it's in the same folder as the executable
			    #EndIf
			    m_AppFolder = GetFolderItem("")
			    #if XojoVersion > 2015.02
			      End Try
			    #EndIf
			    #Pragma BreakOnExceptions Default
			  #EndIf
			  
			  Return m_AppFolder
			End Get
		#tag EndGetter
		AppFolder As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim f As FolderItem = Nil
			  
			  If IsPortable Then
			    f = AppFolder.Child("OpenSong Settings")
			    If Not f.Exists Then
			      App.DebugWriter.Write("AppPreferencesFolder: Error 'OpenSong Settings' sub folder doesn't exist", 1)
			    End If
			  Else // standard - not portable
			    // RealBasic SpecialFolder with some platform dependent subfolder
			    #if TargetLinux
			      f = SpecialFolder.Preferences.Child(".OpenSong")
			    #elseif TargetMacOS
			      f = SpecialFolder.Preferences
			      If Not f.Exists Then
			        f = SpecialFolder.Preferences
			      End If
			    #elseif TargetWin32
			      f = SpecialFolder.Preferences.Child("OpenSong")
			    #endif
			  End If
			  
			  Return f
			End Get
		#tag EndGetter
		AppPreferencesFolderForOpenSong As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		CapoList(0) As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim ctrlScreen As Integer
			  If App.MyPresentSettings <> Nil Then
			    ctrlScreen = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "monitors/@control") - 1
			    If ctrlScreen < 0 Or ctrlScreen + 1 > OSScreenCount() Then ctrlScreen = 0
			  Else
			    ctrlScreen = 0
			  End If
			  
			  Return New OpenSongUtils.OS_Screen(OpenSongUtils.OSScreen(ctrlScreen))
			End Get
		#tag EndGetter
		ControlScreen As OpenSongUtils.OS_Screen
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DebugWriter As DebugOutput
	#tag EndProperty

	#tag Property, Flags = &h0
		DocsFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		FontList() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ImageQualityList(0) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		IsPortable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LastImageFolder As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // i'd like to do a search accent sensitive. At least for de_DE, this does the trick.
			  If m_LocaleForSearch Is Nil Then
			    If MainPreferences = Nil Then Return Locale.Current
			    Dim prefsLocaleName As String
			    prefsLocaleName = MainPreferences.GetValue(prefs.kLocaleForSearch, "", False)
			    If prefsLocaleName <> "" Then
			      Try
			        m_LocaleForSearch = New Locale(prefsLocaleName)
			        If m_LocaleForSort = Nil Then
			          prefsLocaleName = ""
			        End If
			      Catch
			        prefsLocaleName = ""
			      End Try
			    End If
			    If prefsLocaleName = "" Then
			      Try
			        Dim localeName As String = Locale.Current.Identifier
			        If localeName.IndexOf("@") > 0 Then
			          If localeName.IndexOf("collation") = -1 Then
			            localeName.Append(";collation=search")
			          End If
			        Else
			          localeName.Append("@collation=search")
			        End If
			        m_LocaleForSearch = New Locale(localeName)
			      Catch
			        m_LocaleForSearch = Locale.Current
			      End Try
			    End If
			    If prefsLocaleName = "" And m_LocaleForSearch <> Nil Then
			      prefsLocaleName = m_LocaleForSearch.Identifier
			      MainPreferences.SetValue(prefs.kLocaleForSearch, prefsLocaleName)
			    End If
			  End If
			  
			  Return(m_LocaleForSearch)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  m_LocaleForSearch = value
			End Set
		#tag EndSetter
		LocaleForSearch As Locale
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If m_LocaleForSort Is Nil Then
			    If MainPreferences = Nil Then Return Locale.Current
			    Dim prefsLocaleName As String
			    prefsLocaleName = MainPreferences.GetValue(prefs.kLocaleForSort, "", False)
			    If prefsLocaleName <> "" Then
			      Try
			        m_LocaleForSort = New Locale(prefsLocaleName)
			        If m_LocaleForSort = Nil Then
			          prefsLocaleName = ""
			        End If
			      Catch
			        prefsLocaleName = ""
			      End Try
			    End If
			    If prefsLocaleName = "" Then
			      m_LocaleForSort = Locale.Current
			    End If
			    If prefsLocaleName = "" And m_LocaleForSort <> Nil Then
			      prefsLocaleName = m_LocaleForSort.Identifier
			      MainPreferences.SetValue(prefs.kLocaleForSort, prefsLocaleName)
			    End If
			  End If
			  Return(m_LocaleForSort)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  m_LocaleForSort = value
			End Set
		#tag EndSetter
		LocaleForSort As Locale
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			Holds the main preferences for the application.
			This is the target for all future preferences instead
			of the My...Settings XML documents.
			
			MainPreferences should go in the appropriate location
			for the operating system instead of in the application directory.
			This will typically be in a directory or file under PreferencesFolder
		#tag EndNote
		MainPreferences As IPreferences
	#tag EndProperty

	#tag Property, Flags = &h0
		MainWindowIsOpen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MyBible As iBible
	#tag EndProperty

	#tag Property, Flags = &h0
		MyFontChooser As FontChooser
	#tag EndProperty

	#tag Property, Flags = &h0
		MyGlobals As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		MyMainSettings As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		MyPresentSettings As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Global printer settings.
		#tag EndNote
		MyPrinterSetup As PrinterSetup
	#tag EndProperty

	#tag Property, Flags = &h0
		MyPrintSettings As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_AppFolder As FolderItem = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_ControlServer As REST.RESTServer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_LocaleForSearch As Locale
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_LocaleForSort As Locale
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_OpenComplete As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_ProgramExit As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_statusNotifiers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		NDIEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		NDISingleton As NDI
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim presentScreen As Integer
			  If App.MyPresentSettings <> Nil Then
			    presentScreen = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "monitors/@present") - 1
			    If presentScreen < 0 Or presentScreen + 1 > OSScreenCount() Then presentScreen = 0
			  Else
			    presentScreen = 0
			  End If
			  
			  Return New OpenSongUtils.OS_Screen(OpenSongUtils.OSScreen(presentScreen))
			End Get
		#tag EndGetter
		PresentationScreen As OpenSongUtils.OS_Screen
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return m_ProgramExit
			End Get
		#tag EndGetter
		ProgramIsExiting As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ReleaseCandidate As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SavedAppMenuBar As MenuBar
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SlideStyleColorCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		SplashShowing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		StylePreview As XmlNode
	#tag EndProperty

	#tag Property, Flags = &h0
		T As Translator
	#tag EndProperty

	#tag Property, Flags = &h0
		TempoList(0) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ThemeList(0) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeSigList(0) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TransitionList(0) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TranslationFonts(0) As FontFace
	#tag EndProperty

	#tag Property, Flags = &h0
		TransposeAccidentalsList(0) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		VideolanPresetList As Dictionary = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		vMixEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ZombieGuardDog As Timer
	#tag EndProperty


	#tag Constant, Name = BACKGROUNDS_FOLDER, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BundleID, Type = String, Dynamic = False, Default = \"org.opensong.opensong", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DEFAULTS_FOLDER, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DOCUMENTS_FOLDER, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FOLDER_EMPTY, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FOLDER_EXISTS, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FOLDER_READONLY, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = INVALID_FOLDER, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kActivityLog, Type = String, Dynamic = False, Default = \"activitylog/level", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAlternativeFixedFonts, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ubuntu Fixed\x2CCourier New\x2CCourier"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Courier New\x2CCourier"
	#tag EndConstant

	#tag Constant, Name = kAlternativeFonts, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"System\x2CArial\x2CHelvetica"
	#tag EndConstant

	#tag Constant, Name = kLogAppend, Type = String, Dynamic = False, Default = \"/@append", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLogConsole, Type = String, Dynamic = False, Default = \"/@console", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLogLevel, Type = String, Dynamic = False, Default = \"log/level", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLogOutput, Type = String, Dynamic = False, Default = \"log/file", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPromptBeforePresenting, Type = String, Dynamic = False, Default = \"promptbeforepresenting", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXmlPrettyPrint, Type = String, Dynamic = False, Default = \"<xsl:stylesheet version\x3D\"1.0\" xmlns:xsl\x3D\"http://www.w3.org/1999/XSL/Transform\">\n    <xsl:preserve-space elements\x3D\"XMLBIBLE BIBLEBOOK CHAPTER VERS bible b c v lyrics\"/>\n    <xsl:output method\x3D\"xml\" indent\x3D\"yes\"/>\n    <xsl:template match\x3D\"/\">\n        <xsl:copy-of select\x3D\".\"/>\n    </xsl:template>\n</xsl:stylesheet>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NO_FOLDER, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = POINT_TO_CM, Type = Double, Dynamic = False, Default = \"0.035277778", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PREFERENCESVERSION, Type = Double, Dynamic = False, Default = \"1.0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SCRIPTURE_FOLDER, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SETS_FOLDER, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SETTINGS_FOLDER, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SONGS_FOLDER, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STR_BACKGROUNDS, Type = String, Dynamic = False, Default = \"Backgrounds", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STR_OS_DEFAULTS, Type = String, Dynamic = False, Default = \"OpenSong Defaults", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STR_OS_DOCUMENTS, Type = String, Dynamic = False, Default = \"OpenSong", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STR_SCRIPTURE, Type = String, Dynamic = False, Default = \"Scripture", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STR_SETS, Type = String, Dynamic = False, Default = \"Sets", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STR_SETTINGS, Type = String, Dynamic = False, Default = \"Settings", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STR_SONGS, Type = String, Dynamic = False, Default = \"Songs", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_NORMAL, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_RESTORE, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_SHOW, Type = Integer, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_SHOWMINNOACTIVE, Type = Integer, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_SHOWNA, Type = Integer, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_SHOWNOACTIVATE, Type = Integer, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_SHOWNORMAL, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="IsPortable"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProgramIsExiting"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReleaseCandidate"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SplashShowing"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NDIEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="vMixEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SavedAppMenuBar"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="MenuBar"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MainWindowIsOpen"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
