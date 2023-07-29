Function ScanGnet()
    ' find new
    For Local obj:TGNetObject=EachIn GNetObjects( host, GNET_CREATED )
       TPlayer.Addplayer obj
    Next
    DrawText "TPlayers:" + TPlayer.All.Count() , 30,130

		For Local obj:TGNetObject=EachIn GNetObjects( host, GNET_CLOSED )
		TPlayer.ClientHasClosed(obj)
	Next
	
	For Local obj:tgnetobject=EachIn GNetObjects(Host, GNET_MODIFIED)
			
			MoveEntity(GetGNetFloat(obj,1)
	Next
End Function