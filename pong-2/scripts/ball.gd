extends CharacterBody2D

const speed := 4

func _ready() -> void:
	velocity = Vector2(-speed,0)
	
func _physics_process(delta: float) -> void:
	var col := move_and_collide(velocity)
	if col:
		var normal :=col.get_normal()
		velocity=velocity.bounce(normal)
		
