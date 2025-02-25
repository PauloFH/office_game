extends InteractionObject

func _ready() -> void:
	%Label.text = _getText()
	%Label.hide()

func _interact() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		can_interact = true
		%Label.show()


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		can_interact = false
		%Label.hide()
