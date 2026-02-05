#tag Window
Begin Window winPIC
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   444
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   "mbPIC"
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "OpenSong Printer Info"
   Visible         =   True
   Width           =   599
   Begin HTMLViewer HTMLViewer1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   372
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   20
      Visible         =   True
      Width           =   559
   End
   Begin PushButton pbCollect
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "&Collect"
      Default         =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   315
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   404
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbCopy
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "&Copy"
      Default         =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   407
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   404
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbQuit
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   True
      Caption         =   "&Quit"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   499
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   404
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Timer timerDelay
      Height          =   32
      Index           =   -2147483648
      Left            =   21
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   354
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Self.timerDelay.Mode = Timer.ModeSingle
		  Self.timerDelay.Enabled = True
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetFontInfo(ps As PrinterSetup) As Boolean
		  Dim xd As XmlDocument
		  Dim xl As XmlNodeList
		  Dim xn As XmlNode
		  Dim numChildren As Integer
		  Dim numAtts As Integer
		  Dim i As Integer
		  Dim j As Integer
		  Dim s As String
		  Dim g As Graphics
		  
		  xd = New XmlDocument(SpecialFolder.Documents.Child("OpenSong").Child("Settings").Child("PrintSettings"))
		  
		  If xd Is Nil Then 
		    myHTML = myHTML + "<br><em>XmlDocument returned Nil!</em>" + EndOfLine
		    Return False
		  End If
		  
		  Try
		    numChildren = xd.DocumentElement.ChildCount
		  Catch XmlException
		    myHTML = myHTML + "<br><em>GetFontInfo: XmlException counting children" + EndOfLine
		    xd = Nil
		    Return False
		  End Try
		  
		  myHTML = myHTML + "<br>GetFontInfo: Found " + CStr(numChildren) + " children." + EndOfLine
		  
		  For i = 0 To numChildren - 1
		    Try
		      s = xd.DocumentElement.Child(i).Name
		    Catch
		      myHTML = myHTML + "<br><em>GetFontInfo: Exception getting name of child " + CStr(i) + "</em>" + EndOfLine
		      Return False
		    End Try
		    myHTML = myHTML + "<br>GetFontInfo: Child " + CStr(i) + " is '" + s + "'" + EndOfLine
		    
		    If s = "heading" then
		      xn = xd.DocumentElement.Child(i)
		      g = OpenPrinter(ps)
		      
		      numAtts = xn.AttributeCount
		      myHTML = myHTML + "<br>GetFontInfo: found " +  CStr(numAtts) + " attributes." + EndOfLine
		      
		      For j = 0 To numAtts - 1
		        Try
		          s = xn.GetAttributeNode(j).Name
		          myHTML = myHTML + "<br>GetFontInfo: Attribute " + CStr(j) + " is '" + s + "'" + EndOfLine
		          Select Case s
		          Case "font"
		            Try
		              g.TextFont = xn.GetAttributeNode(j).Value
		              myHTML = myHTML + "<br>Requested Font: " + xn.GetAttributeNode(j).Value
		              myHTML = myHTML + "<br>Provided Font: " + g.TextFont
		            Catch 
		              myHTML = myHTML + "<br><em>GetFontInfo: error looking up font in graphics object.</em>" + EndOfLine
		              Return False
		            End Try
		          Case "size"
		            g.TextSize = CDbl(xn.GetAttributeNode(j).Value)
		            myHTML = myHTML + "<br>Text Size: " + xn.GetAttributeNode(j).Value + EndOfLine
		          Case "bold"
		            g.Bold = (xn.GetAttributeNode(j).Value = "true")
		            myHTML = myHTML + "<br>Bold: " + xn.GetAttributeNode(j).Value + EndOfLine
		          Case "italic"
		            g.Italic = (xn.GetAttributeNode(j).Value = "true")
		            myHTML = myHTML + "<br>Italic: " + xn.GetAttributeNode(j).Value + EndOfLine
		          Case "underline"
		            g.Underline = (xn.GetAttributeNode(j).Value = "true")
		            myHTML = myHTML + "<br>Underline: " + xn.GetAttributeNode(j).Value + EndOfLine
		          Case "border"
		            myHTML = myHTML + "<br>Border: " + xn.GetAttributeNode(j).Value + EndOfLine
		          Case "fill"
		            myHTML = myHTML + "<br>Fill: " + xn.GetAttributeNode(j).Value + EndOfLine
		          Case "shadow"
		            myHTML = myHTML + "<br>Shadow: " + xn.GetAttributeNode(j).Value + EndOfLine
		          End Select
		        Catch
		          myHTML = myHTML + "<br><em>GetFontInfo: Error accessing attribute " + CStr(j) + "</em>" + EndOfLine
		          Return False
		        End Try
		      Next
		      
		      Try
		        myHTML = myHTML + "<br>TextAscent: " + CStr(g.TextAscent) + EndOfLine
		        myHTML = myHTML + "<br>TextHeight: " + CStr(g.TextHeight) + EndOfLine
		        myHTML = myHTML + "<br>EM-Width: " + CStr(g.StringWidth("M")) + EndOfLine
		        myHTML = myHTML + "<br>EN-Width: " + CStr(g.StringWidth("N")) + EndOfLine
		        If Not (g Is Nil) Then
		          g = Nil
		        End If
		      Catch
		        myHTML = myHTML + "<br><em>GetFontInfo: Error accessing graphics object.</em>" + EndOfLine
		        Return False
		      End Try
		    End If
		  Next
		  xn = Nil
		  xd = Nil
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPrinterSetup() As PrinterSetup
		  //
		  // OpenSong maintains a single PrinterSetup object for the printer.  This routine controls
		  // access to that object.  If ShowDialog is True, then the PrinterSetup dialog will be shown.
		  // If Wnd is not Nil, that Dialog will be attached to the given window (Mac only).
		  //
		  // RealBasic for the Mac has an issue with the PrinterSetup object.  The one returned
		  // from PageSetupDialog is invalid.  It has to be copied into a new one to be used.  For
		  // this reason, a clone is returned on OS X.
		  //
		  // On Windows, a second call to OpenPrinterDialog with the same PrinterSetup object
		  // results in no dialog display and Nil returned for the Graphics object.  Copy it, and
		  // all works fine.  Go figure.
		  //
		  // TODO: Save SetupString across program invocations.  Issues to remember: SetupString is
		  // platform dependent.  SetupString on Windows can't just be sent to an XML file such as
		  // MyPrintSettings with SmartML.SetValue.  Use something like EncodeBase64 to store
		  // and retrieve.
		  // This will also need to include the RB version as an attribute, as SetupStrings changed
		  // format in RB 2006 r3.
		  //
		  // Finally, this needs a different approach for Linux since (as of RB2005R4) PrinterSetup
		  // doesn't do anything useful.
		  //
		  
		  Dim TempPS As PrinterSetup
		  Dim NewPS As PrinterSetup
		  
		  TempPS = New PrinterSetup
		  TempPS.MaxHorizontalResolution = -1
		  TempPS.MaxVerticalResolution = -1
		  
		  If TempPS.PageSetupDialog(Self) Then
		    MyPrinterSetup = TempPS // Save the new settings
		  Else
		    Return Nil // User cancelled dialog.
		  End If
		  // We have a non-null MyPrinterSetup now.  Copy it and return
		  // Sadly, this has to be OS-specific, at least under RB5.5.
		  // If, on OS X, if you do a straight copy it bombs.  If you copy
		  // the setup string, it doesn't bomb but the horizontal and vertical resolutions
		  // are set to 72, which really does a number on things if it is reporting
		  // height and width at something other than 72dpi.
		  // Copying the setup string on Windows started off working, but
		  // then started returning an invalid pointer that would crash OS.
		  // This is insane...
		  // (September 2006: Curiouser and curiouser.  After taking another look
		  // at this problem, the same code appears to work for both Mac and Windows.
		  // Hopefully the printer fixes in RB 2006 r3 will let us put this to bed once
		  // and for all.)
		  
		  NewPS = New PrinterSetup
		  NewPS.MaxHorizontalResolution = -1
		  NewPS.MaxVerticalResolution = -1
		  NewPS.SetupString = MyPrinterSetup.SetupString
		  Return NewPS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetPrinterSetupInfo(NewPS As PrinterSetup)
		  myHTML = myHTML + "<body><h3>PrinterSetup</h3>"
		  If NewPS Is Nil Then
		    myHTML = myHTML + "<br><em>PrinterSetup is Nil!</em>" + EndOfLine
		    Return
		  End If
		  myHTML = myHTML + "<br>Height: " + CStr(NewPS.Height)
		  myHTML = myHTML + "<br>Width: " + CStr(NewPS.Width)
		  myHTML = myHTML + "<br>Top: " + CStr(NewPS.Top)
		  myHTML = myHTML + "<br>Left: " + CStr(NewPS.Left)
		  myHTML = myHTML + "<br>Horizontal Resolution: " + CStr(NewPS.HorizontalResolution)
		  myHTML = myHTML + "<br>Maximum Horizontal Resolution: " + CStr(NewPS.MaxHorizontalResolution)
		  myHTML = myHTML + "<br>Vertical Resolution: " + CStr(NewPS.VerticalResolution)
		  myHTML = myHTML + "<br>Maximum Vertical Resolution: " + CStr(NewPS.MaxVerticalResolution)
		  myHTML = myHTML + "<br>Page Height: " + CStr(NewPS.PageHeight)
		  myHTML = myHTML + "<br>Page Width: " + CStr(NewPS.PageWidth)
		  myHTML = myHTML + "<br>Page Top: " + CStr(NewPS.PageTop)
		  myHTML = myHTML + "<br>Page Left: " + CStr(NewPS.PageLeft)
		  myHTML = myHTML + "<br>Setup String:<br><pre>" + CStr(NewPS.SetupString) + "</pre>"
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private myHTML As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MyPrinterSetup As PrinterSetup
	#tag EndProperty


