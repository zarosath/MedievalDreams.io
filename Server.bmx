SuperStrict
' This is the main server API for the game client
Framework brl.GNet
Import brl.standardio
Import brl.threads

Local port:Int = 12345

Global Host:TGNetHost=CreateGNetHost()
If Host
   Print "Host created."
Else
   Print "Couldnt create host."
   End
EndIf

Global listen:Int = GNetListen(Host,port)
If listen
   Print "Server listening on Port "+ port
Else
   Print "Could not bind socket."
   CloseGNetHost Host
   End
EndIf
Global shutdown:Int = False
Local ServerMilliseconds:Int=MilliSecs()
Local inputthread:TThread=CreateThread(commandinput, "")
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