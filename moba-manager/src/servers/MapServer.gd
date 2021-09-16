extends Node
class_name MapServer


var _graph_data: = {}


func _get_baked_data() -> Dictionary: return _graph_data['baked_data']
func _get_connections() -> Dictionary: return _graph_data['connections']


export(String, FILE, '*.gv') var graph_file: String


func _ready() -> void:
	_prepare_map()


func _prepare_map() -> void:
	_graph_data['connections'] = GraphParser.parse(graph_file, self)
	_graph_data['baked_data'] = _bake_paths()


func _bake_paths() -> Dictionary:
	var connections: Dictionary = _graph_data['connections']
	var baked_data: = {}
	
	for source in connections:
		baked_data[source] = Dijkstra.evaluate(source, connections)
	
	return baked_data


func get_baked_path(from: Node, to: Node) -> Array:
	var result: = []
	var baked_data: = _get_baked_data()
	
	var data: Dictionary = baked_data[from]
	while to != null:
		result.append(to)
		to = data[to][1]
	
	result.invert()
	return result
