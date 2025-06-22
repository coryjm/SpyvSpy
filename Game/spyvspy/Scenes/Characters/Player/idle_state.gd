extends NodeState


@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	
		
	if player.player_direction.y < 0:
		animated_sprite_2d.play("idle_back")
	elif player.player_direction.y > 0:
		animated_sprite_2d.play("idle_front")
	elif player.player_direction.x > 0:
		animated_sprite_2d.play("idle_right")
		animated_sprite_2d.flip_h = false
	elif player.player_direction.x < 0:
		animated_sprite_2d.play("idle_left")
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.play("idle_front")

		
		
func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
		
	if player.current_weapon == DataTypes.Attack.Axe && GameInputEvents.use_weapon():
		transition.emit("Attack")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
