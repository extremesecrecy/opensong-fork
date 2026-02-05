#tag Class
Private Class GtkWidgetHeightFixHandlerClass
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  #if TargetLinux
		    
		    Declare Function g_signal_add_emission_hook Lib "libgobject-2" (id As UInt32, detail As Int32, hook As Ptr, notify As Ptr) As UInt32
		    Declare Function g_signal_lookup Lib "libgobject-2" (name As CString, type As UInt32) As UInt32
		    Declare Function gtk_widget_get_type Lib "libgtk-3" () As UInt32
		    Declare Function gtk_button_get_type Lib "libgtk-3" () As UInt32
		    
		    WidgetMap=new Dictionary //to store references to mapped controls
		    
		    Dim type As UInt32 = gtk_widget_get_type
		    GtkWidgetMapCallBackID = g_signal_add_emission_hook(g_signal_lookup("map", type), 0, AddressOf GtkWidgetMapCallback, Nil)
		    GtkWidgetUnmapCallBackID = g_signal_add_emission_hook(g_signal_lookup("unmap", type), 0, AddressOf GtkWidgetUnmapCallback, Nil)
		    GtkWidgetStyleCallBackID = g_signal_add_emission_hook(g_signal_lookup("style-updated", type), 0, AddressOf GtkWidgetHeightFixCallback, Nil)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if TargetLinux
		    
		    Declare Sub g_signal_remove_emission_hook Lib "libgobject-2" (id As UInt32, detail As Int32)
		    Declare Function g_signal_lookup Lib "libgobject-2" (name As CString, type As UInt32) As UInt32
		    Declare Function gtk_button_get_type Lib "libgtk-3" () As UInt32
		    
		    Dim type As UInt32 = gtk_button_get_type
		    g_signal_remove_emission_hook(g_signal_lookup("map", type), GtkWidgetMapCallBackID)
		    g_signal_remove_emission_hook(g_signal_lookup("unmap", type), GtkWidgetUnmapCallBackID)
		    g_signal_remove_emission_hook(g_signal_lookup("style-updated", type), GtkWidgetStyleCallBackID)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetContainerControl(c as Control) As ContainerControl
		  if not c isa EmbeddedWindowControl then
		    Return nil
		  else
		    //we store them by handle. If we have a match, skip the introspection.
		    if ContainerRefs<>nil then
		      //What are the odds of a reused handle? Best not to find out...
		      if ContainerRefs.HasKey(c.Handle) then
		        dim wr as WeakRef = weakref(ContainerRefs.Value(c.handle))
		        //first we'll dump any with a dead weakref to avoid possible use of a wrong object
		        if wr<>nil then
		          Return ContainerControl(wr.Value)
		        end if
		      end if
		    end if
		    
		    
		    ContainerRefs=new Dictionary//start fresh
		    dim w As window = c.Window
		    dim cc as ContainerControl
		    if w IsA TranslatableContainer then
		      cc=TranslatableContainer(w).GetContainerControl(c.Handle)
		    end if
		    if cc<>nil then
		      ContainerRefs.Value(cc.Handle)=new weakref(cc)
		    else
		      //loop through the objects and find containers
		      dim myObjectIterator as Runtime.ObjectIterator= Runtime.IterateObjects
		      while myObjectIterator.MoveNext
		        dim curr As object=myObjectIterator.Current
		        if curr isA ContainerControl then
		          //store a weakref in the dictionary only if the control is open
		          if ContainerControl(curr).Handle>0 then ContainerRefs.Value(ContainerControl(curr).Handle)=new weakref(ContainerControl(curr))
		        end if
		      wend
		      
		      //if we find a match and it is valid, we send it back as a ContainerControl
		      if ContainerRefs.HasKey(c.handle) then cc=ContainerControl(weakref(ContainerRefs.Value(c.handle)).Value)
		    end if
		    
		    Return cc
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function getControlForHandle(handletofind As ptr) As RectControl
		  #if TargetLinux
		    If handleToFind = nil Then
		      Return Nil
		    End If
		    
		    for i as integer=0 to WindowCount-1
		      dim r As RectControl=SearchControlByHandle(handletofind,window(i))
		      if r<>nil then Return r
		    next
		    
		    Return Nil
		  #else
		    #Pragma Unused handletofind
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GtkWidgetHeightFixCallback(hint as ptr, count as uint32, params as ptr, data as ptr) As Boolean
		  #if TargetLinux
		    #if DebugBuild
		      App.DebugWriter.Write(CurrentMethodName, 7)
		    #endif
		    
		    declare function g_value_get_object lib "libgtk-3" ( cls as ptr)as ptr
		    declare sub gtk_widget_get_preferred_height lib "libgtk-3" (obj as ptr,byref minh as int32, byref nath as int32 )
		    
		    dim widget as ptr=g_value_get_object(params)
		    
		    if not WidgetMap.HasKey(widget) then Return true
		    
		    dim minh,nath as int32
		    
		    dim r as RectControl=getControlForHandle(widget)
		    if r<>nil then
		      select case r
		      case IsA GroupBox, IsA Listbox, IsA Canvas, IsA PagePanel
		        Return true
		      end select
		      gtk_widget_get_preferred_height(widget,minh,nath)
		      #if DebugBuild
		        dim ch As Integer=r.Height
		        dim h as Integer=max(r.Height,nath)
		        App.DebugWriter.Write(CurrentMethodName + ": " + r.Name + " Height=" + Str(ch) + " minh=" + Str(minh) + " nath=" + Str(nath), 7)
		        if h <> ch then
		          App.DebugWriter.Write(CurrentMethodName + ": " + r.Name + " Height " + Str(ch) + " --> " + Str(h), 7)
		          r.Height=h
		        end if
		      #else
		        r.Height=max(r.Height,nath)
		      #endif
		    end if
		    Return true
		  #Else
		    #Pragma unused data
		    #Pragma unused params
		    #Pragma unused count
		    #Pragma unused hint
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GtkWidgetMapCallback(hint as ptr, count as uint32, params as ptr, data as ptr) As Boolean
		  #If TargetLinux
		    
		    declare function g_value_get_object lib "libgtk-3" ( cls as ptr)as ptr
		    
		    dim widget as ptr=g_value_get_object(params)
		    WidgetMap.Value(widget)=true
		    
		    Return true
		  #Else
		    #Pragma unused data
		    #Pragma unused params
		    #Pragma unused count
		    #Pragma unused hint
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GtkWidgetUnmapCallback(hint as ptr, count as uint32, params as ptr, data as ptr) As Boolean
		  #If TargetLinux
		    
		    declare function g_value_get_object lib "libgtk-3" ( cls as ptr)as ptr
		    
		    dim widget as ptr=g_value_get_object(params)
		    if WidgetMap.HasKey(widget) then WidgetMap.Remove(widget)
		    
		    Return true
		    
		  #Else
		    #Pragma unused data
		    #Pragma unused params
		    #Pragma unused count
		    #Pragma unused hint
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SearchControlByHandle(handle as ptr, win as window) As RectControl
		  for r as integer=0 to win.ControlCount-1
		    dim c as control=win.control(r)
		    if c isa RectControl and ptr(c.Handle)=handle then Return RectControl(c)
		    if c isa EmbeddedWindowControl then 
		      dim cc As ContainerControl=getContainerControl(c)
		      if cc<>nil then
		        dim c1 As RectControl=SearchControlByHandle(handle,window(cc))
		        if c1<>nil then Return c1
		      end if
		    end if
		  next
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared ContainerRefs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GtkWidgetMapCallBackID As uint32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GtkWidgetStyleCallBackID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GtkWidgetUnmapCallBackID As uint32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared WidgetMap As Dictionary
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
