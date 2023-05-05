

' TODO: Tweakable keybindings and speeds

Function MouseLook(pivot:TMesh, camera:TCamera, time:Long )
	Local elapsed:Long
	
	Repeat
		elapsed=MilliSecs()-time
	Until elapsed>0
	
	time=time+elapsed
	Local dt#=elapsed*60.0/1000.0
	
	Local x_speed:Float, y_speed:Float
	
	x_speed=((MouseX()-320)-x_speed)/8+x_speed
	y_speed=((MouseY()-240)-y_speed)/8+y_speed
	MoveMouse 320,240

	TurnEntity pivot,0,(-x_speed),0	'turn player Left/Right
	TurnEntity camera,y_speed,0,0	'tilt camera
	
End Function

Function Move(ent:TMesh)
	If KeyDown( KEY_W )=True Then MoveEntity ent, 0, 0, 0.05
	If KeyDown( KEY_A )=True Then MoveEntity ent, -0.05, 0, 0
	If KeyDown( KEY_S )=True Then MoveEntity ent, 0,0, -0.05
	If KeyDown( KEY_D )=True Then MoveEntity ent, 0.05, 0, 0
End Function
