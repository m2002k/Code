extends StateMachine

class_name Ground_state

@export var JUMP_VELOCITY = -250.0
@export var Airstate: StateMachine
@export var Attackstate: StateMachine
@export var Jump_Aimation : String = "jump"
@export var Fulling_Aimation : String = "fulling"
@export var Attack_Aimation : String = "attack1"

func State_input (event : InputEvent):
	if (event.is_action_pressed("jump")):
		Jump()
		next_state =Airstate
	elif (event.is_action_pressed("Attack")):
		playback.travel(Attack_Aimation)
		next_state=Attackstate

func State_prosse():
	if(!character.is_on_floor()):
		playback.travel(Fulling_Aimation)
		next_state=Airstate

func Jump():
	playback.travel(Jump_Aimation)
	character.velocity.y = JUMP_VELOCITY
