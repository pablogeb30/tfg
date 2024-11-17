extends Area2D

@export var speed = 800
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = "idle_front"
	$AnimatedSprite2D.play()

func _process(delta):
	var velocity = Vector2.ZERO
	
	# Detectar entrada del jugador
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	# Normalizar y escalar velocidad
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	# Mover al personaje
	position += velocity * delta
	
	# Clampear posicion dentro de los limites de la pantalla (si no hay camara)
	position = position.clamp(Vector2.ZERO, screen_size)
	
	# Actualizar animacion segun la direccion
	if velocity.length() > 0:
		if velocity.x != 0:  # Movimiento horizontal
			$AnimatedSprite2D.animation = "move_sides"
			$AnimatedSprite2D.flip_h = velocity.x < 0
		elif velocity.y > 0:  # Movimiento hacia abajo
			$AnimatedSprite2D.animation = "move_front"
		elif velocity.y < 0:  # Movimiento hacia arriba
			$AnimatedSprite2D.animation = "move_back"
	else:
		# Cambiar a estado "idle" dependiendo de la ultima direccion
		if $AnimatedSprite2D.animation == "move_sides":
			$AnimatedSprite2D.animation = "idle_sides"
		elif $AnimatedSprite2D.animation == "move_front":
			$AnimatedSprite2D.animation = "idle_front"
		elif $AnimatedSprite2D.animation == "move_back":
			$AnimatedSprite2D.animation = "idle_back"
