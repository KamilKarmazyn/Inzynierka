extends Sprite

func _on_Area2D_body_entered(body):
	if  body.is_in_group("Player"):
		get_tree().change_scene("res://Scene/Thanks.tscn")
