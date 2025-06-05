extends Node2D

@export var puertas: Array = [] # ["norte", "sur", ...]
@export var es_final: bool = false

func _ready():
	# Activar solo las puertas necesarias
	for dir in ["norte", "sur", "este", "oeste"]:
		var nodo = get_node("Puerta_%s" % dir.capitalize())
		if nodo:
			nodo.visible = puertas.has(dir)
	if es_final:
		modulate = Color(1, 1, 0.5) # color dorado para salas finales

func _on_player_detector_body_entered(_body: Node2D) -> void:
	Events.room_entered.emit(self)
