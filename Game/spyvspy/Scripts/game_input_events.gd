class_name GameInputEvents

static var direction: Vector2

static func movement_input() -> Vector2:
	direction = Vector2.ZERO  # Assign to the static variable

	if Input.is_action_pressed("walk_right"):
		direction.x += 1
	if Input.is_action_pressed("walk_left"):
		direction.x -= 1
	if Input.is_action_pressed("walk_down"):
		direction.y += 1
	if Input.is_action_pressed("walk_up"):
		direction.y -= 1

	return direction.normalized()
	
static func is_movement_input() -> bool:
	return direction != Vector2.ZERO
		
static func use_weapon() -> bool:
	var use_weapon_value: bool = Input.is_action_just_pressed("Attack")
	return use_weapon_value
