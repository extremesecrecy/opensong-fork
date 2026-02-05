#tag Class
Protected Class SImageCanvas
Inherits SBufferedCanvas
	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  Dim rejectdrop As Boolean
		  
		  If obj.PictureAvailable() Then
		    rejectdrop = False
		  ElseIf obj.FolderItemAvailable() Then
		    rejectdrop = ( Picture.Open(obj.FolderItem()) = Nil )
		  Else
		    rejectdrop = True
		  End If
		  
		  Return rejectdrop
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  If obj.PictureAvailable() Then
		    If SetImageAsPicture( obj.Picture() ) Then
		      Action
		    End If
		  ElseIf obj.FolderItemAvailable() Then
		    If SetImageAsFile( obj.FolderItem() ) Then
		      Action
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim f As FolderItem
		  Dim c As New Clipboard
		  
		  If Not AllowChange Then
		    Return True
		  End If
		  
		  If Enabled Then
		    If IsContextualClick Then
		      If InputBox.Ask(App.T.Translate("questions/clear/@caption")) Then
		        ClearImage()
		        Action
		        Return True
		      Else
		        Repaint
		        Return False
		      End If
		    Else
		      If Keyboard.ShiftKey Then
		        PastePicture c
		      Else
		        f = SelectImageFile
		        'f = ImageChooserWindow.Lookup 'GetOpenFolderItem("image/jpeg")
		        If f <> Nil Then
		          If SetImageAsFile(f) Then
		            Action
		          End If
		        Else
		          Repaint
		        End If
		        Return True
		      End If
		    End If
		  Else
		    Return False
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.AcceptPictureDrop()
		  Me.AcceptFileDrop( ImageFileTypes.All() )
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  If Not Enabled Then
		    g.ForeColor = FillColor
		    g.FillRect 0, 0, Width, Height
		    g.ForeColor = DarkBevelColor
		    g.DrawRect 0, 0, Width, Height
		    Return
		  End If
		  
		  g.ForeColor = bgColor
		  g.FillRect 0, 0, Width, Height
		  
		  If Me.Image <> Nil And Me.Image.GetImage <> Nil Then
		    Me.Image.Draw(g)
		  Else
		    g.ForeColor = DarkBevelColor
		    g.DrawRect 0, 0, Width, Height
		    g.DrawLine 0, 0, Width, Height
		  End If
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function mnu_options() As Boolean Handles mnu_options.Action
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub ClearImage()
		  Me.Image.Clear()
		  Repaint
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Me.Image = New StyleImage()
		  Me.Image.ImageFit = StyleImage.ObjectFit.cover // Default handling of background picture
		  Me.bgColor = FillColor
		  
		  ClearImage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImage() As StyleImage
		  Return Me.Image
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageAsString() As String
		  Return Me.Image.GetImageAsString()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageFilename() As String
		  Return Me.Image.GetImageFilename()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PastePicture(c As Clipboard)
		  if c.PictureAvailable() Then
		    Me.Image.SetImage(c.Picture())
		    Repaint()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SelectImageFile() As FolderItem
		  //
		  // Replace ImageChooserWindow with standard OS dialog
		  //
		  Dim f As FolderItem
		  Dim selectionDialog As New OpenDialog
		  If SelectionFolder = Nil Then
		    If App.CheckDocumentFolders(App.BACKGROUNDS_FOLDER) <> App.NO_FOLDER Then
		      SelectionFolder = App.MainPreferences.GetValueFI(Prefs.kBackgroundsFolder, _
		      App.DocsFolder.Child(App.STR_BACKGROUNDS), True)
		    Else
		      #If TargetWin32
		        SelectionFolder = SpecialFolder.Documents
		      #ElseIf TargetMacOS
		        SelectionFolder = SpecialFolder.Documents
		      #ElseIf TargetLinux
		        SelectionFolder = Nil
		      #EndIf
		    End If
		  End If
		  selectionDialog.InitialDirectory = SelectionFolder
		  Dim filter As String
		  Filter = ImageFileTypes.All
		  selectionDialog.Filter = filter
		  selectionDialog.MultiSelect = False
		  f = selectionDialog.ShowModalWithin(Me.Parent.TrueWindow)
		  If f <> Nil Then
		    SelectionFolder = f.Parent
		  End If
		  Return f
		  
		  Exception ex As RuntimeException
		    App.DebugWriter.Write(CurrentMethodName + ": Got an exception, message is '" + ex.message + "'")
		    Return Nil
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImage(img As StyleImage)
		  If img = Nil Then
		    Me.Image.Clear()
		  Else
		    Me.Image = New StyleImage(img)
		  End If
		  Repaint()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetImageAsFile(f As FolderItem) As Boolean
		  Dim bSuccess As Boolean
		  
		  bSuccess = Me.Image.SetImageFromFile(f)
		  If bSuccess Then
		    Me.Repaint()
		  End If
		  
		  Return bSuccess
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetImageAsPicture(img As Picture) As Boolean
		  Me.Image.SetImage(img)
		  Repaint()
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImageAsString(str As String)
		  If Me.Image.SetImageAsString(str) Then
		    Repaint()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImageScaling(fit As StyleImage.ObjectFit)
		  Image.ImageFit = fit
		  Repaint()
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook


	#tag Property, Flags = &h0
		AllowChange As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		bgColor As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Image As StyleImage
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SelectionFolder As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
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
			Name="AllowFocusRing"
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
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bgColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowChange"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
