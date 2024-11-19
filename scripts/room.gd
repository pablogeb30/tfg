extends Node2D

class_name Room

var num_portals: int = randi() % 4 + 1  # Aleatorio entre 1 y 4
@export var portal_scene: PackedScene # Escena del portal (Portal.tscn)

signal changed_room # Senhal de cambio de sala

# Posiciones y rotaciones predefinidas para los portales
var portals_data = {
	"Up": {"position": Vector2(900, 30), "rotation": 90},
	"Down": {"position": Vector2(900, 1776), "rotation": 270},
	"Left": {"position": Vector2(30, 900), "rotation": 0},
	"Right": {"position": Vector2(1776, 900), "rotation": 180}
}

func _ready():
	# Seleccionar aleatoriamente las direcciones de los portales
	var directions = ["Up", "Down", "Left", "Right"]
	directions.shuffle()
	
	# Crear los portales necesarios
	for i in range(num_portals):
		var portal_info = portals_data[directions[i]]

		# Instanciar el portal y configurarlo
		var portal = portal_scene.instantiate()
		add_child(portal)
		portal.position = portal_info["position"]
		portal.rotation_degrees = portal_info["rotation"]
		portal.direction = directions[i]
		portal.name = "Portal" + directions[i]
	
		# Conectar la senhal del portal al metodo adecuado
		portal.connect("closed_portal", Callable(self, "_on_portal_closed"))

# Emitir senhal de cambio de sala
func _on_portal_closed(direction: String) -> void:
	changed_room.emit(direction)
	print("El jugador ha entrado en el portal hacia " + direction)
