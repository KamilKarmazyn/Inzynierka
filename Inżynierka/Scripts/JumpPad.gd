extends Area2D

func _on_JumpPad_body_entered(body):
	if body.is_in_group("Player"):
		$AnimatedSprite.play("jump")
		body.velocity.y = -1100
		body.move_and_slide(body.velocity)



func _on_AnimatedSprite_animation_finished():
	if ($AnimatedSprite.animation == "jump"):
		$AnimatedSprite.play("stop")
