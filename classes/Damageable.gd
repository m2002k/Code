extends Node

class_name Damageable

#Health 
@export var HP: int =100

@export var plysical_resistant: int =0
@export var fire_resistant: int =0
@export var lighting_resistant: int =0
@export var frost_resistant: int =0
@export var poison_resistant: int =0
@export var bleeding_resistant: int =0

@export var bleedable: bool
@export var Undead: bool
@export var Wet: bool 
@export var ummunity: bool = false

var team: String

func hit(damge : Damge):
	if (damge.team==team && !ummunity):
		HP-=DamgeCont(damge.Plysical,plysical_resistant)
		if (Undead):
			HP-=damge.healing
		else :
			HP+=damge.healing

func DamgeCont(damge: int,resistant: int):
	return damge*(1-(resistant/100))
