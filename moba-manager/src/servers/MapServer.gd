extends Node
class_name MapServer


var _graph_parser: = GraphParser.new()
var _dijkstra: = Dijkstra.new()


var _graph_data: Dictionary


func _get_baked_data() -> Dictionary: return _graph_data['baked_data']
func _get_connections() -> Dictionary: return _graph_data['connections']


export(String, FILE, '*.json') var graph_file: String


func _ready() -> void:
	_prepare_map()


func _prepare_map() -> void:
	var raw_data: = _graph_parser.parse(graph_file)
	var nodes: = _graph_parser.create_nodes(raw_data['nodes'], self)
	_graph_parser.create_buildings(raw_data['buildings'], self)
	_graph_data['connections'] = _graph_parser.create_connections(raw_data['connections'], self)
	_graph_data['baked_data'] = _bake_paths(nodes)


func _bake_paths(nodes: Array) -> Dictionary:
	var connections: Dictionary = _get_connections()
	var baked_data: = {}
	
	for source in connections:
		baked_data[source] = _dijkstra.evaluate(source, connections, nodes)
	
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
