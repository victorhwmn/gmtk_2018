extends KinematicBody2D

func shoot(Bullet, direction, speed = null, size = null, damage = null):
	var bullet = Bullet.instance()
	var shooter_radius = get_node("CollisionShape2D").get_shape().radius
	var bullet_radius = bullet.get_node("CollisionShape2D").get_shape().radius
	var total_radius = shooter_radius + bullet_radius
	bullet.position = get_node("CollisionShape2D").global_position + Vector2(total_radius, total_radius) * 2 * direction
	bullet.init(direction, speed, size, damage)
	get_tree().get_root().get_node("Level").add_child(bullet)
	return bullet
	pass