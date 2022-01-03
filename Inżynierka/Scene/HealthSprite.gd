extends Sprite

func _process(delta):
	if GlobalHp.Player != null:
		frame = GlobalHp.Player.health
