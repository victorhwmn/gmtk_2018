extends "Destructable.gd"

func _ready():
	hp = 5
	pass

func _process(delta):
	pass

func destroy():
	queue_free()
	pass