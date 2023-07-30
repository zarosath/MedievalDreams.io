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
			      For Local loc:TPlayer = EachIn localplayer.All
         If loc.GObj=obj
				Local newx:Float = EntityX(loc.playerentity) - GetGNetFloat(obj,1)
								Print newx
				MoveEntity(loc.playerentity,newx,0,0)

				'loc.y
				'loc.
         EndIf
      Next
	Next
End Function