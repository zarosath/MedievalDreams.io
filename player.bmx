' load player mesh
Global Playermodel:TMesh=LoadAnimMesh("Media/models/Player/player.b3d")
HideEntity Playermodel
Local PlayerIsOnGround:Int

Type TPlayer

	'Global all:TList = New TList

Field Username:String
'Field x: Float
'Field y: Float
Field PlayerIsOnGround:Int
Field YAcceleration:Float
Field playerentity:TEntity = CopyEntity(Playermodel)
Field Pivot:TPivot=CreatePivot()

Field GObj:TGNetObject



	Global All:TList=New TList

    Function Addme:TPlayer(Name:String)
        Local loc:TPlayer = New TPlayer
EntityType(loc.pivot,GroupCharacters)
	ScaleEntity loc.playerentity,1,1,1
			EntityRadius(loc.pivot, 0.1,0.1)

		EntityParent loc.playerentity, loc.Pivot
			RotateEntity(loc.playerentity, 180,0,180)
			PositionEntity(loc.pivot,14,0.2,-15) 'general player spawn location

			
			
        loc.GObj = CreateGNetObject(Host)
      loc.Username=Name
        all.AddLast loc
        Return loc
    End Function

    Function Addplayer(Obj:TGNetObject)
        Local loc:TPlayer = New TPlayer
        loc.GObj = Obj
        All.AddLast loc
EntityType(loc.pivot,GroupCharacters)
			EntityRadius(loc.pivot, 0.1,0.1)
		EntityParent loc.playerentity, loc.Pivot
					RotateEntity(loc.playerentity, 180,0,180)
						ScaleEntity loc.playerentity,1,1,1
			PositionEntity(loc.pivot,14,0.2,-15) 'general player spawn location
    End Function

   Function ClientHasClosed(Obj:TGnetObject)
      For Local loc:TPlayer = EachIn All
         If loc.GObj=Obj
			FreeEntity(loc.playerentity)
            All.Remove loc
         EndIf
      Next
   End Function

Method movePlayer (Player:TPlayer, x:Float,y:Float,z:Float)
If Player = localplayer Then Return ' method presently unused, saving for later in case it is needed
End Method

    Method X:Float()
        Return GetGNetFloat(GObj,GnetplayerX)
    End Method

    Method Y:Float()
        Return GetGNetFloat(GObj,GnetplayerY)
    End Method

    Method Z:Float()
        Return GetGNetFloat(GObj,GnetplayerZ)
    End Method

    Method Pitch:Float()
        Return GetGNetFloat(GObj,GnetplayerPitch)
    End Method

    Method Yaw:Float()
        Return GetGNetFloat(GObj,GnetplayerYaw)
    End Method

    Method Roll:Float()
        Return GetGNetFloat(GObj,GnetplayerRoll)
    End Method

	Method Set()
           PositionEntity Pivot, X(), Y(), Z()
           RotateEntity   Pivot, Pitch(), Yaw(), Roll()
	End Method

	Method Send()
	'send client player information
		   SetGNetFloat(LocalPlayer.GObj,GnetplayerX,EntityX(localplayer.pivot))
		   SetGNetFloat(LocalPlayer.GObj,GnetplayerY,EntityY(localplayer.pivot))
		   SetGNetFloat(LocalPlayer.GObj,GnetplayerZ,EntityZ(localplayer.pivot))
		   SetGNetFloat(localplayer.GObj,GnetplayerPitch,EntityPitch(localplayer.pivot))
		   SetGNetFloat(localplayer.GObj,GnetplayerYaw,EntityYaw(localplayer.pivot))
		   SetGNetFloat(localplayer.GObj,GnetplayerRoll,EntityRoll(localplayer.pivot))
	End Method
	
End Type

