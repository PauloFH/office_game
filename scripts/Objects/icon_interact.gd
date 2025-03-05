extends InteractionObject
class_name IconInteract

@onready var control: Control = $Control
@onready var minigame_scene: PackedScene = preload("res://scenes/minigamesUi/hacking_minigame.tscn")
var minigame: HackingMinigame
var player: Player

func _ready() -> void:
	%Label.text = _getText()
	%Label.hide()

func _interact() -> void:
	print("Interagir")
	if not minigame:
		minigame = minigame_scene.instantiate() as HackingMinigame
		player._interact(minigame)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && can_interact:
		_interact()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		can_interact = true
		player = body
		%Label.show()


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		can_interact = false
		player = null
		%Label.hide()
