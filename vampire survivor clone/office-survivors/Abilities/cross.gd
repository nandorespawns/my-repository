extends Area2D

var travelled_distance = 0
var speed = 120.0
var forward_range = 50.0
var backward_range = 200
var hover_timer = 0.8
var current_phase = "forward"
var damage = 1

@onready var hover_damage_timer = $HoverDamageTimer

func _ready():
	$HoverTime.wait_time = hover_timer
	hover_damage_timer.wait_time = 0.2
	

func _physics_process(delta):
	play_cross_animation()
	
	match current_phase:
		"forward":
			move_forward(delta)
		"hover":
			hover_in_place(delta)
		"backward":
			move_backward(delta)
			

func move_forward(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance >= forward_range:
		travelled_distance = forward_range
		current_phase = "hover"
		start_hover_timer()


func hover_in_place(delta):
	if hover_damage_timer.is_stopped():
		hover_damage_timer.start()
	
func move_backward(delta):
	var direction = Vector2.LEFT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance >= forward_range + backward_range:
		queue_free()
	
func start_hover_timer():
	$HoverTime.start()
	hover_damage_timer.start()
	



func play_cross_animation():
	$AnimationPlayer.play("spin")


func _on_hover_time_timeout():
	current_phase = "backward"
	hover_damage_timer.stop()


func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)


func _on_hover_damage_timer_timeout():
	for body in get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(damage)
