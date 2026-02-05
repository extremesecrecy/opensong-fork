#tag Module
Protected Module prefs
	#tag Note, Name = Overview
		For the moment, this module is just to provide a
		place to hold the path constants for the different
		preferences.
	#tag EndNote


	#tag Property, Flags = &h21
		Private mPageSetup As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mPageSetup = "" Then
			    Dim host As String
			    Try
			      host = Hostname
			    Catch
			      host = "default"
			    End Try
			    mPageSetup = "printer/"+host+"/"+SystemAsString+"/"+SystemArchitectureAsString+"/@page_setup_string"
			  End If
			  Return mPageSetup
			End Get
		#tag EndGetter
		Protected PageSetup As String
	#tag EndComputedProperty


	#tag Constant, Name = kBibleIdentifier, Type = String, Dynamic = False, Default = \"scripture/xml/@use_filename", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCurrentSongFolder, Type = String, Dynamic = False, Default = \"saved_state/songfolder", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDocumentsFolder, Type = String, Dynamic = False, Default = \"documents_folder", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLanguage, Type = String, Dynamic = False, Default = \"language", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLastOpenSet, Type = String, Dynamic = False, Default = \"saved_state/last_open_set", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLastScriptureBook, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@book", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLastScriptureChapter, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@chapter", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLastScriptureThru, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@thru", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLastScriptureVerse, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@verse", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLyricsReplaceWithSpace, Type = String, Dynamic = False, Default = \"songs/lyrics/whitespace", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPPTViewLocation, Type = String, Dynamic = False, Default = \"pptview_location", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kScriptureCharsPerSlide, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@chars_per_slide", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kScriptureFormat, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@format", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kScriptureShowNumbers, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@show_numbers", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kScriptureVersePerSlide, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@verse_per_slide", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kScriptureVersion, Type = String, Dynamic = False, Default = \"saved_state/last_scripture/@version", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSetsLastExportFolder, Type = String, Dynamic = False, Default = \"sets/last_export", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSongsPreviewWithChords, Type = String, Dynamic = False, Default = \"songs/preview/showchords", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUseOldFolderDB, Type = String, Dynamic = False, Default = \"documents_folder/UseOldFolderDB", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUseSheetDialogs, Type = String, Dynamic = False, Default = \"dialogs/@usesheets", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kVideolanLocation, Type = String, Dynamic = False, Default = \"videolan_location", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWindowGeometry, Type = String, Dynamic = False, Default = \"saved_state/app_window/geometry", Scope = Protected
	#tag EndConstant


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
End Module
#tag EndModule
