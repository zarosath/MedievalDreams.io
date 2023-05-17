Strict

Framework openb3d.b3dglgraphics
Import brl.randomdefault
Graphics3D 800,600, 0, 3

HideMouse()

SeedRnd(MilliSecs()) 

Const CFirstPerson% = 1
Const CThirdPerson% = 2
Global ViewMode% = CFirstPerson

Const GroupEnvironment% = 1
Const GroupCharacters% = 2

Global Camera:TCamera = CreateCamera() 
CameraRange(Camera,0.1,1000)
CameraClsColor(Camera,000,000,000)  

Local Origine:TMesh = CreateCube() 
ScaleMesh(Origine,0.1/2,1000.0,0.1/2)
EntityColor(Origine,255,000,000)
EntityFX(Origine,1)

Local GroundMesh:TMesh  = CreateCube()
ScaleMesh(GroundMesh,100.0/2,0.1/2,100.0/2)
PositionMesh(GroundMesh,100.0/2,-0.1/2,100.0/2)
EntityColor(GroundMesh,000,125,000)
EntityType(GroundMesh,GroupEnvironment)

Local PlayerCollider:TPivot = CreatePivot() 
PositionEntity(PlayerCollider,0,0,0) 
EntityRadius(PlayerCollider,0.25)
EntityType(PlayerCollider,GroupCharacters)

Local PlayerEyes:TPivot = CreatePivot()
PositionEntity(PlayerEyes,EntityX(PlayerCollider,True),EntityY(PlayerCollider,True)+1.6-0.25,EntityZ(PlayerCollider,True)+0.25)
EntityParent(PlayerEyes,PlayerCollider,True)

Local PlayerMesh:TMesh = CreateCube() 
ScaleMesh(PlayerMesh,0.5/2,1.7/2,0.25/2) 
PositionMesh(PlayerMesh,0,1.7/2,0) 
EntityColor(PlayerMesh,000,000,125) 
PositionEntity(PlayerMesh,EntityX(PlayerCollider,True),EntityY(PlayerCollider,True)-0.25,EntityZ(PlayerCollider,True)) 
EntityParent(PlayerMesh,PlayerCollider,True) 

ViewMode = CFirstPerson

PositionEntity(PlayerCollider,5,0.25+0.01,5)

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
Local x_speed:Int
Local y_speed:Int
Local DirectLight:TLight = CreateLight(1) 
LightColor(DirectLight,125,125,125) 
PositionEntity(DirectLight,0,128.0,-128.0) 
RotateEntity(DirectLight,45,0,0) 
AmbientLight(063,063,063)

Collisions(GroupCharacters,GroupEnvironment,2,3)

While(Not KeyHit(KEY_ESCAPE))  

 Local MXSpeed:Float = MouseXSpeed() 
 Local MYSpeed:Float = MouseYSpeed()  

    x_speed=((MouseX()-320)-x_speed)/8+x_speed
    y_speed=((MouseY()-240)-y_speed)/8+y_speed
 MoveMouse(GraphicsWidth()/2,GraphicsHeight()/2) 
 PlayerEyesPitch = PlayerEyesPitch+MYSpeed
 If(PlayerEyesPitch > 89)
  PlayerEyesPitch = 89
 EndIf
 If(PlayerEyesPitch < -89)
  PlayerEyesPitch = -89
 EndIf
 PlayerColliderYaw = PlayerColliderYaw-MXSpeed
 RotateEntity(PlayerEyes,PlayerEyesPitch,0,0)
 RotateEntity(PlayerCollider,0,PlayerColliderYaw,0)  

 Local CollidedCollidable:TEntity = EntityCollided(PlayerCollider,GroupEnvironment)
If( Not CollidedCollidable )
  PlayerIsOnGround = False
 Else'If( CollidedCollidable <> 0 )
  PlayerIsOnGround = True
 EndIf

 If( PlayerIsOnGround = False )
  'PlayerVY = PlayerVY - 0.0025
  TranslateEntity(PlayerCollider,PlayerVX,PlayerVY,PlayerVZ) 
  If(KeyDown(KEY_W)>0)
   MoveEntity(PlayerCollider,0,0,0.01) 
  Else If(KeyDown(KEY_A)>0) 
   MoveEntity(PlayerCollider,0,0,-0.01) 
  EndIf 
  If(KeyDown(KEY_S)>0) 
   MoveEntity(PlayerCollider,-0.01,0,0) 
  Else If(KeyDown(KEY_D)>0) 
   MoveEntity(PlayerCollider,0.01,0,0) 
  EndIf
 ElseIf( PlayerIsOnGround = True )
  PlayerOldX = EntityX(PlayerCollider,True)
  PlayerOldZ = EntityZ(PlayerCollider,True)
  PlayerVY = 0 
  If(KeyDown(1)>0)
   MoveEntity(PlayerCollider,0,0,0.1) 
  Else If(KeyDown(31)>0) 
   MoveEntity(PlayerCollider,0,0,-0.1) 
  EndIf 
  If(KeyDown(2)>0) 
   MoveEntity(PlayerCollider,-0.1,0,0) 
  Else If(KeyDown(32)>0) 
   MoveEntity(PlayerCollider,0.1,0,0) 
  EndIf 
  If(KeyDown(KEY_SPACE)>0)
   PlayerVY# = 0.1
  EndIf
  PlayerNewX = EntityX(PlayerCollider,True)
  PlayerNewZ = EntityZ(PlayerCollider,True)
  PlayerVX = PlayerNewX - PlayerOldX
  PlayerVZ = PlayerNewZ - PlayerOldZ 
 EndIf

 UpdateWorld()

 If(KeyHit(KEY_TAB)>0)
  If( ViewMode = CFirstPerson )
   ViewMode = CThirdPerson
  ElseIf( ViewMode = CThirdPerson )
   ViewMode = CFirstPerson
  EndIf
 EndIf

 If( ViewMode = CFirstPerson )
  PositionEntity(Camera,EntityX(PlayerEyes,True),EntityY(PlayerEyes,True),EntityZ(PlayerEyes,True))
  RotateEntity(Camera,EntityPitch(PlayerEyes,True),EntityYaw(PlayerEyes,True),EntityRoll(PlayerEyes,True))
  MoveEntity(Camera,0,0,0.0)
 ElseIf( ViewMode = CThirdPerson )
  PositionEntity(Camera,EntityX(PlayerEyes,True),EntityY(PlayerEyes,True),EntityZ(PlayerEyes,True))
  RotateEntity(Camera,EntityPitch(PlayerEyes,True),EntityYaw(PlayerEyes,True),EntityRoll(PlayerEyes,True))
  MoveEntity(Camera,0,0,-3.0)
 EndIf

 If(KeyDown(2)>0) 
  Wireframe(True) 
 Else 
  Wireframe(False) 
 EndIf 

 'SetBuffer(BackBuffer())
 RenderWorld() 

 Flip(1) 

Wend

End