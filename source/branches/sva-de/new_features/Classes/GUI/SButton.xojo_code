#tag Class
Class SButton
Inherits Canvas
	#tag Event
		Sub GotFocus()
		  If Not HasFocus Then
		    HasFocus = True
		    Refresh(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Const KEY_RETURN = 13
		  Const KEY_ENTER = 3
		  If Key = " " Or Key = Chr(KEY_RETURN) Or Key = Chr(KEY_ENTER) Then
		    Action
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  If HasFocus Then
		    HasFocus = False
		    Refresh(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  If Stuck And Not Toggle Then Return False
		  IsMouseDown = True
		  MenuItem = ""
		  If Enabled Then
		    Refresh(False)
		    // Mac OSX will open the popup on MouseDown,
		    // Windows & Linux open in MouseUp
		    #If TargetMacOS
		      ConstructPopupMenu
		      If Popup <> Nil Then
		        Dim selectedItem As MenuItem
		        Dim relativeLeft As Integer = Me.Left
		        Dim relativeTop As Integer = Me.Top
		        
		        Dim w As Window = Me.Window
		        While w IsA Window
		          If w IsA ContainerControl Then
		            relativeLeft = relativeLeft + w.Left
		            relativeTop = relativeTop + w.Top
		            w = ContainerControl(w).Window
		          Else
		            w = Nil
		          End If
		        Wend
		        relativeLeft = relativeLeft + Me.Window.Left + Me.Width
		        relativeTop = relativeTop + Me.Window.Top
		        selectedItem = Popup.PopUp(relativeLeft, relativeTop)
		        If selectedItem <> Nil Then
		          MenuItem = selectedItem.Text
		          RaiseEvent Action
		        End If
		      End If
		    #Endif
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  If Not IsMouseOver Then
		    IsMouseOver = True
		    Refresh(False)
		  End If
		  RaiseEvent MouseEnter
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  If IsMouseOver Then
		    IsMouseOver = False
		    Refresh(False)
		  End If
		  RaiseEvent MouseExit
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #Pragma Unused X
		  #Pragma Unused Y
		  // The Linux & Windows systems expect to open
		  // a contextual dialog on mouse up, but OS X
		  // does it on mouse down.
		  IsMouseDown = False
		  If X < 0 Or X > Width Or Y < 0 Or Y > Height Then
		    // do nothing
		  Else
		    #if Not TargetMacOS
		      ConstructPopupMenu
		      If Popup <> Nil Then
		        Dim selectedItem As MenuItem
		        selectedItem = Popup.PopUp
		        If selectedItem <> Nil Then
		          MenuItem = selectedItem.Text
		        End If
		      End If
		    #endif
		    RaiseEvent Action
		  End If
		  Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Font = New FontFace
		  If Icon <> Nil Then SetGrayIcon(Icon)
		  If App.MyMainSettings <> Nil Then
		    mNewPaint = SmartML.GetValueB(App.MyMainSettings.DocumentElement, "paint/@new", True, False)
		  Else
		    mNewPaint = False
		  End If
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  If GrayIcon = Nil Then SetGrayIcon(Icon)
		  g.ClearRect 0, 0, g.Width, g.Height
		  Dim i, offset, tri(6) As Integer
		  
		  If NewPaint Then
		    PaintNew(g)
		    Return
		  End If
		  Dim pg As Graphics = g
		  Dim p As Picture = Me.TrueWindow.BitmapForCaching(g.Width, g.Height)
		  g = p.Graphics
		  g.AntiAlias = True
		  g.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  
		  If Len(Font.Name) > 0 Then
		    Font.OntoGraphics g
		  Else
		    g.TextFont = "System"
		  End If
		  
		  If g.TextSize < 0 Then
		    g.TextSize = 0
		  End If
		  
		  If (IsMouseDown And Enabled) Or Stuck Then
		    offset = 0
		    g.ForeColor = DarkBevelColor
		    g.FillRect 0, 0, Width, Height
		  ElseIf (IsMouseOver And Enabled) Or HasFocus Then
		    g.ForeColor = LightBevelColor
		    g.FillRect 0, 0, Width, Height
		  Else
		    ' Looks better on Mac OS X without, but doesn't work on Windows with False clear refreshes
		    'g.ForeColor = FillColor
		    'g.FillRect 0, 0, Width, Height
		  End If
		  
		  If Icon <> Nil Then
		    i = (Height - Icon.Height)/2
		    If Enabled Or GrayIcon Is Nil Then
		      g.DrawPicture Icon, i+offset, i+offset
		    Else
		      g.DrawPicture GrayIcon, i+offset, i+offset
		    End If
		    i = i + Icon.Width
		  End If
		  
		  If LabelAlign = 1 Then
		    i = i + (Width - i)/2 - g.StringWidth(Label)/2
		  Else
		    i = i + (Height - g.TextHeight) / 2 + 1
		  End If
		  
		  If Not Enabled Then
		    If LightBevelColor = FillColor Then
		      g.ForeColor = HSV(LightBevelColor.Hue, LightBevelColor.Saturation, Min(1, LightBevelColor.Value + 0.2))
		    Else
		      g.ForeColor = LightBevelColor
		    End If
		    g.DrawString Label, i+1, Ceil((Height + g.TextAscent) / 2) - 2 + offset+1
		    If DarkBevelColor = FillColor Then
		      g.ForeColor = HSV(DarkBevelColor.Hue, DarkBevelColor.Saturation, Max(0, DarkBevelColor.Value - 0.2))
		    Else
		      g.ForeColor = DarkBevelColor
		    End If
		    g.DrawString Label, i, Ceil((Height + g.TextAscent) / 2) - 2 + offset
		  Else
		    If Font.ForeColor = Color.Black Then
		      g.ForeColor = TextColor
		    Else
		      g.ForeColor = Font.ForeColor
		    End If
		    g.DrawString Label, i, Ceil((Height + g.TextAscent) / 2) - 2 + offset
		  End If
		  
		  If Popup <> Nil Then
		    i = g.TextAscent/4
		    tri(1) = Width - i*3
		    tri(2) = Height/2 - i
		    tri(3) = Width - i*2
		    tri(4) = Height/2
		    tri(5) = Width - i*3
		    tri(6) = Height/2 + i
		    g.FillPolygon tri
		  End If
		  
		  If Outline Then
		    If (IsMouseDown And Enabled) Or Stuck Then
		      g.ForeColor = TextColor
		      g.DrawRect 0, 0, Width, Height
		    Elseif (IsMouseOver And Enabled) Or StickyBevel Or HasFocus Then
		      g.ForeColor = DarkBevelColor
		      g.DrawRect 0, 0, Width, Height
		    End If
		  End If
		  pg.DrawPicture(p, 0, 0)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddPopupRow(str As String)
		  If Popup = Nil Then
		    Popup = New SButtonPopup
		    Popup.Parent = Me
		  End If
		  
		  '++JRC Workaround for RB 2007 issue where UTF-8 strings are
		  'improperly encoded in ContextualMenus (bug #1829317)
		  'Popup.AddRow str
		  Popup.Append New MenuItem(str)
		  Popup.GoodStrings.Append str
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPopupSeparator()
		  If Popup = Nil Then
		    Popup = New SButtonPopup
		    Popup.Parent = Me
		  End If
		  
		  Popup.Append New MenuItem(popup.TextSeparator)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeletePopup()
		  Popup = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PaintNew(g As Graphics)
		  '
		  ' Significant changes made here to give the application a completely different look.
		  '
		  ' EMP, sometime in early 2005
		  '
		  Dim pg As Graphics = g
		  Dim p As Picture = Me.TrueWindow.BitmapForCaching(g.Width, g.Height)
		  g = p.Graphics
		  g.AntiAlias = True
		  g.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  Dim i, offset, tri(6) As Integer
		  Const ShadowWidth = 2
		  Dim ShadowOffset As Integer
		  
		  ShadowOffset = Ceil(ShadowWidth / 2)
		  
		  If Len(Font.Name) > 0 Then
		    Font.OntoGraphics g
		  Else
		    g.TextFont = "System"
		  End If
		  
		  If g.TextSize < 0 Then
		    g.TextSize = 0
		  End If
		  
		  If (Enabled And IsMouseDown) Or Stuck Then
		    offset = 0
		    // Fill the background
		    g.ForeColor = DarkTingeColor
		    g.FillRect 0, 0, Width, Height
		    
		    If Outline Then
		      // Left and Top Bevels
		      g.ForeColor = DarkBevelColor
		      g.PenWidth = ShadowWidth
		      g.DrawLine 0, 0, 0, Height - ShadowWidth
		      g.PenWidth = 1
		      g.PenHeight = ShadowWidth
		      g.drawline 0, 0, Width - ShadowWidth, 0
		      g.PenHeight = 1
		      
		      // Right and Bottom bevels
		      g.ForeColor = LightBevelColor
		      g.PenWidth = ShadowWidth
		      g.DrawLine 0, height - ShadowOffset-1, Width, height  - ShadowOffset-1
		      g.PenWidth = 1
		      g.PenHeight = ShadowWidth
		      g.DrawLine Width - ShadowOffset -1, 0, Width - ShadowOffset-1, Height
		      g.PenHeight = 1
		      
		      // Outline
		      g.ForeColor = FrameColor
		      g.PenWidth = 1
		      g.PenHeight = 1
		      g.DrawRect 0, 0, Width, Height
		    End If
		    // Just for grins, let's make the text different than the other buttons
		    g.Bold = Not g.Bold
		    If g.TextSize <> 0 Then g.TextSize = g.TextSize + 1
		    
		  ElseIf (Enabled And IsMouseOver) Or HasFocus Then
		    If Outline Then 
		      // Fill the background
		      g.ForeColor = LightTingeColor
		      g.FillRect 0, 0, Width, Height
		      
		      // Left and Top Bevels
		      g.ForeColor = DarkBevelColor
		      g.PenWidth = ShadowWidth
		      g.DrawLine 0, 0, 0, Height
		      g.PenWidth = 1
		      g.PenHeight = ShadowWidth
		      g.drawline 0, 0, Width, 0
		      g.PenHeight = 1
		      
		      // Right and Bottom bevels
		      g.ForeColor = LightBevelColor
		      g.PenWidth = ShadowWidth
		      g.PenHeight = ShadowWidth
		      g.DrawLine 0, height - ShadowOffset - 1, Width, height  - ShadowOffset - 1
		      g.DrawLine Width - ShadowOffset - 1, 0, Width - ShadowOffset -1, Height
		      
		      // Outline
		      g.ForeColor = FrameColor
		      g.PenWidth = 1
		      g.PenHeight = 1
		      g.DrawRect 0, 0, Width, Height
		    End If
		    g.Bold = Not g.Bold
		    If g.TextSize <> 0 Then g.TextSize = g.TextSize + 1
		    
		  Else
		    // This code path is for unselected controls that the mouse is not over.  Draw like a
		    // button ready to be pressed (appears to be poking out), but don't highlight it inside
		    // the bevels like a MouseOver
		    
		    // Fill the background similar to the desktop
		    g.ForeColor = FillColor
		    g.FillRect 0, 0, Width, Height
		    
		    If Outline Then
		      // Left and Top Bevels
		      g.ForeColor = LightBevelColor
		      g.PenWidth = ShadowWidth
		      g.DrawLine 0, 0, 0, Height
		      g.PenWidth = 1
		      g.PenHeight = ShadowWidth
		      g.drawline 0, 0, Width, 0
		      g.PenHeight = 1
		      
		      // Right and Bottom bevels
		      g.ForeColor = DarkBevelColor
		      g.PenWidth = ShadowWidth
		      g.DrawLine 0, height - ShadowOffset - 1, Width, height  - ShadowOffset - 1
		      g.PenWidth = 1
		      g.PenHeight = ShadowWidth
		      g.DrawLine Width - ShadowOffset - 1, ShadowOffset, Width - ShadowOffset - 1, Height - ShadowOffset -1
		      g.PenHeight = 1
		      
		      // Outline
		      g.ForeColor = FrameColor
		      g.PenWidth = 1
		      g.PenHeight = 1
		      g.DrawRect 0, 0, Width, Height
		    End If
		  End If
		  
		  If Icon <> Nil Then
		    i = (Height - Icon.Height)/2
		    g.DrawPicture Icon, i+offset, i+offset
		    i = i + Icon.Width
		  End If
		  
		  If LabelAlign = 1 Then
		    i = i + (Width - i)/2 - g.StringWidth(Label)/2
		  Else
		    i = i + (Height - g.TextHeight) / 2 + 1
		  End If
		  
		  If Not Enabled Then
		    // Make the button look like it's pressed, but we'll emboss the text to
		    // indicate it's disabled
		    If Outline Then
		      g.ForeColor = FillColor
		      g.fillrect 0, 0, width, height
		      
		      // Left and Top Bevels
		      g.ForeColor = DarkBevelColor
		      g.PenWidth = ShadowOffset
		      g.PenHeight  = ShadowOffset
		      g.DrawRect 0, 0, Width, height
		      
		      // Right and Bottom bevels
		      g.ForeColor = LightBevelColor
		      g.DrawLine 0, height - ShadowOffset, Width, height  - ShadowOffset
		      g.DrawLine Width - ShadowOffset, 0, Width - ShadowOffset, Height
		      
		      // Outline
		      g.ForeColor = FrameColor
		      g.PenWidth = 1
		      g.PenHeight = 1
		      g.DrawRect 0, 0, Width, Height
		    End If
		    
		    // Now, draw the embossed text
		    If LightBevelColor = FillColor Then
		      g.ForeColor = HSV(LightBevelColor.Hue, LightBevelColor.Saturation, Min(1, LightBevelColor.Value + 0.2))
		    Else
		      g.ForeColor = LightBevelColor
		    End If
		    g.DrawString Label, i+1, Ceil((Height + g.TextAscent) / 2) - 2 + offset+1
		    If DarkBevelColor = FillColor Then
		      g.ForeColor = HSV(DarkBevelColor.Hue, DarkBevelColor.Saturation, Max(0, DarkBevelColor.Value - 0.2))
		    Else
		      g.ForeColor = DarkBevelColor
		    End If
		    g.DrawString Label, i, Ceil((Height + g.TextAscent) / 2) - 2 + offset
		    If GrayIcon = Nil And Icon <> Nil Then
		      SetGrayIcon(Icon)
		    End If
		    If GrayIcon <> Nil Then
		      i = (Height - GrayIcon.Height)/2
		      g.DrawPicture GrayIcon.BestRepresentation(GrayIcon.Width, GrayIcon.Height, g.ScaleX), i+offset, i+offset
		      i = i + GrayIcon.Width
		    End If
		  Else
		    If Font.ForeColor = Color.Black Then
		      g.ForeColor = TextColor
		    Else
		      g.ForeColor = Font.ForeColor
		    End If
		    g.DrawString Label, i, Ceil((Height + g.TextAscent) / 2) - 2 + offset
		  End If
		  
		  If Popup <> Nil Then
		    i = (g.TextAscent/4) * g.ScaleX
		    tri(1) = (Width - i*1.5)
		    tri(2) = (Height/2 - i)
		    tri(3) = (Width - (i/2))
		    tri(4) = (Height/2)
		    tri(5) = (Width - i*1.5)
		    tri(6) = (Height/2 + i)
		    g.FillPolygon tri
		  End If
		  
		  pg.DrawPicture(p, 0, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformAction()
		  RaiseEvent Action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFont(font As FontFace)
		  Me.Font = font
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGrayIcon(pic As Picture, mask As Picture = Nil)
		  Dim surf As RGBSurface
		  Dim graysurf As RGBSurface
		  Dim picarray() As Picture
		  Dim pi As Picture
		  Dim graypic As Picture
		  
		  If pic = Nil Then Return
		  
		  If pic.ImageCount > 1 Then
		    For i As Integer = 0 To pic.ImageCount - 1
		      pi = pic.IndexedImage(i)
		      graypic = New Picture(pi.Width, pi.Height)
		      graypic.HorizontalResolution = pi.HorizontalResolution
		      graypic.VerticalResolution = pi.VerticalResolution
		      graypic.Graphics.DrawingColor = Color.Black  // fix for blank images in GrayIcon (Linux Xojo 2024r1.1)
		      graypic.Graphics.FillRectangle(0, 0, graypic.Width, graypic.Height)
		      surf = pi.RGBSurface
		      graysurf = graypic.RGBSurface
		      
		      For y As Integer = 0 To pi.Height
		        For x As Integer = 0 To pi.Width
		          //++
		          // Xojo Bug 33328 against 2014r1.1
		          //
		          // Steps: Create a Color by calling HSV(0,0,0,100) And draw into a graphics Object. 
		          // 
		          // Expected Result:
		          // Draw With partial opacity
		          // 
		          // Actual Result: 
		          // Draws With full opacity.
		          // 
		          // Workarounds:
		          // Set saturation To a non-zero value (ie 0.000001)
		          //--
		          //++
		          // Notes...still messes up on Windows; use CopyMask / ApplyMask instead
		          //--
		          graysurf.Pixel(x, y) = HSV(surf.Pixel(x, y).Hue, 0.00001, surf.Pixel(x, y).Value)
		        Next
		      Next
		      graypic.applymask(pi.CopyMask)
		      #If TargetMacOS
		        picarray.insert 0, graypic
		      #Else
		        picarray.append graypic
		      #EndIf
		    Next
		    GrayIcon = New Picture(picarray(0).Width, picarray(0).Height, picarray)
		  Else //Single image; probably old-style pic + mask
		    GrayIcon = New Picture(pic.Width, pic.Height)
		    GrayIcon = pic.CopyColorChannels
		    surf = GrayIcon.RGBSurface
		    For y As Integer = 0 To GrayIcon.Height
		      For x As Integer = 0 To GrayIcon.Width
		        If surf.Pixel(x, y).Alpha < 128 Then
		          surf.Pixel(x, y) = HSV(surf.Pixel(x, y).Hue, 0.00000000001, surf.Pixel(x, y).Value, surf.Pixel(x, y).Alpha)
		        End If
		      Next
		    Next
		    If Mask <> Nil Then
		      GrayIcon.ApplyMask(mask)
		    Else
		      GrayIcon.ApplyMask(pic.CopyMask)
		    End If
		  End If // End separate pic + mask
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIcon(pic As Picture, mask As Picture = Nil)
		  If pic = Nil Then
		    Icon = Nil
		    Return
		  End If
		  
		  Select Case pic.Type
		  Case Picture.Types.Image
		    Icon = pic
		    
		  Case Picture.Types.Vector
		    Dim ufe As UnsupportedFormatException
		    ufe.Message = "Vector picture not supported as icon for " + Self.Name
		    Raise ufe
		    
		  Case Picture.Types.ImmutableBitmap
		    If mask <> Nil Then
		      Dim p As New Picture(pic.Width, pic.Height, 32)
		      p.HorizontalResolution = pic.HorizontalResolution
		      p.VerticalResolution = pic.VerticalResolution
		      p.Graphics.DrawPicture(pic, 0, 0)
		      p.ApplyMask mask
		      Icon = p
		    Else
		      Icon = pic
		    End If
		  End Select
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructPopupMenu()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseEnter()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseExit()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h1
		Protected Font As FontFace
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			'EMP, added to support PaintNew method
		#tag EndNote
		Protected GrayIcon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		HasFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Icon As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsMouseOver As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLabel
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLabel = value
			  Invalidate
			End Set
		#tag EndSetter
		Label As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		LabelAlign As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MenuItem As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLabel As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNewPaint As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStuck As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mToggle As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mNewPaint
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNewPaint = value
			  Invalidate
			End Set
		#tag EndSetter
		NewPaint As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Outline As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Popup As SButtonPopup
	#tag EndProperty

	#tag Property, Flags = &h0
		StickyBevel As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mStuck
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <> mStuck Then
			    mStuck = value
			    Invalidate
			  End If
			End Set
		#tag EndSetter
		Stuck As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mToggle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mToggle = value
			  Invalidate
			End Set
		#tag EndSetter
		Toggle As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Label"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LabelAlign"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Center"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasFocus"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuItem"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Outline"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StickyBevel"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Stuck"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Toggle"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NewPaint"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
