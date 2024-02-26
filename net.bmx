Const GnetplayerX:Int = 1
Const GnetplayerY:Int = 2
Const GnetplayerZ:Int = 3
Const GnetplayerPitch:Int = 4
Const GnetplayerYaw:Int = 5
Const GnetplayerRoll:Int = 6



Function ScanGnet()
    ' find new
    For Local obj:TGNetObject=EachIn GNetObjects( host, GNET_CREATED )
       TPlayer.Addplayer obj
    Next
   ' DrawText "TPlayers:" + TPlayer.All.Count() , 30,130

		For Local obj:TGNetObject=EachIn GNetObjects( host, GNET_CLOSED )
		TPlayer.remove(obj)
	Next
	
	For Local obj:tgnetobject=EachIn GNetObjects(Host, GNET_MODIFIED)
			      For Local loc:TPlayer = EachIn TPlayer.All
						If loc.GObj=obj
					loc.set()
         EndIf
      Next
	Next
End Function