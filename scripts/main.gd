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
	new_room.connect("changed_room", Callable(self, "_on_room_changed"))


func _on_room_changed(direction: String) -> void:
	# Ocultar al jugador
	$Player.visible = false
	await get_tree().create_timer(0.5).timeout
	
	# Borrar ultima sala instanciada
	for child in get_children():
		if child is Room:
			child.queue_free()
	
	# Instanciar una nueva sala
	var new_room = room_scene.instantiate()
	add_child(new_room)
	
	# Inicializar la sala creada
	new_room.init(direction)
	
	# Colocar al jugador en la posicion correspondiente
	set_player(direction, new_room)
	
	# TODO: Anhadir animacion de abrir portal
	var portal = new_room.get_node("Portal" + new_room.get_opposite_direction(direction))
	var sprite_portal = portal.get_node("AnimatedSprite2D")
	sprite_portal.play("open")
	await sprite_portal.animation_finished
	sprite_portal.play("idle")
	
	# Mostrar al jugador de nuevo
	$Player.visible = true
	
	# Conectar la senhal de cambio de sala a la nueva
	new_room.connect("changed_room", Callable(self, "_on_room_changed"))

# Posicionar al jugador en el portal de entrada con un pequenho desplazamiento
func set_player(direction: String, room: Room) -> void:
	match direction:
		"Up":
			$Player.position = room.portals_data["Down"]["position"] - Vector2(0, 180)
		"Down":
			$Player.position = room.portals_data["Up"]["position"] + Vector2(-10, 85)
		"Left":
			$Player.position = room.portals_data["Right"]["position"] - Vector2(120, 60)
		"Right":
			$Player.position = room.portals_data["Left"]["position"] + Vector2(120, -40)
