extends State

class_name Air_state
@export var Groundstate: State
@export var JUMP_VELOCITY = -350
@export var Double_Jump_Aimation : String = "jamp"

var Djump= false

func State_prosse(delta):
	if(character.is_on_floor()):
		next_state=Groundstate

func on_exit():
	Djump=true

func State_input (event : InputEvent):
	if (event.is_action_pressed("jump")&&Djump):
		double_jump()

func double_jump():
	playback.travel(Double_Jump_Aimation)
	character.velocity.y = JUMP_VELOCITY
	Djump=false
