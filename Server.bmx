Strict
Import BRL.StandardIO
Import BRL.GNet
'Import "Player.bmx"

' This is the main server API for the game client

AppTitle="GNet Server Example"
Graphics 640,480,0,80
debugstop
Global Host:TGNetHost=CreateGNetHost()


If Host
   Print "Host created."
Else
   Print "Couldnt create host."
EndIf

Local player_x:Int=0
Local player_y:Int=0

Const GNET_PLAYER_X:Int=0
Const GNET_PLAYER_Y:Int=1




Global listen:Int =GNetListen(Host,12345)

If listen
   Print "Server listening on Port 12345"
Else
   Print "Could not bind socket."
EndIf

While Not KeyDown(KEY_ESCAPE)
   Cls
   GNetSync(Host)
  
   'If (GNetAccept(Host))
   '   Print "Ein Client will sich verbinden"
     
     
   'End If
  
   'SetGNetFloat player1,GNET_PLAYER_X,player_x
   'SetGNetFloat player1,GNET_PLAYER_Y,player_y

   For Local obj:TGNetObject=EachIn GNetObjects( host,GNET_ALL )
      'If obj=player1
         'DrawText "Me",player_x,player_y
      'Else
         'DrawText "Him",GetGNetFloat(obj,GNET_PLAYER_X),GetGNetFloat(obj,GNET_PLAYER_Y)
      'EndIf
   Next
  
   Flip
   'FlushMem()
Wend


CloseGNetHost(Host)
Print "Server Shut down" 

Rem
' Create a new host. We call it listen because that's what it does
Local listen:TGNetHost = CreateGNetHost()

' Make it listen to the connection. 8086 is the port we want to use but you can change this to whatever
' you want between 1024 and 65535 (if i remember correctly.)
If Not GNetListen( listen, 8086 ) Then
	Print "Unable to listen on port."
	End
EndIf


Print "Server started."
Local quit_server = False
While Not quit_server

	GNetSync(listen) ' Sync all created objects

	Local newpeer:TGNetPeer = GNetAccept( listen ) ' Is someone knocking on our port?
	
	If newpeer Then
		' A new player wants to join us.
		Print "New player"
		Print "Players onnected at the moment:"
		Local peerlist:TList = GNetPeers( listen )
		
		For Local p:TGNetPeer = EachIn peerlist
			Print "  - "+DottedIP( SocketRemoteIP(GNetPeerTCPSocket( p )) )
		Next
		
	EndIf
	

	' The stuff below isn't needed in this short tutorial. It just prints some debug information so we can see
	' that the server is actually working. :)	

	Local olist:TList = GNetObjects( listen ) ' Get all created objects in the game
	
	For Local o:TGnetObject = EachIn olist
		
		Local state = GNetObjectState( o ) ' Get the state of the object
			
		Select state
			Case GNET_CREATED 'Object has been created
				Print "New object created"
			Case GNET_SYNCED 'Object is in sync
				' do something here if it is needed
				' But the object is in sync and everything is just fine.
			Case GNET_MODIFIED 'Object has been modified
				' The object is modified! But no worries. It will be synced automagically.
			Case GNET_CLOSED 'Object has been closed
				Print "Connection closed to a peer"
				' The object is no longer valid. The player left the game
			Case GNET_MESSAGE 'Object is a message Object
				' I haven't played around with this yet. So you need to read the manual
				' yourself about this. ;)
		
		EndSelect
		
	Next

Wend


Local Command:String = Input("Server> "+ "Emter Command (--help for list of commands ")
Print "Hello "+command

End Rem