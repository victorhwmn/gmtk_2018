extends Area2D

func _ready():
	connect('body_entered', self, 'collected')
	pass

func _process(delta):
	pass
	
func collected(collector):
	print(collector, " entered the area")
	if collector.is_in_group("players"):
		if collector.ammo_count < 6:
			collector.ammo_count+= 1
			queue_free()
	pass