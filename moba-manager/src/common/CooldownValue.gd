class_name CooldownValue


var max_cooldown: int setget , get_max_cooldown
func get_max_cooldown() -> int:
	return max_cooldown


var cooldown: int setget , get_cooldown
func get_cooldown() -> int:
	return cooldown


func _init(cooldown_time: int, on_cooldown: bool = false) -> void:
	max_cooldown = cooldown_time
	if on_cooldown: cooldown = max_cooldown


func is_ready() -> bool:
	return cooldown == 0


func trigger() -> void:
	if not is_ready(): assert("attempt to trigger ability in cooldown")
	cooldown = max_cooldown


func update() -> void:
	cooldown = int(max(cooldown - 1, 0))
