extends CharacterBody2D

const speed :=800

func getYdir() -> float:
	return Input.get_action_strength("down")-Input.get_action_strength("up")


func _physics_process(delta: float) -> void:
	var dir :Vector2=Vector2(0,getYdir())
	velocity = dir * speed
	move_and_slide()
