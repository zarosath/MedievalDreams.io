Function CheckPick()

' via camera pick from coordinates of cursor
If CameraPick(camera, MouseX(),MouseY()) = Null
Print "returned null: no entity could be picked"
Return
Else
Local picked:TEntity=PickedEntity()
Print EntityName(picked)

Select EntityName(picked) ' Switch Case Select for purpose of action to the picked.
Case "playerEntity"
Select EntityName(picked)
endselect
Print "action: how to interact?"
End Select

EndIf
End Function