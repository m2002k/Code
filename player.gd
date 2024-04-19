extends CharacterBody2D

@onready var SPEED = 300.0
@onready var JUMP_VELOCITY = -400.0
@onready var Sprite =$Sprite2D
@onready var animation_tree = $AnimationTree
var facing_right = true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# filp
	if(velocity.x<0):
		Sprite.flip_h=true
		facing_right = true
	elif (velocity.x>0):
		Sprite.flip_h=false
		facing_right = false
	# movment
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	Updata_animation()

func Updata_animation():
	animation_tree.set("parameters/move/blend_position", velocity.x)
