extends Area2D




func _on_GemBox_area_entered(area):
	if area.is_in_group("Player"):
		queue_free()
