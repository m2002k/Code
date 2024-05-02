extends MKsCharacter

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	flip_Updata()
	move_and_slide()
	Updata_animation()

func Updata_animation():
	animation_tree.set("parameters/move/blend_position", velocity.x)
