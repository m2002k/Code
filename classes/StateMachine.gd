extends Node

class_name StateMachine

@export var character: MKsCharacter
@export var Animation_tree : AnimationTree
@export var Current_state: State
var Death_state: DeathState

var states :Array[State]

func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			child.character = character
			child.playback = Animation_tree["parameters/playback"]
			if (child is  DeathState):
				Death_state=child

func _physics_process(delta):
	if (character.Health.HP<=0):
		switch_states(Death_state)
	elif(Current_state.next_state != null):
		switch_states(Current_state.next_state)
	Current_state.State_prosse()

func if_Can_move():
	return Current_state.can_move

func _input(event : InputEvent):
	Current_state.State_input(event)

func switch_states(new_state : State):
	if(Current_state!=null):
		Current_state.on_exit()
		Current_state.next_state=null
	Current_state=new_state
	Current_state.on_enter()
