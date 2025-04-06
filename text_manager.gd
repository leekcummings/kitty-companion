extends Node

@onready var text_scene = preload("res://text.tscn")

var dialog_lines: String
var current_line_index = 0

@onready var text_box = $NinePatchRect

var text_box_position: Vector2

func play_dialogue(position: Vector2, lines: String):
	print("it went through, it's a problem here")
	dialog_lines = lines
	text_box_position = position
	_show_text_box()

func _show_text_box():
	# Ensure the text box is visible
	text_box = text_scene.instantiate()
	# Set the position of the text box relative to its parent
	text_box.rect_position = text_box_position

#extends Node
#
#var dialog_lines: String
#var current_line_index = 0
#
#@onready var text_box = $MarginContainer/NinePatchRect
#var text_box_position: Vector2
#
#@onready var node = $Node
#
##i don't think that we need this
##var is_dialogue_active = false
#
#func play_dialogue(position: Vector2, lines: String):
	##if is_dialog_active:
		##return
	#dialog_lines = lines
	#text_box_position = position
	#_show_text_box()
	#
#func _show_text_box():
	#node.show()
	#get_tree().root.add_child(text_box)
	#text_box.global_position = text_box_position
	#
