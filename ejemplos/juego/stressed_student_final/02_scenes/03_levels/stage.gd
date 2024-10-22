extends Node2D
var aprobado = preload("res://02_scenes/02_objects/asteroid.tscn")
var suspenso = preload("res://02_scenes/02_objects/suspenso.tscn")
var escuadra = preload("res://02_scenes/02_objects/escuadra.tscn")

var score = 0

const SCREEN_WIDTH = 1920
const SCREEN_HEIGHT = 720

var is_game_over = false

var music = AudioStreamPlayer.new()
	
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if is_game_over and Input.is_key_pressed(KEY_ENTER):
		get_tree().reload_current_scene()

func _on_spawn_timer_timeout():
	var aprobado_instance = aprobado.instantiate()
	aprobado_instance.position = Vector2(SCREEN_WIDTH + 8, randi_range(0, SCREEN_HEIGHT))
	aprobado_instance.get_node("aprobado").score.connect(_on_player_score)
	aprobado_instance.get_node("aprobado").move_speed += score
	add_child(aprobado_instance)

	var suspenso_instance = suspenso.instantiate()
	suspenso_instance.position = Vector2(SCREEN_WIDTH + 8, randi_range(0, SCREEN_HEIGHT))
	suspenso_instance.get_node("suspenso").noscore.connect(_on_player_noscore)
	suspenso_instance.get_node("suspenso").move_speed += score
	add_child(suspenso_instance)

func _on_player_score():
	score += 1
	get_node("ui/score").text = "score: " + str(score)

func _on_player_noscore():
	score -= 1
	get_node("ui/score").text = "score: " + str(score)
	

func _on_player_muerte():
	$muerte.visible = true
	is_game_over = true

func _ready():
	get_node("player/player").destroyed.connect(_on_player_muerte)
	music.stream = load("res://01_assets/03_sound/02_music/musica_fondo.mp3")
	music.stream.loop = true
	music.autoplay = true
	add_child(music)
	
	$muerte.visible = false

func _process(delta):
	$background.position.x -= 30 * delta  
	if $background.position.x < -SCREEN_WIDTH:
		$background.position.x = SCREEN_WIDTH - 320


func _on_muerte_timer_timeout():
	var escuadra_instance = escuadra.instantiate()
	escuadra_instance.position = Vector2(SCREEN_WIDTH + 8, randi_range(0, SCREEN_HEIGHT))
	escuadra_instance.get_node("escuadra").muerte.connect(_on_player_muerte)
	escuadra_instance.get_node("escuadra").move_speed += score
	add_child(escuadra_instance)
