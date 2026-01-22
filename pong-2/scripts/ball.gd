extends CharacterBody2D

const speed := 5.5
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	var ball_dir = rng.randf_range(-1.0, 1.0)
	velocity = Vector2(-speed,ball_dir)
	
func _physics_process(delta: float) -> void:
	var col := move_and_collide(velocity)
	if col:
		var normal :=col.get_normal()
		velocity=velocity.bounce(normal)
		
