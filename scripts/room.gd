extends Node2D

class_name Room

# Diccionario que guarda las conexiones con otras salas
var connections = {}

#func _init(pos : Vector2i):
	#self.position = pos

func connect_room(room: Room):
	"""
	Conecta esta sala con otra.
	"""
	connections[room] = true
	room.connections[self] = true

func is_connected_room(room: Room) -> bool:
	"""
	Comprueba si esta sala esta conectada con otra sala.
	"""
	return connections.has(room)


func _on_player_detector_body_entered(_body: Node2D) -> void:
	Events.room_entered.emit(self)
