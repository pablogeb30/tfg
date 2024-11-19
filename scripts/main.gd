extends Node2D

class_name Main

@export var room_scene: PackedScene  # Escena de la sala (Room.tscn)

func _ready():
	# En cada ejecucion del juego cambia la semilla de randomizacion
	randomize()
	
	# Instanciar la sala inicial
	var new_room = room_scene.instantiate();
	add_child(new_room)
	
	# Conectar la senhal de cambio de sala a la nueva
	new_room.connect("changed_room", Callable(self, "_on_room_changed_room"))

func _on_room_changed_room(_direction: String) -> void:
	# Reiniciar posicion del jugador
	$Player.visible = false
	await get_tree().create_timer(0.7).timeout
	$Player.position = Vector2(900, 900)
	
	# Borrar ultima sala instanciada
	for child in get_children():
		if child is Room:
			child.queue_free()
	
	# Instanciar una nueva sala
	var new_room = room_scene.instantiate()
	add_child(new_room)
	
	# Conectar la senhal de cambio de sala a la nueva
	new_room.connect("changed_room", Callable(self, "_on_room_changed_room"))
	
	# Mostrar al jugador de nuevo
	$Player.visible = true
