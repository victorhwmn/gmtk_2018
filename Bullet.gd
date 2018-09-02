extends KinematicBody2D

var direction
var speed
var size
var damage

func _ready():
	var colors = [
		Color(1, 0, 0, 1),
		Color(0, 1, 0, 1),
		Color(0, 0, 1, 1)
	]
	set_modulate(colors[randi()%3+1-1])
	pass
	
func init(direction, speed, size = 0.1, damage = 10):
	if speed == null:
		speed = 750
	if size == null:
		size = 0.5
	if damage == null:
		damage = 10
	self.direction = direction * speed
	self.speed = speed
	self.size = size
	self.damage = damage
	scale = Vector2(sqrt(size), sqrt(size))
	pass

func _physics_process(delta):
	
	var collision = move_and_collide(direction*delta)
	
	if collision:
		handle_collision(collision)
	pass

func handle_collision(collision):
	if collision.collider.is_in_group("damageable"):
		collision.collider.hit(damage*size)
		queue_free()
	elif collision.collider.is_in_group("bullet"):
		if(size < collision.collider.size):
			queue_free()
		else:
			var total_size = size + collision.collider.size
			direction = (collision.normal*size + collision.collider.direction * collision.collider.size) / total_size * 2
			size = total_size
			set_modulate((get_modulate() + collision.collider.get_modulate())/2)
			scale = Vector2(sqrt(size), sqrt(size))		
	else:
		direction = direction.bounce(collision.normal)
	pass