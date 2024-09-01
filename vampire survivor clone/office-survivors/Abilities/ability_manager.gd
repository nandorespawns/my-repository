extends Area2D


func _physics_process(delta):
	var mobs_in_range = get_overlapping_bodies()
	if mobs_in_range.size() > 0:
		var target_mob = mobs_in_range.front()
		look_at(target_mob.global_position)

func arrow_shoot():
	const PROJECTILE = preload("res://Abilities/arrow.tscn")
	var new_projectile = PROJECTILE.instantiate()
	new_projectile.global_position = %ShootingPoint.global_position
	new_projectile.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_projectile)


func _on_arrow_timer_timeout():
	arrow_shoot()
