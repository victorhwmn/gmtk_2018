extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Arraybodies;
export (String, "Up", "Left", "Right","Down","LR") var type = "Up";
var moviment = Vector2(0,0);
var flag = 2;


func _ready():
	
	if type == "LR":	
		var timer = Timer.new();
		timer.set_wait_time(5)	
		timer.connect("timeout", self, "_timeout")
		add_child(timer)
		timer.start()


	pass

func _process(delta):
	var i;
	var body;
	
	Arraybodies = get_overlapping_bodies();
	match type :
		"Up":
			moviment = Vector2(0,-2);
		"Left":
			moviment = Vector2(-2,0);
		"Right":
			moviment = Vector2(2,0);
		"Down":
			moviment = Vector2(0,2);
		"LR" : 
			moviment = Vector2(flag,0);
			
			
	
	for i in Arraybodies.size() :
		body = Arraybodies[i];
		if body.is_in_group("damageable") :
			body.move_and_collide(moviment)
			
func _timeout() :
	flag = flag * -1;
	rotate(PI);
	

