extends "Shooter.gd"

var turn_delay = 2
var shot_delay = 2
var turn_timer = null
var shot_timer = null
var add_bullet_timer = null
var Bullet = preload("res://Bullet.tscn")
var BulletPreview = preload("res://BulletPreview.tscn")
var Ammo = preload("res://Ammo.tscn")
var last_preview = null
var player_in_range = false
var aim_rotation = 0

var ammo_count = 30
var ammo = []

onready var detector = get_node("PlayerDetector");
onready var players = get_tree().get_nodes_in_group("players")

onready var AnimatedSprite = $AnimatedSprite
var animations = [
		"0_front",
		"1_front_left",
		"2_left",
		"3_back_left",
		"4_back",
		"5_back_right",
		"6_right",
		"7_front_right"
	]

func _ready():
	turn_timer = Timer.new()
	turn_timer.set_wait_time(turn_delay)
	turn_timer.connect("timeout", self, "turn")
	add_child(turn_timer);
	turn_timer.start()
	var shot_lag = Timer.new()
	shot_lag.set_wait_time(1)
	shot_lag.set_one_shot(true)
	shot_lag.connect("timeout", self, "set_shot_timer")
	add_child(shot_lag);
	shot_lag.start()

	add_bullet_timer = Timer.new()
	add_bullet_timer.set_wait_time(0.1)
	add_bullet_timer.connect("timeout", self, "add_bullet")
	add_child(add_bullet_timer)
	add_bullet_timer.start()
	
	pass

func _process(delta):
	pass

func _physics_process(delta):
	player_in_range = false
	for player in players:
		if(detector.overlaps_body(player)):
			player_in_range = true
	pass
	
func turn():
	if last_preview and last_preview.get_ref():
		last_preview.get_ref().queue_free()
		
	aim_rotation+= 1
	
	if(aim_rotation > 7):
		aim_rotation = 0
		
	AnimatedSprite.play(animations[aim_rotation])

func set_shot_timer():
	shot_timer = Timer.new()
	shot_timer.set_wait_time(shot_delay);
	shot_timer.connect("timeout", self, "shot_preview")
	add_child(shot_timer);
	shot_timer.start()
	pass

func shot_preview():
	if player_in_range and len(ammo) > 0:
		var bullet_preview = .shoot(BulletPreview, Vector2(0, 1).rotated(aim_rotation*PI/4))
		bullet_preview.shooter = self
		last_preview = weakref(bullet_preview)
	pass

func playerHit():
	var next_ammo = ammo[0]
	var bullet = .shoot(Bullet, Vector2(0, 1).rotated(aim_rotation*PI/4))
	bullet.set_modulate(ammo[0].get_modulate())
	ammo[0].queue_free()
	ammo.erase(ammo[0])
	pass
	
func add_bullet():
	var new_ammo = Ammo.instance()
	new_ammo.position = Vector2(randi()%5+1, 1)
	new_ammo.scale = Vector2(0.2, 0.2)
	get_node("AmmoContainer").add_child(new_ammo)
	ammo.append(new_ammo)
	if(len(ammo) > ammo_count):
		add_bullet_timer.stop()

func hit(damage):
	queue_free()



