#tag Class
Protected Class ReportClass
	#tag Method, Flags = &h21
		Private Sub CalcPrintableRect()
		  //
		  // Calculate the printable width and height of the page and margins
		  // based upon the information in the PrintSettings XML document
		  // and the given PageSetup
		  //
		  // If a PrinterSetup has been assigned to the report, that settings shall be used.
		  // Otherwise a PrinterSetup object is initialized, assuming (in lack of proper specification,
		  // inspecting such an object) it is initialized to the minimum supported margins.
		  // Then the maximum of these margins, and the corresponding value stored in the PrintSettings XML are used.
		  // Note that findng the minimum margins this way only works for the default printer, but that should be ok, here.
		  //
		  // Page is only used from the XML if the PrinterSetup (given or initialized) does not specify these values
		  
		  Dim lPs As PrinterSetup
		  Dim tMargin, bMargin As Double
		  Dim lMargin, rMargin As Double
		  Dim xtMargin, xbMargin As Double
		  Dim xlMargin, xrMargin As Double
		  Dim Width, Height As Double
		  Dim vRes As Integer
		  
		  If mPs = Nil Then
		    lPs = New PrinterSetup
		    xlMargin = SmartML.GetValueN(PrintSettings.DocumentElement, "page/@left")
		    xrMargin = SmartML.GetValueN(PrintSettings.DocumentElement, "page/@right")
		    xtMargin = SmartML.GetValueN(PrintSettings.DocumentElement, "page/@top")
		    xbMargin = SmartML.GetValueN(PrintSettings.DocumentElement, "page/@bottom")
		    If SmartML.GetValueB(PrintSettings.DocumentElement, "page/@points") Then
		      xlMargin = PointsToInches(xlMargin)
		      xrMargin = PointsToInches(xrMargin)
		      xtMargin = PointsToInches(xtMargin)
		      xbMargin = PointsToInches(xbMargin)
		    End If
		    
		  Else
		    lPs = mPs
		  End If
		  
		  height = SmartML.GetValueN(PrintSettings.DocumentElement, "page/@height")
		  width = SmartML.GetValueN(PrintSettings.DocumentElement, "page/@height")
		  If SmartML.GetValueB(PrintSettings.DocumentElement, "page/@points") Then
		    width = PointsToInches(width)
		    height = PointsToInches(height)
		  End If
		  
		  // I don't trust the vertical resolution to realiably be set. Assume it is equal to horizontal resolution if not
		  If lPs.VerticalResolution <= 0 Then
		    vRes = lPs.HorizontalResolution
		  Else
		    vRes = lPs.VerticalResolution
		  End If
		  
		  If lPs.PageWidth > 0 And lPs.PageHeight > 0 Then
		    width = mPs.PageWidth / mPs.HorizontalResolution
		    height = mPs.PageHeight / vRes
		  End If
		  
		  lMargin = -mPs.PageLeft / mPs.HorizontalResolution
		  rMargin = width - (mPs.Width / mPs.HorizontalResolution) - lMargin
		  tMargin = -mPs.PageTop / mPs.VerticalResolution
		  bMargin = height - (mPs.Height / mPs.VerticalResolution) - tMargin
		  
		  LeftMargin = Max(lMargin, xlMargin)
		  rMargin = Max(rMargin, xrMargin)
		  TopMargin = Max(tMargin, xtMargin)
		  bMargin = Max(bMargin, xbMargin)
		  
		  PrintableWidth = width - LeftMargin - rMargin
		  PrintableHeight = Height - TopMargin - bMargin
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  //
		  // Let's set some reasonable (U.S.) defaults "just in case"
		  //
		  TopMargin = 0.5
		  LeftMargin = 0.5
		  PrintableHeight = 10.0
		  PrintableWidth = 7.5
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Generate(Zoom As Double = 1.0, MyPages As Group2D = Nil) As Boolean
		  #Pragma Unused zoom
		  #Pragma Unused MyPages
		  
		  //
		  // Implement this in the subclass
		  //
		  App.DebugWriter.Write "Report.Generate: Enter/Exit"
		  InputBox.Message "Entered function Report.Generate:" + EndOfLine +_
		  "This should be implemented in the subclass."
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPage(PageNumber As Integer, Zoom As Double = 1.0) As Object2D
		  #Pragma Unused PageNumber
		  #Pragma Unused Zoom
		  
		  //
		  // The source for this method should be in the subclass
		  //
		  App.DebugWriter.Write "Report.GetPage: Enter/Exit"
		  InputBox.Message "Entered function Report.GetPage:" + EndOfLine +_
		  "This should be implemented in the subclass."
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPageCount() As Integer
		  //
		  // Returns the number of pages in the report.
		  //
		  // If, for some reason, Pages is Nil, zero will be returned
		  //
		  // Ed Palmer, January 2006
		  //
		  If Pages <> Nil Then
		    App.DebugWriter.Write "Report.GetPageCount: Enter/Exit, count = " + str(Pages.Count)
		    Return Pages.Count
		  Else
		    App.DebugWriter.Write "Report.GetPageCount: Enter/Exit, Pages = Nil"
		    Return 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LogPrintedSongs() As Boolean
		  '++JRC
		  If  App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		    Dim i As Integer
		    
		    For i = 0 To Ubound(Log)
		      If Log(i) <> Nil Then
		        If NOT Log(i).AddLogEntry Then
		          InputBox.Message App.T.Translate("errors/adding_entry")
		          return false
		        End If
		      End If
		    Next i
		    
		    return true
		  End If
		  
		  Return false
		  '--
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Print() As Boolean
		  //
		  // Time to put it on paper
		  //
		  // Ed Palmer, January 2006
		  //
		  // October 2007
		  //    Under certain circumstances, the Graphics object returned by
		  // the OpenPrinterDialog will have different dimensions than the
		  // page dimensions in the PrinterSetup object.  This has been
		  // observed on the Macintosh with the Canon i9900 printer and
		  // others.
		  //    Therefore, for the time being, this routine will calculate any
		  // change to the resolution between Generate and OpenPrinterDialog
		  // and scale the Group2D accordingly.  This does mean a slight loss in
		  // accuracy when scaling up, but is the minimal impact workaround until
		  // printing can be reexamined to use new techniques.  It also assumes that
		  // the ratios are equal both horizontally and vertically.
		  //
		  // May 2020 (SvA)
		  // On Windows, the user might even select a completely different paper size in the OpenPrinterDialog.
		  // Therefore, the dimensions that have been used to generate the pages is checked against the dimensions
		  // finally available for printing. If those do not match, the report is regenerated.
		  // Differences in resolution are handled by scaling only. Since pages are vector graphics, only minor
		  // differences in positioning may occure, anyway.
		  
		  
		  Dim i As Integer
		  Dim PagesPrinted As Integer = 0
		  Dim g As Graphics
		  Dim xOffset, yOffset As Double
		  Dim printerHRes, printerVRes As Integer
		  Dim HRatio, VRatio As Double
		  Dim pageScale, printerScale As Double
		  Dim pagesWidth, pagesHeight As Double
		  
		  App.DebugWriter.Write "Report.Print: Enter"
		  // Let's check out some things to get ready
		  
		  If ps = Nil Then Return False // Gotta have a print setup object (TODO: Fix for Linux)
		  
		  #if Not TargetWin32
		    If Pages = Nil Or Pages.Count = 0 Then
		      // this is done only because there is no way of aborting print without printing at least one page after OpenPrinterDialog has been called below
		      If Not Generate(ps.HorizontalResolution / 72, Pages) Then Return False
		    End If
		    
		    If Pages = Nil Then Return False // Nothing to print
		    If Pages.Count = 0 Then Return False // Ditto
		  #endif
		  
		  //
		  // Should be OK now.  Time to print
		  //
		  pagesHeight = PrintableHeight
		  pagesWidth = PrintableWidth
		  
		  If Globals.UseSheetDialogs Then
		    g = OpenPrinterDialog(ps, App.GetFrontControlScreenWindow)
		  Else
		    g = OpenPrinterDialog(ps)
		  End If
		  If g = Nil Then Return False // Error, or user cancelled
		  
		  // ps.Set does not fire when modified in OpenPrinterDialog calls above, so try again
		  ps = ps
		  
		  If Pages = Nil Or Pages.Count = 0 Or Abs(pagesWidth - PrintableWidth) > 3/24 Or Abs(pagesHeight - PrintableHeight) > 3/24 Then
		    // we do not have pages or thy hade been generated with page dimensions different in more than 3 pt
		    If Not Generate(ps.HorizontalResolution / 72, Pages) Or Pages = Nil Or Pages.Count = 0 Then
		      #if TargetWin32
		        Dim hdc As Integer = g.Handle(g.HandleTypeHDC)
		        declare function AbortDoc lib "gdi32" (hDC as integer) as integer
		        Call AbortDoc(hdc)
		      #endif
		      Return False
		    End If
		  End If
		  
		  printerHRes = ps.HorizontalResolution
		  printerVRes = ps.VerticalResolution
		  
		  HRatio = printerHRes / (72 * Scale)
		  VRatio = printerVRes / (72 * Scale)
		  
		  If HRatio <> VRatio Then
		    App.DebugWriter.Write StringUtils.Sprintf("Calculated horizontal scaling and vertical scaling are different, H = %d, V = %d",_
		    HRatio, VRatio), 1
		  End If
		  printerScale = Min(HRatio, VRatio)
		  
		  App.DebugWriter.Write StringUtils.Sprintf("Report.Print: copies %d, firstpage %d, lastpage %d, count %d",_
		  g.Copies, g.FirstPage, g.LastPage, Pages.Count)
		  
		  xOffset = (LeftMargin * printerHRes) + ps.PageLeft
		  yOffset = (TopMargin * printerVRes) + ps.PageTop
		  
		  //
		  // Mac OSX will manage copy count through the printer driver,
		  // but Windows requires the program to track this.
		  //
		  #If Not TargetMacOS
		    For CopyCount As Integer = 1 To g.Copies
		  #endif
		  For i = 1 To Pages.Count
		    If i >= g.FirstPage And i <= g.LastPage Then
		      App.DebugWriter.Write "Report.Print: Printing page "+ str(i)
		      If PagesPrinted > 0 Then g.NextPage
		      pageScale = Pages.Item(i - 1).Scale
		      // Alter scale to match the calculated scale based on any change in resolution
		      Pages.Item(i - 1).Scale = printerScale
		      
		      g.DrawObject Pages.Item(i - 1), xOffset, yOffset
		      Pages.Item(i - 1).Scale = pageScale
		      
		      PagesPrinted = PagesPrinted + 1
		    End If
		    
		  Next i
		  
		  #if Not TargetMacOS
		    Next CopyCount
		  #endif
		  
		  '++JRC
		  If NOT LogPrintedSongs Then
		    'TODO Error
		  End If
		  '--
		  
		  //
		  // For some reason, if this isn't done a second printing pass won't work
		  //
		  g = Nil
		  App.DebugWriter.Write "Report.Print: Printed " + str(PagesPrinted) + " pages"
		  App.DebugWriter.Write "Report.Print: Exit"
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		LeftMargin As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Log() As LogEntry
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrintSettings As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			PrinterSetup object associated with this report
		#tag EndNote
		Private mPs As PrinterSetup
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			Holds the generated pages of the report
		#tag EndNote
		Protected Pages As Group2D
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Size (in inches) of the printable area of a page.
			This is calculated from the PrinterSetup object.
		#tag EndNote
		PrintableHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This is the width in inches of the printable area of the page.
			It is calculated from the PrinterSetup object.
		#tag EndNote
		PrintableWidth As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPrintSettings = Nil Then
			    PrintSettings = Nil // try to get default
			  End If
			  return mPrintSettings
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value = Nil Then
			    value = App.MyPrintSettings
			  End If
			  If value = Nil Then
			    mPrintSettings = Nil
			  Else
			    mPrintSettings = New XmlDocument
			    mPrintSettings.AppendChild mPrintSettings.SafeImportNode(value.DocumentElement,True)
			  End If
			End Set
		#tag EndSetter
		PrintSettings As XmlDocument
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPs
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPs = value
			  CalcPrintableRect
			End Set
		#tag EndSetter
		ps As PrinterSetup
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		#tag Note
			The sacale factor Pages have been generated with
		#tag EndNote
		Protected Scale As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		TopMargin As Double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LeftMargin"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrintableHeight"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrintableWidth"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopMargin"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
