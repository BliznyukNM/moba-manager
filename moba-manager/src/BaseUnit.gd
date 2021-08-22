extends Sprite
class_name BaseUnit


onready var _graph: GraphPath = get_node("../../PathGraph")


var _speed: int = 1
var _current_node_index: int
var _next_node_progress: int
var _path: Array = []


func _ready() -> void:
	_path = _graph.find_path_by_name("Radiant_Fountain", "Mid")


func on_tick() -> void:
	if _path.empty(): return
	var current_node: Node2D = _path[_current_node_index]
	var next_node: Node2D = _path[_current_node_index + 1]
	var weight: float = _graph.get_path_weight(current_node, next_node)
	
	_next_node_progress += _speed
	position = current_node.position.linear_interpolate(next_node.position, _next_node_progress / weight)
	
	if _next_node_progress >= weight:
		_next_node_progress -= weight
		_current_node_index += 1
	
	if _current_node_index >= _path.size() - 1:
		_path.clear()
