extends Area2D

func _ready():
	connect('body_entered', self, 'collected')
	pass

func _process(delta):
	pass
	
func collected(collector):
	if collector.is_in_group("players"):
		if collector.ammo_count < 6:
			collector.ammo_count = min(6, collector.ammo_count + 3)
		queue_free()
	pass