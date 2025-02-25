extends Area2D
class_name InteractionObject

@export var action_name: String = "Interact"
const base_text: String = "[E] to "

var can_interact: bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && can_interact:
		_interact()

func _interact() -> void:
	pass

func _getText() -> String:
	return base_text + action_name
