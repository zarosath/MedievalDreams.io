'; CreateTerrain Example 
'; --------------------- 
Framework openb3d.b3dglgraphics
DebugStop
Graphics3D 640,480, 32, 1

Local camera:TCamera=CreateCamera() 
PositionEntity camera,0,1,0 

Local light:TLight=CreateLight() 
RotateEntity light,90,0,0 

'; Create terrain 
Local terrain:TTerrain=CreateTerrain(128) 

'; Texture terrain 
Local grass_tex:TTexture=LoadTexture( "../media/zone/grass.jpg" ) 
EntityTexture terrain,grass_tex 

While Not KeyDown(KEY_ESCAPE) 

If KeyDown(Key_W)=True Then TurnEntity camera,0,-1,0 
If KeyDown(Key_A)=True Then TurnEntity camera,0,1,0 
If KeyDown(Key_S)=True Then MoveEntity camera,0,0,-0.05 
If KeyDown(Key_D)=True Then MoveEntity camera,0,0,0.05 

RenderWorld 

Text 0,0,"Use cursor keys to move about the terrain" 

Flip 

Wend 
EndGraphics()
End  