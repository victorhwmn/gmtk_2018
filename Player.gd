extends KinematicBody2D

var motion = Vector2()
var shoot_dir = Vector2()
var y_dir
var x_dir
var y_shoot_dir = 0
var x_shoot_dir = 0
export var SPEED = 300

func _ready():

	pass

func _physics_process(delta):
	
	var y_dir = 0
	var x_dir = 0
	
	# Input
	if(Input.is_action_pressed("strafe_up")):
		y_dir = -1
	if(Input.is_action_pressed("strafe_down")):
		y_dir = 1
	if(Input.is_action_pressed("strafe_left")):
		x_dir = -1
	if(Input.is_action_pressed("strafe_right")):
		x_dir = 1
	
	# Movement
	motion.x = x_dir * SPEED
	motion.y = y_dir * SPEED
	
	motion = move_and_slide(motion, Vector2(0, 0))
	
	# Shoot
	if(Input.is_action_just_pressed("ui_select")):
		print("BANG!")
		shoot_dir = self.position - get_viewport().get_mouse_position()
		shoot_dir.x *= -1
		shoot_dir.y *= -1
		print(shoot_dir)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
