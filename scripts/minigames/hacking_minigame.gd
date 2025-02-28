extends Control

@export var archive_component: ArchiveComponent
@export var button_container: GridContainer
var palavras: Array
var palavras_sorteadas: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	palavras = archive_component.carregar_palavras()
	palavras_sorteadas = archive_component.sortear_palavras(palavras)
	print(palavras_sorteadas)
	add_buttons()

func add_buttons(amount: int = 30) -> void:
	for i in range(amount):
		var button = Button.new()
		button.text = palavras_sorteadas[i]
		button.pressed.connect(func(): print(button.text))
		button_container.add_child(button)  # Adiciona ao container
