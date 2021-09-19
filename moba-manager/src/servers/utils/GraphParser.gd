class_name GraphParser


func parse(file: String) -> Dictionary:
	var f: = File.new()
	var status: = f.open(file, File.READ)
	
	assert(status == OK, 'Error opening file %s: %d' % [file, status])
	
	var data: Dictionary = JSON.parse(f.get_as_text()).result
	
	f.close()
	
	return data


func create_nodes(nodes: Dictionary, root: Node) -> void:
	for node in nodes:
		var area: = _get_area(node, root)
		for data in nodes[node]:
			_create_node_in_area(data[0], data[1], area)
		area.recalculate_length()


func _get_area(path: String, root: Node) -> TravelArea:
	var node: TravelArea = root.get_node_or_null(path)
	
	if node == null:
		node = TravelArea.new()
		node.name = path
		root.add_child(node)
	
	return node


func _create_node_in_area(name: String, offset: int, area: TravelArea) -> void:
	var node: = TravelNode.new()
	node.name = name
	node.area_offset = offset
	area.add_child(node)


func create_connections(connections: Dictionary, root: Node) -> Dictionary:
	var binds: = {}
	for node in connections:
		var source_node: = root.get_node(node)
		for data in connections[node]:
			var target_node: = root.get_node(data[0])
			if not binds.has(source_node): binds[source_node] = {}
			
	return binds


func _insert_connection(binds: Dictionary, source: Node, target: Node, weight: int) -> void:
	if not binds.has(source): binds[source] = {}
	binds[source][target] = weight


func create_buildings(buildings: Dictionary, root: Node) -> void:
	pass

