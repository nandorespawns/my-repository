extends Area2D

@onready var player = get_node("/root/World/Player")
var attraction_radius = 50.0  
var attraction_speed = 200.0  



func _process(delta):
	if player and is_instance_valid(player):
		var distance_to_player = position.distance_to(player.position)
		
		if distance_to_player <= attraction_radius:
			var direction_to_player = (player.position - position).normalized()
			position += direction_to_player * attraction_speed * delta


func _on_body_entered(body):
	queue_free()
	if body.has_method("experience_get"):
		body.experience_get()
