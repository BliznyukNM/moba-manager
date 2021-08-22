extends Node2D
class_name BaseUnit


export var speed: int = 1
export var health: int = 100


var _graph: GraphPath
var _current_node_index: int
var _next_node_progress: int
var _path: Array


func init(graph: GraphPath, path: Array) -> void:
	_graph = graph
	_path = path


func _move_by_path() -> void:
	if _path.empty(): return
	var current_node: Node2D = _path[_current_node_index]
	var next_node: Node2D = _path[_current_node_index + 1]
	var weight: float = _graph.get_path_weight(current_node, next_node)
	
	_next_node_progress += speed
	position = current_node.position.linear_interpolate(next_node.position, _next_node_progress / weight)
	
	if _next_node_progress >= weight:
		_next_node_progress -= weight
		_current_node_index += 1
	
	if _current_node_index >= _path.size() - 1:
		_path = []
