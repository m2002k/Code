extends CharacterBody2D

@onready var speed = 60.0
@onready var Sprite =$Sprite2D

var facing_right = true

func _physics_process(delta):
	#filp
	if(velocity.x<0):
		Sprite.flip_h=true
		facing_right = true
	elif (velocity.x>0):
		Sprite.flip_h=false
		facing_right = false

	move_and_slide()
