extends Node


export var _ticks_spawn_rate: int
export var _spawn_units: Array
export var _spawn_root_path: NodePath
export var _graph_path: NodePath
export(Array, NodePath) var _path : Array


onready var _spawn_root: = get_node(_spawn_root_path)
onready var _graph: GraphPath = get_node(_graph_path)


var _tick_cooldown: int
var _parsed_path: Array = []


func _ready() -> void:
	for p in _path:
		_parsed_path.append(get_node(p))


func on_tick() -> void:
	_tick_cooldown -= 1
	if _tick_cooldown > 0: return
	
	_tick_cooldown = _ticks_spawn_rate
	
	for spawn_unit in _spawn_units:
		var unit: BaseUnit = spawn_unit.instance()
		unit.init(_graph, _parsed_path)
		_spawn_root.add_child(unit)
