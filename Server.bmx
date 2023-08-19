SuperStrict
' This is the main server API for the game client
Framework brl.GNet
Import brl.standardio
Import brl.threads

Global Host:TGNetHost=CreateGNetHost()
If Host
   Print "Host created."
Else
   Print "Couldnt create host."
   End
EndIf

Global listen:Int = GNetListen(Host,12345)
Local inputthread:TThread=CreateThread(commandinput, "")
If listen
   Print "Server listening on Port 12345"
Else
   Print "Could not bind socket."
   CloseGNetHost Host
   End
EndIf
Global shutdown:Int = False
Local ServerMilliseconds:Int=MilliSecs()
Repeat
    GNetSync Host
    'Print MilliSecs()
Until shutdown=True

Function commandinput:Object(data:Object)
Repeat
Local command:String = Input("Command>: ")
command.toLower()
Select command
Case "close" shutdown=True
Case "stop" shutdown=True
Case "shutdown" shutdown=True
Case "exit" shutdown=True
Case "help" Print "Commands to terminate server: Exit, close, stop, shutdown"
Default
Print "Commands: close, stop, shutdown, exit, help"
EndSelect
Until shutdown=True

EndFunction
DetachThread(inputthread)
CloseGNetHost(host)
Delay 500
If host
Print "server still running after loop shutdown"
Else Print "Server closed" EndIf 