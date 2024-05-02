extends State

class_name DeathState

@export var Death_animation : String ="Death"

func on_enter():
	playback.travel(Death_animation)
