extends Control

@onready var ability_manager = get_node("/root/World/Player/AbilityManager")

var button_upgrade = null


func _ready():
	visible = false
	
	print("Button upgrade in _ready():", button_upgrade)

		

func show_upgrade_screen():
	visible = true
	

func randomize_upgrades():
	var upgrade_keys = ability_manager.upgrades.keys()
	print("Available upgrades:", upgrade_keys)
	if upgrade_keys.size() > 0:
		var random_index = randi() % upgrade_keys.size()
		button_upgrade = upgrade_keys[random_index]
		
		$Panel/Button.text = get_upgrade_name(button_upgrade)
		
		print("Assigned to button:", button_upgrade)
	else:
		print("No upgrades available")




func _on_button_pressed():

	print("Button pressed")
	print("Current button upgrade:", button_upgrade)
	if button_upgrade:
		print("Checking if upgrade exists in dictionary:", button_upgrade)
		if ability_manager.upgrades.has(button_upgrade):
			print("Button upgrade found:", button_upgrade)
			var callable_method = ability_manager.upgrades[button_upgrade]
			if callable_method:
				print("Calling method...")
				callable_method.call()
			else:
				print("Callable method is null")
		else:
			print("Button upgrade not found in dictionary:", button_upgrade)
	else:
		print("Button upgrade not found or null")
	resume_game()


func resume_game():
	visible = false
	get_tree().paused = false


func get_upgrade_name(func_name: String):
	match func_name:
		"arrow_cooldown_upgrade":
			return "Arrow 8% CDR"
		"arrow_pierce_upgrade":
			return "Arrow +1 Pierce"
		"arrow_num_upgrade":
			return "Shoot +1 Arrow"
		"arrow_damage_upgrade":
			return "Arrow 10%+ Damage"
		"cross_cooldown_upgrade":
			return "Cross 8% CDR"
		"cross_num_upgrade":
			return "Shoot +1 Cross"
		"cross_damage_upgrade":
			return "Cross 10%+ Damage"
