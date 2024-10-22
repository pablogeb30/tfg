extends Area2D

const SCREEN_WIDTH = 1920
const MOVE_SPEED = 150

func _ready():
	position.x = 20

func _process(delta):
	position += Vector2(MOVE_SPEED * delta, 0)
	if position.x >= SCREEN_WIDTH + 6:
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("asteroid"):
		queue_free()
