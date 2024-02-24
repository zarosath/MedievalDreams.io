' load player mesh
Global Playermodel:TMesh=LoadAnimMesh("Media/models/Player/player.b3d")
HideEntity Playermodel

Type TPlayer

	Global all:TList = New TList

Field Username:String
'Field x: Float
'Field y: Float
Field PlayerIsOnGround:Int
Field YAcceleration:Float
Field playerentity:TEntity = CopyEntity(Playermodel)
Field Pivot:TPivot=CreatePivot()

Field GObj:TGNetObject
  Field id:Int
  Global lastID:Int = 0

  Method NewID()
    lastID :+ 1
    Self.id = lastID
  End Method

Method printID()
Print Self.id
End Method

    Function Addme:TPlayer(Name:String)
			Local loc:TPlayer = New TPlayer
					EntityType(loc.pivot,GroupCharacters, True)
			'EntityType(loc.playerentity,GroupCharacters, False)
			ScaleEntity loc.playerentity,1,1,1
			EntityParent loc.playerentity, loc.Pivot
			RotateEntity(loc.playerentity, 180,0,180)
			PositionEntity(loc.playerentity, 0, -1,0, True) ' position entity ground level, exactly -1 from Y radius.
			EntityRadius(loc.pivot, 0.2, 1)
			PositionEntity(loc.pivot,10,5.5,-5) 'general player spawn location
			
			        loc.GObj = CreateGNetObject(Host)
			        For Local i:Int= 0 To 31
        SetGNetFloat loc.GObj,i,0
        Next
      loc.Username=Name
        all.AddLast loc
        Return loc
    End Function

    Function Addplayer(Obj:TGNetObject)
        Local loc:TPlayer = New TPlayer
        loc.GObj = Obj
        All.AddLast loc
		'NameEntity(loc.playerentity, "playerEntity")

		loc.playerentity.NameEntity "playerEntity: ID: "
		EntityType(loc.pivot,GroupCharacters, True)
		EntityPickMode(loc.playerentity,2)
		EntityParent loc.playerentity, loc.Pivot
		RotateEntity(loc.playerentity, 180,0,180)
		PositionEntity(loc.playerentity, 0, -1,0, True) ' position entity ground level, exactly -1 from Y radius.
		ScaleEntity loc.playerentity,1,1,1
			EntityRadius(loc.pivot, 0.2, 1)
		PositionEntity(loc.pivot,14,0.2,-15) 'general player spawn location
    End Function

   Function remove(Obj:TGnetObject)
      For Local loc:TPlayer = EachIn All
         If loc.GObj=Obj
			FreeEntity(loc.playerentity)
            All.Remove loc
         EndIf
      Next
   End Function

Method Moveplayer (Player:TPlayer, x:Float,y:Float,z:Float)
If Player = me Then Return ' method presently unused, saving for later in case it is needed
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

	Method SendX()
			   SetGNetFloat(GObj,GnetplayerX,EntityX(pivot))
	End Method
	
	Method SendY()
			   SetGNetFloat(GObj,GnetplayerY,EntityY(pivot))
	End Method
	
	Method SendZ()
			   SetGNetFloat(GObj,GnetplayerZ,EntityZ(pivot))
	End Method
	
	Method SendPitch()
			   SetGNetFloat(GObj,GnetplayerPitch,EntityPitch(pivot))
		
		End Method
	
	Method SendYaw()
			   SetGNetFloat(GObj,GnetplayerYaw,EntityYaw(pivot))
	End Method
	
	Method SendRoll()
			   SetGNetFloat(GObj,GnetplayerRoll,EntityRoll(pivot))
	End Method
End Type

