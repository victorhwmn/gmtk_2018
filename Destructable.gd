extends Node

var hp

func hit(damage):
	hp-= damage
	if hp <= 0:
		destroy()
	pass