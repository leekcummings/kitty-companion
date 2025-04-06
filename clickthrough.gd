extends Node2D

# https://github.com/alinehui/partially-clickthrough-transparent/blob/main/main.gd
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_passthrough($Area2D/Cat) # change this if sprite name changes

func set_passthrough(sprite: AnimatedSprite2D):
	var viewportSize: Vector2 = get_viewport().size
	var scaledSizeX = viewportSize[0] / 1152
	var scaledSizeY = viewportSize[1] / 648
	var texture_center: Vector2 = Vector2(sprite.sprite_frames.get_frame_texture(
		sprite.animation, sprite.frame).get_size()) * 0.5 * sprite.scale.x
	var texture_corners: PackedVector2Array = [
		Vector2((sprite.global_position[0] + texture_center[0]*1)*scaledSizeX, (sprite.global_position[1] + texture_center[1]*0)*scaledSizeY), # Top left corner
		Vector2((sprite.global_position[0] + texture_center[0]*3)*scaledSizeX, (sprite.global_position[1] + texture_center[1]*0)*scaledSizeY), # Top right corner
		Vector2((sprite.global_position[0] + texture_center[0]*3)*scaledSizeX, (sprite.global_position[1] + texture_center[1]*2)*scaledSizeY), # Bottom right corner
		Vector2((sprite.global_position[0] + texture_center[0]*1)*scaledSizeX, (sprite.global_position[1] + texture_center[1]*2)*scaledSizeY) # Bottom left corner
	]
	
	DisplayServer.window_set_mouse_passthrough(texture_corners)


func _on_letter_display_timer_timeout() -> void:
	pass # Replace with function body.
