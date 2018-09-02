extends Position2D

func _ready():
	var player_cam = get_node("../../Player/Camera2D")
	
	player_cam.limit_bottom = self.position.y
	player_cam.limit_right = self.position.x 
	
	pass