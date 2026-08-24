extends Node2D

var score = 0
var lives = 3
var total_spawned = 0
const MAX_LOVES = 30

var love_scene = preload("res://love.tscn")

@onready var hud = $HUD
@onready var spawn_timer = $SpawnTimer

func _ready():
	spawn_timer.timeout.connect(_spawn_love)
	spawn_timer.stop()

func start_game():
	spawn_timer.start()

func _spawn_love():
	if total_spawned >= MAX_LOVES:
		spawn_timer.stop()
		await get_tree().create_timer(2.0).timeout
		_game_over()
		return
	var love = love_scene.instantiate()
	love.position = Vector2(randf_range(40, 1112), -20)
	love.caught.connect(_on_love_caught)
	love.missed.connect(_on_love_missed)
	add_child(love)
	total_spawned += 1

func _on_love_caught():
	score += 1
	hud.update_score(score)

func _on_love_missed():
	lives -= 1
	hud.update_lives(lives)
	if lives <= 0:
		_game_over()

func _game_over():
	spawn_timer.stop()
	var percentage = int((float(score) / float(MAX_LOVES)) * 100)
	hud.show_game_over(percentage)
	$Player.set_process(false)
