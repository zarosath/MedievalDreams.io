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
						If loc.GObj=obj
						PositionEntity(loc.pivot,loc.X(),GetGNetFloat(loc.GObj,2),GetGNetFloat(loc.GObj,3))
						RotateEntity(loc.pivot,loc.Pitch(),loc.Yaw(),loc.Roll())
				'loc.y
				'loc.
         EndIf
      Next
	Next
End Function