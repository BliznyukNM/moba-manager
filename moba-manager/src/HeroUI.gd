extends Node
class_name HeroUI


onready var name_label: Label = $Name
onready var health_bar: TextureProgress = $Health
onready var mana_bar: TextureProgress = $Mana
onready var gold_label: Label = $Gold


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
