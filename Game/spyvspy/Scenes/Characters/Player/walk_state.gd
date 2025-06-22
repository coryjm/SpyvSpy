extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 100

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()

	# Play animations based on direction
	if direction.y < 0:
		animated_sprite_2d.play("walk_back")
	elif direction.y > 0:
		animated_sprite_2d.play("walk_front")
	elif player.player_direction.x > 0:
		animated_sprite_2d.play("walk_right")
		animated_sprite_2d.flip_h = false
	elif player.player_direction.x < 0:
		animated_sprite_2d.play("walk_left")
		animated_sprite_2d.flip_h = true

	# Update player direction if moving
	if direction != Vector2.ZERO:
		player.player_direction = direction

	# Apply movement
	player.velocity = direction * speed
	player.move_and_slide()


func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")



func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
