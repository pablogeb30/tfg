extends Area2D

class_name Player

@export var speed = 600 # Velocidad normal del personaje
@export var run_speed = 800 # Velocidad al correr
var screen_size # Tamaño de la pantalla

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = "idle_up"
	$AnimatedSprite2D.play()

func _process(delta):
	var velocity = Vector2.ZERO
	var is_running = Input.is_action_pressed("run") # Detectar si se está corriendo
	
	# Detectar entrada del jugador
	if Input.is_action_pressed("walk_right"):
		velocity.x += 1
	if Input.is_action_pressed("walk_left"):
		velocity.x -= 1
	if Input.is_action_pressed("walk_down"):
		velocity.y += 1
	if Input.is_action_pressed("walk_up"):
		velocity.y -= 1

	# Normalizar y escalar velocidad
	if velocity.length() > 0:
		velocity = velocity.normalized() * (run_speed if is_running else speed)

	# Mover al personaje
	position += velocity * delta
	
	# Clampear posición dentro de los límites de la pantalla (si no hay cámara)
	position = position.clamp(Vector2.ZERO, screen_size)
	
	# Actualizar animación según la dirección y estado
	if velocity.length() > 0:
		if velocity.x > 0:  # Movimiento hacia la derecha
			$AnimatedSprite2D.animation = "run_right" if is_running else "walk_right"
		elif velocity.x < 0: # Movimiento hacia la izquierda
			$AnimatedSprite2D.animation = "run_left" if is_running else "walk_left"
		elif velocity.y > 0:  # Movimiento hacia abajo
			$AnimatedSprite2D.animation = "run_down" if is_running else "walk_down"
		elif velocity.y < 0:  # Movimiento hacia arriba
			$AnimatedSprite2D.animation = "run_up" if is_running else "walk_up"
	else:
		# Cambiar a estado "idle" dependiendo de la última dirección
		if $AnimatedSprite2D.animation in ["walk_right", "run_right"]:
			$AnimatedSprite2D.animation = "idle_right"
		elif $AnimatedSprite2D.animation in ["walk_left", "run_left"]:
			$AnimatedSprite2D.animation = "idle_left"
		elif $AnimatedSprite2D.animation in ["walk_down", "run_down"]:
			$AnimatedSprite2D.animation = "idle_down"
		elif $AnimatedSprite2D.animation in ["walk_up", "run_up"]:
			$AnimatedSprite2D.animation = "idle_up"
