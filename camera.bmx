'camera-
Global camera:TCamera=CreateCamera(Pivot)
Global x_speed:Float
Global y_speed:Float
Global cameracontrol:Int = True
PositionEntity( Camera, 0.3, 2, -2.5 )
CameraRange( Camera, 0.1, 100 )


Function CameraFunction()

 If KeyHit(KEY_TAB)
    If cameracontrol = False
        cameracontrol = True
    Else
        cameracontrol = False
    EndIf
EndIf
If (cameracontrol = True)
	HideMouse()
Text 0,0,"camera control = true"
	x_speed = ((MouseX()-GraphicsWidth()/2)-x_speed)/8+x_speed
	y_speed = ((MouseY()-GraphicsHeight()/2)-y_speed)/8+y_speed
	MoveMouse (GraphicsWidth()/2,GraphicsHeight()/2)
	TurnEntity Pivot, 0, -x_speed , 0
	If Abs(EntityPitch(Camera) + y_speed)<30
			TurnEntity Camera, y_speed, 0 , 0
	EndIf
	Else
		ShowMouse()
		Text 0,0,"cameracontrol = false"
			RotateEntity Camera,0,0,0   ' RESETs the camera !!! 
EndIf
End Function

