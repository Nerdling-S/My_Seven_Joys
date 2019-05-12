extends Sprite

#Node: AnimPlayer
var anim_player

#Node: RestCollisionShape
var rest_coll_shape
#Node: RunCollisionShape
var run_coll_shape


#Run as node is added to the scene tree (effectively initialisation)
func _ready():
	#Animation Player
	anim_player = get_node("../AnimPlayer")
	#CollisionShape2D's
	rest_coll_shape = get_node("../RestCollisionShape")
	run_coll_shape = get_node("../RunCollisionShape")


#Change animations based on current state
func change_anim(state):
	match state:
		#If at rest
		0:
			#Stop current animation
			anim_player.stop(true)
			#Set to rest pose
			frame = 0
			#Switch to Collision Shape for Rest
			run_coll_shape.disabled = true
			rest_coll_shape.disabled = false
		#If in motion
		1:
			#Play running animation
			anim_player.play("Player_Run_Anim")
			#Switch to Collision Shape for Running
			rest_coll_shape.disabled = true
			run_coll_shape.disabled = false