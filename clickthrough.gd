extends Node2D

# https://github.com/alinehui/partially-clickthrough-transparent/blob/main/main.gd
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_passthrough($sitting) # change this if sprite name changes

func set_passthrough(sprite: Sprite2D):
	var texture_center: Vector2 = sprite.texture.get_size() / 2
	var texture_corners: PackedVector2Array = [
		sprite.global_position + texture_center * Vector2(-1, -1), # Top left corner
		sprite.global_position + texture_center * Vector2(1, -1), # Top right corner
		sprite.global_position + texture_center * Vector2(1 , 1), # Bottom right corner
		sprite.global_position + texture_center * Vector2(-1 ,1) # Bottom left corner
	]

	DisplayServer.window_set_mouse_passthrough(texture_corners)
