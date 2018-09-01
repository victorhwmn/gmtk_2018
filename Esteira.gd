extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Arraybodies;
export (String, "Up", "Left", "Right","Down") var type = "Up";
var moviment = Vector2(0,0);


func _ready():

	pass

func _process(delta):
	var i;
	var body;
	
	Arraybodies = get_overlapping_bodies();
	match type :
		"Up":
			moviment = Vector2(0,-1);
			
		"Left":
			moviment = Vector2(-1,0);
			
		"Right":
			moviment = Vector2(1,0);
			
		"Down":
			moviment = Vector2(0,1);
	
	
	for i in Arraybodies.size() :
		body = Arraybodies[i];
		if body.is_in_group("enemy") :
			body.position = body.position + moviment
			
		
			
	

