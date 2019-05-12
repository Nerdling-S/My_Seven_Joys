extends KinematicBody2D


var velocity = Vector2(0,0)

#Strength of Gravity
var gravity = 800

const JUMP_STRENGTH = 300

const RUN_SPEED = 200


#Perform physics operations
func _physics_process(delta):
	#Add gravity with frame normalisation (speed of frames)
	velocity.y += gravity * delta
	
	#See below
	poll_input()
	
	#If standing still, switch to rest pose
	if velocity.x == 0:
		$Sprite.change_anim(0)
		
	#Move in direction of velocity and slide on collision with objects
	#Velocity, Floor Normal (direction of floor)
	velocity = move_and_slide(velocity, Vector2(0,-1))


#Check for Input and act on it
func poll_input():
	#Reset Velocity
	velocity.x = 0
	
	#Up / W / Space / Button 0
	if Input.is_action_pressed("game_jump") && is_on_floor():
		#Point vector upwards
		velocity.y = -JUMP_STRENGTH
		
	#Right / D / L-Stick -> Right
	if Input.is_action_pressed("game_right"):
		#Point vector rightwards
		velocity.x += RUN_SPEED
		#Aim sprite to the right
		$Sprite.scale.x = 1
		#Run animation
		$Sprite.change_anim(1)
		
	#Left / A / L-Stick -> Left
	if Input.is_action_pressed("game_left"):
		#Point vector leftwards
		velocity.x -= RUN_SPEED
		#Aim sprite to the right
		$Sprite.scale.x = -1
		#Run Animation
		$Sprite.change_anim(1)