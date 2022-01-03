extends Node

var Menu = load("res://music/bensound-instinct.ogg")

func _ready():
	pass

func play():
	$music.stream = Menu  
	$music.play()

func off_volume():
	$music.volume_db = 100
	
func on_volume():
	$music.volume_db = 1
	
