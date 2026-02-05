#tag Class
Private Class GtkEntryFixHandlerClass
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  #if TargetLinux
		    FoundEntries = New Dictionary
		    Declare Function g_signal_add_emission_hook Lib "libgobject-2" (id As UInt32, detail As Int32, hook As Ptr, notify As Ptr) As UInt32
		    Declare Function g_signal_lookup Lib "libgobject-2" (name As CString, type As UInt32) As UInt32
		    Declare Function gtk_widget_get_type Lib "libgtk-3" () As UInt32
		    Declare Function gtk_entry_get_type Lib "libgtk-3" () As UInt32
		    
		    Dim type As UInt32 = gtk_entry_get_type
		    Dim wtype As UInt32 = gtk_widget_get_type
		    GtkEntryCallBackID = g_signal_add_emission_hook(g_signal_lookup("map", type), 0, AddressOf GtkEntryFixCallback, Nil)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if TargetLinux
		    
		    Declare Sub g_signal_remove_emission_hook Lib "libgobject-2" (id As UInt32, detail As Int32)
		    Declare Function g_signal_lookup Lib "libgobject-2" (name As CString, type As UInt32) As UInt32
		    Declare Function gtk_entry_get_type Lib "libgtk-3" () As UInt32
		    
		    Dim type As UInt32 = gtk_entry_get_type
		    g_signal_remove_emission_hook(g_signal_lookup("map", type), GtkEntryCallBackID)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GtkEntryFixCallback(hint as ptr, count as uint32, params as ptr, data as ptr) As Boolean
		  #if TargetLinux
		    
		    declare function g_value_get_object lib "libgtk-3" ( cls as ptr)as ptr
		    declare function g_object_class_find_property lib "libgtk-3" ( cls as ptr, prop as cstring)as ptr
		    Declare Sub g_object_set Lib "libgtk-3" (obj As ptr, name As CString, value As Int32,term As ptr=Nil)
		    
		    dim widget as ptr=g_value_get_object(params)
		    
		    if FoundEntries.HasKey(widget) then Return true
		    
		    dim prop as ptr=g_object_class_find_property(widget.ptr(0),"width-chars")
		    if prop<>nil then
		      g_object_set(widget, "width-chars", 0)
		    end if
		    
		    FoundEntries.Value(widget)=1
		    
		    Return true
		  #else
		    #Pragma unused data
		    #Pragma unused params
		    #Pragma unused count
		    #Pragma unused hint
		  #endif
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Shared FoundEntries As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GtkEntryCallBackID As uint32
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
