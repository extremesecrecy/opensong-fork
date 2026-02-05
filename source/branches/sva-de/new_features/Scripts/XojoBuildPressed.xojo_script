If BuildMac Then // --- Building for macOS 
  Dim appPath As String
  // appPath = buildApp(16, False) // Intel
  // appPath = buildApp(24, False) // ARM
  appPath = BuildApp(9, False) // Universal
End If

If BuildWin32 Then // --- Building for Windows (32-bit only supported by OpenSong)
  Dim appPath as string = buildApp(3, False)
End If

If BuildLinux Then // --- Building for Linux
  Dim appPath as string 
  appPath = BuildApp(18, False)  // ARM32
  appPath = BuildApp(17, False)  // AMD64
  appPath = BuildApp(26, False)  // ARM64
  // Until CopyFileStep in Build Automation allows distinguishing ARM64 from ARM32,
  // it is necessary to manually copy the NDI shared library into the opensong Libs folder
  Print "Please manually copy libndi.so.x.x.x from Frameworks/linux/aarch64-rpi4-linux-gnuabi to the Linux ARM64 build folder"
End If

//++
// Supported values depend on version of Xojo
//
// Possible values for build targets
// ---------------------------------
// Value | Target
//     3 | Windows x86
//     4 | Linux x86
//     9 | macOS Universal
//    12 | Xojo Cloud x86
//    14 | iOS Simulator (x64)
//    15 | iOS (ARM64)
//    16 | macOS x64
//    17 | Linux x64
//    18 | Linux ARM32
//    19 | Windows x64
//    21 | Android Emulator (ARM64)
//    23 | Android Device (ARM64)
//    24 | macOS ARM64
//    25 | Windows ARM64
//    26 | Linux ARM64
//--
