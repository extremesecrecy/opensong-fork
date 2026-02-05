#tag Class
Protected Class WorkerThreadClass
Inherits Thread
	#tag Event
		Sub Run()
		  Dim myTask As ProcessTask
		  Sleep(1000,True)
		  While GetTask(myTask)
		    Sleep(1000,True)
		    System.DebugLog(CurrentMethodName + " got task Mode = " + Str(myTask.Mode) + " " + myTask.Item.AbsolutePath)  '§
		    TaskStarted(myTask)
		    ExecuteTask(myTask)
		    TaskCompleted(myTask)
		    TaskRemoved(myTask)
		  Wend
		  System.DebugLog(CurrentMethodName + " ending")  '§
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddTask(Task As ProcessTask)
		  If Task = Nil Then Return
		  
		  TaskQueueAccess.Enter
		  TaskQueue.Append(Task)
		  TaskQueueAccess.Leave
		  
		  TaskAdded(Task)
		  
		  If State = Thread.NotRunning Then
		    Run
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  TaskQueueAccess = New CriticalSection
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTask(ByRef Task As ProcessTask) As Boolean
		  Dim result As Boolean = False
		  
		  TaskQueueAccess.Enter
		  If TaskQueue.Ubound >=0 Then
		    Task = TaskQueue(0)
		    TaskQueue.Remove(0)
		    result = True
		  Else
		    Task = Nil
		    result = False
		  End If
		  TaskQueueAccess.Leave
		  Return result
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ExecuteTask(Task As ProcessTask)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskAdded(Task As processtask)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskCompleted(Task As ProcessTask)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskRemoved(Task As ProcessTask)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskStarted(Task As ProcessTask)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected Shared TaskQueue() As ProcessTask
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared TaskQueueAccess As CriticalSection
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
