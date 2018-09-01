extends KinematicBody2D

var Bullet = preload("res://Bullet.tscn")

var motion = Vector2()
var y_dir
var x_dir
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
		var shoot_dir = -(position - get_global_mouse_position()).normalized()
		
		var bullet = Bullet.instance()
		bullet.position = position + get_node("Sprite").texture.get_size()/2 * shoot_dir
		bullet.init(shoot_dir)
		get_parent().add_child(bullet)
	
	pass

func _process(delta):
	pass
