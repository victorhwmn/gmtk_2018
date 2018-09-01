extends KinematicBody2D

var Bullet = preload("res://Bullet.tscn")

var motion = Vector2()
var y_dir
var x_dir
var direction
var shoot_y_dir
var shoot_x_dir
export var SPEED = 300

func _ready():

	pass

func _physics_process(delta):
	
	var y_dir = 0
	var x_dir = 0
	var shoot_y_dir = 0
	var shoot_x_dir = 0
	var use_aim = false
	var shoot_dir = Vector2(0,0)
	
	
	# Input
	if(Input.is_action_pressed("strafe_up")):
		y_dir = -1
	if(Input.is_action_pressed("strafe_down")):
		y_dir = 1
	if(Input.is_action_pressed("strafe_left")):
		x_dir = -1
	if(Input.is_action_pressed("strafe_right")):
		x_dir = 1
	if(Input.is_action_pressed("aim_up")):
		shoot_y_dir = -1
		use_aim = true
	if(Input.is_action_pressed("aim_down")):
		use_aim = true
		shoot_y_dir = 1
	if(Input.is_action_pressed("aim_left")):
		shoot_x_dir = -1
		use_aim = true
	if(Input.is_action_pressed("aim_right")):
		shoot_x_dir = 1
		use_aim = true
	
	
	# Movement
	motion.x = x_dir * SPEED
	motion.y = y_dir * SPEED
	
	motion = move_and_slide(motion, Vector2(0, 0))
	
	# Shoot
	if(Input.is_action_just_pressed("ui_select")):
		# Mouse Control
		#var shoot_dir = -(position - get_global_mouse_position()).normalized()
		
		# Keyboard Control
		if(use_aim):
			shoot_dir.x = shoot_x_dir
			shoot_dir.y = shoot_y_dir
		else:
			shoot_dir = motion.normalized()
		var bullet = Bullet.instance()
		bullet.position = position + get_node("Sprite").texture.get_size()/2 * shoot_dir
		bullet.init(shoot_dir)
		get_parent().add_child(bullet)
	
	# Animation
	
	pass

func set_direction():
	
	pass

func shoot():
	
	pass

func _process(delta):
	pass
