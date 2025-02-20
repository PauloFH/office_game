# A classe minigame oferece interface básica para que haja a interação entre cada
# implementação e os objetos que as instanciam
class_name Minigame
extends Node

signal jogo_ganho(pontuacao:int)
signal jogo_perdido()

@export
var dificuldade:float = 0.0

# Tempo desde a instanciação do alerta do minigame até seu fim, recomendo deixar 
# na média dos 10 segundos a depender da dificuldade
@export
var intervalo_de_execução:float = 0.0

# Interações com essa variável podem ser diferentes, portanto olhe as implementações
# de cada minigame pra entender como será a pontuação
@export
var pontuacao_atual:float = 0.0

func _ready() -> void :
	if intervalo_de_execução > 0:
		var new_timer :Timer = Timer.new()
		new_timer.one_shot = true
		add_child(new_timer)
		new_timer.start(intervalo_de_execução)
