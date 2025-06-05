extends Node2D

const DIRECCIONES = {
	"norte": Vector2(0, -1),
	"sur": Vector2(0, 1),
	"este": Vector2(1, 0),
	"oeste": Vector2(-1, 0)
}
const OPUESTA = {
	"norte": "sur",
	"sur": "norte",
	"este": "oeste",
	"oeste": "este"
}

@export var sala_escena: PackedScene
@export var distancia_objetivo: int = 10
@export var mostrar_minimapa := true

var salas = {} # posición Vector2 -> { distancia, puertas: [], es_final }


func _ready():
	var sala_size = Vector2(1920, 1080)
	var origen = Vector2(0, 0)

	salas[origen] = { "distancia": 0, "puertas": [], "es_final": false }
	var cola = [origen]
	var max_distancia = 0
	var ultima_sala = origen

	while cola.size() > 0:
		var actual = cola.pop_front()
		var datos_actual = salas[actual]
		var distancia = datos_actual["distancia"]

		if distancia > max_distancia:
			max_distancia = distancia
			ultima_sala = actual

		if distancia >= distancia_objetivo:
			continue

		var direcciones = DIRECCIONES.keys()
		direcciones.shuffle()
		var num_salas = randi_range(1, 4)

		for i in range(num_salas):
			var dir = direcciones[i]
			var nueva_pos = actual + DIRECCIONES[dir]

			if not salas.has(nueva_pos):
				# Crear nueva sala
				salas[nueva_pos] = {
					"distancia": distancia + 1,
					"puertas": [OPUESTA[dir]],
					"es_final": false
				}
				# Añadir conexión a la sala actual
				salas[actual]["puertas"].append(dir)
				cola.append(nueva_pos)

	# Marcar sala final
	salas[ultima_sala]["es_final"] = true

	# Instanciar salas
	for pos in salas.keys():
		var sala = sala_escena.instantiate()
		sala.position = pos * sala_size
		sala.name = "Sala_%s_%s" % [pos.x, pos.y]

		# Pasar datos a la sala
		sala.set("puertas", salas[pos]["puertas"])
		sala.set("es_final", salas[pos]["es_final"])

		add_child(sala)

func _draw():
	if not mostrar_minimapa:
		return

	var tile_size := Vector2(40, 40) # tamaño de sala en el minimapa
	var offset := Vector2(960, 540) # desplazamiento desde la esquina
	var color_normal := Color(0.5, 0.5, 0.5)
	var color_final := Color(1, 0.8, 0.2)

	for pos in salas.keys():
		var screen_pos := offset + Vector2(pos.x * tile_size.x, pos.y * tile_size.y)
		var color =  color_final if salas[pos]["es_final"] else color_normal

		# Dibujar la sala
		draw_rect(Rect2(screen_pos, tile_size), color)

		# Dibujar conexiones
		for dir in salas[pos]["puertas"]:
			var delta = DIRECCIONES[dir] * tile_size
			var destino = screen_pos + delta
			draw_line(screen_pos + tile_size / 2, destino + tile_size / 2, Color.WHITE, 1.0)
