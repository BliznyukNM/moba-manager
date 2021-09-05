extends Node
class_name Hero


export var name_key: String

""" Health """
export var base_health: = 100


var max_health: int setget , get_max_health
func get_max_health() -> int:
	return base_health


var health: int setget _set_health
func _set_health(value: int) -> void:
	health = int(clamp(value, 0, self.max_health))


""" Mana """
export var base_mana: = 100


var max_mana: int setget , get_max_mana
func get_max_mana() -> int:
	return base_mana


var mana: int setget _set_mana
func _set_mana(value: int) -> void:
	mana = int(clamp(value, 0, self.max_mana))


""" Experience and level """
const _exp_to_lvl: = [
	100, # 1 -> 2
	200, # 2 -> 3
	400, # 3 -> 4
]

var experience: int setget _set_experience
func _set_experience(value: int) -> void:
	if _is_level_max(): return

	experience = value
	if experience >= self.experience_for_next_level:
		experience -= self.experience_for_next_level
		level += 1
		if _is_level_max(): experience = self.experience_for_next_level


var experience_for_next_level: int setget , get_experience_for_next_level
func get_experience_for_next_level() -> int:
	if _is_level_max(): return _exp_to_lvl[-1]
	return _exp_to_lvl[level - 1]


const _base_experience_gain: int = 30


var _experience_per_gain: int setget , _get_experience_per_gain
func _get_experience_per_gain() -> int:
	var value: = _base_experience_gain
	return value - randi() % (value / 5)


func _is_level_max() -> bool:
	return level > _exp_to_lvl.size()


var level: int = 1


""" Gold """
var gold: int


const _base_gold_gain: int = 10


var _gold_per_gain: int setget , _get_gold_per_gain
func _get_gold_per_gain() -> int:
	var value: = _base_gold_gain
	return value - randi() % (value / 5)


var fraction: int


export var base_attack: = 40


var attack: int setget , get_attack
func get_attack() -> int:
	return base_attack - randi() % (base_attack / 10)


var _gold_gain_ability: = CooldownValue.new(15, true)
var _exp_gain_ability: = CooldownValue.new(22, true)
var _attack_ability: = CooldownValue.new(15)


func _ready() -> void:
	health = self.max_health
	mana = self.max_mana


func update() -> void:
	_gold_gain_ability.update()
	_exp_gain_ability.update()
	_attack_ability.update()

	farm() # TODO: just testing


func damage(value: int) -> void:
	self.health -= value


func farm() -> void:
	if _gold_gain_ability.is_ready:
		self.gold += self._gold_per_gain
		_gold_gain_ability.trigger()
	if _exp_gain_ability.is_ready:
		self.experience += self._experience_per_gain 
		_exp_gain_ability.trigger()


func attack_target(target: Hero) -> void:
	if not _attack_ability.is_ready: return
	target.damage(self.attack)	
