extends CharacterBody2D

# Constantes del movimiento del personaje
const MAX_SPEED = 500.0
const ACCELERATION = 6000.0
const FRICTION = 4000.0

# Variable para el sprite animado
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.play("idle_down")


func _physics_process(delta: float) -> void:
	# Se recogen las entradas de teclado
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Normalizar el vector de entrada si es mayor que 1 (movimiento diagonal)
	if input.length() > 1:
		input = input.normalized()
	
	# Animaciones de movimiento
	if input.length() > 0:
		
		# Se define la velocidad en funcion de las constantes
		velocity = velocity.move_toward(input * MAX_SPEED, ACCELERATION * delta)
		
		# Manejo de animaciones diagonales
		if input.x != 0 and input.y != 0:
			if input.x > 0 and input.y > 0:
				animated_sprite.play("run_rightdown")
			elif input.x > 0 and input.y < 0:
				animated_sprite.play("run_rightup")
			elif input.x < 0 and input.y > 0:
				animated_sprite.play("run_leftdown")
			elif input.x < 0 and input.y < 0:
				animated_sprite.play("run_leftup")
		
		# Manejo de animaciones para direcciones principales
		else:
			if abs(input.x) > abs(input.y):
				if input.x > 0:
					animated_sprite.play("run_right")
				else:
					animated_sprite.play("run_left")
			else:
				if input.y > 0:
					animated_sprite.play("run_down")
				else:
					animated_sprite.play("run_up")
					
	# Animaciones idle
	else:
		# Se aplica la friccion al quedarse quieto el personaje
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
		# Se muestra la animacion correspondiente
		if animated_sprite.animation == "run_right":
			animated_sprite.play("idle_right")
		elif animated_sprite.animation == "run_left":
			animated_sprite.play("idle_left")
		elif animated_sprite.animation == "run_up":
			animated_sprite.play("idle_up")
		elif animated_sprite.animation == "run_down":
			animated_sprite.play("idle_down")
		elif animated_sprite.animation == "run_leftup":
			animated_sprite.play("idle_leftup")
		elif animated_sprite.animation == "run_leftdown":
			animated_sprite.play("idle_leftdown")
		elif animated_sprite.animation == "run_rightup":
			animated_sprite.play("idle_rightup")
		elif animated_sprite.animation == "run_rightdown":
			animated_sprite.play("idle_rightdown")
	
	# Se mueve al personaje
	move_and_slide()
