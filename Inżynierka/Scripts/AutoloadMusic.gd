extends Node

var Menu = load("res://music/2021-08-30_-_Boss_Time_-_www.FesliyanStudios.com.ogg")

func _ready():
	pass

func play():
	$music.stream = Menu  
	$music.play()

func off_volume():
	$music.volume_db = 100
	
func on_volume():
	$music.volume_db = 1
	
