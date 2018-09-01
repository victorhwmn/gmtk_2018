extends KinematicBody2D

var motion = Vector2()
var y_dir
var x_dir
export var SPEED = 200

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	
	var y_dir = 0
	var x_dir = 0
	
	# Input
	if(Input.is_action_pressed("ui_up")):
		y_dir = -1
	if(Input.is_action_pressed("ui_down")):
		y_dir = 1
	if(Input.is_action_pressed("ui_left")):
		x_dir = -1
	if(Input.is_action_pressed("ui_right")):
		x_dir = 1
		
	# Movement	
	motion.x = x_dir * SPEED
	motion.y = y_dir * SPEED
	
	motion = move_and_slide(motion, Vector2(0, 0))
	
	# Shoot
	if(Input.is_action_just_pressed("ui_select")):
		var gum
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
