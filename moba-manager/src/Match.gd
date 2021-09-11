extends Node


# TODO: move to some kind of hero database
onready var _heroes: = {
	HeroKey.Test: preload("res://src/heroes/TestHero.tscn"),
	HeroKey.SecondTest: preload("res://src/heroes/SecondTestHero.tscn")
}


onready var _ui_root: = $MatchUI
onready var _map: = $Map
onready var _time: = $"/root/Time"


var _update_cooldown: float


func _ready() -> void:
	_ui_root.add_hero(_create_hero(HeroKey.Test, Fraction.Radiant))
	_ui_root.add_hero(_create_hero(HeroKey.SecondTest, Fraction.Dire))


func _create_hero(hero_key: int, fraction: int) -> Hero:
	var hero: Hero = _heroes[hero_key].instance()
	hero.fraction = fraction
	_map.spawn_hero(hero, fraction)
	return hero


func _update() -> void:
	_map.update()
	_ui_root.update()
	_time.tick()


func _physics_process(delta: float) -> void:
	_update_cooldown += delta * _time.get_updates_per_second()
	var ticks_amount = int(_update_cooldown)

	for _i in range(0, ticks_amount):
		_update()

	_update_cooldown -= ticks_amount

