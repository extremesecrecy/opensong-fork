#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopySupportFoldersLinux
					AppliesTo = 0
					Architecture = 0
					Destination = 0
					Subdirectory = 
					FolderItem = Li4vT3BlblNvbmclMjBEZWZhdWx0cy8=
					FolderItem = Li4vT3BlblNvbmclMjBMYW5ndWFnZXMv
					FolderItem = Li4vT3BlblNvbmclMjBTY3JpcHR1cmUv
					FolderItem = Li4vT3BlblNvbmclMjBTZXR0aW5ncy8=
				End
				Begin CopyFilesBuildStep CopyNDILibARM
					AppliesTo = 0
					Architecture = 2
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9hcm0vbGlibmRpLnNvLjQuNS4z
					FolderItem = Li4vRnJhbWV3b3Jrcy9saWJuZGlfbGljZW5zZXMudHh0
				End
				Begin CopyFilesBuildStep CopyNDILibX86_64
					AppliesTo = 0
					Architecture = 1
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy94ODZfNjQvbGlibmRpLnNvLjQuNS4z
					FolderItem = Li4vRnJhbWV3b3Jrcy9saWJuZGlfbGljZW5zZXMudHh0
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopySupportFoldersMac
					AppliesTo = 0
					Architecture = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vT3BlblNvbmclMjBEZWZhdWx0cy8=
					FolderItem = Li4vT3BlblNvbmclMjBMYW5ndWFnZXMv
					FolderItem = Li4vT3BlblNvbmclMjBTY3JpcHR1cmUv
					FolderItem = Li4vT3BlblNvbmclMjBTZXR0aW5ncy8=
				End
				Begin CopyFilesBuildStep CopyLibraries
					AppliesTo = 0
					Architecture = 1
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9saWJuZGkuNC5keWxpYg==
				End
				Begin IDEScriptBuildStep CodeSignDebugBuilds , AppliesTo = 1, Architecture = 0
					Var App As String = CurrentBuildLocation + "/""" + CurrentBuildAppName + ".app"""
					Call DoShellCommand("xattr -clr " + App)
					Call DoShellCommand("codesign -f --options=runtime --deep --timestamp --entitlements ""${PROJECT_PATH}/../Installers/Mac/entitlements.plist"" -s 'Developer ID Application: Edward Palmer' " + App + "/Contents/Frameworks/*.dylib")
					Call DoShellCommand("codesign -f --options=runtime --deep --timestamp --entitlements ""${PROJECT_PATH}/../Installers/Mac/entitlements.plist"" -s 'Developer ID Application: Edward Palmer' " + App + "/Contents/Frameworks/*.framework")
					Call DoShellCommand("codesign -f --options=runtime --deep --timestamp --entitlements ""${PROJECT_PATH}/../Installers/Mac/entitlements.plist"" -s 'Developer ID Application: Edward Palmer' " + App)
				End
				Begin CopyFilesBuildStep CopyTextFiles
					AppliesTo = 2
					Architecture = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9saWJuZGlfbGljZW5zZXMudHh0
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopySupportFoldersWin
					AppliesTo = 0
					Architecture = 0
					Destination = 0
					Subdirectory = 
					FolderItem = Li4vT3BlblNvbmclMjBEZWZhdWx0cy8=
					FolderItem = Li4vT3BlblNvbmclMjBMYW5ndWFnZXMv
					FolderItem = Li4vT3BlblNvbmclMjBTY3JpcHR1cmUv
					FolderItem = Li4vT3BlblNvbmclMjBTZXR0aW5ncy8=
				End
				Begin CopyFilesBuildStep CopyNDILib
					AppliesTo = 0
					Architecture = 0
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9Qcm9jZXNzaW5nLk5ESS5MaWIueDg2LmRsbA==
					FolderItem = Li4vRnJhbWV3b3Jrcy9saWJuZGlfbGljZW5zZXMudHh0
				End
			End
#tag EndBuildAutomation
