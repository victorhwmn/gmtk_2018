extends KinematicBody2D

func _ready():
	var colors = [
		Color(1, 0, 0, 1),
		Color(0, 1, 0, 1),
		Color(0, 0, 1, 1)
	]
	set_modulate(colors[randi()%3+1-1])
	pass

func _process(delta):
	move_and_collide(Vector2(0, 1)*delta*100)
	pass