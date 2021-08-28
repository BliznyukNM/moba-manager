extends Node
class_name Hero


export var base_health: = 100
export var base_mana: = 100
export var base_attack: = 40


var _max_health : int setget , _get_max_health
func _get_max_health() -> int:
	return base_health


var _health : int setget _set_health, _get_health
func _set_health(value: int) -> void:
	_health = int(clamp(value, 0, self._max_health))
func _get_health() -> int:
	return _health
