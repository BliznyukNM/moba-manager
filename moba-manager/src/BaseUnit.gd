extends Node2D
class_name BaseUnit


enum Alliance { Radiant, Dire, Neutral }


export var base_speed: int = 1
export var base_health: int = 300
export var base_attack_damage: int = 40
export var base_attack_spread: int = 5 # works as base_attack +- spread
export var base_attack_speed: int = 15 # once per given amount of ticks
export(Alliance) var alliance: int


var _graph: GraphPath
var _current_node_index: int
var _next_node_progress: int
var _path: Array
var _enemy: BaseUnit
var _attack_cooldown: int


var current_health: int setget _set_current_health, _get_current_health
func _set_current_health(value: int) -> void:
	current_health = clamp(value, 0, base_health)
	print("Health of %s: %d" % [name, current_health])
	if current_health == 0: _die()
func _get_current_health() -> int:
	return current_health


func init(graph: GraphPath, path: Array) -> void:
	_graph = graph
	_path = path
	self.current_health = base_health


func on_tick() -> void:
	_attack_cooldown -= 1


func _move_by_path() -> void:
	if _path.empty() or _current_node_index >= _path.size() - 1: return
	
	var current_node: Node2D = _path[_current_node_index]
	var next_node: Node2D = _path[_current_node_index + 1]
	var weight: = _graph.get_path_weight(current_node, next_node)
	
	_next_node_progress += base_speed
	
	if _next_node_progress >= weight:
		_next_node_progress -= weight
		_current_node_index += 1
		_set_parent(next_node)


func _set_parent(new_parent: Node) -> void:
	get_parent().remove_child(self)
	new_parent.add_child(self)


func _attack_enemy() -> void:
	if _attack_cooldown > 0: return
	_enemy.receive_damage(base_attack_damage + randi() % (base_attack_spread * 2) - base_attack_spread)
	_attack_cooldown = base_attack_speed


func receive_damage(damage: int) -> void:
	self.current_health -= damage


func _die() -> void:
	print("Unit %s is dead. RIP" % name)
	queue_free()


func _reset_path_movement() -> void:
	_next_node_progress = 0
