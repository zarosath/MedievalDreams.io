Rem 
		main client-side game application
EndRem
Strict

Framework openb3d.b3dglgraphics
Import Brl.Gnet
Import brl.threads
Import blide.deltatiming
'DebugStop
Graphics3D 840,600,0,2

Include "createTerrain.bmx"
Include "player.bmx"
Include "Gnet.bmx"


Local port:Int = 12345
Local address:String = "localhost"
'variables
Const GroupEnvironment% = 2
Const GroupCharacters% = 3
Const pivots:Int = 4

Const GRAVITY:Float = 0.1
Const  ENERGY:Float = 1.5
Const  MOTION:Int   = 20
Global YAcceleration:Float
Global PlayerTime:Int
Global playerjumped:Int
Global Startmenu:Int = False
Global exitapp:Int=False


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
Rem
so we Include these bmx files down here For until clients me.tplayer instance Not yet 
End Rem
Include "camera.bmx"
Include "EntityPick.bmx"
	me.SendX()
		me.SendY()
				me.SendZ()
					'send player position after TPlayer GNetobject is created
' debug entity landmark
	Local c:TEntity = CreateCylinder()
	ScaleEntity c, 0.2,10,0.2
   	PositionEntity c, 12,0,-12

' set collision
Collisions(GroupCharacters,GroupEnvironment,2,3)
Collisions(GroupCharacters,GroupCharacters,1,3)

Rem
load test And Or preload player entities
TODO: create preload cache system for multi-repurposing player entities
End Rem
Local entitycopythread:TThread=CreateThread(entitycopy, "")
Function entitycopy:Object(data:Object)
For Local i=1 To 200
If (exitapp=True)
Exit
EndIf
'Local bots:TPlayer = New TPlayer
'bots.newID()
'bots.printID()
'Print "ModelPreload_"+i
Next
End Function

Type FPS
    Global Counter, time, TFPS

    Function Calc%()
        Counter:+1
        If time < MilliSecs()
            TFPS = Counter ' <- Frames/Sec
             time = MilliSecs() + 1000 'Update
             Counter = 0
        End If
        Return TFPS
    End Function
End Type

Function Rungame()

End Function

' Main Loop
While (exitapp=False)
If(AppTerminate() Or KeyHit(KEY_ESCAPE))
exitapp=True
' wait thread because we need to be sure it exits the loop via exitapp=true so it does not segment fault
WaitThread(entitycopythread)
EndIf
If (exitapp=True)
DetachThread(entitycopythread)
Print("thread EntityCopyThread Detached")
CloseGNetObject(me.GObj)
Delay 500
Print"PlayerNetobject closed"
CloseGNetHost(Host)
Print "host closed"
Exit
EndIf
'Repeat

If Startmenu = True

'Return
Else

EndIf
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
	
			If KeyDown(key_SPACE) And me.PlayerIsOnGround = True Then
					playerJumped=True
					YAcceleration=ENERGY
			EndIf
	
	'if left mouse button was hit
	If MouseHit(1)
	CheckPick() ' entity pick
	EndIf
	
	
	' Gravity and jumping function
If  PlayerTime<MilliSecs() And me.PlayerIsOnGround=False
	PlayerTime = MilliSecs()+ MOTION
	
	 	YAcceleration = YAcceleration - GRAVITY

	MoveEntity me.Pivot, 0,YAcceleration,0
	'Print EntityY(Pivot)
	If EntityY(me.Pivot)<0
		'  auto floor collision or:
	EndIf
EndIf

Local pX:Float = EntityX(me.pivot)
Local pY:Float = EntityY(me.pivot)
Local pZ:Float = EntityZ(me.pivot)


Local WhoCollided:TEntity = EntityCollided(me.pivot,GroupEnvironment)
If WhoCollided=terrain
me.PlayerIsOnGround = True
ElseIf EntityY(me.pivot) > ( TerrainY(terrain, pX, pY, pZ))
me.PlayerIsOnGround = False
	EndIf

			'Update player location and rotation upon changes
	If EntityX(me.pivot) <> me.X() Then me.SendX()
		If EntityY(me.pivot) <> me.Y() Then me.SendY()
			If EntityZ(me.pivot) <> me.Z() Then me.SendZ()
			
				If EntityPitch(me.pivot) <> me.Pitch() Then me.SendPitch()
		If EntityYaw(me.pivot) <> me.Yaw() Then me.SendYaw()
			If EntityRoll(me.pivot) <> me.Roll() Then me.SendRoll()
		
		
		
		   GNetSync(Host)
	ScanGnet()
	If (KeyHit(KEY_R)) 'print coordinates for reference
	Print "pivot coordinates"
Print EntityX(me.pivot)
Print EntityY(me.pivot)
Print EntityZ(me.pivot)
Print "playerentity coordinates"
Print EntityX(me.playerentity, True)
Print EntityY(me.playerentity, True)
Print EntityZ(me.playerentity, True)
EndIf

	UpdateWorld
	RenderWorld
	'text command function must go here under update/renderworld
		Text 5,5,"Your FPS: "+FPS.Calc() 'This goes in main-loop
		'DrawText("Current deltatime: " + Delta.Factor(), 0, 40)
		Text 20,20,"use mouse and WASD from keyboard to move"
		Flip

Wend ' End Main Loop