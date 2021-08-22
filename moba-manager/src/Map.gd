extends Node
class_name Map


export(float, EASE) var tick_multiplier: = 1


onready var units_node: = $Units
onready var spawners_node: = $Spawners


var time_passed_since_last_tick: = 0.0


func _ready() -> void:
	_process_all_tickables(1)


func _process(delta: float) -> void:
	time_passed_since_last_tick += delta * tick_multiplier
	var ticks_amount: = int(time_passed_since_last_tick)
	
	if ticks_amount == 0: return
	print(time_passed_since_last_tick)
	
	_process_all_tickables(ticks_amount)
	time_passed_since_last_tick -= ticks_amount


func _process_all_tickables(ticks_count: int) -> void:
	for _i in range(0, ticks_count):
		var spawners: = spawners_node.get_children()
		_process_tickables(spawners)
		
		var units: = units_node.get_children()
		_process_tickables(units)


func _process_tickables(tickables: Array) -> void:
	for tickable in tickables:
		tickable.on_tick()
