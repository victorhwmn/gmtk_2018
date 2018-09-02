extends Position2D

func _ready():
	var player_cam = get_node("../Player/Camera2D")
	
	player_cam.limit_top = self.position.y
	player_cam.limit_left = self.position.x 
	
	pass