extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Arraybodies;
export (String, "Up", "Left", "Right","Down","LR","RL","UD","DU") var direcao = "Up";
export (String, "Rosa","Marrom") var type = "Rosa";
export (int) var wait_time = 5;
var moviment = Vector2(0,0);
var flag = 2;


func _ready():
	
	if direcao == "LR" or direcao == "RL" or direcao == "UD" or direcao == "DU":	
		var timer = Timer.new();
		timer.set_wait_time(wait_time)	
		timer.connect("timeout", self, "_timeout")
		add_child(timer)
		timer.start()
		
	match type :
		"Rosa":
			get_child(3).show()
			get_child(4).show()
		"Marrom":
			get_child(1).show()
			get_child(2).show()
	pass	


func _process(delta):
	var i;
	var body;
	
	Arraybodies = get_overlapping_bodies();
	match direcao :
		"Up":
			moviment = Vector2(0,-2);
		"Left":
			moviment = Vector2(-2,0);
		"Right":
			moviment = Vector2(2,0);
		"Down":
			moviment = Vector2(0,2);
		"LR" : 
			moviment = Vector2(-flag,0);
		"RL" :
			moviment = Vector2(flag,0);
		"UD" :
			moviment = Vector2(0,-flag);
		"DU" :
			moviment = Vector2(0,flag);		
		
			
			
	
	for i in Arraybodies.size() :
		body = Arraybodies[i];
		if body.is_in_group("damageable") :
			body.move_and_collide(moviment)
			
func _timeout() :
	flag = flag * -1;
	rotate(PI);
	

