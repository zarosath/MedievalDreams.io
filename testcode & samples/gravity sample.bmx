SuperStrict
' simple gravity example

Graphics 800,600

Const GRAVITY:Float = 0.1   ' the worlds gravity         lower= less gravity
Const ELASTIC:Float = 0.8   ' the floor's elastic factor 0 = no trampolin effect
Const ENERGY :Float = 7     ' the initital energy (by a jump, or by a shoot)
Const MOTION :Int   = 10    ' the video speed            higher =  Slow Motion

Global YSpeed:Float  ' the ball's y-speed positiv=rises up, negativ=falling down

Global ballX:Float, ballY:Float, ballTimer:Int
Repeat
	Cls
	If KeyHit(KEY_SPACE)
		ySpeed = ENERGY
		ballX  = 50	
	EndIf
	CalculateBall
	SetColor 0,255,0
	DrawLine 0,500,800,500
	DrawText "Press SPACE to kick the balls into the sky", 100,100
	SetColor 255,0,0
	DrawOval 30, 490-ballY,10,10
	SetColor 255,255,0
	DrawOval ballX, 490-ballY,10,10
	Flip 0
Until AppTerminate() 



Function CalculateBall()
	If ballTimer<MilliSecs()
		ballTimer = MilliSecs() + MOTION
		ySpeed   = ySpeed - GRAVITY
		ballY  = ballY + ySpeed
		ballx  = ballX + 1
		If ballY<0
			  ballY=0
			  YSpeed   = -YSpeed*ELASTIC
		EndIf
	EndIf
End Function 
