extends CharacterBody2D

@onready var speed = 60.0
@onready var Sprite =$Sprite2D
@onready var animation_tree = $AnimationTree

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = true

func _ready():
	animation_tree.active = true

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
	

