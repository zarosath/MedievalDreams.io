'main program
Strict

Framework openb3d.b3dglgraphics

Graphics3D 800,600, 0, 3

Include "player.bmx"
Include "camera.bmx"
Include "createTerrain.bmx"
Include "CameraFunctions.bmx"

'variables
Const GroupEnvironment% = 1
Const GroupCharacters% = 2

' Light the world, todo;maybe put the lighting in bmx zone file. for now it is in main.
Local light:TLight=CreateLight()
RotateEntity light,90,0,0

' enable collisions
Collisions(GroupCharacters,GroupEnvironment,2,0)
EntityType(terrain,GroupEnvironment)
EntityType(pivot,GroupCharacters)
EntityRadius(pivot, 1,1)
 Repeat

	If KeyDown( KEY_RIGHT )=True Then TurnEntity Pivot,0,-1,0
	If KeyDown( KEY_LEFT )=True Then TurnEntity Pivot,0,1,0
	If KeyDown( KEY_DOWN )=True Then MoveEntity Pivot,0,0,-1
	If KeyDown( KEY_UP )=True Then MoveEntity Pivot,0,0,1
	If KeyDown( key_W )=True Then MoveEntity Pivot,0,1,0
	If KeyDown( key_S )=True Then MoveEntity Pivot,0,-1,0
If (KeyHit(KEY_R))
Print EntityX(Pivot)
Print EntityY(Pivot)
Print EntityZ(Pivot)
EndIf
CameraFunction()
Local WhoCollided:TEntity = EntityCollided(pivot,GroupEnvironment)
If WhoCollided=terrain
     PlayerIsOnGround = True
Print "Entity collided with terrain"
Else PlayerIsOnGround = False
	EndIf
	If PlayerIsOnGround = False
	Print "player isnt on the ground"
	  'PlayerVY = PlayerVY - 0.0025
  'TranslateEntity(Pivot,PlayerVX,PlayerVY,PlayerVZ) 
  PlayerNewX = EntityX(pivot,True)
  PlayerNewZ = EntityZ(pivot,True)
  PlayerVX = PlayerNewX - PlayerOldX
  PlayerVZ = PlayerNewZ - PlayerOldZ 
EndIf
	UpdateWorld
	RenderWorld
	Flip 1

'Text 0,0,"Use cursor keys to move about the terrain"

Flip


Until AppTerminate() Or KeyHit(KEY_ESCAPE) 
