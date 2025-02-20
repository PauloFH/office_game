extends CharacterBody2D
class_name Character

var state: String = "idle_down"
var direction : Vector2 = Vector2.ZERO
@export var Speed: float = 300.0

func _interact() -> void:
	pass

func _change_state() -> void:
	pass

func _move() -> void:
	pass
