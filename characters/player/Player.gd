extends KinematicBody2D

var velocity = Vector2(0,0)

var gravity = 750

var jump_strength = 220

var run_speed = 100

func poll_input():
	velocity.x = 0
	if Input.is_action_pressed("game_jump") && is_on_floor():
		velocity.y = -jump_strength
		
	if Input.is_action_pressed("game_right"):
		velocity.x += run_speed
		
	if Input.is_action_pressed("game_left"):
		velocity.x -= run_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	
	poll_input()
	
	var collision_info
	
	collision_info = move_and_collide(velocity * delta)
	
	velocity = move_and_slide(velocity, Vector2(0,-1))