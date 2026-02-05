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
		  Dim width, height As Double
		  Dim hRes, vRes As Integer
		  
		  If mPs = Nil Then
		    lPs = New PrinterSetup
		  Else
		    lPs = mPs
		  End If
		  
		  // Check if PrinterSetup values make sense
		  // looks like MacOS does not provide a way to define margins on the page setup dialog other then defining a custum paper size
		  // so use this for Windows only
		  hRes = lPs.HorizontalResolution
		  vRes = lPs.VerticalResolution
		  If vRes <= 0 Then
		    vRes = hRes
		  End If
		  If hRes <= 0 Then
		    If vRes < 0 Then
		      hRes = 0
		      vRes = 0
		    Else
		      hRes = vRes
		    End If
		  End If
		  
		  PageWidth = 0
		  PageHeight = 0
		  If hRes >= 0 And _
		    lPs.PageWidth >= 0 And lPs.PageLeft <= 0 And lPs.Width > 0 And lPs.Width - lPs.PageLeft <= lPs.PageWidth And _
		    lPs.PageHeight >= 0 And lPs.PageTop <= 0 And lPs.Height > 0 And lPs.Height - lPs.PageTop <= lPs.PageHeight Then
		    If mPs = Nil Then
		      // these are minimum margins to be used below
		      lMargin = LeftMargin
		      rMargin = (lPs.PageWidth + lPs.PageLeft + lPs.Width) / hRes
		      tMargin = TopMargin
		      bMargin = (lPs.PageHeight + lPs.PageTop + lPs.Height) / vRes
		    Else
		      PageWidth = lPs.PageWidth / hRes
		      PageHeight = lPs.PageHeight / vRes
		      #If TargetWin32  
		        PrintableWidth = lPs.Width / hRes
		        LeftMargin = -lPs.PageLeft / hRes
		        PrintableHeight = lPs.Height / vRes
		        TopMargin = -lPs.PageTop / vRes
		        If PrintableWidth <= 100 And PrintableHeight <= 100 Then
		          // they made sense, we use them
		          Return
		        End If
		      #Endif
		    End If
		  End If
		  
		  // get page dimensions from PrintSettings
		  height = SmartML.GetValueN(PrintSettings.DocumentElement, "page/@height")
		  width = SmartML.GetValueN(PrintSettings.DocumentElement, "page/@width")
		  xlMargin = Max(SmartML.GetValueN(PrintSettings.DocumentElement, "page/@left"), 0)
		  xrMargin = Max(SmartML.GetValueN(PrintSettings.DocumentElement, "page/@right"), 0)
		  xtMargin = Max(SmartML.GetValueN(PrintSettings.DocumentElement, "page/@top"), 0)
		  xbMargin = Max(SmartML.GetValueN(PrintSettings.DocumentElement, "page/@bottom"), 0)
		  If SmartML.GetValueB(PrintSettings.DocumentElement, "page/@points") Then
		    width = PointsToInches(width)
		    height = PointsToInches(height)
		    xlMargin = PointsToInches(xlMargin)
		    xrMargin = PointsToInches(xrMargin)
		    xtMargin = PointsToInches(xtMargin)
		    xbMargin = PointsToInches(xbMargin)
		  ElseIf Not SmartML.GetValueB(PrintSettings.DocumentElement, "page/@inches") Then
		    width = width / 2.54
		    height = height / 2.54
		    xlMargin = xlMargin / 2.54
		    xrMargin = xrMargin / 2.54
		    xtMargin = xtMargin / 2.54
		    xbMargin = xbMargin / 2.54
		  End If
		  
		  // should we use page size from PrinterSetup?
		  If xlMargin >= 0 And xrMargin >= 0 And xtMargin >= 0 And xbMargin >= 0 And _
		    PageWidth - xlMargin - xrMargin >= 0.5 And PageHeight - xtMargin - xbMargin >= 0.5 _
		    And PageWidth < 100 And PageHeight < 100 Then
		    width = PageWidth
		    height = PageHeight
		  End If
		  
		  // do the PrintSettings values make sense?
		  If xlMargin < 0 Or xrMargin < 0 Or xtMargin < 0 Or xbMargin < 0 Or _
		    width - xlMargin - xrMargin <= 0 Or height - xtMargin - xbMargin <= 0 Then
		    // no --> use default values
		    If CountryUsesImerialPaperSize(Locale.Current) Then
		      width = 8.5  // US Letter
		      height = 11
		      xlMargin = 0.5
		      xtMargin = 0.5
		      xrMargin = 0.5
		      xbMargin = 0.5
		    Else
		      width = PointsToInches(595.32)  // A4
		      height = PointsToInches(841.92)
		      xlMargin = PointsToInches(70.92)  // 2.5 cm
		      xtMargin = PointsToInches(42.48)  // 1.5 cm
		      xrMargin = PointsToInches(42.48)
		      xbMargin = PointsToInches(42.48)
		    End If
		  End If
		  
		  LeftMargin = Max(lMargin, xlMargin)
		  rMargin = Max(rMargin, xrMargin)
		  TopMargin = Max(tMargin, xtMargin)
		  bMargin = Max(bMargin, xbMargin)
		  
		  PrintableWidth = width - LeftMargin - rMargin
		  PrintableHeight = Height - TopMargin - bMargin
		  
		  PageWidth = width
		  PageHeight = height
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
		  If  App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		    Dim i As Integer
		    
		    For i = 0 To Ubound(Log)
		      If Log(i) <> Nil Then
		        log(i).Printed = True
		        If Not Log(i).AddLogEntry Then
		          InputBox.Message App.T.Translate("errors/adding_entry")
		          Return False
		        End If
		      End If
		    Next i
		    
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LogSongsAsCopied() As Boolean
		  // this is similar to LogPrintedSongs, however by saving to PDF we did not print them but created a transformed copy
		  If  App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		    Dim i As Integer
		    
		    For i = 0 To Ubound(Log)
		      If Log(i) <> Nil Then
		        log(i).Copied = True
		        If Not Log(i).AddLogEntry Then
		          InputBox.Message App.T.Translate("errors/adding_entry")
		          Return False
		        End If
		      End If
		    Next i
		    
		    Return True
		  End If
		  
		  Return False
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
		  
		  printerHRes = ps.HorizontalResolution
		  printerVRes = ps.VerticalResolution
		  
		  HRatio = printerHRes / (72 * Scale)
		  VRatio = printerVRes / (72 * Scale)
		  
		  If HRatio <> VRatio Then
		    App.DebugWriter.Write StringUtils.Sprintf("Calculated horizontal scaling and vertical scaling are different, H = %d, V = %d",_
		    HRatio, VRatio), 10
		  End If
		  printerScale = Min(HRatio, VRatio)
		  
		  xOffset = (LeftMargin * printerHRes) + ps.PageLeft
		  yOffset = (TopMargin * printerVRes) + ps.PageTop
		  
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
		  
		  App.DebugWriter.Write StringUtils.Sprintf("Report.Print: copies %d, firstpage %d, lastpage %d, count %d",_
		  g.Copies, g.FirstPage, g.LastPage, Pages.Count)
		  
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
		  
		  If Not LogPrintedSongs Then
		    'TODO Error
		  End If
		  
		  //
		  // For some reason, if this isn't done a second printing pass won't work
		  //
		  g = Nil
		  App.DebugWriter.Write "Report.Print: Printed " + str(PagesPrinted) + " pages"
		  App.DebugWriter.Write "Report.Print: Exit"
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveAsPDF() As Boolean
		  If Pages = Nil Then Return False // Nothing to print
		  If Pages.Count = 0 Then Return False // Ditto
		  
		  If Pages = Nil Or Pages.Count = 0 Then
		    // we do not have pages or thy hade been generated with page dimensions different in more than 3 pt
		    If Not Generate(1, Pages) Or Pages = Nil Or Pages.Count = 0 Then
		      Return False
		    End If
		  End If
		  
		  Dim savedScale As Double = Pages.Scale
		  Pages.Scale = 1.0
		  Dim fPdf As FolderItem = GraphicsX.VectorToPdf(Pages, InchesToPoints(LeftMargin), InchesToPoints(TopMargin), InchesToPoints(PageWidth), InchesToPoints(PageHeight))
		  Pages.Scale = savedScale
		  
		  If fPdf <> Nil Then 
		    If Not LogSongsAsCopied Then
		      // ignore (or should we tell the user?)
		    End If
		    
		    fPdf.Open
		  End If
		  
		  Return fPdf <> Nil
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
		Protected PageHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			Holds the generated pages of the report
		#tag EndNote
		Protected Pages As Group2D
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PageWidth As Double
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
