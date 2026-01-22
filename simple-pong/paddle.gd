extends CharacterBody2D

#Paddel will only move vertically with inputs w and s for player 1 and up and down for player 2

var speed = 400



func _process(delta):
	var direction = 0
	var screen_height = get_viewport_rect().size.y
	var paddle_height = $CollisionShape2D.shape.size.y/2.5
	
	if Input.is_key_pressed(Key.KEY_W):
		direction -= 1
	if Input.is_key_pressed(Key.KEY_S):
		direction += 1
	position.y += direction * speed * delta
	position.y = clamp(
		position.y,
		paddle_height,
		screen_height - paddle_height
	)
	pass 
