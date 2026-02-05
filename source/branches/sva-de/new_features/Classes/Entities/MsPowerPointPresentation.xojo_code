#tag Class
Protected Class MsPowerPointPresentation
Implements iPresentation
	#tag Method, Flags = &h0
		Function AnimationCount(slideIndex As Integer) As Integer
		  // Part of the iPresentation interface.
		  
		  'Using the PowerPoint API it is not possible to get the number of animations for a specific slide, only for the currently showing slide.
		  'The Office 2007 API has added a few new functions to the SlideShowView object to get the number of clicks.
		  
		  Dim result As Integer = -1
		  
		  If IsShowing() Then
		    If slideIndex = CurrentSlide() Then
		      #pragma BreakOnExceptions Off
		      Try
		        result = m_oPpt.SlideShowWindow.View.GetClickCount()
		      Catch rtex
		        'make sure we do not crash on a PowerPoint prior to Office 2007
		        App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		      End Try
		      #pragma BreakOnExceptions Default
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanControl() As Boolean
		  // Part of the iPresentation interface.
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanPreview() As Boolean
		  // Part of the iPresentation interface.
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(presentation As PowerPointPresentation)
		  // Part of the iPresentation interface.
		  m_oPpt = presentation
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentAnimation() As Integer
		  // Part of the iPresentation interface.
		  
		  'This will only work on Office 2007 or later.
		  
		  Dim result As Integer = -1
		  
		  If IsShowing() Then
		    #pragma BreakOnExceptions Off
		    Try
		      result = m_oPpt.SlideShowWindow.View.GetClickIndex()
		    Catch rtex
		      'make sure we do not crash on a PowerPoint prior to Office 2007
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentSlide() As Integer
		  // Part of the iPresentation interface.
		  
		  Dim result As Integer = 0
		  
		  If IsShowing() Then
		    #pragma BreakOnExceptions Off
		    Try
		      result = m_oPpt.SlideShowWindow.View.Slide.SlideIndex
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If IsShowing() Then
		    Call EndShow()
		  End If
		  
		  Call PresentationFactory.UnregisterPresentation( self )
		  
		  If Not IsNull(m_oPpt) Then
		    #pragma BreakOnExceptions Off
		    Try
		      m_oPpt.Saved = True
		      m_oPpt.Close()
		    Catch rtex
		      'The actual PowerPoint object must have been destroyed without our knowing ...
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndShow() As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  
		  If IsShowing() Then
		    #pragma BreakOnExceptions Off
		    Try
		      Dim currFilename As String
		      currFilename = Filename()
		      m_oPpt.SlideShowWindow.View.Exit_()
		      If m_oPpt <> Nil Or Filename() <> currFilename Then
		        currFilename = Filename()
		        Call UnregisterPresentation(self)
		      End If
		      result = True
		    Catch rtex
		      'so PowerPoint decided to end the show before we did
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Filename() As String
		  // Part of the iPresentation interface.
		  
		  Dim result As String
		  
		  If Not IsNull(m_oPpt) Then
		    #pragma BreakOnExceptions Off
		    Try
		      result = m_oPpt.FullName
		    Catch rtex
		      'this sometimes fails for no reason...
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FirstVisibleSlide() As Integer
		  Dim result As Integer = 0
		  
		  If IsShowing() Then
		    For i As Integer = 1 to SlideCount()
		      If Not IsHidden(i) Then
		        result = i
		        Exit
		      End If
		    Next
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GotoAnimation(slideIndex As Integer, animationIndex As Integer) As Boolean
		  // Part of the iPresentation interface.
		  
		  // Part of the iPresentation interface.
		  
		  'Using the PowerPoint API it is not possible to get the number of animations for a specific slide, only for the currently showing slide.
		  'The Office 2007 API has added a few new functions to the SlideShowView object to get the number of clicks.
		  
		  Dim result As Boolean = False
		  
		  If IsShowing() Then
		    
		    Dim slideChangeSuccess As Boolean = False
		    If slideIndex <> CurrentSlide() Then
		      slideChangeSuccess = GotoSlide( slideIndex )
		    Else
		      slideChangeSuccess = True
		    End If
		    
		    #pragma BreakOnExceptions Off
		    Try
		      // GotoClick does not animate. So jump if going backwards, but use Next to advance
		      Dim currAnimationIndex As Integer = m_oPpt.SlideShowWindow.View.GetClickIndex()
		      Dim lastAnimationIndex As Integer
		      If slideChangeSuccess Then
		        If animationIndex = currAnimationIndex Then
		          Return True
		        End If
		        Dim animationCount As Integer = m_oPpt.SlideShowWindow.View.GetClickCount()
		        If animationIndex > animationCount Then
		          Return False
		        End If
		        If animationIndex > currAnimationIndex Then
		          Do
		            lastAnimationIndex = currAnimationIndex
		            result = m_oPpt.SlideShowWindow.View.Invoke( "Next" )
		            currAnimationIndex = m_oPpt.SlideShowWindow.View.GetClickIndex()
		          Loop Until result = False Or currAnimationIndex >= animationIndex Or currAnimationIndex <= lastAnimationIndex
		          Return currAnimationIndex = animationIndex
		        Else
		          Dim goToResult As Integer = -33
		          goToResult = m_oPpt.SlideShowWindow.View.GotoClick( animationIndex )
		          result = True
		        End If
		      End If
		    Catch rtex
		      'make sure we do not crash on a PowerPoint prior to Office 2007
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GotoSlide(slideIndex As Integer) As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  
		  If IsShowing() Then
		    #pragma BreakOnExceptions Off
		    Try
		      If slideIndex <= m_oPpt.Slides.Count And slideIndex > 0 Then
		        
		        m_oPpt.SlideShowWindow.View.GotoSlide( slideIndex )
		        result = True
		      End If
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HostName() As String
		  // Part of the iPresentation interface.
		  
		  Return "Microsoft PowerPoint"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsHidden(slideIndex As Integer) As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  
		  If Not IsNull(m_oPpt) Then
		    #pragma BreakOnExceptions Off
		    Try
		      If slideIndex <= m_oPpt.Slides.Count And slideIndex > 0 Then
		        result = m_oPpt.Slides.Item(slideIndex).SlideShowTransition.Hidden()
		      End If
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsShowing() As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  
		  If Not IsNull(m_oPpt) Then
		    #pragma BreakOnExceptions Off
		    Try
		      If Not IsNull(m_oPpt.SlideShowWindow) Then
		        result = Not IsNull( m_oPpt.SlideShowWindow.View )
		      End If
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LastVisibleSlide() As Integer
		  Dim result As Integer = 0
		  
		  If IsShowing() Then
		    For i As Integer = SlideCount() downto 1
		      If Not IsHidden(i) Then
		        result = i
		        Exit
		      End If
		    Next
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextSlide() As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  
		  If IsShowing() Then
		    result = GotoSlide( CurrentSlide() + 1 )
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Notify(iEvent As PresentationEvent)
		  // Part of the iPresentation interface.
		  
		  If Not IsNull(PresentWindow.XCurrentSlide) Then
		    If SetML.IsExternal(PresentWindow.XCurrentSlide) Then
		      
		      Dim presAppl As string = SmartML.GetValue(PresentWindow.XCurrentSlide.Parent.Parent, "@application", False)
		      Dim presHost As string = SmartML.GetValue(PresentWindow.XCurrentSlide.Parent.Parent, "@host", False)
		      Dim presFilename As String
		      Dim presFile As FolderItem
		      
		      If presAppl = "presentation" And presHost = "ppt" Then
		        presFilename = SmartML.GetValue(PresentWindow.XCurrentSlide.Parent.Parent, "@_localfilename", False)
		        If presFilename = "" Then
		          presFile = SmartML.GetValueFI(PresentWindow.XCurrentSlide.Parent.Parent, "@filename")
		          If presFile = Nil Then
		            presFilename = SmartML.GetValue(PresentWindow.XCurrentSlide.Parent.Parent, "@filename", False)
		          End If
		        End If
		        If presfile = Nil Then presfile = PathToFolderItem(presFilename)
		        If Not IsNull(presFile) Then
		          
		          If Filename() = presFile.NativePath() Then
		            
		            If iEvent = PresentationFactory.PresentationEvent.NextSlide Then
		              
		              If IsShowing() Then
		                If Not PresentWindow.IsSlidechangeExternal() Then
		                  Dim currSlideIndex As Integer = SmartML.GetValueN(PresentWindow.XCurrentSlide, "@id", False)
		                  
		                  If currSlideIndex < CurrentSlide() Then
		                    // The presentation advanced to the next slide
		                    Call PresentWindow.KeyDownX(Chr(ASC_KEY_DOWN))
		                    
		                  ElseIf currSlideIndex > CurrentSlide() Then
		                    // The presentation jumped back
		                    // If the current slide is the last and the new slide is the first, the presentation has looped
		                    If IsNull(PresentWindow.XCurrentSlide.NextSibling) And _
		                      CurrentSlide() = FirstVisibleSlide() Then
		                      Call PresentWindow.KeyDownX(Chr(ASC_KEY_BACKSPACE))
		                    Else
		                      Call PresentWindow.KeyDownX(Chr(ASC_KEY_UP))
		                    End If
		                  End If
		                End If
		              End If
		              
		            ElseIf iEvent = PresentationFactory.PresentationEvent.EndPresentation Then
		              
		              If Not PresentWindow.IsClosingExternal() Then
		                Call PresentWindow.KeyDownX(Chr(ASC_KEY_RIGHT))
		              End If
		              
		            End If
		            
		          End If
		        End If
		      End If
		      
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PresenterNotes(slideIndex As Integer) As String
		  // Part of the iPresentation interface.
		  
		  Dim result As String
		  
		  If Not IsNull(m_oPpt) Then
		    #pragma BreakOnExceptions Off
		    Try
		      If slideIndex <= m_oPpt.Slides.Count And slideIndex > 0 Then
		        // This code is adapted from code by Eric White found here
		        // https://stackoverflow.com/a/2955232
		        // which in turn originates from
		        // https://learn.microsoft.com/en-us/archive/blogs/ericwhite/removing-speaker-notes-from-a-set-of-powerpoint-presentations
		        // and again from
		        // https://devblogs.microsoft.com/scripting/hey-scripting-guy-how-can-i-remove-the-speaker-notes-from-a-powerpoint-presentation/
		        // 
		        // I was a bit worried about the fixed Item(2). I found other code using the constant 2 as the type
		        // of the shape containing the notes text, but doing things that way did not prove to be successfull
		        // https://www.rdpslides.com/pptfaq/FAQ00937_Importing_notes_text_from_a_text_file.htm
		        
		        Dim oShapes As PowerPointShapes = m_oPpt.Slides.Item(slideIndex).NotesPage.Shapes
		        If oShapes.Count >= 2 Then
		          result = oShapes.Item(2).TextFrame.TextRange.Text
		        End If
		      End If
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreviewSlide(slideIndex As Integer, width As Integer, height As Integer) As Picture
		  // Part of the iPresentation interface.
		  
		  Dim result As Picture = Nil
		  Dim r As New Random
		  Dim f As FolderItem
		  
		  If Not IsNull(m_oPpt) Then
		    #pragma BreakOnExceptions Off
		    Try
		      If slideIndex <= m_oPpt.Slides.Count And slideIndex > 0 Then
		        
		        f = SpecialFolder.Temporary.Child(Str(r.InRange(100000, 999999)))
		        If f <> Nil Then
		          'm_oPpt.Slides.Item(slideIndex).Export( f.NativePath(), "JPG", width, height )
		          #pragma Unused width
		          #Pragma Unused height
		          m_oPpt.Slides.Item(slideIndex).Export( f.NativePath(), "JPG" )  // ignore given dimensions so PowerPoint keeps the slide's designed aspect
		          
		          result = Picture.Open(f)
		          f.Delete
		        End If
		      End If
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreviousSlide() As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  
		  If IsShowing() Then
		    result = GotoSlide( CurrentSlide() - 1 )
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlideCount() As Integer
		  // Part of the iPresentation interface.
		  
		  Dim result As Integer = 0
		  
		  If Not IsNull( m_oPpt ) Then
		    #pragma BreakOnExceptions Off
		    Try
		      result = m_oPpt.Slides.Count
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlideName(slideIndex As Integer) As String
		  // Part of the iPresentation interface.
		  
		  Dim result As String
		  
		  If Not IsNull(m_oPpt) Then
		    #pragma BreakOnExceptions Off
		    Try
		      If slideIndex <= m_oPpt.Slides.Count And slideIndex > 0 Then
		        result = m_oPpt.Slides.Item(slideIndex).Name
		      End If
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartShow(loopShow As Boolean = False, startAt As Integer = - 1, endAt As Integer = - 1) As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  Dim ppWnd As PowerPointSlideShowWindow
		  Dim pixelsToPoints As Double = 72/96
		  Dim presentScreen As Integer
		  
		  If Not IsShowing() Then
		    If Not IsNull( m_oPpt ) Then
		      #pragma BreakOnExceptions Off
		      Try
		        m_oPpt.SlideShowSettings.LoopUntilStopped = loopShow
		        
		        If startAt > 0 And startAt <= m_oPpt.Slides.Count And startAt <= endAt Then
		          m_oPpt.SlideShowSettings.StartingSlide = startAt
		        End If
		        If endAt > 0 And endAt <= m_oPpt.Slides.Count And endAt >= startAt Then
		          m_oPpt.SlideShowSettings.EndingSlide = endAt
		        End If
		        
		        presentScreen = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "monitors/@present") - 1
		        If presentScreen < 0 Or presentScreen > ScreenCount - 1 Then presentScreen = 0
		        
		        ppWnd = m_oPpt.SlideShowSettings.Run
		        ppWnd.Activate()
		        
		        If Not IsNull( ppWnd ) Then
		          ppWnd.Left = OSScreen(presentScreen).Left * pixelsToPoints
		          ppWnd.Top = OSScreen(presentScreen).Top * pixelsToPoints
		          ppWnd.Width = OSScreen(presentScreen).Width * pixelsToPoints
		          ppWnd.Height = OSScreen(presentScreen).Height * pixelsToPoints
		          
		          return Result
		        End If
		      Catch rtex
		        App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		      End Try
		      #pragma BreakOnExceptions Default
		    End If
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StepBackward() As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  
		  If IsShowing() Then
		    #pragma BreakOnExceptions Off
		    Try
		      
		      m_oPpt.SlideShowWindow.View.Previous
		      result = True
		      
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StepForward() As Boolean
		  // Part of the iPresentation interface.
		  
		  Dim result As Boolean = False
		  
		  If IsShowing() Then
		    #pragma BreakOnExceptions Off
		    Try
		      
		      m_oPpt.SlideShowWindow.View.Invoke( "Next" )
		      result = True
		      
		    Catch rtex
		      App.DebugWriter.Write(CurrentMethodName + ": ignored exception " + RuntimeException(rtex).Message, 4)
		    End Try
		    #pragma BreakOnExceptions Default
		  End If
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Note, Name = On PowerPoint automation
		This object takes care of the interfacing to Microsoft PowerPoint.
		Usage requires a full installation of Microsoft PowerPoint.
		
		When using the AnimationCount, make sure to only get the animationCount for the currenly showing slide, 
		otherwise the functions allways returns -1. If run with PowerPoint < 2007, this function will allways return -1 (unknown)
		
		For more information on the available automation objects see http://msdn.microsoft.com/en-us/library/aa271589(office.11).aspx
	#tag EndNote


	#tag Property, Flags = &h21
		Private m_oPpt As PowerPointPresentation = Nil
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
	#tag EndViewBehavior
End Class
#tag EndClass
