extends Node


const updates_per_second: = 15


var _ticks_passed: int


func tick() -> void:
	_ticks_passed += 1


func get_passed_seconds() -> int:
	return _ticks_passed / updates_per_second
