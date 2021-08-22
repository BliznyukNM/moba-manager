extends Node
class_name Map


export var tick_multiplier: = 1.0


onready var units_node: = $Units


var time_passed_since_last_tick: = 0.0


func _process(delta: float) -> void:
	time_passed_since_last_tick += delta
	var ticks_amount: = int(time_passed_since_last_tick * tick_multiplier)
	
	if ticks_amount == 0: return
	
	for _i in range(0, ticks_amount):
		var units: = units_node.get_children()
		_process_tickables(units)
	
	time_passed_since_last_tick -= ticks_amount / tick_multiplier


func _process_tickables(tickables: Array) -> void:
	for tickable in tickables:
		tickable.on_tick()
