extends Area2D

var travelled_distance = 0.0
var speed = 200.0
var forward_range = 130.0
var backward_range = 300.0
var pierce = 0
var damage = 1
var current_phase = "forward"


func _physics_process(delta):
	
	
	match current_phase:
		"forward":
			move_forward(delta)
		"backward":
			move_backward(delta)
			
	

func move_forward(delta):
	var direction = Vector2.UP.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance >= forward_range:
		travelled_distance = forward_range
		move_backward(delta)

func move_backward(delta):
	var direction = Vector2.DOWN.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance >= forward_range + backward_range:
		queue_free()

func play_spin_animation():
	$AnimationPlayer.play("spin")
