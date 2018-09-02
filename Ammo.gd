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
	
func collected(collector):
	if collector.is_in_group("players"):
		if collector.ammo_count < 6:
			collector.ammo_count+= 1
		queue_free()
	pass