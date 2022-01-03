extends KinematicBody2D



func _on_Area2D_body_entered(body):
	if body.get("MC") == "Player":
		get_tree().change_scene("res://Scene/GameScena.tscn")
pass 


