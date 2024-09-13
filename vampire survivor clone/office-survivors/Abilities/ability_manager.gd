extends Area2D

@onready var upgrade_selection_screen = get_node("/root/World/Player/UpgradeScreen")

var upgrades = {
	"arrow_cooldown_upgrade": Callable(self, "apply_arrow_cooldown_upgrade"),
	"arrow_pierce_upgrade": Callable(self, "apply_arrow_pierce_upgrade"),
	"arrow_num_upgrade": Callable(self, "apply_arrow_num_upgrade"),
	"arrow_damage_upgrade": Callable(self, "apply_arrow_damage_upgrade"),
	"cross_cooldown_upgrade": Callable(self, "apply_cross_cooldown_upgrade"),
	"cross_num_upgrade": Callable(self, "apply_cross_num_upgrade"),
	"cross_damage_upgrade": Callable(self, "apply_cross_damage_upgrade")
	
	
}

func _ready():
	print("upgrades available:", upgrades.keys())
	


#initialize all arrow stats
var arrow_speed = 100.0
var arrow_range = 200.0
var arrow_timer = 1
var arrow_pierce = 0
var arrow_damage = 1
var arrow_num = 0

#initialize all cross stats
var cross_speed = 50.0
var cross_forward_range = 50.0
var cross_backward_range = 200
var cross_damage = 0.3
var cross_num = 1
var cross_timer = 2

#initialize all axe stats



func get_closest_mob():
	var mobs_in_range = get_overlapping_bodies()
	var closest_mob = null
	var shortest_distance = INF
	
	for mob in mobs_in_range:
		if mob is CharacterBody2D:
			var distance_to_mob = global_position.distance_to(mob.global_position)
			if distance_to_mob < shortest_distance:
				shortest_distance = distance_to_mob
				closest_mob = mob
	return closest_mob

func get_random_mob():
	var mobs_in_range = get_overlapping_bodies()
	
	if mobs_in_range.size() > 0:
		var random_index = randi() % mobs_in_range.size()
		var random_mob = mobs_in_range[random_index]
		
		if random_mob is CharacterBody2D:
			return random_mob
	return null

func arrow_shoot():
	const PROJECTILE = preload("res://Abilities/arrow.tscn")
	var closest_mob = get_closest_mob()
	
	for i in range(arrow_num):
		var new_projectile = PROJECTILE.instantiate()
		new_projectile.global_position = %ShootingPoint.global_position
	
	
		if closest_mob != null:
			new_projectile.look_at(closest_mob.global_position)
			var spread_angle = deg_to_rad(10 * (i - arrow_num / 2))
			new_projectile.global_rotation += spread_angle
		else:
			var spread_angle = deg_to_rad(10 * (i - arrow_num / 2))
			new_projectile.global_rotation = %ShootingPoint.global_rotation + spread_angle
	
		new_projectile.speed = arrow_speed
		new_projectile.range = arrow_range
		new_projectile.pierce = arrow_pierce
		new_projectile.damage = arrow_damage
		
		%ShootingPoint.add_child(new_projectile)
	


func cross_shoot():
	const PROJECTILE = preload("res://Abilities/cross.tscn")
	
	for i in range(cross_num):
		var random_mob = get_random_mob()
		var new_projectile = PROJECTILE.instantiate()
		new_projectile.global_position = %ShootingPoint.global_position
	
	
	
		if random_mob != null:
			new_projectile.look_at(random_mob.global_position)
			
		else:
			
			new_projectile.global_rotation = %ShootingPoint.global_rotation 
		
		new_projectile.damage = cross_damage
		new_projectile.speed = cross_speed
		%ShootingPoint.add_child(new_projectile)
	
#Arrow Upgrades
func apply_arrow_cooldown_upgrade():
	print("cd button working")
	arrow_timer = $ArrowTimer
	$ArrowTimer.wait_time -= 0.08

func apply_arrow_pierce_upgrade():
	print("pierce button working")
	arrow_pierce += 1
	
func apply_arrow_num_upgrade():
	print("extra button working")
	arrow_num += 1
	
func apply_arrow_damage_upgrade():
	print("damage button working")
	arrow_damage *= 1.1



#Cross Upgrades
func apply_cross_cooldown_upgrade():
	cross_timer = $CrossTimer
	$CrossTimer.wait_time -= 0.08
	
func apply_cross_num_upgrade():
	cross_num += 1

func apply_cross_damage_upgrade():
	cross_damage *= 1.1

func _on_arrow_timer_timeout():
	arrow_shoot()


func _on_player_level_up(new_level):
	%UpgradeScreen.visible = true
	upgrade_selection_screen.randomize_upgrades()
	get_tree().paused = true
	


func _on_cross_timer_timeout():
	cross_shoot()
