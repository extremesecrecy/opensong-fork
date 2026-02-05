#tag Class
Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  #if DebugBuild
		    if handleItem (GetOpenFolderItem (FileTypes.All)) then
		      quit
		    end
		  #else
		    showAbout
		    quit
		  #endif
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  call handleItem (item)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function handleExport(prjFile as FolderItem) As Boolean
		  dim forceSetup, ok as Boolean
		  dim results as RBPrjParseResults
		  dim config as RBPrjExportConfig
		  dim externalsSeparate, adoptProjectFolderHierarchy, includeNonPrjFiles as Boolean
		  
		  config = new RBPrjExportConfig
		  ok = config.LoadConfiguration (prjFile)
		  if not ok then
		    results = new RBPrjParseResults
		    results.AppendErrMsg config.LastError
		  else
		    forceSetup = Keyboard.OptionKey or Keyboard.AsyncOptionKey
		    do
		      ok = config.GetContentsHierarchy (adoptProjectFolderHierarchy) and config.GetExternalsHandling (externalsSeparate, includeNonPrjFiles)
		      if not ok or forceSetup then
		        if not config.EnterConfiguration (forceSetup) then
		          // user cancelled
		          exit
		        else
		          // let's run another loop to get the config values
		        end
		        forceSetup = false
		      end
		    loop until ok
		    if ok then
		      ok = RBPrjSupport.WriteProjectToVault (prjFile, results, not externalsSeparate, adoptProjectFolderHierarchy, includeNonPrjFiles)
		      if ok then
		        ok = config.SaveConfiguration ()
		        if not ok then
		          results = new RBPrjParseResults
		          results.AppendErrMsg config.LastError
		        end
		      end
		    end
		  end
		  
		  if results <> nil then
		    RBPrjSupport.ShowParseResults results, "Export"
		  end
		  
		  return ok
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function handleImport(vaultDir as FolderItem) As Boolean
		  dim ok as Boolean
		  dim results as RBPrjParseResults
		  
		  ok = RBPrjSupport.CreateProjectFromVault (vaultDir, results)
		  
		  RBPrjSupport.ShowParseResults results, "Import"
		  
		  return ok
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function handleItem(itemRef as FolderItem) As Boolean
		  // returns true if all went well.
		  if itemRef <> nil then
		    if RBPrjHelper.EndsIn (itemRef.Name, RBPrjHelper.VaultDirSfx) then
		      // a vault dir was passed
		      return handleImport (itemRef)
		    else
		      // a project file was passed
		      return handleExport (itemRef)
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub showAbout()
		  MsgBox "RB Project Vault Export/Import tool" + EndOfLine + EndOfLine + "Drop a .rbp file or " + RBPrjHelper.VaultDirSfx + " folder onto this app's icon to use it"
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"Clear", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
