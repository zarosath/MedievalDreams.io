'; CreateTerrain Example 
'; --------------------- 
Framework openb3d.b3dglgraphics
DebugStop
Graphics3D GraphicsWidth(),GraphicsHeight(), 32, 0

Local camera:TCamera=CreateCamera() 
PositionEntity camera,0.3,2,-2.5

Local light:TLight=CreateLight() 
RotateEntity light,90,0,0 

'; Create terrain 
Local terrain:TTerrain=CreateTerrain(128) 

'; Texture terrain 
Local grass_tex:TTexture=LoadTexture( "./grass.jpg" ) 
EntityTexture terrain,grass_tex 

While Not KeyDown(KEY_ESCAPE) 

If KeyDown(KEY_A)=True Then TurnEntity camera,0,-1,0 
If KeyDown(KEY_D)=True Then TurnEntity camera,0,1,0 
If KeyDown(KEY_W)=True Then MoveEntity camera,0,0,-0.05 
If KeyDown(KEY_S)=True Then MoveEntity camera,0,0,0.05 

RenderWorld 

Text 0,0,"Use cursor keys to move about the terrain" 

Flip 

Wend 
EndGraphics()
End  