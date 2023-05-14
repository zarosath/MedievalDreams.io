
'main program
Strict

Framework openb3d.b3dglgraphics

Graphics3D 800,600, 0, 3

Include "player.bmx"
Include "camera.bmx"
Include "createTerrain.bmx"
Include "CameraFunctions.bmx"

Const GroupEnvironment:Int = 1
Const GroupCharacters:Int = 2

' Light the world, todo;maybe put the lighting in bmx zone file. for now it is in main.
Local light:TLight=CreateLight()
RotateEntity light,90,0,0
Collisions(GroupCharacters,GroupEnvironment,2,3)

While Not KeyDown( KEY_ESCAPE )

Local MXSpeed:Float = MouseXSpeed()  
Local MYSpeed:Float = MouseYSpeed()   
 MoveMouse(GraphicsWidth()/2,GraphicsHeight()/2)  
 PlayerEyesPitch = PlayerEyesPitch+MYSpeed*0.1 
 If(PlayerEyesPitch > 89)
  PlayerEyesPitch = 89
 EndIf
 If(PlayerEyesPitch < -89)
  PlayerEyesPitch = -89
 EndIf
 PlayerColliderYaw = PlayerColliderYaw-MXSpeed*0.1   
 RotateEntity(PlayerEyes,PlayerEyesPitch,0,0)
 RotateEntity(PlayerCollider,0,PlayerColliderYaw,0) 

Local CollidedCollidable:TEntity = EntityCollided(PlayerCollider,GroupEnvironment)
 If( Not CollidedCollidable )
  PlayerIsOnGround = False
 Else
  PlayerIsOnGround = True
 EndIf
 If( PlayerIsOnGround = False )
  PlayerVY = PlayerVY - 0.0025 
  TranslateEntity(PlayerCollider,PlayerVX,PlayerVY,PlayerVZ)  
  If(KeyDown(KEY_W)>0) 
   MoveEntity(PlayerCollider,0,0,0.01)  
  Else If(KeyDown(KEY_S)>0)  
   MoveEntity(PlayerCollider,0,0,-0.01)  
  EndIf  
  If(KeyDown(KEY_A)>0)  
   MoveEntity(PlayerCollider,-0.01,0,0)  
  Else If(KeyDown(KEY_D)>0)  
   MoveEntity(PlayerCollider,0.01,0,0)  
  EndIf
 ElseIf( PlayerIsOnGround = True )
  PlayerOldX = EntityX(PlayerCollider,True)
  PlayerOldZ = EntityZ(PlayerCollider,True)
  PlayerVY = 0  
  If(KeyDown(KEY_W)>0) 
   MoveEntity(PlayerCollider,0,0,0.1)  
  Else If(KeyDown(31)>0)  
   MoveEntity(PlayerCollider,0,0,-0.1)  
  EndIf  
  If(KeyDown(KEY_A)>0)  
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

 UpdateWorld
'Local terra_y#=TerrainY(terrain,x#,y#,z#)+5

'PositionEntity camera,x#,terra_y#,z#
  PositionEntity(Camera,EntityX(PlayerEyes,True),EntityY(PlayerEyes,True),EntityZ(PlayerEyes,True))
  RotateEntity(Camera,EntityPitch(PlayerEyes,True),EntityYaw(PlayerEyes,True),EntityRoll(PlayerEyes,True))
  MoveEntity(Camera,0,0,-3.0)
RenderWorld

Text 0,0,"Use cursor keys to move about the terrain"

Flip(1)


Wend
