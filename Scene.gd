extends Node

var Bullet = preload("res://Bullet.tscn")

func _ready():
#	for x in range(0, 10000):
#		var bullet = Bullet.instance()
#		bullet.position = Vector2(randi()%1000+0, randi()%500+0)
#		bullet.init((self.get_viewport().get_visible_rect().size/2 - bullet.position).normalized())
#		add_child(bullet)
	pass

func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			var bullet = Bullet.instance()
			bullet.position = event.position
			bullet.init((self.get_viewport().get_visible_rect().size/2 - bullet.position).normalized())
			add_child(bullet)
