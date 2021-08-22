class_name GraphPath
extends Node


export var graph: Dictionary


func get_path_weight(from_node: Node2D, to_node: Node2D) -> int:
	var info: Dictionary = graph.get(get_path_to(from_node))
	var next_point: int = info.get(get_path_to(to_node))
	# assert(not (next_point is int), "Expected from %s to %s straight path, but get %s" % [from_node, to_node, next_point])
	return next_point


func find_path_by_node(from_node: Node2D, to_node: Node2D) -> Array:
	return find_path_by_name(get_path_to(from_node), get_path_to(to_node))


func find_path_by_name(from_node: NodePath, to_node: NodePath) -> Array:
	var path: = [get_node(from_node)]
	_find_path_recursive(from_node, to_node, path)
	return path


func _find_path_recursive(from_node: NodePath, to_node: NodePath, path: Array) -> void:
	var info: Dictionary = graph.get(from_node)
	var next_point = info.get(to_node)
	
	if next_point is int:
		path.append(get_node(to_node))
	elif next_point is NodePath:
		path.append(get_node(next_point))
		_find_path_recursive(next_point, to_node, path)
	else: assert("Unexpected type in path.")
