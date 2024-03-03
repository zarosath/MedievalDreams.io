Global Pick:TEntity
Global Picked:TEntity

Function GetPick:TEntity()
Pick = CameraPick(camera, MouseX(),MouseY())
Picked = PickedEntity()
If Pick = Null
?Debug
Print "Returned Null: no entity was picked"
?
Return null
Else
?Debug
Print EntityName(Picked)
Print Picked.ToString()
?
Return Picked
EndIf
End Function