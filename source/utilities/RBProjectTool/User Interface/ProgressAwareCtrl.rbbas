#tag Class
Protected Class ProgressAwareCtrl
Implements ProgressAware
	#tag Method, Flags = &h0
		Function ProgressUpdate(current as Integer, maximum as Integer) As Boolean
		  return ProgressUpdate_ (current, maximum)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ProgressUpdate_(current as Integer, maximum as Integer) As Boolean
	#tag EndHook


End Class
#tag EndClass
