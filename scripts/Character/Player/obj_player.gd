extends Character
class_name Player

func _ready() -> void:
	%animPlayer.play("idle_down")

func _process(delta: float) -> void:
	_move()
	_change_state()

func _input(event: InputEvent) -> void:
	direction = Input.get_vector(
		"move_left","move_right",
		"move_up", "move_down")
	

func _change_state() -> void:
	if direction == Vector2.ZERO:
		if state.begins_with("walk"):
			state = state.replace("walk", "idle")
	else:
		if abs(direction.x) > abs(direction.y):
			state = "walk_right" if direction.x > 0 else "walk_left"
		else:
			state = "walk_down" if direction.y > 0 else "walk_up"
	
	%animPlayer.play(state)

func _move() -> void:
	velocity = direction * Speed
	move_and_slide()
