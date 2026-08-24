extends Area2D

const SPEED = 450.0

const LEFT_LIMIT  = 40.0
const RIGHT_LIMIT = 1112.0

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	position.x += direction * SPEED * delta
	position.x = clamp(position.x, LEFT_LIMIT, RIGHT_LIMIT)
