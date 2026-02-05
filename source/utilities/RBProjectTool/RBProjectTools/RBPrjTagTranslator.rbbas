#tag Module
Protected Module RBPrjTagTranslator
	#tag Method, Flags = &h21
		Private Sub readTranslations()
		  dim tagn, line, i as Integer
		  dim tags(), transValue, s, lines() as String
		  dim dict as Dictionary
		  dim v as Variant
		  
		  theTranslations = new Dictionary
		  
		  // determine the line delimiters in the TranslationTable constant
		  if InStr(TranslationTable, chr(13)+chr(10)) > 0 then
		    s = chr(13)+chr(10)
		  elseif InStr(TranslationTable, chr(13)) > 0 then
		    s = chr(13)
		  else
		    s = chr(10)
		  end
		  
		  lines = TranslationTable.Split(s)
		  while line <= Ubound(lines)
		    s = Trim (lines(line))
		    line = line + 1
		    if s <> "" then
		      RBPrjHelper.Assert (CountFields(s, ":") = 2, "invalid pair in line "+Str(line), "readTranslations")
		      transValue = NthField(s, ":", 2)
		      s = NthField(s, ":", 1)
		      tags = s.Split(",")
		      dict = theTranslations
		      for i = 0 to Ubound(tags)
		        RBPrjHelper.Assert (LenB(tags(i)) = 4, "each tag must be 4 chars long, line "+Str(line), "readTranslations")
		        tagn = RBPrjHelper.Str4ToInt(tags(i)) // this allows us to use the Dictionary case-sensitive
		        RBPrjHelper.Assert (tagn > 0, "internal error: int value of tag is negative, line "+Str(line), "readTranslations")
		        if i = Ubound(tags) then
		          if dict.HasKey(tagn) then
		            RBPrjHelper.RaiseExc ("tag defined twice, line "+Str(line)+": "+tags(i), "readTranslations")
		          end
		          dict.Value(tagn) = transValue
		        else
		          tagn = -tagn
		          if dict.HasKey(tagn) then
		            v = dict.Value(tagn)
		          else
		            v = new Dictionary
		          end
		          dict.Value(tagn) = v
		          dict = v
		        end
		      next
		    end
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Translations() As Dictionary
		  if theTranslations = nil then
		    readTranslations ()
		  end
		  return theTranslations
		End Function
	#tag EndMethod


	#tag Note, Name = About TagTranslations
		General information used to be found at <http://www.rbdocs.com/rbprj/tags>, but this page is lost now.
		There is currently no other page with such information, sorry
	#tag EndNote

	#tag Note, Name = How to add translations
		' Getting error messages about missing "tag" translations?
		'
		' That's because you've tried to convert a binary project file into its XML representation,
		' with the file containing tags that are not known to this software yet.
		'
		' This would be a problem if you'd pass this generated XML file to the RB IDE,
		' since the IDE would not understand those tags then.
		'
		' To solve this, you need to add the missing translations manually. This is not
		' difficult though. Do this:
		'
		' 1. Run the RBPrjTool and have it create a XML file from the binary (.rb) prj file.
		' Ignore the warning about the missing translations.
		'
		' 2. Open the same binary prj file in the RB IDE and use "Save As...". In the
		' appearing file save dialog, set the "Format" option below to "XML Project",
		' then save the file.
		'
		' 3. Open both generated XML files with a text editor (e.g. TextWrangler).
		' Search for "unknown_" in the first file. For example, you might find:
		'   <unknown_Abcd>
		'
		' 4. In the IDE-generated XML file, find the matching line. Of course, you can
		' not search for "unknown_" there, but its translation. You must search for
		' unique lines that are around the line in question instead.
		'
		' 5. Once you have found the matching translation, write down the pair,
		' like this:
		'   Abcd:TheTranslation
		'
		' 6. View the "TranslationTable" constant in this class. Cut out the
		' entire "Default Value" (Select All, then Cut to clipboard), paste it into a text editor,
		' append the new translation pair to its end and paste this new set of pairs back into
		' the TranslationTable constant.
		'
		' 7. Run the RBPrjTool again and have it again convert the binary prj file to XML to
		' check that you now do not get the "missing translations" warning any more.
		'
		' That's it.
		'
		' BTW, if you find new translations, please let Thomas Tempelmann know (tt@tempel.org)
		'
		' Thanks!
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			two formats are used:
			
			1.
			key: 4-char 'tag' value, converted into an Integer for case-sensitive lookup
			value: the translation String
			
			2.
			key: negated Integer value of the enclosing group's 'tag' value (negated works because the chars used at all ASCII, i.e. below chr(127))
			value: a Dictionary with the same properties as this one
		#tag EndNote
		Private theTranslations As Dictionary
	#tag EndProperty


	#tag Constant, Name = TranslationTable, Type = String, Dynamic = False, Default = \"Name\x2CCnst:ItemName\rName:ObjName\rPSIV:ProjectSavedInVers\rACnm:ProjMgrUser\rACsv:ProjMgrServer\rVer1:MajorVersion\rVer2:MinorVersion\rVer3:SubVersion\rRels:Release\rNnRl:NonRelease\rRegn:Region\rSVer:ShortVersion\rLVer:LongVersion\rIVer:InfoVersion\rDVew:DefaultViewID\rprTp:ProjectType\rDLan:DefaultLanguage\rCLan:CurrentLanguage\rDEnc:DefaultEncoding\rBflg:BuildFlags\rBCXF:BuildCarbonExecutableFormat\rIcon:Icon\rCPal:ColorPalette\rflag:ItemFlags\relem:Element\rMacC:MacCreator\rBMac:BuildMacName\rBCar:BuildCarbonName\rBSiz:BuildSize\rBMSz:BuildMinSize\rBSzS:BuildSizeAsString\rBMSS:BuildMinSizeAsString\rMDIc:WinMDICaption\rBWin:BuildWinName\rBMDI:BuildWinMDI\rBL86:BuildLinuxX86Name\rrEdt:EditBounds\rCont:ObjContainerID\reSpt:EditSplit\rbPGp:BrowserPositionGroup\rbPEl:BrowserPositionElement\rscKy:ScreenKey\rbCls:IsClass\rSize:ObjSize\rSupr:Superclass\rbNtr:IsInterface\rCnst:Constant\rEnco:TextEncoding\rtype:ItemType\rdefn:ItemDef\rpltf:ItemPlatform\rlang:ItemLanguage\rIntr:Interfaces\rbApO:IsApplicationObject\rsrcl:SourceLine\rpObj:Module\rProj:Project\rpTxt:AnyFile\rpExt:ExternalCode\rpEEx:ExtEncCode\rname:ItemName\rCIns:ConstantInstance\rPDef:PropertyVal\rpVew:Window\rlstH:LastPositionH\rlstV:LastPositionV\rHIns:HookInstance\rsorc:ItemSource\rstsr:StartSelRow\rstsc:StartSelCol\rndsr:EndSelRow\rndsc:EndSelCol\rFDef:FormDefn\rMItm:MenuItem\rpMnu:Menu\rspmu:ItemSpecialMenu\rtext:ItemText\rindx:ItemIndex\rscut:ItemShortcut\rbhlp:ItemHelp\rdhlp:ItemDisabledHelp\rstyl:ItemStyle\rmaEn:MenuAutoEnable\rProp:Property\rrslt:ItemResult\rMeth:Method\rpath:FullPath\rppth:PartialPath\ralis:FileAlias\rparm:ItemParams\raivi:AutoIncVersion\rBCMO:BuildCarbonMachOName\rComp:Compatibility\rVwBh:ViewBehavior\rVwPr:ViewProperty\rVsbl:Visible\rPrGp:PropertyGroup\rPVal:PropertyValue\rAlas:AliasName\rWnSt:WindowState\rOTab:OpenTab\rLsLc:LastLocation\rpUIs:UIState\rdecl:ItemDeclaration\rsrbp:SourceLineBreakpoint\rfTyp:FileType\rCBhv:ControlBehavior\rccls:ControlClass\rCtrl:Control\rCBix:ControlIndex\rntln:NoteLine\rpFol:Folder\rdata:ItemData\rpFTy:FileTypes\rBlok:block\rNote:Note\rRbBF:RBProject\rMiSK:MenuShortcut\rMiMk:MenuShortcutModifier\rMiAM:AlternateShortcutModifier\rMopt:MacOptionModifier\rMiKK:MacControlModifier\rMiAK:PCAltModifier\rpDBs:Database\rHook:Hook\rSySF:SystemFlags\rCPrs:SetAccessor\rCPrg:GetAccessor\rMnuH:MenuHandler\rpPic:Picture\rpCur:Cursor\rtran:ItemTransparent\rBind:Binding\rBnSr:BindSource\rBnSd:BindSourceData\rBbSd:BindSourceBindData\rBnDs:BindDest\rBnDd:BindDestData\rBbDd:BindDestBindData\rdesc:ItemDescription\rStrx:Structure\rEnum:Enumeration\rmask:Mask\rpRes:Resources\rpMed:Movie\rpScp:Script\rBunI:BundleIdentifier\rmodd:LatestChange\rCPif:InheritsFrom\rvbET:EditorType\rAltE:AlternateEditorID\rLSpt:LeftSplitter\rWcmN:BuildWinCompanyName\rWpNm:BuildWinProductName\rWiNm:BuildWinInternalName\rGDIp:UseGDIPlus\rDgCL:DebuggerCommandLine\rWprt:WebPort\rWpcl:WebProtocol\rWdpt:WebDebugPort\rWbsr:WebUseIntegratedBrowser\rWbLS:WebLaunchString\rWHTM:WebHTMLHeader\rWbDS:WebDisconnectString\rUsBF:UseBuildsFolder\rprWA:WebApp\rBSts:BuildAutomation\rBsls:BuildStepsList\rBSbu:BuildProjectStep\rplSC:ProjectListSortColumn\rplCD:ProjectListColumnSortDirection\rWrnP:WarningPreferences\rWiFd:BuildWinFileDescription\rhidp:HiDPI\rdkmd:DarkMode\rlinA:LinuxArchitecture\rmacA:MacArchitecture\roPtL:OptimizationLevel\rcRDW:CopyWindowsRedist\rWinV:WindowsVersions\rrunA:WindowsRunAs\rPtID:PartID\riLck:Locked\rmVis:MenuItemVisible\rImg :MultiImage\rImgR:ImageRepresentation\rsvin:SaveInfo\rImgS:ImageSpecification\rcomM:Comment\rdeVi:Device\ritHt:Height\rorie:Orientation\rplFM:Platform\rresZ:Resolution\ritWd:Width\ritHd:HeightDouble\ritwD:WidthDouble\rSwSt:StudioWindowState\rMaxW:WindowMaximized\rSEds:Editors\rSEdC:EditorCount\rSEdr:Editor\rSEId:EditorIndex\rSELn:EditorLocation\rSEPt:EditorPath\rEdpt:EditingPartID\rStST:SelectedTab\rAChp:ProjMgrPort\rAicn:ApplicationIcon\rArch:Architecture\rAtrb:Attributes\rAXCI:ActiveXControlIcon\rAXCl:ActiveXControl\rbFAS:BuildForAppStore\rbinE:BinaryEnum\rbkGP:BookmarkGroup\rbmrk:Bookmark\rbrkG:BreakPointGroup\rBScf:CopyFilesStep\rBSsc:IDEScriptStep\rBSsn:SignProjectScriptStep\rCi1a:HLCItem1Attr\rCi2a:HLCItem2Attr\rciID:CodeItemID\rcnfT:ConformsTo\rCni1:HLCItem1\rCni2:HLCItem2\rCnLk:HLCEditable\rCnMP:HLCScale\rCnPr:HLCPriority\rCnPv:HLCValue\rCnRo:HLCRelOp\rcomp:Compatibility\rDest:Subdirectory\rdevT:DeviceType\rDgDD:DebuggerDestinationDir\rDmth:DelegateDeclaration\rdscR:Description\rDstR:Destination\rEEst:EmptyEventState\renbl:Enabled\rEnVv:EnvVars\rFTpt:FilePhysicalType\rFTRk:FileRank\rHCla:HCLActive\rHCnm:HLCName\rHLCn:HighLevelConstraint\riAic:AppIcon\riArc:IOSArchitecture\riDDv:IOSDebugDevice\rIDEv:IDEVersion\rIEsx:ExternalScriptStep\riLim:iOSLaunchImages\rimPo:Imported\rioLS:IOSLaunchScreen\rioPP:ProvisioningProfileName\riOri:IOSLayoutEditorViewOrientation\riOsC:IOSCapabilities\riosC:iOSContainer\riosv:IOSView\rIPDB:IncludePDB\risBn:BuildiOSName\riSCI:ScreenContentItem\riVTy:IOSLayoutEditorViewType\rkCod:CodeDescription\rkUTI:UTIType\rLib :LibraryName\rLimg:LaunchImages\rlncs:NormalizeControlSizes\rlnNM:lineNum\rMacV:MacMinimumVersion\rMImp:MethodImplements\rmimT:MimeType\rmobc:MobileContainer\rmobv:MobileScreen\robjC:ObjectiveC\rocls:WebObjectClass\rOPSp:OrigProjectSpec\rpACX:COMActiveX\rpAET:AETemplate\rpasw:Password\rpItm:ProjectItem\rpLay:IOSLayout\rPlst:PList\rpOCX:ActiveX\rPro :ProOnlyItem\rpRpt:Report\rpScn:IOSScreen\rpSnd:Sound\rpTbr:Toolbar\rpWPg:WebPage\rpWSe:WebSession\rpWSt:WebStyle\rpXCM:XCMDPlugin\rRpsc:ReportSection\rRSpt:RightSplitter\rScrX:ScrollX\rScrY:ScrollY\rSCtx:ScriptText\rsegB:SegmentedButton\rsegC:SegmentedControl\rshrd:Shared\rSoft:SoftLink\rStpA:StepAppliesTo\rTarg:Target\rti  :ToolItem\rtlib:PathToTypeLibrary\rTVew:DefaultTabletViewID\rullv:UseLLVM\runID:UnitID\runTY:UnitType\rUsin:GlobalUsingClauses\rUSng:Using\rvisi:Visible_\rWbAn:WebHostingAppName\rWbHd:WebHostingDomain\rWbHI:WebHostingIdentifier\rWeb2:WebVersion\rwinA:WindowsArchitecture\rwInV:WebControlInitialValue\rWptS:WebSecurePort\rWSSD:WebStyleStateDefinition\rWSSG:WebStyleStateGroup\rWSSI:WebStyleStateID\rxcls:ActiveXCLSID\rXMth:ExternalMethod\rXTCG:DrawOSXTxtCoreGraph\rxWbV:WebView\rxWSs:Session", Scope = Private
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
