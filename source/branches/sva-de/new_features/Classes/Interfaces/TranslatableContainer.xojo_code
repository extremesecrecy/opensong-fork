#tag Interface
Protected Interface TranslatableContainer
	#tag Method, Flags = &h0
		Function GetContainerControl(Handle As Integer) As ContainerControl
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateContainerControl(T As Translator, handle As Integer, tag As String, fonts() As FontFace, doCaptions As Boolean, doFonts As Boolean)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Description
		ContainerControls do not get enumerated with window.Controls().
		Instead an Embedded Window Control gets returned in it's place.
		There is no method or property to get the corresponding ContainerControl.
		Grobals.Container is able to find the Container control belonging 
		to the EmbeddedWindowControl by inspecting all objects of the app.
		This my take up several seconds, though, and thus is inacceptable.
		If window with a ContainerControl implements this interface, the search 
		can be skipped. Instead the window shall check it's containers for the 
		one with the given handle and then call Translator.TranslateContainerControl
		with the ContainerControl instance, passing on the parameters received 
		through the interface methode
	#tag EndNote


End Interface
#tag EndInterface
