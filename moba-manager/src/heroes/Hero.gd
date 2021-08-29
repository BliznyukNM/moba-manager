extends Node
class_name Hero


export var base_health: = 100
export var base_mana: = 100
export var base_attack: = 40

export var name_key: String


var max_health: int setget , get_max_health
func get_max_health() -> int:
	return base_health


var health: int = self.max_health setget _set_health, get_health
func _set_health(value: int) -> void:
	health = int(clamp(value, 0, self.max_health))
func get_health() -> int:
	return health


var max_mana: int setget , get_max_mana
func get_max_mana() -> int:
	return base_mana


var mana: int = self.max_mana setget _set_mana, get_mana
func _set_mana(value: int) -> void:
	mana = int(clamp(value, 0, self.max_mana))
func get_mana() -> int:
	return mana


var attack: int setget , get_attack
func get_attack() -> int:
	return base_attack


var gold: int setget _set_gold, get_gold
func _set_gold(value: int) -> void:
	gold = value
func get_gold() -> int:
	return gold


func update() -> void:
	farm() # TODO: just testing


func damage(value: int) -> void:
	self.health -= value


func farm() -> void:
	self.gold += 1


func attack_target(target: Hero) -> void:
	target.damage(self.attack)	
