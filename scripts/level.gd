extends Node2D

# Numero de salas restantes hasta que aparezca la sala de jefe
var rooms_to_boss = 10

# _ready is called when the node is added to the scene
func _ready():
	# Initialize the random number generator
	randomize()
	# Creamos la sala inicial
	create_room()
	# Generate the dungeon by placing rooms and connecting them
	generate_level()
	
func generate_level():
	pass


func create_room():
	pass
	
