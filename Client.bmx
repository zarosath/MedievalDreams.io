Rem 
		main client-side game application
EndRem
Strict

Rem
Test visual studio commit.
end rem
Framework openb3d.b3dglgraphics
Import Brl.Gnet

Graphics3D 800,600, 0, 3

Include "createTerrain.bmx"
Include "player.bmx"
Include "PlayerNet.bmx"

Local port:Int = 12345
Local address:String = "localhost"
'variables
Const GroupEnvironment% = 2
Const GroupCharacters% = 3

Const GRAVITY:Float = 0.1
Const  ENERGY:Float = 1.5
Const  MOTION:Int   = 20
Global YAcceleration:Float
Global PlayerTime:Int
Global playerjumped:Int

						' instance of network objects
						Global Host:TGNetHost=CreateGNetHost()
						Global Client:Int = GNetConnect(Host,address,port)						
' Light the world, todo;maybe put the lighting in bmx zone file. for now it is in main.
Local light:TLight=CreateLight()
RotateEntity light,90,0,0

If Host
   Print "Host created."
Else
   Print "Couldnt create local host."
EndIf

If(Client = True)
Print "Host has connected to the server successfully"
	Else
				Print"Host was not able to connect to server"
				CloseGNetHost(Host)
Print "host closed"
			Return
	EndIf
						Global me:TPlayer = TPlayer.AddMe("client")
Include "camera.bmx"
Include "EntityPick.bmx"
	me.SendX()
		me.SendY()
				me.SendZ()
					'send player position after tplayer GNetobject is created
' debug entity landmark
	Local c:TEntity = CreateCylinder()
	ScaleEntity c, 0.2,10,0.2
   	PositionEntity c, 12,0.00000000001,-12
' set collision
Collisions(GroupCharacters,GroupEnvironment,2,2)
'Collisions(GroupCharacters,GroupCharacters,2,2)


Repeat


CameraFunction()
	
	If KeyDown( KEY_D )=True
	MoveEntity me.Pivot,0.1,0,0
	EndIf
	If KeyDown( KEY_S )=True
	MoveEntity me.Pivot,0,0,-0.1
	EndIf
	If KeyDown( KEY_A )=True
	MoveEntity me.Pivot,-0.1,0,0
	EndIf
	If KeyDown( KEY_W )=True
	MoveEntity me.Pivot,0,0,0.1
	EndIf
	If KeyDown( key_UP )=True
	MoveEntity me.Pivot,0,0.1,0
	EndIf
	If KeyDown( key_Down )=True
	MoveEntity me.Pivot,0,-0.1,0
	EndIf
	
	Click()
	
	' Gravity and jumping function
If  PlayerTime<MilliSecs() 'And YAcceleration<>0
	PlayerTime = MilliSecs()+ MOTION
	 	YAcceleration = YAcceleration - GRAVITY
	MoveEntity me.Pivot, 0,YAcceleration,0
	'Print EntityY(Pivot)
	If EntityY(me.Pivot)<0.1
		'  auto floor collision or:
		 'PositionEntity me.Pivot, EntityX(me.Pivot), 1 , EntityZ(me.Pivot)
		YAcceleration=0
	EndIf
EndIf

Local WhoCollided:TEntity = EntityCollided(me.pivot,GroupEnvironment)
If WhoCollided=terrain
     'Print "Entity has collided with the terrain"
PlayerIsOnGround = True
Else

PlayerIsOnGround = False
'Print "player isnt colliding with anything"
	EndIf
	
			'Update player location and rotation upon changes
	If EntityX(me.pivot) <> me.X() Then me.SendX()
		If EntityY(me.pivot) <> me.Y() Then me.SendY()
			If EntityZ(me.pivot) <> me.Z() Then me.SendZ()
			
				If EntityPitch(me.pivot) <> me.Pitch() Then me.SendPitch()
		If EntityYaw(me.pivot) <> me.Yaw() Then me.SendYaw()
			If EntityRoll(me.pivot) <> me.Roll() Then me.SendRoll()
	
		If KeyDown(key_SPACE) And PlayerIsOnGround = True Then
					YAcceleration=ENERGY
			EndIf
		
		
		
		   GNetSync(Host)
	ScanGnet()
	If (KeyHit(KEY_R)) 'print coordinates for reference
Print EntityX(me.pivot)
Print EntityY(me.pivot)
Print EntityZ(me.pivot)
EndIf
	
	UpdateWorld
	RenderWorld
		Flip

'Text 0,0,"Use cursor keys to move about the terrain"




Until AppTerminate() Or KeyHit(KEY_ESCAPE)
CloseGNetObject(me.GObj)
Delay 500
Print"Player object closed"
CloseGNetHost(Host)
Print "host closed"
End