extends RigidBody2D

func _ready():
	var colors = [
		Color(1, 0, 0, 1),
		Color(0, 1, 0, 1),
		Color(0, 0, 1, 1)
	]
	set_modulate(colors[randi()%3+1-1])
	pass

func _process(delta):
	pass