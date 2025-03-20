extends Control


@onready var input_display: LineEdit = $PanelContainer/VBoxContainer/InputDisplay
@onready var grid_container: GridContainer = $PanelContainer/VBoxContainer/GridContainer


func _ready() -> void:
	for button in grid_container.get_children():
		if button is Button:
			button.pressed.connect(_on_button_pressed.bind(button.get_text()))


func setup_calculator() -> void:
	pass


func _on_button_pressed(value: String) -> void:
	if value == "=":
		var expression = input_display.get_text()
		var result = _evaluate_expression(expression)
		if _is_valid_integer(result):
			result = int(result)
		input_display.set_text(str(result))
	elif value == "C":
		input_display.set_text("")
	else:
		var text = input_display.get_text() + value
		input_display.set_text(text)


func _evaluate_expression(expression: String) -> float:
	var result: float = 0.0
	var error_message: String = "Error"
	var expr = Expression.new()
	var error = expr.parse(expression, [])
	if error == OK:
		result = expr.execute([], null, true)
		if expr.has_execute_failed():
			input_display.set_text(error_message)
			return 0.0
	else:
		input_display.set_text(error_message)
		return 0.0
	return result


func _is_valid_integer(value: float) -> bool:
	return value == int(value)
