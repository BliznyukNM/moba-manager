class_name GraphParser


func parse(file: String) -> Dictionary:
	var f: = File.new()
	var status: = f.open(file, File.READ)
	
	assert(status == OK, 'Error opening file %s: %d' % [file, status])
	
	var data: Dictionary = JSON.parse(f.get_as_text()).result
	
	f.close()
	
	return data


func bind_objects(connections: Dictionary, buildings: Dictionary, root: Node) -> Dictionary:
	var binds: Dictionary
	
	for connection in connections:
		_process_connection(NodePath(connection), connections[connection], binds, root)
	
	for building in buildings:
		pass
	
	return binds


func _process_connection(source: NodePath, connections: Array, binds: Dictionary, root: Node) -> void:
	for connection in connections:
		var source_node: = _get_node(source, root)
		var target_node: = _get_node(NodePath(connection[0]), root)
		_insert_bind(binds, source_node, target_node, connection[1])
		_insert_bind(binds, target_node, source_node, connection[1])


func _insert_bind(binds: Dictionary, source: Node, target: Node, weight: int) -> void:
	if not binds.has(source): binds[source] = {}
	binds[source][target] = weight


func _get_node(path: NodePath, root: Node) -> Node:
	var node: = root.get_node_or_null(path)

	if node != null: return node

	var area_node: = root.get_node_or_null(path.get_name(0))

	if area_node == null:
		area_node = Node.new()
		area_node.name = path.get_name(0)
		root.add_child(area_node)

	if node == null:
		node = Node.new()
		node.name = path.get_name(1)
		area_node.add_child(node)

	return node
