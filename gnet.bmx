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
			      For Local loc:TPlayer = EachIn TPlayer.All
         If Localplayer.GObj=obj
			Return
				Else
					Local newx:Float = EntityX(loc.playerentity) - loc.X()
							Print newx
						MoveEntity(loc.playerentity,newx,EntityY(loc.playerentity),EntityZ(loc.playerentity))

				'loc.y
				'loc.
         EndIf
      Next
	Next
End Function