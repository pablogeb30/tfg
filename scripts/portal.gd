extends Area2D

class_name Portal

@export var direction: String = "" # Direccion del portal

signal closed_portal # Senhal de portal cerrado

func _ready():
	$AnimatedSprite2D.animation = "idle"
	$AnimatedSprite2D.play()

# Cuando el jugador entra en el portal se emite la senhal
func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		closed_portal.emit(direction)
		# Posponer la desactivacion de la colision
		call_deferred("_disable_collision")
		# Reproducir la animacion de cierre
		$AnimatedSprite2D.play("close")
		# Esperar a que termine la animacion antes de eliminar el nodo
		await $AnimatedSprite2D.animation_finished
		queue_free()

# Desactivar la colision de manera segura
func _disable_collision():
	$CollisionShape2D.disabled = true
