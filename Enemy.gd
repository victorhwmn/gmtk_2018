extends "Shooter.gd"

var turn_delay = 2
var shot_delay = 2
var turn_timer = null
var shot_timer = null
var Bullet = preload("res://Bullet.tscn")
var BulletPreview = preload("res://BulletPreview.tscn")
var last_preview = null
var player_in_range = false

onready var detector = get_node("PlayerDetector");
onready var players = get_tree().get_nodes_in_group("players")

func _ready():
	turn_timer = Timer.new()
	turn_timer.set_wait_time(turn_delay);
	turn_timer.connect("timeout", self, "turn")
	add_child(turn_timer);
	turn_timer.start()
	var shot_lag = Timer.new()
	shot_lag.set_wait_time(1);
	shot_lag.set_one_shot(true)
	shot_lag.connect("timeout", self, "set_shot_timer")
	add_child(shot_lag);
	shot_lag.start()
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
	rotate(PI/4)
	pass

func set_shot_timer():
	shot_timer = Timer.new()
	shot_timer.set_wait_time(shot_delay);
	shot_timer.connect("timeout", self, "shot_preview")
	add_child(shot_timer);
	shot_timer.start()
	pass

func shot_preview():
	if player_in_range:
		var bullet_preview = .shoot(BulletPreview, Vector2(0, 1).rotated(get_global_transform().get_rotation()))
		bullet_preview.shooter = self
		last_preview = weakref(bullet_preview)
	pass

func playerHit():
	.shoot(Bullet, Vector2(0, 1).rotated(get_global_transform().get_rotation()))
	pass

func hit(damage):
	print(name, " took ", damage, " damage!")



