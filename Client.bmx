Rem 
		main client-side game application
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

Const GRAVITY:Float = 0.1
Const  ENERGY:Float = 1.5
Const  MOTION:Int   = 25 
Global YAcceleration:Float
Global PlayerTime:Int
Global playerjumped:Int

' Light the world, todo;maybe put the lighting in bmx zone file. for now it is in main.
Local light:TLight=CreateLight()
RotateEntity light,90,0,0
MoveEntity(pivot,14,0.2,-15) ' lets move the player a little further onto the terrain. Todo: add general player spawn location


' debug entity landmark
	Local c:TEntity = CreateCylinder()
	ScaleEntity c, 0.2,10,0.2
   	PositionEntity c, 12,0.00000000001,-12
' set collision
Collisions(GroupCharacters,GroupEnvironment,2,2)

 Repeat
CameraFunction()


	If KeyDown( KEY_D )=True Then TurnEntity Pivot,0,-1,0
	If KeyDown( KEY_A )=True Then TurnEntity Pivot,0,1,0
	If KeyDown( KEY_S )=True Then MoveEntity Pivot,0,0,-0.1
	If KeyDown( KEY_W )=True Then MoveEntity Pivot,0,0,0.1
	If KeyDown( key_UP )=True Then MoveEntity Pivot,0,0.1,0
	If KeyDown( key_Down )=True Then MoveEntity Pivot,0,-0.1,0
	
		If KeyDown(key_SPACE) And PlayerIsOnGround = True Then
		Print EntityY(Pivot)
		 'MoveEntity Pivot,0,20,0
	YAcceleration=ENERGY
		Print EntityY(Pivot)
			EndIf
	
	If (KeyHit(KEY_R)) 'print coordinates for reference
Print EntityX(Pivot)
Print EntityY(Pivot)
Print EntityZ(Pivot)
EndIf


If  PlayerTime<MilliSecs() 'And YAcceleration<>0
	PlayerTime = MilliSecs()+ MOTION
	 	YAcceleration   = YAcceleration - GRAVITY
	MoveEntity Pivot, 0,YAcceleration,0
	Print EntityY(Pivot)
	If EntityY(Pivot)<0
		'  auto floor collision or:
		 'PositionEntity Pivot, EntityX(Pivot), 0 , EntityZ(Pivot)
		YAcceleration=0
	EndIf
EndIf

Local WhoCollided:TEntity = EntityCollided(pivot,GroupEnvironment)
If WhoCollided=terrain
     Print "Entity has collided with the terrain"
PlayerIsOnGround = True
Else

PlayerIsOnGround = False
Print "player isnt colliding with anything"
	EndIf
	
	

	UpdateWorld
	RenderWorld
	Flip 1

'Text 0,0,"Use cursor keys to move about the terrain"

Flip


Until AppTerminate() Or KeyHit(KEY_ESCAPE) 
