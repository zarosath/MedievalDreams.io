
'camera

Local camera:TCamera=CreateCamera()
'PositionEntity camera,130,1,-130

' ?? camera player pivot
Local PlayerEyes:TPivot=CreatePivot()
PositionEntity(PlayerEyes,EntityX(PlayerCollider,True),EntityY(PlayerCollider,True)+1.6-0.25,EntityZ(PlayerCollider,True)+0.25)
EntityParent(PlayerEyes,PlayerCollider,True)


Function orbitcamera(cam:TEntity,ent:TEntity,dist#)
Local piv:TPivot=CreatePivot()
PositionEntity piv,EntityX(ent),EntityY(ent),EntityZ(ent)
PositionEntity cam,EntityX(piv),EntityY(piv),EntityZ(piv)
'RotateEntity cam,0,0,0
MoveEntity cam,0,0,-dist
EntityParent cam,piv
TurnEntity piv,Float(MouseXSpeed())*0.6,Float(MouseYSpeed())*0.6,Float(MouseZSpeed())*0.6 'mouse control
'FreeEntity piv

End Function