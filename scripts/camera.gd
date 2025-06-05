extends Camera2D


func _ready() -> void:
	Events.room_entered.connect(_on_room_entered)

func _on_room_entered(room: Node2D) -> void:
	global_position = room.global_position
