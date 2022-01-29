extends KinematicBody2D

var gravity = 10
var velocity = Vector2(0,0)
var rushLeft = true

var speed = 60

func _ready():
	$AnimatedSprite.play("Walk")
	
func _process(delta):
	
	move_character()
	detect_turn_around()

func move_character():
	velocity.x = -speed if rushLeft else speed
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
	
func detect_turn_around():
	if not $RayCast2D.is_colliding() and not is_on_floor() or is_on_wall():
		rushLeft = !rushLeft
		scale.x = -scale.x
	
func _on_MCDetector_body_entered(body):
	if  body.is_in_group("Player"):
		$AnimatedSprite.play("Attack")
		
func _on_MCDetector_body_exited(body):
	if  body.is_in_group("Player"):
		$AnimatedSprite.play("Walk")
