extends KinematicBody2D

#Recebe Node do Player para pegar a posição dele
#var player = get_node("/root/MainGame/Player");
var shot_timer = 3;
var timer = null;
var can_shot = false;
onready var acha_player = get_node("Detectar_jogador");
onready var player = get_node("../Player")


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	timer = Timer.new()
	timer.set_wait_time(shot_timer);
	timer.connect("timeout",self,"_can_shot")
	add_child(timer);
	timer.start();

	pass

func _process(delta):
	
	
	if acha_player.overlaps_body(player) :
		#print(can_shot);
		var direcao = player.position
		if can_shot == true :
			can_shot = false;
			print(direcao);
			#Cria uma bala na direção do Player
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	pass

func _can_shot():
	can_shot = true;

	
	
	