Rem 
		main client-side application
EndRem
Strict

Framework openb3d.b3dglgraphics

Graphics3D 800,600, 0, 3

Include "player.bmx"
Include "camera.bmx"
Include "createTerrain.bmx"

'variables
Const GroupEnvironment% = 1
Const GroupCharacters% = 2


' Light the world, todo;maybe put the lighting in bmx zone file. for now it is in main.
Local light:TLight=CreateLight()
RotateEntity light,90,0,0
MoveEntity(pivot,14,0.00000000001,-15) ' lets move the player a little further onto the terrain. Todo: add general player spawn location


' debug entity landmark
	Local c:TEntity = CreateCylinder()
	ScaleEntity c, 0.2,10,0.2
   	PositionEntity c, 12,0.00000000001,-12
' enable collisions
Collisions(GroupCharacters,GroupEnvironment,2,2)

 Repeat

	If KeyDown( KEY_RIGHT )=True Then TurnEntity Pivot,0,-1,0
	If KeyDown( KEY_LEFT )=True Then TurnEntity Pivot,0,1,0
	If KeyDown( KEY_DOWN )=True Then MoveEntity Pivot,0,0,-1
	If KeyDown( KEY_UP )=True Then MoveEntity Pivot,0,0,1
	If KeyDown( key_W )=True Then MoveEntity Pivot,0,1,0
	If KeyDown( key_S )=True Then MoveEntity Pivot,0,-1,0
	
		If KeyDown(key_SPACE) And PlayerIsOnGround = True Then
		Print EntityY(Pivot)
		 MoveEntity Pivot,0,20,0
		Print EntityY(Pivot)
			EndIf
	
If (KeyHit(KEY_R))
Print EntityX(Pivot)
Print EntityY(Pivot)
Print EntityZ(Pivot)
EndIf
CameraFunction()
Local WhoCollided:TEntity = EntityCollided(pivot,GroupEnvironment)
If WhoCollided=terrain
     'Print "Entity has collided with the terrain"
PlayerIsOnGround = True
Else

PlayerIsOnGround = False
'Print "player isnt colliding with anything"
	EndIf
	
	If PlayerIsOnGround = False
	  PlayerVY = PlayerVY - 0.0010
  TranslateEntity(Pivot,PlayerVX,PlayerVY,PlayerVZ) 
  PlayerOldX = EntityX(pivot,True)
  PlayerOldZ = EntityZ(pivot,True)

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
