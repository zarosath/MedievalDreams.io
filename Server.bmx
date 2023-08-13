SuperStrict
' This is the main server API for the game client

AppTitle="GNet Server Example"
Graphics 640,480

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

Repeat
    Cls
    GNetSync Host
    DrawText MilliSecs(), 100,100
    Flip 1
Until AppTerminate() Or KeyDown(KEY_ESCAPE)

CloseGNetHost Host
Print "Server Shut down" 