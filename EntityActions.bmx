

		Function entitykind(entity:TEntity)
		
				If entity = Null
					Return
						Else
				Select EntityName(entity)
				
				Case "playerEntity"
				Print "Player entity selected, action?"
				AttackPlayer(tplayer.find(entity))
		End Select
				EndIf
		End Function


		Function AttackPlayer(Player:Tplayer)

				If EntityDistance(Player.playerentity, me.playerentity) <=1
				Player.removehealth(40)
				If Player.Health=0 Then player.Death(Player)
		End If

	End Function