' load player mesh
Local Player:TMesh=LoadAnimMesh("Media/models/Player/player.b3d")
ScaleEntity Player,1,1,1

Local PlayerColliderYaw:Float = 0
Local PlayerEyesPitch:Float = 0
Local PlayerIsOnGround:Int = 0
Local PlayerVX:Float = 0
Local PlayerVZ:Float = 0
Local PlayerVY:Float = 0
Local PlayerOldX:Float = 0
Local PlayerOldZ:Float = 0
Local PlayerNewX:Float = 0
Local PlayerNewZ:Float = 0

' Pivot for collisions
Local PlayerCollider:TPivot=CreatePivot()
PositionEntity(PlayerCollider,0,0,0)  
EntityRadius(PlayerCollider,0.25)
EntityType(PlayerCollider,2)

PositionEntity(Player,EntityX(PlayerCollider,True),EntityY(PlayerCollider,True)-0.25,EntityZ(PlayerCollider,True))
EntityParent(Player,PlayerCollider,True)