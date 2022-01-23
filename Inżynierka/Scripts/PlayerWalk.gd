extends KinematicBody2D
var gravity
var dead = false
const MC = "Player"
const Speed = 20
const knockback = 200
const jump = -800
const Up = Vector2(0, -1)
export (int) var health = 3 
export (int) var coin = 3 
export (int) var chest = 3 
export (int) var gem = 3 
var velocity = Vector2(0,0)
var rushLeft = true
var friction = 20
const Max_speed = 300
var on_ladder = false
var vertical_speed = 100
onready var raycast = $RayCast2D
onready var detector = $Detector
var motion = Vector2()

func _ready():
	GlobalHp.Player = null

func _process(delta):
	Move_Hero()
	QuitGame()

func Move_Hero():
	var Move = Vector2.ZERO
	gravity = 30
	Move.y += gravity	
	if not dead and not $AnimatedSprite.animation == "Auc":
		if Input.is_action_pressed("ui_right"):
			$AnimatedSprite.flip_h = false
			Move.x += Speed
		if Input.is_action_pressed("ui_left"):
			$AnimatedSprite.flip_h = true
			Move.x -= Speed
		print(Move)
		if Move.x:
			$AnimatedSprite.play("walk")
		else: 
			$AnimatedSprite.play("stop")
			if velocity.x >= 0:
				velocity.x = max(velocity.x - friction,0)
			else:
				velocity.x = min(velocity.x + friction,0)
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				on_ladder = false
				Move.y = jump
	velocity += Move
	velocity.x = clamp(velocity.x, -Max_speed, Max_speed)
	velocity = move_and_slide(velocity, Up)
	print(health)

				
func _on_AttackDetector_body_entered(body):
	if Input.is_action_pressed("Left_mouse_button"):
		$AnimatedSprite.play("Attack")
	pass # Replace with function body.



func _on_Hitbox_area_entered(area):
	if area.is_in_group("BadGuy"):
		$AnimatedSprite.play("Auc")
		velocity.x = -knockback if rushLeft else knockback
		velocity.y -= 1000
		health -= 1
		get_parent().find_node("UI").find_node("HealthSprite").frame -= 1
		if health <= 0 and not dead:
			$AnimatedSprite.play("Dead")
			dead = true

func _on_Hitbox2_area_entered(area):
		if area.is_in_group("BadGuy"):
			$AnimatedSprite.play("Auc")
			velocity.x = knockback if rushLeft else -knockback
			velocity.y -= 500
			health -= 1
			get_parent().find_node("UI").find_node("HealthSprite").frame -= 1
		if health <= 0 and not dead:
			$AnimatedSprite.play("Dead")
			dead = true

func QuitGame():
	if Input.is_action_pressed("Quit"):
		get_tree().quit()




func _on_AnimatedSprite_animation_finished():
	if ($AnimatedSprite.animation == "Dead"):
			get_tree().reload_current_scene()
	if ($AnimatedSprite.animation == "Auc"):
		$AnimatedSprite.play("stop")


func _on_CoinBox_area_entered(area):
	if area.is_in_group("Coin"):
		coin += 1
		get_parent().find_node("Tresure").find_node("Coin").frame += 1
	if area.is_in_group("Chest"):
		chest += 1
		get_parent().find_node("Tresure").find_node("Chest").frame += 1
	if area.is_in_group("Gem"):
		chest += 1
		get_parent().find_node("Tresure").find_node("Gem").frame += 1
