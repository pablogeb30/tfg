extends Sprite2D

const SCREEN_WIDTH = 1920

func _input(event):
	if Input.is_key_pressed(KEY_DOWN):
		get_tree()change_scene_to_file("res://stage.tscn")
