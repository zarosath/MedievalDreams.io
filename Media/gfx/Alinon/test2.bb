 Graphics3D 1024,768,32

  SetBuffer BackBuffer()

  camera=CreateCamera()
 

  ;light=CreateLight()

  house=LoadMesh( "wholetown.3ds" )
  RotateEntity house,0,90,0

  While Not KeyHit(1)

      If KeyDown(200) Then
          MoveEntity camera,0,0,1
      EndIf

      If KeyDown(208) Then
          MoveEntity camera,0,0,-1
      EndIf

      If KeyDown(203) Then
          TurnEntity camera,0,1.0,0
      EndIf

      If KeyDown(205) Then
          TurnEntity camera,0,-1.0,0
      EndIf

  UpdateWorld
  RenderWorld

  Text 335,500,"NEW Town for The Servant"

  Flip

  Wend
  End