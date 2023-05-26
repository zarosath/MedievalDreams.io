Rem 
		main client-side game application
EndRem
Strict

Framework openb3d.b3dglgraphics
Import Brl.Gnet
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

Global Host:TGNetHost=CreateGNetHost()

Global LocalPlayer:TGNetObject=CreateGNetObject(Host)

If Host
   Print "Host created."
Else
   Print "Couldnt create local host."
EndIf
If(Client = True) Then Print "Host has connected to the server successfully"

Const GNET_PLAYER_X:Int=0
Const GNET_PLAYER_Y:Int=1



Global Client:Int = GNetConnect(Host,"localhost",12345)

' debug entity landmark
	Local c:TEntity = CreateCylinder()
	ScaleEntity c, 0.2,10,0.2
   	PositionEntity c, 12,0.00000000001,-12
' set collision
Collisions(GroupCharacters,GroupEnvironment,2,2)

Repeat

If(Client = False)
 Print"Host was not able to connect to server"
Exit
EndIf
CameraFunction()



	If KeyDown( KEY_D )=True Then TurnEntity Pivot,0,-1,0
	If KeyDown( KEY_A )=True Then TurnEntity Pivot,0,1,0
	If KeyDown( KEY_S )=True Then MoveEntity Pivot,0,0,-0.1
	If KeyDown( KEY_W )=True Then MoveEntity Pivot,0,0,0.1
	If KeyDown( key_UP )=True Then MoveEntity Pivot,0,0.1,0
	If KeyDown( key_Down )=True Then MoveEntity Pivot,0,-0.1,0
	
		If KeyDown(key_SPACE) And PlayerIsOnGround = True Then
		Print EntityY(Pivot)
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
     'Print "Entity has collided with the terrain"
PlayerIsOnGround = True
Else

PlayerIsOnGround = False
'Print "player isnt colliding with anything"
	EndIf
	
	'Flip

	UpdateWorld
	RenderWorld

'Text 0,0,"Use cursor keys to move about the terrain"




Until AppTerminate() Or KeyHit(KEY_ESCAPE) 
