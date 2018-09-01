extends "Shooter.gd"

var Bullet = preload("res://Bullet.tscn")

var motion = Vector2()
var y_dir
var x_dir
var shoot_y_dir
var shoot_x_dir

var shoot_timer = Timer.new()
var shoot_delay = 0.2
var can_shoot = true

export var SPEED = 300

func _ready():
	shoot_timer.set_wait_time(shoot_delay);
	shoot_timer.set_one_shot(true)
	shoot_timer.connect("timeout", self, "enable_shoot")
	add_child(shoot_timer)
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
	if(Input.is_action_pressed("aim_down")):
		shoot_y_dir = 1
	if(Input.is_action_pressed("aim_left")):
		shoot_x_dir = -1
	if(Input.is_action_pressed("aim_right")):
		shoot_x_dir = 1

	# Movement
	motion.x = x_dir * SPEED
	motion.y = y_dir * SPEED
	
	move_and_collide(motion * delta)
	# Shoot
	
	shoot_dir.x = shoot_x_dir
	shoot_dir.y = shoot_y_dir
	
	if(can_shoot and shoot_dir != Vector2(0,0)):
		can_shoot = false
		shoot_timer.start()
		.shoot(Bullet, shoot_dir)
	pass

func enable_shoot():
	can_shoot = true
	pass
	
func _process(delta):
	pass

func hit(damage):
	print(self.name, " took ", damage, " damage")
	pass
