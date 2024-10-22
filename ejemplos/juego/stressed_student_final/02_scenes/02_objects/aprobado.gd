extends Area2D

var move_speed = 450
var score_emitted = false

signal score

func _process(delta):
	position -= Vector2(move_speed * delta, 0)
	if position.x <= -2600:
		queue_free()

func _on_aprobado_area_entered(area):
	if area.is_in_group("player"):
		if not score_emitted:
			score_emitted = true
			score.emit()
			queue_free()
