Strict
Import BRL.StandardIO
Import BRL.GNet

' This is the main server API for the game client

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