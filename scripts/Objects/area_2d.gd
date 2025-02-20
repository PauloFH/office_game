extends Area2D

@onready var label = $Label  # Referência ao Label

func _ready():
	label.visible = false  # Esconde o texto ao iniciar

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):  # Verifica se o Player entrou na área
		print("Entrei")
		label.visible = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):  # Esconde o texto quando o Player sai
		label.visible = false
