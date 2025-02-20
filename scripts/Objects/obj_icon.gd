extends StaticBody2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready() -> void:
	interaction_area.interact = Callable(self, "on_Interact")

func on_Interact() -> void:
	print("Interagi")
