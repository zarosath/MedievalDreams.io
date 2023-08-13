SuperStrict
' This is the main server API for the game client
Framework brl.GNet

Global Host:TGNetHost=CreateGNetHost()

If Host
   Print "Host created."
Else
   Print "Couldnt create host."
   End
EndIf

Global listen:Int = GNetListen(Host,12345)

If listen
   Print "Server listening on Port 12345"
Else
   Print "Could not bind socket."
   CloseGNetHost Host
   End
EndIf
Local shutdown:Int = False
Repeat
    GNetSync Host
    Print MilliSecs()
Until shutdown=True

CloseGNetHost Host
Print "Server Shut down" 