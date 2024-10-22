extends Node

var video_player

signal finished

func _ready():
	$menu.visible = false

func _on_animacion_finished():
	$menu.visible = true
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		load_game_scene()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func load_game_scene():
	get_tree().change_scene_to_file("res://02_scenes/03_levels/stage.tscn")
