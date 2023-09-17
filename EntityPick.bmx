Function click()
If MouseHit(1)
If CameraPick(camera, MouseX(),MouseY()) = Null
Print "returned null: no entity could be picked"
Return
EndIf
Print EntityName(CameraPick(camera, MouseX(),MouseY()))
If PickedEntity !=Null
Print EntityName(PickedEntity())
EndIf
EndIf
End Function