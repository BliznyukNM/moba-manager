extends Node
class_name HeroUI


onready var name_label: = $Name
onready var health_bar: = $Health
onready var mana_bar: = $Mana
onready var gold_label: = $Gold
onready var experience_bar: = $Experience
onready var level_label: = $Experience/Level


var _hero: Hero


func init(hero: Hero) -> void:
	_hero = hero
	
	yield(self, "ready")
	name_label.text = tr(hero.name_key)
	health_bar.max_value = hero.max_health
	mana_bar.max_value = hero.max_mana

	update()


func update() -> void:
	health_bar.value = _hero.health
	mana_bar.value = _hero.mana
	gold_label.text = str(_hero.gold)
	level_label.text = str(_hero.level)

	experience_bar.max_value = _hero.experience_for_next_level
	experience_bar.value = _hero.experience
