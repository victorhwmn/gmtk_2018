extends StaticBody2D

func _process(delta):
	
	var enemy = get_node("../Control_enemy")
	
	if(enemy != null):
		var enemies = enemy.get_child_count()
		if(enemies == 0):
			unlock()
	pass

func unlock():
	$box.disabled = true
	$Sprite.visible = false