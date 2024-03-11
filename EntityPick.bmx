Global Pick:TEntity
Global Picked:TEntity

Function GetPick:Tentity()
Pick = CameraPick(camera, MouseX(),MouseY())
Picked = PickedEntity()
If Pick = Null
?Debug
Print "Returned Null: no entity was picked"
?
Return Null
Else
?Debug
Print EntityName(Picked)
Print "Entity object to string: "+Picked.ToString()
?
Return Picked
EndIf
End Function
