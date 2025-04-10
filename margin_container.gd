extends MarginContainer

# getting elements workable in scripe
@onready var label = $MarginContainer/Label
@onready var timer = $LetterDisplayTimer

const max_width = 256

var text = ""
var letter_index = 0

var letter_time = 0.03

signal finished_displaying()

func display_text(text_to_display: String):
	text = text_to_display
	label.text = text_to_display
	
	await resized
	custom_minimum_size.x = min(size.x, max_width)
	
	if size.x > max_width:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y = size.y
		
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24

	label.text = ""
	_display_letter()
	
func _display_letter():
	label.text += text[letter_index]
	
	letter_index += 1
	if letter_index >= text.length():
		finished_displaying.emit()
		return
		
	timer.start(letter_time)


func _on_letter_display_timer_timeout() -> void:
	_display_letter()
