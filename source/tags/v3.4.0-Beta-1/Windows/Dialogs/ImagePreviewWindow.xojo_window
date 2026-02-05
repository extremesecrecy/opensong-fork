#tag Window
Begin Window ImagePreviewWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   False
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   ""
   Visible         =   False
   Width           =   600
   Begin Canvas img_preview
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub KeyUp(Key As String)
		  If Key = Chr(27) Then
		    Self.Close
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Dim p As New Xojo.Point(x, y)
		  If Self.Bounds.Contains(p) Then
		    Self.Close
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'img_preview.AllowChange = False
		  'img_preview.bgColor = RGB(127, 127, 127)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  img_preview.Invalidate
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  img_preview.Invalidate
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ShowImage(img As StyleImage, windowTitle As String = "")
		  Dim tmpImage As New StyleImage(img)
		  tmpImage.ImageFit = StyleImage.ObjectFit.contain
		  'img_preview.SetImage(tmpImage)
		  Self.Title = windowTitle
		  Self.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowImageAt(img As StyleImage, x As Integer, y As Integer, windowTitle As String = "")
		  
		  Const kWindowDivisor As Integer = 3
		  'Dim tempImage As New StyleImage(img)
		  'tempImage.ImageFit = StyleImage.ObjectFit.contain
		  'img_preview.SetImage(tempImage)
		  
		  Dim position As New REALbasic.Point(x, y)
		  Dim screen As Integer
		  Dim screenBounds As REALbasic.Rect
		  
		  previewImage = Self.BitmapForCaching(img.GetImage.Width, img.GetImage.Height)
		  previewImage.HorizontalResolution = img.GetImage.HorizontalResolution
		  previewImage.VerticalResolution = img.GetImage.VerticalResolution
		  previewImage.Graphics.DrawPicture img.GetImage, 0, 0, previewImage.Graphics.Width, previewImage.Graphics.Height, 0, 0, img.GetImage.Width, img.GetImage.Height
		  
		  For screen = 0 To OSScreenCount - 1
		    screenBounds = OSScreen(screen).Bounds
		    If screenBounds.Contains(position) Then
		      Exit For
		    End If
		  Next
		  
		  Dim windowBounds As REALbasic.Rect = Self.Bounds
		  Dim ratio As Double = img.GetImage.Width / img.GetImage.Height
		  If ratio >= 1.0 Then
		    windowBounds.Height = Min(screenBounds.Height / kWindowDivisor, img.GetImage.Height)
		    windowBounds.Width = windowBounds.Height * ratio
		  Else
		    windowBounds.Height = Min(screenBounds.Height / kWindowDivisor, img.GetImage.Height)
		    windowBounds.Width = windowBounds.Height / ratio
		  End If
		  
		  // Adjust the height so the content area is the calculated height, not the entire window
		  windowBounds.Center = New REALbasic.Point(x, y)
		  Self.Bounds = windowBounds
		  Self.Height = windowBounds.Height
		  windowBounds = Self.Bounds
		  
		  windowBounds.Top = Max(y - (windowBounds.Height / 2), 0)
		  windowBounds.Left = Max(x - (windowBounds.Width / 2), 0)
		  
		  If windowBounds.Bottom > (OSScreen(screen).AvailableTop + OSScreen(screen).AvailableHeight) Then
		    windowBounds.Top = Max(OSScreen(screen).AvailableTop, _
		    OSScreen(screen).AvailableTop + OSScreen(screen).AvailableHeight - windowBounds.Height)'MISSING OPENING PARENTHESIS
		  End If
		  
		  If windowBounds.Right > (OSScreen(screen).AvailableLeft + OSScreen(screen).AvailableWidth) Then
		    windowBounds.Left = Max(OSScreen(screen).AvailableLeft, _
		    OSScreen(screen).AvailableLeft + OSScreen(screen).AvailableWidth - windowBounds.Width)'MISSING OPENING PARENTHESIS
		  End If
		  
		  Self.Bounds = windowBounds
		  
		  Self.Title = windowTitle
		  Self.Show
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private previewImage As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events img_preview
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim ratio As Double 
		  Dim previewWidth As Double
		  Dim previewHeight As Double
		  Dim destWidth As Double
		  Dim destHeight As Double
		  Dim heightRatio As Double
		  Dim widthRatio As Double
		  Dim imagePositionW As Double
		  Dim imagePositionH As Double
		  Dim destLeft As Double
		  Dim destTop As Double
		  
		  widthRatio = g.Width / previewImage.Width
		  heightRatio = g.Height / previewImage.Height
		  ratio = Min(widthRatio, heightRatio)
		  destWidth = previewImage.Width * ratio
		  destHeight = previewImage.Height * ratio
		  destLeft = (g.Width - destWidth) / 2
		  destTop = (g.Height - destHeight) / 2
		  g.ForeColor = &c808080
		  g.FillRect 0, 0, g.Width, g.Height
		  g.DrawPicture previewImage, destLeft, destTop, destWidth, destHeight, 0, 0, previewImage.Width, previewImage.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
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
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
