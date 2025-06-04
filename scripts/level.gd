extends Node2D

# Numero de salas restantes hasta que aparezca la sala de jefe
var room_count = 4

# Carga la escena 'room' como recurso
@export var room_scene: PackedScene

# _ready is called when the node is added to the scene
func _ready():
	# Initialize the random number generator
	randomize()
	# Generate the dungeon by placing rooms and connecting them
	generate_level()

func generate_level():
	var rooms = []  # Lista para almacenar las salas generadas
	for i in range(room_count):
		# Instanciar una nueva sala
		var room_instance = room_scene.instantiate()
		# Posicionar la sala (esto puede mejorarse según tu lógica de diseño)
		#room_instance.position = Vector2(randf() * 1600, randf() * 1600)
		add_child(room_instance)
		# Conectar la nueva sala con una sala ya existente, si hay alguna
		if rooms.size() > 0:
			# Escoger una sala aleatoria de las ya generadas
			var random_room = rooms[randi() % rooms.size()]
			# Conectar ambas salas
			room_instance.connect_room(random_room)
		# Añadir la sala a la lista de salas generadas
		rooms.append(room_instance)
	# Crear conexiones adicionales aleatorias (opcional, para evitar un árbol puro)
	create_additional_connections(rooms)

func create_additional_connections(rooms):
	"""
	Crea conexiones adicionales entre salas de forma aleatoria,
	evitando que todas las salas estén conectadas con todas.
	"""
	for room in rooms:
		# Probabilidad de crear una conexión adicional
		if randf() < 0.5:  # Ajusta la probabilidad según el diseño
			var random_room = rooms[randi() % rooms.size()]
			# Asegurarse de no conectar una sala consigo misma o duplicar conexiones
			if not room.is_connected_room(random_room) and room != random_room:
				room.connect_room(random_room)
