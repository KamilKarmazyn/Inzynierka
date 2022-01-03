extends Node2D


export var ladder_tile = 1
var tile_size = 16
var ladder_height = ladder_tile * tile_size
onready var ladderArea = $LadderArea
onready var ladderAreaColl = $LadderArea/LadderAreaColl
onready var ladderTop = $LadderTop
onready var ladderTopColl = $LadderTop/LadderTopColl

func LadderSetup():
	ladder_height = ladder_tile * tile_size

	ladderAreaColl.shape.extents = Vector2(tile_size/2, ladder_height/2) 
	var ladder_area_extents = ladderAreaColl.shape.get_extents()
	ladderArea.position.y = -ladder_area_extents.y
	
	var ladder_top_extents = ladderTopColl.shape.get_extents()
	ladderTop.position.y = -ladder_area_extents.y * 2 + ladder_top_extents.y
	ladderTopColl.one_way_collision_margin = 0.1

func _ready():
	LadderSetup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
