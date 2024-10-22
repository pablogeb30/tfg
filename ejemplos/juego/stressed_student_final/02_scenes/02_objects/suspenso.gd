extends Area2D

var move_speed = 450
var noscore_emitted = false

signal noscore

func _process(delta):
	position -= Vector2(move_speed * delta, 0)
	if position.x <= -2200:
		queue_free()

func _on_suspenso_area_entered(area):
	if area.is_in_group("player"):
		if not noscore_emitted:
			noscore_emitted = true
			noscore.emit()
			queue_free()
			
