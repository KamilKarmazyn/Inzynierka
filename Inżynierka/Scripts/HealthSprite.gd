extends Sprite

func health():
		if GlobalHp.Player != null:
			frame = GlobalHp.Player.health

