#tag Window
Begin Window ProgressWin
   BackColor       =   16777215
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   67
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "RB Prj Tool Progress"
   Visible         =   True
   Width           =   327
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Stop"
      ControlOrder    =   0
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   24
      Underline       =   False
      Visible         =   True
      Width           =   72
   End
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      ControlOrder    =   1
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Maximum         =   100
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   25
      Value           =   0
      Visible         =   True
      Width           =   221
   End
   Begin ProgressAwareCtrl ProgressAwareCtrl1
      ControlOrder    =   2
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   5
      LockedInPosition=   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   7
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function myProgressUpdate(current as Integer, maximum as Integer) As Boolean
		  if Microseconds > nextProgressTime then
		    if me.ProgressBar1.Maximum <> maximum then
		      me.ProgressBar1.Maximum = maximum
		    end
		    if me.ProgressBar1.Value <> current then
		      me.ProgressBar1.Value = current
		    end
		    me.ProgressBar1.Refresh
		    App.DoEvents // allow the user to click on the Stop button
		    nextProgressTime = Microseconds + 1000*50 // update every 50ms
		  end
		  
		  return not me.stopped
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private nextProgressTime As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private stopped As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  self.stopped = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProgressAwareCtrl1
	#tag Event
		Function ProgressUpdate_(current as Integer, maximum as Integer) As Boolean
		  return myProgressUpdate (current, maximum)
		End Function
	#tag EndEvent
#tag EndEvents
