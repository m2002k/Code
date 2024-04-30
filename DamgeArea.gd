extends Area2D

class_name DamgeArea

var team: String
var damge: Damge

func _on_body_entered(body):
	pass

func _ready():
	for child in get_children():
		if (child is Damge):
			damge = child
			damge.team=team
