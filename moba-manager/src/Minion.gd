"""
Minion class
"""

extends BaseUnit


func on_tick() -> void:
	.on_tick()
	
	if is_instance_valid(_enemy):
		_attack_enemy()
	else:
		_enemy = _get_closest_enemy()
		
		if _enemy == null:
			_move_by_path()
		else:
			_reset_path_movement()


func _get_closest_enemy() -> BaseUnit:
	var current_node: Node2D = _path[_current_node_index]
	var units: = current_node.get_children()
	var enemies: = []
	
	for unit in units:
		if unit.alliance == alliance: continue
		enemies.push_back(unit)
	
	if enemies.size() == 0: return null
	
	enemies.shuffle() # sort by priority
	return enemies.front()
