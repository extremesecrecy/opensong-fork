#tag Class
Class RBPrjExportConfig
	#tag Method, Flags = &h0
		Function LoadConfiguration(itemRef as FolderItem) As Boolean
		  dim configFile as FolderItem
		  
		  // preset
		  pLastErr = ""
		  pConfig = new Dictionary
		  pPrjFile = nil
		  pVaultDir = nil
		  
		  if RBPrjHelper.EndsIn (itemRef.Name, RBPrjHelper.VaultDirSfx) then
		    // a vault dir was passed
		    pVaultDir = itemRef
		    if not RBPrjSupport.GetPrjFileFromVault (pVaultDir, pPrjFile) then
		      pLastErr = "The passed Vault folder is not valid"
		      return false
		    end
		  else
		    // a project file was passed
		    pVaultDir = itemRef.Parent.TrueChild (RBPrjHelper.MakeVaultDirName (itemRef.Name, false))
		    pPrjFile = itemRef
		  end
		  
		  if pVaultDir.Exists then
		    // read the config from the vault
		    configFile = pVaultDir.TrueChild (ExportConfigFileName)
		    if configFile.Exists then
		      if not pConfig.LoadXML (configFile) then
		        pLastErr = "The configuration file """+configFile.Name+""" inside the Vault is not valid"
		        return false
		      end
		      pDirty = false
		      pLoaded = true
		    end
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveConfiguration() As Boolean
		  dim f as FolderItem
		  
		  if not pVaultDir.Exists then
		    pLastErr = "Vault folder does not exist"
		    return false
		  end
		  
		  pConfig.Value ("About") = AboutText
		  
		  f = pVaultDir.TrueChild (ExportConfigFileName)
		  if pDirty or not f.Exists then
		    if not me.pConfig.SaveXML (f, true) then
		      pLastErr = "Saving config to Vault folder failed"
		      return false
		    end
		  end
		  
		  pDirty = false
		  pLastErr = ""
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContentsHierarchy(ByRef useFolders as Boolean) As Boolean
		  dim v as Variant
		  if pConfig.HasKey (KeyVaultItemsAdoptFolderHierarchy) then
		    v = pConfig.Value (KeyVaultItemsAdoptFolderHierarchy)
		    if v.Type = 11 then
		      useFolders = v.BooleanValue
		      return true
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetExternalsHandling(ByRef separate as Boolean, ByRef allFiles as Boolean) As Boolean
		  dim s as String
		  if pConfig.HasKey (KeyExternalItemsHandling) then
		    s = pConfig.Value (KeyExternalItemsHandling)
		    separate = (s = ValueExternalsSeparate)
		    if separate then
		      allFiles = false
		    else
		      allFiles = (s = ValueAllFilesInVault)
		    end
		    return separate or allFiles or (s = ValuePrjItemsInVault)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExternalsHandling(separate as Boolean, allFiles as Boolean)
		  dim s as String
		  if separate then
		    s = ValueExternalsSeparate
		  elseif allFiles then
		    s = ValueAllFilesInVault
		  else
		    s = ValuePrjItemsInVault
		  end
		  if not pConfig.HasKey (KeyExternalItemsHandling) or pConfig.Value (KeyExternalItemsHandling) <> s then
		    pConfig.Value (KeyExternalItemsHandling) = s
		    pDirty = true
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetContentsHierarchy(adoptFolders as Boolean)
		  if not pConfig.HasKey (KeyVaultItemsAdoptFolderHierarchy) or pConfig.Value (KeyVaultItemsAdoptFolderHierarchy) <> adoptFolders then
		    pConfig.Value (KeyVaultItemsAdoptFolderHierarchy) = adoptFolders
		    pDirty = true
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub unused1()
		  'if pConfig.HasKey (KeyProjectAbsolutePath) then
		  'pPrjFile = GetFolderItem (pConfig.Value (KeyProjectAbsolutePath))
		  'if pPrjFile = nil or not pPrjFile.Exists then
		  'pLastErr = "The project file referenced in the configuration file """+itemRef.Name+""" does not exist"
		  'return false
		  'end
		  'elseif pPrjFile = nil then
		  'pLastErr = "The passed Vault configuration file is missing the project path entry"
		  'return false
		  'end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As String
		  return me.pLastErr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnterConfiguration(always as Boolean) As Boolean
		  dim dlg as ExportConfigWin
		  dim ok as Boolean
		  
		  if not me.pLoaded or always then
		    dlg = new ExportConfigWin
		    if dlg.EnterOptions (me) then
		      call SaveConfiguration() // ignore possible error state here because the vault might not exist yet
		      ok = true
		    end
		  else
		    ok = true
		  end
		  
		  return ok
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pLastErr As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pConfig As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pVaultDir As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pPrjFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pLoaded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pDirty As Boolean
	#tag EndProperty


	#tag Constant, Name = KeyVaultItemsAdoptFolderHierarchy, Type = String, Dynamic = False, Default = \"VaultItemsAdoptFolderHierarchy", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = KeyExternalItemsHandling, Type = String, Dynamic = False, Default = \"ExternalItemsHandling", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = KeyProjectAbsolutePath, Type = String, Dynamic = False, Default = \"ProjectAbsolutePath", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ValueExternalsSeparate, Type = String, Dynamic = False, Default = \"separate", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ValueAllFilesInVault, Type = String, Dynamic = False, Default = \"allFilesInVault", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ValuePrjItemsInVault, Type = String, Dynamic = False, Default = \"prjItemsInVault", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ExportConfigFileName, Type = String, Dynamic = False, Default = \"ExportConfig.localonly", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AboutText, Type = String, Dynamic = False, Default = \"Created by \'RB Vault ExIm\' -- see http://www.rbwiki.org/doku.php/rbp/scm/rbvexim", Scope = Protected
	#tag EndConstant


End Class
#tag EndClass
