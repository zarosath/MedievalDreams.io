
'main program
Strict

Framework openb3d.b3dglgraphics
Import "CameraFunctions.bmx"
Graphics3D 800,600, 0, 3
Local camera:TCamera=CreateCamera()
Include "createTerrain.bmx"
Local light:TLight=CreateLight()
RotateEntity light,0,0,0

' load player mesh
Local Player:TMesh=LoadAnimMesh("Media/models/Player/player.b3d")
ScaleEntity Player,1,1,1

While Not KeyDown( KEY_ESCAPE )

	MouseLook(Player, Camera, MilliSecs())
	Move(Player)
RenderWorld

Flip
Wend