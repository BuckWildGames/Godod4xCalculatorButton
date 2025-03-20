extends LineEdit


var allowed_characters = "0123456789+-*/.()"


func _ready() -> void:
	text_changed.connect(_on_text_changed)


func _on_text_changed(new_text: String) -> void:
	var cursor_position = get_caret_column()
	var filtered_text = ""
	for i in range(new_text.length()):
		if allowed_characters.contains(new_text[i]):
			filtered_text += new_text[i]
	set_text(filtered_text)
	set_caret_column(cursor_position)
