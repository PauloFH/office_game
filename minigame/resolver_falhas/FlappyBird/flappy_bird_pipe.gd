class_name flappyBirdPipe
extends Node2D

# de -1 a 1 para canto superior e inferior da tela
@export_range(-1, 1)
var altura_da_abertura:float = 0

# de 0 a 1
@export_range(0, 1)
var tamanho_da_abertura:float = 1

@export
var abertura_minima:float = 240 :
	set(i):
		if i < 120: abertura_minima = 120
		else: abertura_minima = i

@export
var velocidade :float = 1

func _ready() -> void:
	position.y += altura_da_abertura * 200
	%lowerPipe.position.y += abertura_minima + tamanho_da_abertura * 70
	%upperPipe.position.y -= abertura_minima + tamanho_da_abertura * 70

func _physics_process(delta: float) -> void:
	position.x -= velocidade * delta * 120.0
	
	if position.x < -64: 
		queue_free()
