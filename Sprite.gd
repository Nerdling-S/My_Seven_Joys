extends Sprite

var anim_player

var rest_coll_shape
var run_coll_shape

func _ready():
	anim_player = get_node("../AnimPlayer")
	rest_coll_shape = get_node("../RestCollisionShape")
	run_coll_shape = get_node("../RunCollisionShape")
	
func change_anim(state):
	if state == 0:
		anim_player.stop(true)
		frame = 0
		run_coll_shape.disabled = true
		rest_coll_shape.disabled = false
	elif state == 1:
		anim_player.play("Player_Run_Anim")
		rest_coll_shape.disabled = true
		run_coll_shape.disabled = false