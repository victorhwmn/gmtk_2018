extends "Destructable.gd"

export var LOOT = preload("res://Candy.tscn")

func _ready():
	hp = 5
	pass

func _process(delta):
	pass

func destroy():
	var loot = LOOT.instance()
	loot.position = self.position
	get_tree().get_root().get_node("Level").add_child(loot)
	queue_free()
	pass