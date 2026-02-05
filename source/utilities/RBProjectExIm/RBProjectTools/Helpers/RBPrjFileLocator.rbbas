#tag Class
Protected Class RBPrjFileLocator
Implements RBPrjFileLocating
	#tag Method, Flags = &h0
		Sub Constructor(defaultDir as FolderItem, forceThatDir as Boolean, checkAllSubdirs as Boolean, externalsFileNameSuffix as String)
		  me.defaultDir = defaultDir
		  me.forceThatDir = forceThatDir
		  me.fileSuffix = externalsFileNameSuffix
		  me.checkAllSubdirs = checkAllSubdirs
		  
		  me.chosenDirs.Append me.defaultDir
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function locateInChosenDirs(fileName as String) As FolderItem
		  // Looks for the file in the default dir and in the dirs that the user has given in previous open-dialogs
		  //
		  // If the checkAllSubdirs option is enabled, it makes sure that the item exists only once
		  // to avoid accidentally choosing the wrong one automatically
		  
		  dim dir, f as FolderItem
		  
		  for each dir in me.chosenDirs
		    f = dir.TrueChild (fileName)
		    if f.Exists and not f.Directory then
		      return f
		    end
		  next
		  
		  if me.checkAllSubdirs then
		    // search the subdirs as well
		    
		    dim found as Boolean
		    
		    for each dir in me.chosenDirs
		      if locateInSubdirs(dir, fileName, f) then
		        if found then
		          return nil // -> more than one occurance
		        end
		        found = true
		      end
		    next
		    
		    if found then
		      return f
		    end
		    
		    return nil
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function locateInSubdirs(dir as FolderItem, fileName as String, ByRef fOut as FolderItem) As Boolean
		  // Looks for the file in all its subdirs
		  // Returns true if the subdirs contain exactly on occurance
		  
		  dim found as Boolean
		  
		  dim n as Integer = dir.Count
		  for i as Integer = 1 to n
		    dim subdir as FolderItem = dir.Item(i)
		    if subdir <> nil and subdir.Directory then
		      // we have a subdir - does the file exist in it?
		      dim f as FolderItem
		      f = subdir.TrueChild (fileName)
		      if f.Exists and not f.Directory or locateInSubdirs(subdir, fileName, f) then
		        // yes, there's our file in it
		        if found then
		          return false // we have at least two same-named files in the subdirs -> bad
		        end
		        // keep looking for other occurances
		        found = true
		        fOut = f
		      end
		    end
		  next
		  
		  return found
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateMissingFile(fileName as String, itemName as String) As FolderItem
		  // this one may interact with the user
		  
		  #if TargetHasGUI
		    
		    dim dlg as new OpenDialog
		    dim f as FolderItem
		    
		    if me.forceThatDir then
		      
		      // should have been found already
		      
		    else
		      
		      // try to find it in the given dirs
		      
		      if fileName <> "" then
		        f = locateInChosenDirs(fileName)
		        if f <> nil then
		          return f
		        end
		      end
		      
		      // let the user choose interactively
		      
		      dlg.Title = "Locate '"+itemName+"': "+fileName
		      dlg.PromptText = dlg.Title
		      dlg.InitialDirectory = me.chosenDirs(UBound(me.chosenDirs)) // last used dir
		      dlg.CancelButtonCaption = "Abort"
		      dlg.ActionButtonCaption = "Choose"
		      
		      f = dlg.ShowModal ()
		      
		      if f = nil then
		        // user Cancelled
		        raise new RBPrjException ("Cancelled", "")
		      else
		        // remember this dir for the next time
		        if not me.chosenDirs(UBound(me.chosenDirs)).IsSameFolderItem (f.Parent) then
		          me.chosenDirs.Append f.Parent
		        end
		      end
		      
		      return f
		      
		    end
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RelocateFile(f as FolderItem, fileName as String, itemName as String) As FolderItem
		  // this one must not interact with the user (and gets called before LocateMissingFile)
		  
		  if me.forceThatDir and me.defaultDir <> nil and fileName <> "" then
		    f = me.defaultDir.TrueChild (fileName)
		  end
		  
		  if f <> nil and me.fileSuffix <> "" then
		    f = RBPrjHelper.AddedBeforeExtension (f, me.fileSuffix)
		  end
		  
		  return f
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private checkAllSubdirs As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private chosenDirs() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private defaultDir As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private fileSuffix As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private forceThatDir As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
