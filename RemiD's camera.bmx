SuperStrict

Import openb3d.b3dglgraphics

Graphics3D 800,600,0,2

' world
Local Floor:TEntity = CreatePlane()
EntityColor  Floor, 0, 99, 0

SeedRnd MilliSecs()
For Local  i%=0 To 30
	Local c:TEntity = CreateCylinder()
	ScaleEntity c, 0.2,10,0.2
   	PositionEntity c, -10,-2,-100 + i*10

Next
For Local  i%=0 To 10
	Local c:TEntity = CreateCube()
	EntityColor  c, Rand(255),Rand(255),Rand(255)
	ScaleEntity c, 2 , 4, 2
   	PositionEntity c, Rand(-60,60),1, Rand(-60,60)	
   	TurnEntity c, 0, Rand(360),0	
Next


' light
Global Light:TLight = CreateLight(1)
LightRange Light,1000
PositionEntity Light, 10,50,20


' man
Global Pivot:TEntity = CreatePivot()
Global Man:TEntity = CreateCubicMan()
EntityParent Man, pivot
PositionEntity Man,0,0.75,0

' camera
Global Camera:TCamera = CreateCamera(Pivot)
PositionEntity( Camera, 0.3, 2, -2.5 )
CameraRange( Camera, 0.1, 100 )


Repeat
	Movements

	Cls
	UpdateWorld
	RenderWorld
	Flip 1
Until KeyHit(1)


Function Movements()
	If KeyDown(KEY_UP) 	MoveEntity Pivot, 0, 0   , 0.1
	If KeyDown(KEY_RIGHT) TurnEntity Pivot, 0, -1 , 0
	If KeyDown(KEY_LEFT) TurnEntity Pivot, 0, +1 , 0
End Function

		
Function CreateCubicMan:TEntity()		
		Local mesh:TEntity = CreatePivot()		

		Local head:TMesh  = CreateSphere(32)
		ScaleMesh    head, 0.25, 0.30, 0.25
		PositionMesh head, 0, 0.92, 0		
		EntityColor  head, 255,155,111
		EntityParent head, Mesh


		Local chest:TMesh = CreateCube()
		ScaleMesh    chest, 0.24, 0.3, 0.1
		PositionMesh chest, 0, 0.27, 0		
		EntityColor  chest, 255,0,111
		EntityParent chest, Mesh


		Local arms:TMesh = CreateCube()
		ScaleMesh    arms, 0.85, 0.08, 0.08
		PositionMesh arms, 0, 0.6, 0		
		EntityColor  arms, 255,0,111
		EntityParent arms, Mesh

		Local hips:TMesh = CreateCube()
		ScaleMesh    hips, 0.26, 0.15, 0.11
		PositionMesh hips, 0, 0, 0		
		EntityColor  hips, 255,255,0
		EntityParent hips, Mesh


		Local leg1:TMesh = CreateCylinder()
		ScaleMesh    leg1, 0.08, 0.4, 0.08
		PositionMesh leg1, -0.15, -0.4, 0		
		EntityColor  leg1, 255,155,111
		EntityParent leg1, Mesh

		Local leg2:TMesh = CreateCylinder()
		ScaleMesh    leg2, 0.08, 0.4, 0.08
		PositionMesh leg2, +0.15, -0.4, 0		
		EntityColor  leg2, 255,155,111
		EntityParent leg2, Mesh

		Return mesh
End Function