extends CharacterBody2D

const SPEED := 200.0
var last_direction := "down"

func _physics_process(delta: float) -> void:
	# Get input as a 2D direction vector
	var input_vector := Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()

	# Update velocity based on input
	velocity = input_vector * SPEED

	# Update animation based on movement
	if input_vector != Vector2.ZERO:
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				last_direction = "right"
				$AnimatedSprite2D.play("idle right")
			else:
				last_direction = "left"
				$AnimatedSprite2D.play("idle left")
		else:
			if input_vector.y > 0:
				last_direction = "down"
				$AnimatedSprite2D.play("idle left")
			else:
				last_direction = "up"
				$AnimatedSprite2D.play("idle left")
	else:
		match last_direction:
			"up":
				$AnimatedSprite2D.play("idle_up")
			"down":
				$AnimatedSprite2D.play("idle_down")
			"left":
				$AnimatedSprite2D.play("idle left")
			"right":
				$AnimatedSprite2D.play("idle right")

	move_and_slide()
