extends KinematicBody2D

var direction
var speed
var size

func _ready():
	pass
	
func init(direction, speed = 1000, size = 0.1):
	self.direction = direction * speed
	self.speed = speed
	self.size = size
	scale = Vector2(sqrt(size), sqrt(size))
	pass

func _physics_process(delta):
	
	var collision = move_and_collide(direction*delta)
	
	if collision:
		
		var collider = collision.collider
		
		if collider.is_in_group("bullet"):
			if(size < collider.size):
				queue_free()
			else:
				var total_size = size + collider.size
				direction = (collision.normal*size + collider.direction * collider.size) / total_size * 2
				size = total_size
				scale = Vector2(sqrt(size), sqrt(size))
		else:
			direction = direction.bounce(collision.normal)
			if collider.has_method("hit"):
				collider.hit()
			
	pass
