' load player mesh
Global Playermodel:TMesh=LoadAnimMesh("Media/models/Player/player.b3d")
HideEntity Playermodel
Local PlayerIsOnGround:Int
Global Pivot:TPivot=CreatePivot()
EntityType(pivot,GroupCharacters)

Type TPlayer

	'Global all:TList = New TList

Field Username:String
Field x: Float
Field y: Float
Field PlayerIsOnGround:Int
Field YAcceleration:Float
Field playerentity:TEntity = CopyEntity(Playermodel)

    Field GObj:TGNetObject



	Global All:TList=New TList

    Function Addme:TPlayer(Name:String)
        Local loc:TPlayer = New TPlayer

	ScaleEntity loc.playerentity,1,1,1
			EntityRadius(pivot, 0.01,0.01)

		EntityParent loc.playerentity, Pivot
			RotateEntity(loc.playerentity, 180,0,180)
			
        loc.GObj = CreateGNetObject(Host)
      loc.Username=Name
        all.AddLast loc
        Return loc
    End Function

    Function Addplayer(Obj:TGNetObject)
        Local loc:TPlayer = New TPlayer
        loc.GObj = Obj
        All.AddLast loc
    End Function

   Function ClientHasClosed(Obj:TGnetObject)
      For Local loc:TPlayer = EachIn All
         If loc.GObj=Obj
			FreeEntity(loc.playerentity)
            All.Remove loc
         EndIf
      Next
   End Function


End Type

Function ScanGnet()
    ' find new
    For Local obj:TGNetObject=EachIn GNetObjects( host, GNET_CREATED )
       TPlayer.Addplayer obj
    Next
    DrawText "TPlayers:" + TPlayer.All.Count() , 30,130

		For Local obj:TGNetObject=EachIn GNetObjects( host, GNET_CLOSED )
		TPlayer.ClientHasClosed(obj)
	Next
End Function