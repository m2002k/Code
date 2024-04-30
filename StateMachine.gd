extends Node

class_name StateMachine

@export var character: CharacterBody2D
@export var Animation_tree : AnimationTree
@export var Current_state: State

var states :Array[State]

func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			child.character = character
			child.playback = Animation_tree["parameters/playback"]

func _physics_process(delta):
	if(Current_state.next_state != null):
		switch_states(Current_state.next_state)
	Current_state.State_prosse()

func if_Can_move():
	return Current_state.can_move

func switch_states(new_state : State):
	if(Current_state!=null):
		Current_state.on_exit()
		Current_state.next_state=null
	Current_state=new_state
	Current_state.on_enter()
