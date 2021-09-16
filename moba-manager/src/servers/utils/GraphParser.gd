class_name GraphParser


static func parse(path: String, root: Node) -> Dictionary:
	var f = File.new()
	var status = f.open(path, File.READ)

	assert(status == OK, 'Error opening file %s: %d' % [path, status])
	
	var connections: = {}
	
	while not f.eof_reached():
		var line = f.get_line()
		_parse_connection(line, connections, root)
	
	f.close()
	
	return connections


static func _parse_connection(line: String, connections: Dictionary, root: Node) -> void:
	var args: = line.split(' ')
	
	if args.size() < 3: return
	
	var node1: = _get_node(NodePath(args[0]), root)
	var node2: = _get_node(NodePath(args[2]), root)
	var weight: = int(args[1])
	
	_insert_connection(connections, node1, node2, weight)
	_insert_connection(connections, node2, node1, weight)


static func _insert_connection(connections: Dictionary, source: Node, target: Node, weight: int) -> void:
	if not connections.has(source): connections[source] = {}
	connections[source][target] = weight


static func _get_node(path: NodePath, root: Node) -> Node:
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
