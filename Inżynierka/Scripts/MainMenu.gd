extends Node2D


func _ready():
	AutoloadMusic.play()



func _on_On_pressed():
	AutoloadMusic.on_volume()


func _on_Off_pressed():
	AutoloadMusic.off_volume()


func _on_VolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
