extends CharacterBody2D


const SPEED = 300.0
var direction = Vector2(0,0)
var screen_height = 0
var ball_radius = 0
var paddle_left
var paddle_right
var paddle_left_size = Vector2(0,0)
var paddle_right_size = Vector2(0,0)

func _ready():
	paddle_left =  get_parent().get_node("Paddle_left")
	paddle_right =  get_parent().get_node("Paddle_right")
	screen_height = get_viewport_rect().size.y
	ball_radius = $ball_shape.shape.radius
	paddle_left_size = paddle_left.get_node("CollisionShape2D").shape.extents
	paddle_right_size = paddle_right.get_node("CollisionShape2D").shape.extents
	randomize()
	var ball_horizontal = [-1,1].pick_random()
	var ball_vertical = randf_range(-0.5,0.5)
	direction = Vector2(ball_horizontal,ball_vertical).normalized()
	#direction = Vector2(0,-1).normalized()

func _physics_process(_delta):
	position += direction * SPEED *_delta
	if position.y - ball_radius <= 0:
		direction.y *= -1
		position.y = ball_radius
	elif position.y + ball_radius >= screen_height:
		direction.y *= -1
		position.y = screen_height - ball_radius
	check_paddle_collision()

func check_paddle_collision():
	if direction.x < 0:	
		if position.x - ball_radius <= paddle_left.position.x + paddle_left_size.x \
		and position.x > paddle_left.position.x \
		and position.y >= paddle_left.position.y - paddle_left_size.y \
		and position.y <= paddle_left.position.y + paddle_left_size.y:
			direction.x *= -1
			position.x = paddle_left.position.x + paddle_left_size.x + ball_radius
	if direction.x > 0:
		if position.x + ball_radius >= paddle_right.position.x - paddle_right_size.x \
		and position.x < paddle_right.position.x \
		and position.y >= paddle_right.position.y - paddle_right_size.y \
		and position.y <= paddle_right.position.y + paddle_right_size.y:

			direction.x *= -1
			position.x = paddle_right.position.x - paddle_right_size.x - ball_radius
