#tag Module
Protected Module Documentation
	#tag Note, Name = About
		// Written originally on Nov 11-14, 2005 by Thomas Tempelmann
		//
		// Project homepage: <http://www.tempel.org/rb/#prjtool>
		//
		// Consider all this code, being part of the RBPrjTools, freely available for
		// your use in your own projects.
		//
		// Please be kind and contact me if you have made improvements and like to share
		// them with others or if you like to make a commercial product out of it (while
		// you are free to do so, I'd like to know at least).
		//
		// Enjoy!
		// Thomas Tempelmann
	#tag EndNote

	#tag Note, Name = To Do
		Things that still need to be worked on:
		
		- ExIm GUI: show progress during conversion
		
		- optionally make the localonly files invisible so that they don't get checked in
		   by accident - this requires a "ignore changes" switch with the UI and cmdline
		   tools, though. and i need to make sure it works on Mac and Windows both
		
		- When determining the files that are in the vault so that i can delete the leftovers
		   in the end, it would help if i'd also read ProjectState.localonly to locate the
		   _previous_ external files and delete those if they're left out in the new prj version.
		   Sure, this might mean that an external rbvx gets deleted when other prjs may be
		   still using it, but 1. it can always be recreated, and 2. it would be good nonetheless
		   because then the other prjs should reconsider their externals strategy we well,
		   probably.
		   Only problem is that currently the ProjectState.localonly file is not known to the
		   vault writer and it's gotten already deleted the entries when the writer gets
		   invoked...
		   
		- "all externals" vault option doesn't work properly yet, because on import the
		   information about the original file gets lost (it's known to the treebuilder and to
		   the tree, but does not get passed to the file writer)
		   -> must handle external non-code items like code items by running them
		   thru the externals included and calling a new parser for them (of a new class,
		   probably)
		
		-  i could store version control configuration inside the prj files. one way would
		    be to add a module whose name begins with "_" (IDE hides those) and place
		    the config data into notes therein
		
		- add a "-force" option to both tools so that changes in the original can be ignored
		
		- cmdline tool: add a command to view all file paths of a prj file or of a vault prj, also one
		   to test if the main prj is in changed state
		
		- the sorting values should not be determined by the tree builder but by the
		   tree itself - and it should update the values whenever a sub-part of the tree
		   gets changed
		
		- optionally filter breakpoints from the file, and store this information in an extra file for
		   later merging, perhaps per user (might do this also for the filtered absolute path and
		   editor entries)
		
		- check if xml output for RB 5.5 has any need, or if rb 5.5 can also read the newer format
		   for properties
		
		- finish XML Reader
		
		- externalslocator: after the first is manually located, try to figure out the new root of
		   those externals and use it to look up other missing externals in the same relativePath
		
		- Binary and XML writers cause all external items to be written in the same
		   format, even if the original files were in a different format. But in certain cases
		   it's even desired to write all in one format (e.g. when exporting from bin to xml)
		   So, the CloneForExternalsProcessing() methods have to become smarter to
		   support both modes
		
		- make sure that the item lookup functions in rbprjtree also implicitly handle external
		   items! also, try to add functions similar to what xmldocument offers so that one
		   can port an app that works on xmldocs into one that works on my tree instead.
		   then port Florent Pillet's localization helper to use my code, then release it as a framwork
		
		- optionally may offer an option
		   not to use object names in the vault files at all, for a flat format that does automatically
		   not cause trouble even when items get renamed (because they still have the same ID
		   then)
		
		- for better safety, create new files under a temp name first and replace the old
		   one only when it's finished
		
		- write a tool that only exports, then checks everything in. gets configured by
		   a config document which one can double click to launch this tool to have it
		   all done in one simple step.
		
		- make it possible to place the vault folder somewhere else. the info is not stored
		   in the vault, though, but must be passed from outside to the tool for both export
		   and import
		
		- on export: detect renames and moves using the block IDs and comparing the new set of
		   files in the vault to the previous one.
		
		- another thought at solving the automatism: make a d&d app that you can drop either
		   .rb or .rbvault onto - it then issues a svn status call to see if the working copy is uptodate
		   and also compares the dates in the vaults (including the externals) with the .rb file.
		   then it can decide which side is newer and whether a export or import is needed or
		   if there's even a conflict. or the app is told a list of .rbvault prjs that it all checks when
		   launched (perhaps it can even retrieve it from svn?)
		
		- make the inner classes free of english language - for errors and warnings, use named constants and provide a
		   translator for english and optionally for other languages.
		
		- finding of external items: when the user has selected a file, make sure that it's the correct one!
		
		- XML related Crashing Bug, reported here: http://www.realsoftware.com/feedback/viewreport.php?reportid=lfldqmsk
		
		- Class browser:
		  - watch the source file and auto-refresh the tree when it has changed
		  - implement hierarchic view modes
		  - make it possible to view controls as members of windows somehow (but how?)
		  - the find-editfield is not too useful yet. perhaps it should work on ALL known identifiers, not just on classes,
		     or it should work like the Location field in the IDE
		
		- feature requests:
		   - convert prj items into rbscript source and back
		   - (by Keith Hutchison) export selected items and turn them in the main prj file optionally into external refs
		   - turn string literals into named constants for easier localization
		   - offer a way to run rbscripts that do alterations to properties etc.
		   - cleanup functions:
		      - remove empty comments from properties
		      - remove duplicate "super" items
		   - (by Joe Huber) detect possible circular references by following class properties and seeing if they end up in a loop
		   - convert between different RB versions, i.e. name back and forth, e.g.:
		      - MouseWheel's delta<->deltaY
		      - FileTypes1 -> FileTypes for RB 5.5
		      - there are some control properties that were renamed from 5.5 to 2005
		   - turn global public identifiers in modules into protected ones that get accessed qualified (via "modulename.identname")
		
		- progressbar does not count properly when a recursive Parse happens in RBPrjExternalsIncluder (it restarts from 0 then for each included file)
		
		- RBObjEntity: the whole declaration cleanup is not satisfying yet, as is the way it's then shown in the class browser's
		   member list rows
		
		- Possible issue: The text such as source code in the prj is currently assumed to be always UTF-8. But there is an
		   encoding item with each method and other groups might need to be used to determine the encoding instead.
		
		- Find "###" in source code for more notes
	#tag EndNote

	#tag Note, Name = Change History
		// Latest changes at top
		
		sva_de:
		- merged in some changes done by TT in v1.1.8 alpha versions
		- creared out unused variables
		- updated things which were flagged as deprecated in RB 2011r4.3
		- separated handling of Int and Dbl item types

		10Apr07, v1.1.7
		- Updated to compile with RB 2007r2
		- Fixed a bug in RBPrjExternalsIncluder.GroupEnter that would create corrupted project files
		   that have been written by RB 2007r2 (and maybe by other versions after 2006r2 as well)
		- Added some new tags to RBPrjTagTranslator
		
		14May06, v1.1.6
		- Added a GUI version of the ExIm tool. When opened the first time with a project file,
		   it presents a dialog in which one can choose a few options, which it will then store
		   inside the created vault. That way, one can simply drop a vault or prj file onto the
		   tool to have it import or export without further interaction.
		
		21Feb06, v1.1.5
		- Improvement: At start of an "Export to Vault" procedure, the "ProjectState.localonly"
		   file is written with an identifier in it telling that the vault is in an incomplete state.
		   Once the vault has been successfully written, this information is replaced to show a
		   "complete" state. This prevents accidental attempts to recreate the project from
		   a defective vault (as it might happen when there were errors while creating the
		   vault files)
		
		19Feb06, v1.1.5
		- The Version code in the rbvx files is not the App's version any more but a separate
		   file version so that the files do not require an update each time they're created with
		   a new version of this tool.
		
		19Feb06, v1.1.4
		- Output: "Export to Vault" has new option to keep external items in their original place
		   instead of being stored inside the main project's vault folder.
		- Output: Text Export now adds "/P" instead of "/s" as type to the project header line so that Text Import
		   can properly read such files back.
		- Output: Text Export (and Vault Export) now use Hex encoding instead of Base64 encoding for
		   non-printable values (added new "/h" type for this)
		- Output: Sorting of group items is now safe (i.e. project remains intact)
		- Output: External items written to the Vault now get their absolute path references removed (this
		   includes the Alias entry for Mac OS), letting only a relative path remain. This ensure that exchanging
		   external items between multiple project locations does not cause those items to update all
		   the time.
		- Output: Improved Vault support for RB 5.5 project files: All the editor state related information is now
		   removed from the files in the vault. The last 8 bytes of each block header are cleared as well.
		   Thanks to Ben Henny for his suggestions on this.
		- Bugfix: "Merge Externals" operation in MainWin works again (recently it did create a text file
		   and not, as intended, a new binary prj file)
		- Bugfix: No "external file item can't be located" errors any more after having successfully
		   located them manually already.
		- Bugfix: Can now locate external items of RB 4.5-written projects better
		- Bugfix: Merging external objects that were organized in a project folder are not losing their
		   position in the folder any more (unless they're excrypted - can't do much about that)
		- Bugfix: RBPrjObjTreeBuilder can now deal with "Shared" methods, thanks to Alexander Zharikov
		- Bugfix: RBPrjObjTreeBuilder can now deal with method declarations with unusual use of blanks
		- Internal: RBPrjBlockWriter class got removed as it's not used any more
		- UI: Disabled "Export to Doxygen" because of lack of interest (it's still in the code, just removed from
		   the MainWin) and added "Export to Binary" instead so that one can recreate a project from a
		   former "Export to Text" operation.
		
		10Feb06
		- Bugfix: v1.1.2 was not able to Import from Vault when there was no project file already existing
		   (that's because it wanted to see if the old project file was not altered and did error out when
		   there was no file found to be checked)
		- "RB Prj Vault ExIm.rbp" can be compiled again
		- The "rbpvexim" command line tool has new options. Start it without parameters to see them.
		   (note: the "exernalsSeparate" option is not working yet, though, will fix that for next version)
		- Improved some error messages
		- v1.1.3 released
		
		08Feb06
		- New safety measure: "Import From Vault" refuses to replace the prj file if the prj file has been
		   altered since it was last exported to the vault. Creates a "ProjectState.localonly" file for this.
		   See <http://www.rbwiki.org/doku.php/rbp/scm/rbvexim#conflicts.between.the.project.s.original.and.the.copy.in.the.vault>
		- New safety measure: "Import From Vault" moves the last version of the project files to the trash
		   instead of deleting them.
		- Vault Export can now adopt the project's folder hierarchy. On Import from Vault the hierarchy does not
		   matter - all files inside the vault will be recognized, no matter in which subfolder they're in.
		- External items search improved: If a external item is identified by multiple paths (relative, absolute
		   and Mac OS Alias), then the relative path is now searched first, and only if that fails, it falls back
		   to Alias and finally to absolute. This is more consistent with the IDE (2006r1), which prefers relative
		   paths over absolute.
		- Contents.rbvx file uses now TAB chars instead of "/" as a field separator
		- Tags: Added 3 more missing Binding tags (only seem to appear in RB 5.x projects, not in RB 200x)
		- FileTypes: added ".rbo;.rbm;.rbw" to "RBprj" file type so that one can drop single external
		   project items on the main window's drop boxes as well.
		- v1.1.2 released
		
		06Feb06
		- Bugfix: reading binary prj files with encrypted items that have values other than 2
		   are now detected properly again.
		- Bugfix: XML export does again add the "<Hex>" tag to hex encoded "<PropertyVal>" entries.
		- Improvement: TAB chars text items do not force a hex encoding any more, making Listbox
		   header entries better readable in XML and rbvx (vault) exports.
		- Moved the constant "KindTranslation" from the "RBPrjHelper" module to the "KindTranslations" module.
		- Input project files can now be of any supported format (not just the binary format any more).
		- Source code is now indented by two extra TAB chars for better readability in rbvx files.
		- The block length field in the block header is now zeroed when reading a binary project;
		   this allows me to eliminate the special case to ignore this value inside RBPrjItem.Equals().
		- v1.1.1 released
		
		28Jan05
		- based on the information in the bug report with ID "ntnexits", I have changed RBPrjXMLBuilder
		   to not create Hex entries with items that have more than 32767 bytes by default (see its
		   constructor where you can control this option).
		   This also solves the crashes formerly experienced with the XSLT transformation used for the
		   Doxygen conversion, and so I've enabled that feature in the Main window again as well.
		- included this version in Scott Steinman's "Reality Check" v0.7.0
		
		26Jan05
		- bugfix: does not leave files open any more inside RBPrjVaultWriter.updateFile
		   (thanks to Ben Henny for reporting it)
		- bugfix: does not optimize source lines starting with a blank any more to avoid
		   verification failures because of this
		- v1.1 released and announced on RBPrjTools and REALsource groups
		
		22Jan05
		- improved indentation code a little again
		- major overhaul of text exporter and vault exporter, vault importer finished
		- new extensions: textual project files now get always ".rbvx" extension, and vault uses ".rbvault" now
		- externals support in vault: all externals end up in main vault, no separate vaults are used any more
		for external project items.
		- vault export's self-verification now also verifies any involved external items properly
		- v1.1b2 released and announced on RBPrjTools and REALsource groups
		
		15Jan06:
		- moved data from the "PropertyLists.txt" file to a constant in the "RBPrjHelper" module
		- lots of changes to support the vault ex-/import
		- now properly supports externals in every possible case (I hope)
		- vault files are now created with LF line endings so that Apple's FileMerge works
		- added a console app "RB Prj Vault ExIm.rbp"
		- v1.1b1 released to a small group of testers
		
		08Jan06:
		- added kind translation for "mask"
		- moved the constant "KindTranslation" from the "RBPrjSupport" module to the "RBPrjHelper" module
		- added RBPrjBinaryFileWriter - now we can read _and_ write binary files
		- added support for version control by writing and reading project items to a "vault" directory, in text form
		- released 1.0.8 to some version control users for testing
		
		05Jan06:
		- gave the code to the Public Domain (no more Copyright be Thomas Tempelmann)
		- added kind translations for bindings ("Bind", "desc" etc.)
		- added a note about how to add missing kind translations
		- v1.0.7 released
		
		15Dec05:
		- renamed 'RBPrjImportFilter' into 'RBPrjProcessing'
		- renamed 'RBProject' into 'RBPrjBinaryFileReader' and moved its Type...-constants to 'RBPrjItem'
		- RBPrjBinaryFileReader.Parse can now ask the user to locate external items that can not be found automatically
		- Added the module "RBPrjSupport" which provides common functions
		- Moved the contents of the file "KindTranslation.txt" into a constant inside the "RBPrjSupport" module
		- renamed a few classes, added "Overview" and other documention, some code cleanup
		- errors and warnings are new collected in a separate class (RBPrjParseResults)
		- Added items ordering to RBPrjItemsTreeBuilder so that one can now create XML or Text files for
		easier comparison of different versions of a project file. This function also does some cleanup
		of redundant data, i.e. remove duplicate "Super" entries in Controls
		- v1.0.6 released
		
		02Dec05:
		- Updated "KindTranslation.txt" to the latest findings
		
		01Dec05:
		- When there's a mismatch in a method's parameter list versus its declaration, which can be caused
		by the 2005r4 IDE (it's obviously a bug in the IDE), and which is noticed when using the Class Browser,
		the process is no longer aborted by an exception but instead reportError() is called to enlist this problem.
		
		30Nov05:
		- Class Browser: now clears content view whenever the members list gets refreshed
		
		29Nov05:
		- fixed RBPrjObjTreeBuilder.getDeclaration() to accept multi-array declarations
		- v1.0.5 released
		
		29Nov05:
		- Can now include any kind of external item instead of only classes (no more "wrong state (3)" errors)
		- Does not crash any more with a nil ptr exc (tree=nil) in xml export with "merged" turned off when
		processing an external item
		- Compiles and runs under RB 5.5.5 again (note: RB 5.5 does crash if it calls interface methods that
		are implemented as "private"!)
		- v1.0.4 released
		
		24Nov05:
		- now detects encrypted items and skips them gracefully
		- Class browser added that actually starts being useful, not finished yet, though
		- v1.0.3 released
		
		17-21Nov05
		- renamed a few classes
		- added a lot of items to "KindTranslation.txt"
		- tested external items whose path uses non-ASCII chars, on Windows with RB 2005r4 - works
		- added Sorted XML exporter
		- added RBPrjObjTreeBuilder
		- added Andy Dent's XSLT for Java/Doxygen transformation, but the XMLDocument.Transform crashes
		(I've filed a bug with RS and hope they'll fix it soon). I've disabled this feature for now.
		- added RBPrjIdents, which create lists of identifiers in scopes of each class and globals. The IdentsWin
		can browse these scopes in a rudimentary way.
		- v1.0.2 released
		
		15Nov05
		- App has been briefly tested to work on Windows now
		- Some exception raisings have been converted into recorded messages that are shown after the parsing process
		- XML exporter: missing translations are prefixed by "unknown_" in the xml file along with a recorded msg
		- KindTranslation.txt is now using Windows line delimiters (CR+LF) to suit this platform better
		- XML exporter: fixed the code that reads the translations so that it can handle all kinds of line delimiters
		- ProgressWin shows progress and provides Stop button
		- Some classes have been renamed
		- Main windows offers various options now
		- v1.0.1 released
		
		14Nov05
		- v1.0, first release
	#tag EndNote

	#tag Note, Name = Overview
		// Overview of the classes and modules in this project
		//
		// RBPrjSupport - provides common functionality for easier use in other projects. Check this one out first!
		//
		// RBPrjFileReader - reads a project file and parses it by invoking a class that implements 'RBPrjProcessing'
		// RBPrjItemsTree - stores a prj in memory and can iterate over its items to invoke processors like those below:
		//
		//   The following processors are available so far:
		//
		//     RBPrjExternalsIncluder - when parsing a prj file, it finds external items to include them in the parsing process
		//     RBPrjTextFileWriter - writes the project data out to a text file
		//     RBPrjXMLFileWriter - writes the project data out to a XML file (compatible with RB's XML format for projects)
		//     RBPrjXMLBuilder - creates a XMLDocument object from the project data
		//     RBPrjItemsTreeBuilder - creates a tree of all items ('RBPrjItemsTree'), optionally sorting the items for special uses
		//     RBPrjObjTreeBuilder - creates a tree of all code related items (classes, modules, windows, etc.) for code analysis
		//
		// RBPrjIdents - maintains a tree for code analysis: provides symbol lookup, e.g. for a class browser
		//
		// Note:
		//   RBPrjItemsTree is the central container for a project file - you can read Prj files into this tree and write them out
		//   from it again. See RBPrjSupport for the import and export functions that create and use this tree.
	#tag EndNote

	#tag Note, Name = About Tag Translations
		//
		// Getting error messages about missing "tag" translations?
		// See the note in the RBPrjTagTranslator module
		//
	#tag EndNote

	#tag Note, Name = See Also
		// more notes can be found inside the RBPrjSupport module
		// and here: <http://www.tempel.org/rb/#prjtool>
	#tag EndNote

	#tag Note, Name = Release procedures
		' Things to do for a new release
		'
		'- increase the version in RBPrjSupport.AppVersion
		'- create a zip archive to make sure that it's readable on both Mac and Windows systems
		'
		' Things that should be tested before a new version is released
		'
		'- if a new RB version comes out, test any new features and see if xml output still works
		'- does a vault export and re-import work?
		'- does the rbvexim tool compile
		'- can the UI project be built with RB 5.5.5
		'- can all projects be built in the Windows IDE
		'- make sure merging externals works with encrypted external items ("encrypted/s.rbp")
		'   (note: it's a known problem that when including encrypted externals, their folder position
		'   gets lost, but this can't be fixed unless I'd know how to decrypt these items so that I can
		'   put the new "Cont" element inside)
	#tag EndNote


End Module
#tag EndModule
