#tag Class
Private Class GtkWidgetHeightFixHandlerClass
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  #If TargetLinux
		    
		    Declare Function g_signal_add_emission_hook Lib "libgobject-2" (id As UInt32, detail As Int32, hook As Ptr, notify As Ptr) As UInt32
		    Declare Function g_signal_lookup Lib "libgobject-2" (name As CString, type As UInt32) As UInt32
		    Declare Function gtk_widget_get_type Lib "libgtk-3" () As UInt32
		    Declare Function gtk_button_get_type Lib "libgtk-3" () As UInt32
		    
		    Dim type As UInt32 = gtk_widget_get_type
		    GtkWidgetCallBackID = g_signal_add_emission_hook(g_signal_lookup("map", type), 0, AddressOf GtkWidgetHeightFixCallback, Nil)
		    GtkWidgetStyleCallBackID = g_signal_add_emission_hook(g_signal_lookup("style-updated", type), 0, AddressOf GtkWidgetHeightFixCallback, Nil)
		    
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #If TargetLinux
		    
		    Declare Sub g_signal_remove_emission_hook Lib "libgobject-2" (id As UInt32, detail As Int32)
		    Declare Function g_signal_lookup Lib "libgobject-2" (name As CString, type As UInt32) As UInt32
		    Declare Function gtk_button_get_type Lib "libgtk-3" () As UInt32
		    
		    Dim type As UInt32 = gtk_button_get_type
		    g_signal_remove_emission_hook(g_signal_lookup("map", type), GtkWidgetCallBackID)
		    g_signal_remove_emission_hook(g_signal_lookup("style-updated", type), GtkWidgetStyleCallBackID)
		    
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GtkWidgetHeightFixCallback(hint as ptr, count as uint32, params as ptr, data as ptr) As Boolean
		  #if TargetLinux
		    
		    declare function g_value_get_object lib "libgtk-3" ( cls as ptr)as ptr
		    Declare sub gtk_widget_get_preferred_height Lib "libgtk-3" (obj as ptr,byref minh as int32, byref nath as int32 )
		    Declare Function gtk_widget_get_toplevel Lib "libgtk-3" (obj as ptr) as ptr
		    
		    dim widget as ptr=g_value_get_object(params)
		    dim widgetwindow as ptr=gtk_widget_get_toplevel(widget)
		    
		    for w as integer=0 to WindowCount-1
		      if ptr(window(w).Handle)=widgetwindow then
		        for c as integer=0 to window(w).ControlCount -1
		          
		          dim ctrl as control= window(w).control(c)
		          if ctrl isA RectControl and ptr(RectControl(ctrl).handle)=widget then
		            
		            If ctrl IsA EmbeddedWindowControl Then Continue
		            dim minh,nath as int32
		            gtk_widget_get_preferred_height(widget,minh,nath)
		            dim r As RectControl=RectControl(ctrl)
		            r.Height=max(r.Height,nath)
		            exit
		            
		          end if
		        next
		      end if
		    next
		    
		    Return true
		    
		  #endif
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private GtkWidgetCallBackID As uint32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GtkWidgetStyleCallBackID As Integer
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
