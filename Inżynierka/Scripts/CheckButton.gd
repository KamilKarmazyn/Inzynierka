extends CheckButton


func _ready():
	pass # Replace with function body.



func _on_CheckButton_toggled(button_pressed):
	if(button_pressed):
		AutoloadMusic.on_volume()
	else:
		AutoloadMusic.off_volume()
