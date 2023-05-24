' load player mesh
Global Player:TMesh=LoadAnimMesh("Media/models/Player/player.b3d")
ScaleEntity Player,1,1,1
Global Pivot:TPivot=CreatePivot()
EntityType(pivot,GroupCharacters)
EntityRadius(pivot, 0.00000000001,0.00000000001)


EntityParent Player, Pivot
RotateEntity(Player, 180,0,180)
Local PlayerIsOnGround:Int

Type TPlayer

Field x
Field y
Field playerentity:TEntity = CopyEntity(Player)

End Type