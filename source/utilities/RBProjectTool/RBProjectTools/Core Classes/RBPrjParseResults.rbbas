#tag Class
Protected Class RBPrjParseResults
	#tag Method, Flags = &h0
		Sub Add(source as RBPrjParseResults)
		  dim s as String
		  for each s in source.errMsgs
		    me.errMsgs.Append s
		  next
		  for each s in source.warnMsgs
		    me.warnMsgs.Append s
		  next
		  if source.hadEncryptedItems then
		    me.hadEncryptedItems = true
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendErrMsg(msg As String, where As Integer = - 1)
		  If where = -1 Then
		    errMsgs.Append(msg)
		  Else
		    errMsgs.Insert(where,msg)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendWarnMsg(msg As String, where As Integer = - 1)
		  If where = -1 Then
		    WarnMsgs.Append(msg)
		  Else
		    WarnMsgs.Insert(where,msg)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(progressUpdate as ProgressAware)
		  me.Constructor()
		  me.progressUpdate = progressUpdate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FetchMessages(ByRef warnings() as String, ByRef errors() as String)
		  warnings = me.warnMsgs
		  errors = me.errMsgs
		  redim me.warnMsgs(-1)
		  redim me.errMsgs(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HadFatalErrors() As Boolean
		  return Ubound(me.errMsgs) >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HadProblems() As Boolean
		  return Ubound(me.errMsgs) >= 0 or Ubound(me.warnMsgs) >= 0 or me.hadEncryptedItems
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		errMsgs() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		hadEncryptedItems As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		progressUpdate As ProgressAware
	#tag EndProperty

	#tag Property, Flags = &h0
		warnMsgs() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="hadEncryptedItems"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
