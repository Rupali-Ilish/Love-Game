extends CanvasLayer

@onready var score_label     = $ScoreLabel
@onready var lives_label     = $LivesLabel
@onready var game_over_panel = $GameOverPanel
@onready var start_panel     = $StartPanel

func update_score(value: int):
	score_label.text = "Score: " + str(value)

func update_lives(value: int):
	lives_label.text = "Lives: " + str(value)

func show_game_over(percentage: int):
	game_over_panel.visible = true
	if percentage == 100:
		$GameOverPanel/Label.text = "You caught every single love! Mission Passed! Thanks for loving me 💖"
	elif percentage >= 50:
		$GameOverPanel/Label.text = "Oh! You filled your heart with " + str(percentage) + "% love. Why not full? Who is the bitch?"
	else:
		$GameOverPanel/Label.text = "Only " + str(percentage) + "% love? I don't need your love anymore!"

func _on_start_button_pressed():
	start_panel.visible = false
	get_parent().start_game()

func _on_restart_button_pressed():
	get_tree().reload_current_scene()
