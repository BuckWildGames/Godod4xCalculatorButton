@tool
extends EditorPlugin

# Called when the plugin is enabled
func _enter_tree() -> void:
	add_custom_type("CalculatorButton", "Button", preload("res://addons/calculator_button/assets/calculator_button.gd"), preload("res://addons/calculator_button/assets/calculator_green.svg"))


# Called when the plugin is disabled
func _exit_tree() -> void:
	remove_custom_type("CalculatorButton")
