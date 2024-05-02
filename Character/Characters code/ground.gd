On a CharacterBody2D:

extends CharacterBody2D

var state
var gravity = ProjectSettings.get_setting(“physics/2d/default_gravity”)

func _ready():
state = State.new()
state.name = “State”
add_child(state)
state.change_state(“Idle”)

func _physics_process(delta):
if not is_on_floor():
velocity.y += gravity * delta
move_and_slide()

“State”:

extends Node
class_name State

var MAX_SPEED = 8000
var ACCELERATION = 1000
const SPEED = 600.0

var states
var current_state

func _init():
states = {
“Idle”: IdleState,
“Run”: RunState,
}

func change_state(new_state_name):
if get_child_count() != 0:
get_child(0).queue_free()
current_state = states.get(new_state_name).new()
current_state.name = new_state_name
add_child(current_state)

“IdleState”:

extends State
class_name IdleState

var player

@onready var anim = get_node(“AnimationPlayer”)

func _ready():
player = get_parent().get_parent()
if get_node(“AnimatedSprite2D”).flip_h:
anim.play(“Idle Left”)
else:
anim.play(“Idle Right”)

func _physics_process(delta):
if Input.is_action_pressed(“ui_right”):
get_parent().change_state(“Run”)

elif Input.is_action_pressed("ui_left"):
	get_parent().change_state("Run")
player.velocity.x = lerp(player.velocity.x, 0.0, 0.2)
“RunState”:

extends State
class_name RunState

var player

@onready var anim = get_node(“AnimationPlayer”)

func _ready():
player = get_parent().get_parent()
anim.play(“Run”)

func _physics_process(delta):
if Input.is_action_pressed(“ui_right”):
player.velocity.x = min(player.velocity.x + ACCELERATION * delta, MAX_SPEED * delta)
elif Input.is_action_pressed(“ui_left”):
player.velocity.x = max(player.velocity.x - ACCELERATION * delta, -MAX_SPEED * delta)
else:
get_parent().change_state(“Idle”)
