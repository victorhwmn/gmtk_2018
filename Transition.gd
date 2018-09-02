extends Area2D

export(String, FILE, "*.tscn") var next_scene

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			StageManager.change_scene(next_scene)
			#get_tree().change_scene(world_scene)
