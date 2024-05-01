extends State

@export var Groundstate: State
@export var attack1_name : String ="attack1"
@export var attack2_name : String ="attack2"
@export var move_animation : String = "move"

@onready var timer =$Timer

func State_input (event : InputEvent):
	if (event.is_action_pressed("Attack")):
		timer.start()

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == attack1_name):
		if(timer.is_stopped()):
			next_state=Groundstate
			playback.travel(move_animation)
		else :
			playback.travel(attack2_name)

	if (anim_name == attack2_name):
		next_state=Groundstate
		playback.travel(move_animation)
