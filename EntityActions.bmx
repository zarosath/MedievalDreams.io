

		Function entityaction(entity:TEntity)
		If entity <> Null
		
		Rem ToDo: code id system for all loaded entities? not sure. also need to remove player from map when a player disconnects
		End Rem
				Select EntityName(entity)
				
				Case "playerEntity"
						Local id:Int = String(TPlayer.PlayerIDmap[entity]).ToInt()
						Print("Player ID "+id)
							Print "Player entity selected, action?"
								AttackPlayer(tplayer.find(id))
		End Select
				EndIf
		End Function


		Function AttackPlayer(Player:Tplayer)

				If EntityDistance(Player.playerentity, me.playerentity) <=1
				Player.removehealth(40)
				If Player.Health=0 Then player.Death(Player)
		End If

	End Function