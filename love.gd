extends Area2D

var speed = 180.0

signal caught
signal missed

func _ready():
	area_entered.connect(_on_area_entered)

func _process(delta):
	position.y += speed * delta

	if position.y > 700:
		missed.emit()
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("player"):
		caught.emit()
		queue_free()
