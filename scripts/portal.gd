extends Area2D

class_name Portal

@export var direction: String = "" # Direccion del portal

signal opened_portal

func _ready():
	$AnimatedSprite2D.play()

# Cuando el jugador entra en el portal se emite la senhal
func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		opened_portal.emit(direction)
