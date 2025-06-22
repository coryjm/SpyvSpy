extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	var anim = ""

	if player.player_direction == Vector2.UP:
		anim = "attack_back"
	elif player.player_direction == Vector2.DOWN:
		anim = "attack_front"
	elif player.player_direction == Vector2.LEFT:
		anim = "attack_left"
		animated_sprite_2d.flip_h = true
	elif player.player_direction == Vector2.RIGHT:
		anim = "attack_right"
		animated_sprite_2d.flip_h = false

	if animated_sprite_2d.animation != anim:
		animated_sprite_2d.play(anim)
		if not animated_sprite_2d.is_connected("animation_finished", Callable(self, "_on_attack_finished")):
			animated_sprite_2d.connect("animation_finished", Callable(self, "_on_attack_finished"))
func _on_attack_finished() -> void:
	print("Attack animation finished at:", animated_sprite_2d.frame)
	transition.emit("Idle")

func _on_exit() -> void:
	animated_sprite_2d.disconnect("animation_finished", Callable(self, "_on_attack_finished"))
	animated_sprite_2d.stop()
