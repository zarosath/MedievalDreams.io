'main program
Strict

Framework openb3d.b3dglgraphics

Graphics3D 800,600, 0, 3

Include "player.bmx"
Include "camera.bmx"
Include "createTerrain.bmx"
Include "CameraFunctions.bmx"

' Light the world, todo;maybe put the lighting in bmx zone file. for now it is in main.
Local light:TLight=CreateLight()
RotateEntity light,90,0,0


 Repeat

	If KeyDown( KEY_RIGHT )=True Then TurnEntity Pivot,0,-1,0
	If KeyDown( KEY_LEFT )=True Then TurnEntity Pivot,0,1,0
	If KeyDown( KEY_DOWN )=True Then MoveEntity Pivot,0,0,-1
	If KeyDown( KEY_UP )=True Then MoveEntity Pivot,0,0,1
	If KeyDown( key_W )=True Then MoveEntity Pivot,0,1,0
	If KeyDown( key_S )=True Then MoveEntity Pivot,0,-1,0


CameraFunction()

'PositionEntity camera,x#,terra_y#,z#

	
	UpdateWorld
	RenderWorld
	Flip 1

'Text 0,0,"Use cursor keys to move about the terrain"

Flip


Until AppTerminate() Or KeyHit(KEY_ESCAPE) 
