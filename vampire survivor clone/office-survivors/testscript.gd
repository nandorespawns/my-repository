extends Area2D


var upgrades = {
	"test_upgrade": Callable(self, "_test_upgrade_function")
}

func _ready():
	print("Testing Callable")
	_test_upgrade_function()  # Simulate calling the function
	_on_button_pressed()

func _test_upgrade_function():
	print("Test Upgrade Function Called")

func _on_button_pressed():
	var upgrade_key = "test_upgrade"
	if upgrades.has(upgrade_key):
		print("Button pressed, attempting to call:", upgrade_key)
		var callable_method = upgrades[upgrade_key]
		if callable_method:
			print("Calling method...")
			callable_method.call()
		else:
			print("Callable method is null")
	else:
		print("Button upgrade not found or null")
