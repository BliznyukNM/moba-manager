class_name Dijkstra


const INT_INFINITY: = 9223372036854775807


static func evaluate(origin: Node, connections: Dictionary) -> Dictionary:
	var result: = {}
	var visited_nodes: = []
	var unvisited_nodes: = connections.keys()
	
	for node in unvisited_nodes:
		result[node] = [INT_INFINITY if node != origin else 0, null]
	
	while unvisited_nodes.size() > 0:
		var visiting_node: Node = _get_closest_node(result, visited_nodes)
		var neighbours_data: Dictionary = connections[visiting_node]
		
		for neighbour in neighbours_data:
			if visited_nodes.find(neighbour) >= 0: continue
			var distance: int = result[visiting_node][0] + neighbours_data[neighbour]
			if result[neighbour][0] > distance: result[neighbour] = [distance, visiting_node]
		
		visited_nodes.append(visiting_node)
		unvisited_nodes.remove(unvisited_nodes.find(visiting_node))
	
	return result


static func _get_closest_node(data: Dictionary, blacklist: Array) -> Node:
	var node: Node
	var distance: int = INT_INFINITY
	
	for n in data:
		var d = data[n][0]
		if d >= distance or blacklist.find(n) >= 0: continue
		distance = d
		node = n
	
	return node
