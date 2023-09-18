Function click()

' via camera pick from coordinates of cursor
If CameraPick(camera, MouseX(),MouseY()) = Null
Print "returned null: no entity could be picked"
Return
Else
Local picked:TEntity=PickedEntity()
Print EntityName(picked)


EndIf
End Function