class_name GraphPath
extends Node


export var graph: Dictionary


func find_path(from_node: NodePath, to_node: NodePath) -> Array:
	var path: = []
	_find_path(from_node, to_node, path)
	return path


func _find_path(from_node: NodePath, to_node: NodePath, path: Array) -> void:
	var info: Dictionary = graph.get(from_node)
	var next_point = info.get(to_node)
	
	if next_point is int:
		path.append({to_node: next_point})
	else:
		path.append({next_point: info.get(next_point)})
		_find_path(next_point, to_node, path)
