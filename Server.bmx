SuperStrict
' This is the main server API for the game client
Framework brl.GNet
Import brl.standardio

Global Host:TGNetHost=CreateGNetHost()

If Host
   Print "Host created."
Else
   Print "Couldnt create host."
   End
EndIf

Global listen:Int = GNetListen(Host,43594)

If listen
   Print "Server listening on Port 43594"
Else
   Print "Could not bind socket."
   CloseGNetHost Host
   End
EndIf
Local shutdown:Int = False
Local ServerMilliseconds:Int=MilliSecs()
Repeat
    GNetSync Host
    Print MilliSecs()
Until shutdown=True

CloseGNetHost Host
Delay 100
If host
Print "server still running after loop shutdown"
Else Print "Server Shut down" EndIf 