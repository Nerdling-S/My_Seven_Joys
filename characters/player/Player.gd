extends KinematicBody2D

var velocity = Vector2(0,0)

var gravity = 1
var jump_strength = 120

var midair = false

func _unhandled_input(event):
	if event.is_action("game_jump") && !midair:
		velocity.y = -jump_strength
		midair = true

func _physics_process(delta):
	
	velocity.y += gravity
	
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info && midair:
		if collision_info.get_position().y >= position.y:
			midair = false
			print(collision_info.collider)