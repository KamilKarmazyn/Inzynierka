xtends Button


func _ready():
		connect("pressed", self, "on_button_press")
func on_button_press():
			OS.window_fullscreen = !OS.window_fullscreen
