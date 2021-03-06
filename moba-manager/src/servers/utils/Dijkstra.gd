class_name Dijkstra


const INT_INFINITY: = 9223372036854775807


func evaluate(origin: Node, connections: Dictionary, nodes: Array) -> Dictionary:
	var result: = {}
	var visited_nodes: = []
	
	for node in nodes:
		result[node] = [INT_INFINITY if node != origin else 0, null]
	
	while nodes.size() > 0:
		var visiting_node: Node = _get_closest_node(result, visited_nodes)
		var neighbours_data: Dictionary = connections[visiting_node]
		
		for neighbour in neighbours_data:
			if visited_nodes.find(neighbour) >= 0: continue
			var distance: int = result[visiting_node][0] + neighbours_data[neighbour]
			if result[neighbour][0] > distance: result[neighbour] = [distance, visiting_node]
		
		visited_nodes.append(visiting_node)
		nodes.remove(nodes.find(visiting_node))
	
	return result


func _get_closest_node(data: Dictionary, blacklist: Array) -> Node:
	var node: Node
	var distance: int = INT_INFINITY
	
	for n in data:
		var d = data[n][0]
		if d >= distance or blacklist.find(n) >= 0: continue
		distance = d
		node = n
	
	return node


func _get_weight_to_node(data: Dictionary, target: Node) -> int:
	return 0
