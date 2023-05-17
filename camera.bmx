'camera-
Global camera:TCamera=CreateCamera(Pivot)
Global x_speed:Float
Global y_speed:Float
Global cameracontrol:Int = True
PositionEntity( Camera, 0.3, 2, -2.5 )
CameraRange( Camera, 0.1, 100 )



Function orbitcamera(cam:TEntity,ent:TEntity,dist#) ' unused - saving for reference
Local piv:TPivot=CreatePivot()
PositionEntity piv,EntityX(ent),EntityY(ent),EntityZ(ent)
PositionEntity cam,EntityX(piv),EntityY(piv),EntityZ(piv)
'RotateEntity cam,0,0,0
MoveEntity cam,0,0,-dist
EntityParent cam,piv
TurnEntity piv,Float(MouseXSpeed())*0.6,Float(MouseYSpeed())*0.6,Float(MouseZSpeed())*0.6 'mouse control
'FreeEntity piv

End Function


Function CameraFunction()

 If KeyHit(KEY_TAB)
    If cameracontrol = False
        cameracontrol = True
    Else
        cameracontrol = False
    EndIf
EndIf
If (cameracontrol = True)
Text 0,0,"camera control = true"
	x_speed = ((MouseX()-GraphicsWidth()/2)-x_speed)/8+x_speed
	y_speed = ((MouseY()-GraphicsHeight()/2)-y_speed)/8+y_speed
	MoveMouse (GraphicsWidth()/2,GraphicsHeight()/2)
	TurnEntity Pivot, 0, -x_speed , 0
	'If Abs(EntityYaw(Camera) + y_speed)<45
	    TurnEntity Camera, y_speed, 0 , 0
	'EndIf
	Else
	Text 0,0,"cameracontrol = false"
	RotateEntity Camera,0,0,0   ' RESETs the camera !!! 
EndIf
End Function

