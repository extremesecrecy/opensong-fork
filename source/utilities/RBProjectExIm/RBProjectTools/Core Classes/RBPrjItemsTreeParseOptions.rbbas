#tag Class
Protected Class RBPrjItemsTreeParseOptions
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(optionMode as Integer)
		  me.Constructor
		  
		  select case optionMode
		  case OptimizeNone
		    // leave everything on 'false'
		  case OptimizeForVault
		    me.orderedGroups = true
		    me.removeDuplicateSupers = true
		    me.reduceExternalPaths = true
		    me.removeEditingInfos = true
		  case OptimizeAll
		    me.orderedBlocks = true
		    me.orderedGroups = true
		    me.removeDuplicateSupers = true
		    me.reduceExternalPaths = true
		    me.removeEditingInfos = true
		  else
		    RBPrjHelper.Assert (false, "invalid option", "RBPrjItemsTreeParseOptions")
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			Sorts the blocks
		#tag EndNote
		orderedBlocks As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Sorts the groups (sub blocks) as much as possible.
			E.g, PVal/PDef entries can be sorted, while Controls inside a Window must not be sorted
			because their order is significant for their index.
		#tag EndNote
		orderedGroups As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			External items can be specified in several ways: by Alias (Mac only), absolute path and relative path.
			This option makes sure there is only and exactly one relative path
		#tag EndNote
		reduceExternalPaths As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			RB 2005 and 2006r1 create multiple identical "Super" entries in Controls. This option removes all but one of them
		#tag EndNote
		removeDuplicateSupers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Removes editor related information from code related project items such as cursor position
			and text selection.
			This option is only relevant to projects saved with RB versions 5.x and before. RB 200x
			does store the editor state in a separate block which will not be touched by this option.
		#tag EndNote
		removeEditingInfos As Boolean
	#tag EndProperty


	#tag Constant, Name = OptimizeAll, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OptimizeForVault, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OptimizeNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