#tag EndWindowCode

#tag Events HTMLViewer1
	#tag Event
		Sub Open()
		  Me.LoadPage "<html><head><title>Explanation</title></head>" +_
		  "<body><h2>Purpose</h2>"+_
		  "<p>The purpose of this program is to collect information about how OpenSong ""sees"" "+_
		  "the fonts selected for printing and the printer itself."+EndOfLine+_
		  "<p>When you press <em>Collect</em>, a Printer Setup dialog will be shown."+_
		  "<p>Select the setup you normally use to print in OpenSong and press the ""OK"" button."+EndOfLine+_
		  "<p>When complete, the <em>Copy</em> button will be enabled and this text will be replaced "+_
		  "with the information to be sent back to the OpenSong development team."+_
		  "<p>Press the <em>Copy</em> button, then paste the data into your favorite email program "+_
		  "and send to swampcat@users.sourceforge.net."+EndOfLine+_
		  "<p><b>Note</b>: a blank page will be printed on the selected printer. This is an unfortunate "+_
		  "side effect of RealBasic that cannot be avoided."+EndOfLine+_
		  "<p><em>Thank you for helping make </em>OpenSong<em> a better program!</em>"+_
		  "</body></html>", GetFolderItem("")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbCollect
	#tag Event
		Sub Action()
		  Dim ps As PrinterSetup
		  myHTML = "<html><head><title>Program Output</title></head>"
		  ps = GetPrinterSetup
		  
		  If GetFontInfo(ps) Then
		    GetPrinterSetupInfo(ps)
		  End If
		  
		  myHTML = myHTML + "</body></html>"
		  HTMLViewer1.LoadPage( myHTML,GetFolderItem(""))
		  pbCopy.Enabled = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbCopy
	#tag Event
		Sub Action()
		  Dim c As New Clipboard
		  c.SetText(myHTML)
		  c.Close
		  MsgBox "Text copied to clipboard." + EndOfLine + "Please paste into a mail message"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbQuit
	#tag Event
		Sub Action()
		  App.AutoQuit = True
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timerDelay
	#tag Event
		Sub Action()
		  pbCollect.Enabled = True
		End Sub
	#tag EndEvent
#tag EndEvents
