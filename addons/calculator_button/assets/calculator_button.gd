extends Button

const CALCULATOR: PackedScene = preload("res://addons/calculator_button/assets/calculator.tscn")

var calculator: Control = null


func _ready() -> void:
	calculator = CALCULATOR.instantiate()
	add_child(calculator)
	calculator.set_visible(false)


func _pressed() -> void:
	if calculator:
		if calculator.is_visible():
			calculator.set_visible(false)
		else:
			calculator.setup_calculator()
			calculator.set_visible(true)
