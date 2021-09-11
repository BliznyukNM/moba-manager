extends Node


const _updates_per_second: = 16
const _max_multiply: = 64


var _ticks_passed: int
var _paused: bool

var time_multiplicator: int = 1 # if < 0 -> slow down, if > 0 -> speed up


func get_updates_per_second() -> int:
	if _paused: return 0
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
	if time_multiplicator > 1: time_multiplicator /= 2
	elif time_multiplicator == 1: time_multiplicator = -2
	else: time_multiplicator *= 2
	time_multiplicator = int(max(time_multiplicator, -_updates_per_second))


func speed_up() -> void:
	if time_multiplicator < -2: time_multiplicator /= 2
	elif time_multiplicator == -2: time_multiplicator = 1
	else: time_multiplicator *= 2
	time_multiplicator = int(min(time_multiplicator, _max_multiply))
