extends Control

#var hearth = 3 setget set_hearth
#var max_hearth = 3 setget set_max_hearth

#onready var label = $Label

#func set_hearth(value):
#	hearth = clamp(value, 0, max_hearth)

#func set_max_hearth(value):
#	max_hearth = max(value, 1)
	
#func _ready():
#	self.max_hearth = PlayerStats.max_hearth
#	self.hearth = PlayerStats.hearth
#	PlayerStats.connect("Hearth_changed", self, "set_hearts")
