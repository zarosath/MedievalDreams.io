Framework brl.GNet
Import brl.polledinput
Import brl.systemdefault
						Global Hostserver:TGNetHost=CreateGNetHost()
						Global Hostclient:TGNetHost=CreateGNetHost()						
						Global listen:Int = GNetListen(Hostserver,43594)
If listen
   Print "Server listening on Port 43594"
Else
   Print "Could not bind socket."
   CloseGNetHost Hostserver
   EndIf					
						Global Client:Int = GNetConnect(hostclient,"localhost",43594)	
If Hostclient
   Print "Host created."
Else
   Print "Couldnt create local host."
EndIf

If(Client = True)
Print "Host has connected to the server successfully"
	Else
				Print"Host was not able to connect to server"
				CloseGNetHost(Hostclient)
Print "host closed"
			Return
	EndIf

Local gobj:tgnetobject = CreateGNetObject(hostclient)
DebugStop
Repeat
GNetSync(Hostserver)
GNetSync(hostclient)
Until KeyHit(Key_escape)

CloseGNetObject(GObj)
Delay 500
Print"Player object closed"
CloseGNetHost(Hostserver)
CloseGNetHost(hostclient)
Print "host closed"