extends Node2D

class_name Room

func _ready():
	# Se conectan todas las senhales de los portales al mismo metodo
	for portal in $Portals.get_children():
		portal.connect("opened_portal", Callable(self, "_on_portal_opened"))

func _on_portal_opened(direction: String) -> void:
	print("El jugador ha entrado en el portal hacia " + direction)
