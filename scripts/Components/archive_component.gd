extends Node
class_name ArchiveComponent

var file_path: String
var palavras: Array

func _init() -> void:
	file_path = "res://resources/Database/words.txt"
	palavras = carregar_palavras(file_path)
	
	if palavras.is_empty():
		print("Nenhuma palavra encontrada no arquivo.")

func carregar_palavras(file_path: String = file_path) -> Array:
	var palavras = []
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	if file:
		var conteudo = file.get_as_text().strip_edges()
		palavras = conteudo.split(";")
	else:
		print("Erro ao abrir o arquivo:", file_path)
	
	return palavras

func sortear_palavras(lista: Array, quantidade: int = 30) -> Array:
	lista.shuffle()  # Embaralha as palavras
	return lista.slice(0, min(quantidade, lista.size()))  # Retorna até 20 palavras únicas
