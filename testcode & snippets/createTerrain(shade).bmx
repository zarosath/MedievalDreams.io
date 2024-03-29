' CreateTerrain.bmx

Strict

Framework openb3d.b3dglgraphics

Graphics3D 800,600,32,1


Local FpsTimer, FpsTicks, fps:Int
Local camera:TCamera=CreateCamera()
PositionEntity camera,130,1,-130
TurnEntity camera,0,50,0

Local light:TLight=CreateLight()
RotateEntity light,90,0,0

' sky
Local sky:TMesh=CreateSphere(32)
Local tex:TTexture=LoadTexture("sky.bmp")
ScaleTexture tex,0.5,0.5
EntityTexture sky,tex
ScaleEntity sky,500,500,500
EntityFX sky,1
FlipMesh sky


' Create terrain
Local terrain:TTerrain=LoadTerrain("terrain.bmp")

' Texture terrain
Local grass_tex:TTexture=LoadTexture( "texture.jpg" )
Local colortex:TTexture=LoadTexture("texture.jpg")
Local normaltex:TTexture=LoadTexture("tnormals.png")
Local spectex:TTexture=LoadTexture("specmap.png")
Local shader:TShader=LoadShader("","shaders/bumpmap.vert.glsl","shaders/bumpmap.frag.glsl")
Local es#=0.2
EntityShininess(terrain,es)


ShaderTexture(shader,colortex,"colorMap",0)
ShaderTexture(shader,normaltex,"normalMap",1)
SetFloat3(shader,"vTangent",0.1,0.1,0.1)
SetFloat(shader,"invRadius",0.01)
ShadeEntity(terrain,shader)
EntityTexture terrain,grass_tex
ScaleEntity terrain,1,1,1
ScaleEntity camera,0.1,0.1,0.1

RenderWorld
TLight.GetLightValues()
TLight.specular[1,0]=200/255.0 ; TLight.specular[1,1]=100/255.0 ; TLight.specular[1,2]=100/255.0

' init mouselook
Local elapsed%
Local time%=MilliSecs()
HideMouse
MoveMouse 0,0


While Not KeyDown( KEY_ESCAPE )

If (MilliSecs() - fpsTimer > 1000)
	fpsTimer = MilliSecs()
	fps = fpsTicks
	fpsTicks = 0
Else
	fpsTicks = fpsTicks + 1
EndIf

MouseLook(pivot,camera,time,elapsed)

	If KeyDown( KEY_RIGHT )=True Then TurnEntity camera,0,-1,0
	If KeyDown( KEY_LEFT )=True Then TurnEntity camera,0,1,0
	If KeyDown( KEY_DOWN )=True Then MoveEntity camera,0,0,-1
	If KeyDown( KEY_UP )=True Then MoveEntity camera,0,0,1
	If KeyDown( key_W )=True Then MoveEntity camera,0,1,0
	If KeyDown( key_S )=True Then MoveEntity camera,0,-1,0
	
	RenderWorld
	
	Text 0,0,"Use cursor keys to move about the terrain"+EntityX(camera)+" "+EntityZ(camera)
	Text 0,10,"fps: "+fps
	
	Flip
Wend
' camera mouselook (from firepaint3d.bb)
Function MouseLook( pivot:TPivot,camera:TCamera,time%,elapsed% )

	Repeat
		elapsed=MilliSecs()-time
	Until elapsed>0
	
	time=time+elapsed
	Local dt#=elapsed*60.0/1000.0
	
	Local x_speed#,y_speed#
	
	x_speed=((MouseX()-320)-x_speed)/4+x_speed
	y_speed=((MouseY()-240)-y_speed)/4+y_speed
	MoveMouse 320,240

	TurnEntity pivot,0,-x_speed,0	'turn player Left/Right
	TurnEntity camera,y_speed,0,0	'tilt camera
	
End Function

End
