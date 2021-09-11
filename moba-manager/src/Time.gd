extends Node


const updates_per_second: = 15


var _ticks_passed: int


func tick() -> void:
	_ticks_passed += 1


func get_passed_time() -> String:
	return "%02d:%02d:%02d" % [
		_ticks_passed / (updates_per_second * 60),
		(_ticks_passed / updates_per_second) % 60,
		_ticks_passed % updates_per_second
	]
