#tag Module
Module Documentation
	#tag Note, Name = About
		// This is the GUI (graphical user interface) version of the "RB Prj Vault Export/Import" tool
		
	#tag EndNote

	#tag Note, Name = Read This First
		// For a change history and other information please see the notes in the
		//  "RB Project Tool.rbp" project file instead
		
	#tag EndNote

	#tag Note, Name = See Also
		<http://www.rbwiki.org/doku.php/rbp/scm/rbvexim>
		
	#tag EndNote

	#tag Note, Name = How it works
		The goal is to provide one drop application that can both export to
		and import from a Vault folder.
		
		There are two possible ways to decide which action to take (export vs. export):
		
		1. By the type of item dropped on the too: Dropping a .rbp file means Export
		while dropping a .rbvault folder means Import.
		
		2. By comparing the state of the project and its Vault. If the vault does not
		exist or if the project has been changed since last export, Export is chosen,
		otherwise Import is chosen.
		
		While the second way seems to provide a nice automatism, it may cause
		confusion to the user if he has just checked out his data from the repository
		into the Vault and now plans to Import the project from the Vault. If,
		however, the project had been changed as well, the wrong action would be
		chosen by the decision process described above. It could only work right
		if this tool had also control over the repository interaction so that it knew
		what happened last and in which state the Vault is.
		
		Alternatively, though, it might be possible to also check the state of the
		Vault's contents - if the tool can detect changes to the Vault as well,
		then it could perform the right action if only either the project or the
		Vault had changed, and warn the user otherwise, not taking an automatic
		action.
		
		Until the state of the Vault contents can be detected, the first solution from
		above will be performed by this tool.
		
	#tag EndNote


End Module
#tag EndModule
