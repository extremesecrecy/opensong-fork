#tag Class
Protected Class NDISenderThread
Inherits Thread
	#tag Event
		Sub Run()
		  Dim frameCount As Integer
		  Dim myNDI As NDI = NDI.NDI
		  Dim cs As CriticalSection = myNDI.NDICriticalSection
		  Do 
		    cs.Enter
		    frameCount = NDI.Frames.Count
		    cs.Leave
		    
		    If frameCount > 0 Then
		      Dim img As Picture
		      cs.Enter
		      img = NDI.Frames(0)
		      NDI.Frames.RemoveRowAt(0)
		      cs.Leave
		      LastImage = NDI.PictureToRawBitmapRGBA(img)
		      
		    End If
		    
		    If LastImage <> Nil Then
		      NDI.SendBitmap LastImage
		    End If
		    
		    Sleep NDI.FrameRateMS
		  Loop
		  
		  Catch ex
		    If ex IsA ThreadEndException Then
		      Raise ex
		    End If
		    cs.Leave
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private LastImage As RawBitmap
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
