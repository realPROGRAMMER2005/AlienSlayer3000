extends Area2D

var speed = 192
var damage = 1
var max_lifetime = 1
var current_lifetime = 0

	
func _physics_process(delta):
	current_lifetime += delta
	if current_lifetime >= max_lifetime:
		queue_free()

	position += transform.x * speed * delta

	for body in get_overlapping_bodies():
		if body.is_in_group("Player"):
			body.take_damage(damage)
		else:
			if not body.is_in_group("Enemies"):
				queue_free()

