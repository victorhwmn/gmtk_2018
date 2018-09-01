extends KinematicBody2D

#Recebe Node do Player para pegar a posição dele
#var player = get_node("/root/MainGame/Player");
var shot_timer = 3;
var timer = null;
var can_shot = false;
var Bullet = preload("res://Bullet.tscn")
onready var acha_player = get_node("Detectar_jogador");
onready var player = get_node("../Player")


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	timer = Timer.new()
	timer.set_wait_time(shot_timer);
	timer.connect("timeout",self,"_can_shot")
	timer.set_one_shot(true);
	add_child(timer);
	timer.start()

	pass

func _process(delta):
	
	
	if acha_player.overlaps_body(player) :
		#print(can_shot);
		var direcao = player.position
		if can_shot == true :
			can_shot = false;
			_shot(direcao)
			timer.start();
			print(direcao);
			#Cria uma bala na direção do Player
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	pass
func _shot(direcao) :
	var shoot_dir = -(position - direcao).normalized()
		
	var bullet = Bullet.instance()
	bullet.position = position + get_node("Sprite").texture.get_size()/2 * shoot_dir
	bullet.init(shoot_dir)
	get_parent().add_child(bullet)



func _can_shot():
	can_shot = true;

func hit():
	queue_free()
	
	
	
