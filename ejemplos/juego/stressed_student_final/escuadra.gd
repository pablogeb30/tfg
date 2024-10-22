extends Area2D

var move_speed = 650
var muerte_emitted = false

signal muerte

func _process(delta):
	position -= Vector2(move_speed * delta, 0)
	if position.x <= -2600:
		queue_free()

func _on_escuadra_area_entered(area):
	if area.is_in_group("player"):
		muerte.emit()
		$sonido_muerte.play()
