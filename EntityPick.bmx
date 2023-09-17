Function click()
If MouseHit(1)
If PickedEntity !=Null
Print EntityName(CameraPick(camera, MouseX(),MouseY()))
Print EntityName(PickedEntity())
EndIf
EndIf
End Function