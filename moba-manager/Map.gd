extends Node


func _ready() -> void:
	var path: Array = $PathGraph.find_path(NodePath("Radiant_Fountain"), NodePath("Dire_Fountain"))
	print(path)
