' load player mesh
Local Player:TMesh=LoadAnimMesh("Media/models/Player/player.b3d")
ScaleEntity Player,1,1,1
Global Pivot:TPivot=CreatePivot()
EntityType(pivot,GroupCharacters)
EntityRadius(pivot, 0.00000000001,0.00000000001)


EntityParent Player, Pivot
RotateEntity(Player, 180,0,180)
Local PlayerIsOnGround:Int
Local PlayerVX:Float = 0
Local PlayerVZ:Float = 0
Local PlayerVY:Float = 0
Local PlayerOldX:Float = 0
Local PlayerOldZ:Float = 0
Local PlayerNewX:Float = 0
Local PlayerNewZ:Float = 0
' Pivot for collisions

'PositionEntity(PlayerCollider,0,0,0)  
'EntityRadius(PlayerCollider,0.25)

'PositionEntity(Player,EntityX(PlayerCollider,True),EntityY(PlayerCollider,True)-0.25,EntityZ(PlayerCollider,True))
'EntityParent(Player,PlayerCollider,True)