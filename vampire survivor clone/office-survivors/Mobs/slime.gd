extends CharacterBody2D



var health = 4
var speed = 30.0

@onready var player = get_node("/root/World/Player")

func _ready():
	play_walking_animation()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	



func take_damage(damage):
	health -= damage
	play_hurt_animation()
	if health <= 0:
		
		queue_free()
		
		const EXPERIENCE_POINT = preload("res://Abilities/experience_point.tscn")
		var experience = EXPERIENCE_POINT.instantiate()
		get_parent().add_child(experience)
		experience.global_position = global_position
	


func play_walking_animation():
	$AnimationPlayer.play("walk")
	
func play_hurt_animation():
	$AnimationPlayer.play("hurt")
	$AnimationPlayer.queue("walk")
