extends Node


const _updates_per_second: = 16
const _max_multiply: = 64


var _ticks_passed: int
var _paused: bool
var _time_multiplicators: = [-16, -8, -4, -2, 1, 2, 3, 4, 8, 16, 32, 64, 128]
var _multiplicator_index: int = 4 # for x1


func get_current_multiplicator() -> int:
	return _time_multiplicators[_multiplicator_index]


func get_updates_per_second() -> int:
	if _paused: return 0
	
	var time_multiplicator = get_current_multiplicator()
	
	if time_multiplicator < 0:
		return _updates_per_second / -time_multiplicator
	else:
		return _updates_per_second * time_multiplicator


func tick() -> void:
	_ticks_passed += 1


func get_passed_time() -> String:
	return "%02d:%02d:%02d" % [
		_ticks_passed / (_updates_per_second * 60),
		(_ticks_passed / _updates_per_second) % 60,
		_ticks_passed % _updates_per_second
	]


func toggle_play() -> void:
	_paused = not _paused


func slow_down() -> void:
	_multiplicator_index = max(_multiplicator_index - 1, 0)


func speed_up() -> void:
	_multiplicator_index = min(_multiplicator_index + 1, _time_multiplicators.size() - 1)
