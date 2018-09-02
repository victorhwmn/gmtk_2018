extends StaticBody2D

export(String,"Vertical","Horizontal") var  type = "Horizontal"

func _ready():
	
	if type == "Horizontal" :
		get_child(1).set_disabled(true);
		get_child(2).show();
	else:
		get_child(0).set_disabled(true);
		get_child(3).show();

func _process(delta):
	
	var enemy = get_node("../Control_enemy")
	
	if(enemy != null):
		var enemies = enemy.get_child_count()
		if(enemies == 0):
			unlock()
	pass

func unlock():
	if type == "Horizontal" :
		get_child(0).set_disabled(true);
		get_child(2).hide();
	else:
		get_child(1).set_disabled(true);
		get_child(3).hide();