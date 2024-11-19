extends Node2D

class_name Room

var num_portals: int = randi() % 4 + 1  # Aleatorio entre 1 y 4
@export var portal_scene: PackedScene # Escena del portal (Portal.tscn)

signal changed_room(direction: String) # Senhal de cambio de sala

# Posiciones y rotaciones predefinidas para los portales
var portals_data = {
	"Up": {"position": Vector2(900, 30), "rotation": 90},
	"Down": {"position": Vector2(900, 1776), "rotation": 270},
	"Left": {"position": Vector2(30, 900), "rotation": 0},
	"Right": {"position": Vector2(1776, 900), "rotation": 180}
}

func _ready() -> void:
	init("")


# Emitir senhal de cambio de sala
func _on_portal_closed(direction: String) -> void:
	changed_room.emit(direction)
	print("El jugador ha entrado en Portal" + direction)


# Inicializar los portales
func init(direction_from: String = "") -> void:
	# Seleccionar aleatoriamente las direcciones de los portales
	var directions = ["Up", "Down", "Left", "Right"]
	directions.shuffle()
	
	# Lista de direcciones finales (asegurando el opuesto)
	var final_directions = []
	if direction_from != "":
		var opposite_direction = get_opposite_direction(direction_from)
		final_directions.append(opposite_direction)
		directions.erase(opposite_direction)
	
	# Anhadir direcciones aleatorias para los otros portales
	while final_directions.size() < num_portals and directions.size() > 0:
		final_directions.append(directions.pop_back())

	# Generar los portales
	for direction in final_directions:
		create_portal(direction)


# Crear un portal
func create_portal(direction: String):
	var portal_info = portals_data[direction]

	# Instanciar el portal y configurarlo
	var portal = portal_scene.instantiate()
	add_child(portal)
	portal.position = portal_info["position"]
	portal.rotation_degrees = portal_info["rotation"]
	portal.direction = direction
	portal.name = "Portal" + direction
	
	# Conectar la senhal del portal
	portal.connect("closed_portal", Callable(self, "_on_portal_closed"))


# Obtener la direccion opuesta
func get_opposite_direction(direction: String) -> String:
	match direction:
		"Up": return "Down"
		"Down": return "Up"
		"Left": return "Right"
		"Right": return "Left"
		_: return "Error"
