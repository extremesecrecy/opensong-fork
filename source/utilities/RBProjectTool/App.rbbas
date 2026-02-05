#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  me.AutoQuit = true // quit the app when the last window closes
		  
		  dim cont as Boolean
		  cont = true
		  
		  if cont then
		    MainWin.Show
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function RunSelfTest() As Boolean
		  dim results as RBPrjParseResults
		  dim f as FolderItem
		  dim ok as Boolean
		  ok = true
		  
		  // if we have a file (or alias) named "input" -- let's process it right away
		  f = GetFolderItem ("input")
		  if f = nil or not f.Exists then
		    return true
		  end
		  
		  ok = RBPrjSupport.WriteProjectToVault (f, results, false, false, false)
		  if ok then
		    ok = RBPrjSupport.WriteProjectToVault (f, results, true, true, true)
		  end
		  RBPrjSupport.ShowParseResults results, "RunSelfTest"
		  
		  return ok
		End Function
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


End Class
#tag EndClass
