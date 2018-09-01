extends KinematicBody2D

func shoot(Bullet, direction, speed = null, size = null, damage = null):
	var bullet = Bullet.instance()
	bullet.position = position + (get_node("Sprite").texture.get_size()/2 + Vector2(bullet.get_node("CollisionShape2D").get_shape().radius, bullet.get_node("CollisionShape2D").get_shape().radius)*2) * direction
	bullet.init(direction, speed, size, damage)
	get_tree().get_root().add_child(bullet)
	return bullet
	pass