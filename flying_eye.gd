extends MKsCharacter

func _physics_process(delta):
	#filp
	if(velocity.x<0):
		Sprite.flip_h=true
		facing_right = true
	elif (velocity.x>0):
		Sprite.flip_h=false
		facing_right = false
		
	move_and_slide()
	Updata_animation()
