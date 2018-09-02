extends "Bullet.gd"

var shooter
var bounce = 2

func init(direction, speed = 10000, size = 1, damage = 0):
	if speed == null:
		speed = 10000
	if size == null:
		size = 1
	if damage == null:
		damage = 0
	.init(direction, speed, size, 0)
	pass
	
func handle_collision(collision):
	if bounce > 0:
		bounce = bounce - 1
	else:
		queue_free()
		return
	if collision.collider.is_in_group("players"):
		shooter.playerHit()
		queue_free()
	elif collision.collider.is_in_group("damageable"):
		queue_free()
	else:
		.handle_collision(collision)
	pass