extends CharacterBody2D

@onready var speed = 60.0
@onready var Sprite =$Sprite2D
@onready var animation_tree = $AnimationTree
@export  var Health : Damageable
@export var team: String

var facing_right = true

func _ready():
	animation_tree.active = true
	for child in get_children():
		if (child is Damageable):
			Health = child
	Health.team=team

func _physics_process(delta):
	#filp
	if(velocity.x<0):
		Sprite.flip_h=true
		facing_right = true
	elif (velocity.x>0):
		Sprite.flip_h=false
		facing_right = false
		
	move_and_slide()
