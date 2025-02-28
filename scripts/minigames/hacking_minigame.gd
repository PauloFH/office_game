extends Control

@export var archive_component: ArchiveComponent
@export var button_container: GridContainer
@export var attempts_text_label: Label
@export var last_attempt_label: Label
@export var correct_characters_label: Label

var attempts_index: int = 4

var palavra_escolhida: String
var palavras: Array
var palavras_sorteadas: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	palavras = archive_component.carregar_palavras()
	palavras_sorteadas = archive_component.sortear_palavras(palavras)
	print(palavras_sorteadas)
	
	randomize()
	var random_index = randi() % palavras_sorteadas.size()
	palavra_escolhida = palavras_sorteadas[random_index]
	print("Palavra escolhida: ", palavra_escolhida)
	
	att_attempts_text()
	att_last_attempt_text("")
	
	add_buttons()

func add_buttons(amount: int = 30) -> void:
	for i in range(amount):
		var button = Button.new()
		button.text = palavras_sorteadas[i]
		#button.pressed.connect(func(): print(button.text))
		button.pressed.connect(check_button.bind(button))
		button_container.add_child(button)  # Adiciona ao container

func att_attempts_text() -> void:
	attempts_index = attempts_index - 1 if attempts_index >= 1 else attempts_index
	attempts_text_label.text =  "Attempts: " + str(attempts_index) + "/3"

func att_last_attempt_text(last_attempt: String = "") -> void:
	last_attempt_label.text = "last attempt: " + last_attempt

func att_corrects_characters_text(attempt: String) -> void:
	correct_characters_label.text = "correct characters: " + str(count_correct_characters(attempt)) + "/" + str(palavra_escolhida.length())

func count_correct_characters(attempt: String) -> int:
	var min: int = min(attempt.length(), palavra_escolhida.length())
	var correct_word : String = palavra_escolhida
	var correct_characteres = 0
	
	for char in attempt:
		var index = correct_word.find(char)  # Encontra o índice do caractere na string correta
		
		if index != -1:
			correct_characteres += 1
			correct_word = correct_word.erase(index, 1)  # Remove o caractere da string correta para não contar novamente

	
	return correct_characteres

func check_button(button: Button) -> void: 
	print(button.text)
	if button.text == palavra_escolhida:
		print("Plavra correta")
	else:
		att_attempts_text()
		att_last_attempt_text(button.text)
		att_corrects_characters_text(button.text)

func _on_close_button_pressed() -> void:
	queue_free()
