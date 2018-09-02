extends "Shooter.gd"

var Bullet = preload("res://Bullet.tscn")

var motion = Vector2()
var y_dir
var x_dir
var shoot_y_dir
var shoot_x_dir
var shoot_dir = Vector2(0, 0)

var ammo_count = 6

var input_timer = Timer.new()
var input_delay = 0.05

var shoot_timer = Timer.new()
var shoot_delay = 0.5

var can_shoot = true
var anim = "shoot_down"
var new_anim_type = "shoot"
var new_anim_dir = "down"

var is_dead = false

export var SPEED = 300

func _ready():
	input_timer.set_wait_time(input_delay);
	input_timer.set_one_shot(true)
	input_timer.connect("timeout", self, "input_shoot")
	add_child(input_timer)
	shoot_timer.set_wait_time(shoot_delay);
	shoot_timer.set_one_shot(true)
	shoot_timer.connect("timeout", self, "shoot")
	add_child(shoot_timer)
	pass

func _physics_process(delta):
	
	if is_dead:
		return
	
	y_dir = 0
	x_dir = 0
	shoot_y_dir = 0
	shoot_x_dir = 0
	
	# Input
	if(Input.is_action_pressed("strafe_up")):
		y_dir = -1
		new_anim_type = "shoot"
		new_anim_dir = "up"
	if(Input.is_action_pressed("strafe_down")):
		y_dir = 1
		new_anim_type = "shoot"
		new_anim_dir = "down"
	if(Input.is_action_pressed("strafe_left")):
		x_dir = -1
		new_anim_type = "shoot"
		new_anim_dir = "left"
	if(Input.is_action_pressed("strafe_right")):
		x_dir = 1
		new_anim_type = "shoot"
		new_anim_dir = "right"
	if(Input.is_action_pressed("aim_up")):
		shoot_y_dir = -1
		new_anim_type = "shoot"
		new_anim_dir = "up"
	if(Input.is_action_pressed("aim_down")):
		shoot_y_dir = 1
		new_anim_type = "shoot"
		new_anim_dir = "down"
	if(Input.is_action_pressed("aim_left")):
		shoot_x_dir = -1
		new_anim_type = "shoot"
		new_anim_dir = "left"
	if(Input.is_action_pressed("aim_right")):
		shoot_x_dir = 1
		new_anim_type = "shoot"
		new_anim_dir = "right"

	# Movement
	motion.x = x_dir * SPEED
	motion.y = y_dir * SPEED
	
	var collision = move_and_collide(motion * delta)
	
	if collision:
		if collision.collider.is_in_group("collectable"):
			collision.collider.collected(self)
	
	# Shoot
	shoot_dir.x = shoot_x_dir
	shoot_dir.y = shoot_y_dir
	
	if shoot_dir == Vector2(0, 0):
		can_shoot = true
	
	if(can_shoot):
		can_shoot = false
		input_timer.start()
	
	if(x_dir > 0):
		if(y_dir > 0):
			new_anim_dir = "downdiagright"
		elif(y_dir < 0):
			new_anim_dir = "updiagright"
	elif(x_dir < 0):
		if(y_dir > 0):
			new_anim_dir = "downdiagleft"
		elif(y_dir < 0):
			new_anim_dir = "updiagleft"
	
	if(shoot_x_dir > 0):
		if(shoot_y_dir > 0):
			new_anim_dir = "downdiagright"
		elif(shoot_y_dir < 0):
			new_anim_dir = "updiagright"
	elif(shoot_x_dir < 0):
		if(shoot_y_dir > 0):
			new_anim_dir = "downdiagleft"
		elif(shoot_y_dir < 0):
			new_anim_dir = "updiagleft"
			
	var new_anim = new_anim_type + "_" +  new_anim_dir
	if new_anim != anim:
		anim = new_anim
		$Sprite.play(anim)
	pass

func _input(event):
	if event.is_action_pressed("restart"):
			StageManager.restart()

func input_shoot():
	shoot_timer.start()
	if ammo_count > 0 and shoot_dir != Vector2(0, 0):
		.shoot(Bullet, shoot_dir)
		ammo_count-= 1
		print("Ammo: ", ammo_count)
	pass
	
func shoot():
	can_shoot = true
	pass
	
func _process(delta):
	pass

func hit(damage):
	print(self.name, " took ", damage, " damage")
	is_dead = true
	visible = false
	pass