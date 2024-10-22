extends Area2D

const MOVE_SPEED = 550
const SCREEN_WIDTH = 1920
const SCREEN_HEIGHT = 1080


func _ready():
	var centered_position = (SCREEN_HEIGHT) / 2
	position.y = centered_position

signal destroyed

func _process(delta):
	var input_dir = Vector2()
	if Input.is_key_pressed(KEY_UP):
		input_dir.y -= 1
	if Input.is_key_pressed(KEY_DOWN):
		input_dir.y += 1

	position += (delta * MOVE_SPEED) * input_dir
	if position.x < 88:
		position.x = 88
	elif position.x > SCREEN_WIDTH-88:
		position.x = SCREEN_WIDTH-88
	if position.y < 88:
		position.y = 88
	elif position.y > SCREEN_HEIGHT-88:
		position.y = SCREEN_HEIGHT-88


func _on_escuadra_area_entered(area):
	if area.is_in_group("escuadra"):
		queue_free()
