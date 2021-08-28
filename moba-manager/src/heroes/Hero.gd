extends Node
class_name Hero


export var base_health: = 100
export var base_mana: = 100
export var base_attack: = 40

export var name_key: String


var max_health : int setget , get_max_health
func get_max_health() -> int:
	return base_health


var health : int = self.max_health setget _set_health, get_health
func _set_health(value: int) -> void:
	health = int(clamp(value, 0, self._max_health))
func get_health() -> int:
	return health
