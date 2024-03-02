Function CheckPick:Object()
' via camera pick from coordinates of cursor
If CameraPick(camera, MouseX(),MouseY()) = Null
Print "returned null: no entity could be picked"
Return
Else
Local Picked:TEntity=PickedEntity()
Print EntityName(picked)

'For Local s:TEntity = EachIn TPlayer.PlayerID.Keys()
    'Print EntityName(Picked) + " = " + String(TPlayer.PlayerID[picked]) ' retrieve value using index operator
'Next


Select EntityName(Picked) ' Switch Case Select for purpose to action of the picked.
Case "playerEntity"
Print "action: how to interact?"
Return tplayer.find(picked)
End Select

EndIf
End Function