extends Area2D

var travelled_distance = 0
var speed = 100.0
var range = 200.0
var pierce = 0 
var damage = 1

func _physics_process(delta):

	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	
	travelled_distance += speed * delta
	if travelled_distance > range:
		queue_free()

func _on_body_entered(body):
	if pierce > 0:
		pierce -= 1
	elif pierce <= 0 :
		queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)
