extends CharacterBody2D

@onready var speed = 60.0
@onready var Sprite =$Sprite2D
@onready var animation_tree = $AnimationTree
@export  var Health : Damageable
@export var team: String

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = true

func _ready():
	animation_tree.active = true
	for child in get_children():
		if (child is Damageable):
			Health = child
	Health.team=team

func _physics_process(delta):
	#gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	#filp
		if(velocity.x<0):
			Sprite.flip_h=true
			facing_right = true
		elif (velocity.x>0):
			Sprite.flip_h=false
			facing_right = false
			
	move_and_slide()
	Updata_animation()

func Updata_animation():
	animation_tree.set("parameters/move/blend_position", velocity.x)
