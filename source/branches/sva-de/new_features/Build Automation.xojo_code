#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopySupportFoldersLinux
					AppliesTo = 0
					Architecture = 0
					Target = 0
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
					Target = 0
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9saW51eC9hcm0tcnBpNC1saW51eC1nbnVlYWJpaGYvbGlibmRpLnNvLjYuMC4w
				End
				Begin CopyFilesBuildStep CopyNDILibX86_64
					AppliesTo = 3
					Architecture = 1
					Target = 0
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9saW51eC94ODZfNjQtbGludXgtZ251L2xpYm5kaS5zby42LjAuMA==
				End
				Begin CopyFilesBuildStep CopyNDILicenseLinux
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9Qcm9jZXNzaW5nLk5ESS5MaWIuTGljZW5zZXMudHh0
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopySupportFoldersMac
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vT3BlblNvbmclMjBEZWZhdWx0cy8=
					FolderItem = Li4vT3BlblNvbmclMjBMYW5ndWFnZXMv
					FolderItem = Li4vT3BlblNvbmclMjBTY3JpcHR1cmUv
					FolderItem = Li4vT3BlblNvbmclMjBTZXR0aW5ncy8=
				End
				Begin CopyFilesBuildStep CopyNDILibraryMac
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9tYWNvcy9saWJuZGkuZHlsaWI=
				End
				Begin CopyFilesBuildStep CopyNDILicenseMac
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9Qcm9jZXNzaW5nLk5ESS5MaWIuTGljZW5zZXMudHh0
				End
				Begin IDEScriptBuildStep CodeSignDebugBuilds , AppliesTo = 3, Architecture = 0, Target = 0
					Var App As String = CurrentBuildLocation + "/""" + CurrentBuildAppName + """"
					Var result As String
					result = DoShellCommand("xattr -clr " + App)
					result = DoShellCommand("codesign -f --options=runtime --deep --timestamp --entitlements ""${PROJECT_PATH}/entitlements.plist"" -s 'Developer ID Application: Edward Palmer' " + App + "/Contents/Frameworks/*.dylib")
					result = DoShellCommand("codesign -f --options=runtime --deep --timestamp --entitlements ""${PROJECT_PATH}/entitlements.plist"" -s 'Developer ID Application: Edward Palmer' " + App + "/Contents/Frameworks/*.framework")
					result = DoShellCommand("codesign -f --options=runtime --deep --timestamp --entitlements ""${PROJECT_PATH}/entitlements.plist"" -s 'Developer ID Application: Edward Palmer' " + App)
				End
				Begin SignProjectStep Sign
				  DeveloperID=Developer ID Application: Edward Palmer
				  macOSEntitlements={"App Sandbox":"False","Hardened Runtime":"False","Notarize":"False","UserEntitlements":"/Users/palmered/SVN/opensong-sf/source/trunk/OpenSong.entitlements","Hardened RuntimeEntitlements":{"com.apple.security.cs.allow-dyld-environment-variables":"True"}}
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopySupportFoldersWin
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 0
					Subdirectory = 
					FolderItem = Li4vT3BlblNvbmclMjBEZWZhdWx0cy8=
					FolderItem = Li4vT3BlblNvbmclMjBMYW5ndWFnZXMv
					FolderItem = Li4vT3BlblNvbmclMjBTY3JpcHR1cmUv
					FolderItem = Li4vT3BlblNvbmclMjBTZXR0aW5ncy8=
				End
				Begin CopyFilesBuildStep CopyNDILibWin
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy93aW5kb3dzL1Byb2Nlc3NpbmcuTkRJLkxpYi54ODYuZGxs
				End
				Begin CopyFilesBuildStep CopyNDILicenseWin
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vRnJhbWV3b3Jrcy9Qcm9jZXNzaW5nLk5ESS5MaWIuTGljZW5zZXMudHh0
				End
			End
#tag EndBuildAutomation
