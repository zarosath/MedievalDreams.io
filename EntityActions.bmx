


		Function AttackPlayer(Player:Tplayer)

				If EntityDistance(Player.playerentity, me.playerentity) <=1
				Player.removehealth(40)
				If Player.Health=0 Then player.Death(Player)
		End If

	End Function