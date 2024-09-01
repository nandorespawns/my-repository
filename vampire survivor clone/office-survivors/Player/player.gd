extends CharacterBody2D


signal health_depleted

var health = 100.0
var speed = 60.0
var experience = 0.0
var level = 1


func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		play_moving_animation()
	else:
		play_still_animation()
	
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = $HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		$HealthBar.value = health
		if health <= 0.0:
			emit_signal("health_depleted")
	
	
func experience_get():
	const EXPERIENCE_RATE = 5.0
	var overlapping_experience = %ExperienceManager.get_overlapping_bodies()
	if overlapping_experience.size() > 0:
		experience += EXPERIENCE_RATE * overlapping_experience.size() 
		%ExperienceBar.value = experience
		check_level_up()
	
	
func check_level_up():
	const EXPERIENCE_TO_LEVEL_UP = 20.0
	%ExperienceBar.max_value = EXPERIENCE_TO_LEVEL_UP
	if experience == EXPERIENCE_TO_LEVEL_UP:
		level += 1
		experience -= EXPERIENCE_TO_LEVEL_UP 
		
	
	

	
	
func play_still_animation():
	%AnimationPlayer.play("still")

func play_moving_animation():
	%AnimationPlayer.play("moving")
