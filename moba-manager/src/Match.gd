extends Node


export(float, EASE) var _time_multiplier: = 1.0


const _updates_per_second: = 15


# TODO: move to some kind of hero database
onready var heroes: Dictionary = {
	HeroKey.Test: preload("res://src/heroes/TestHero.tscn")
}


onready var ui_root: MatchUI = $MatchUI
onready var heroes_root: Node = $Heroes


var _update_cooldown: float


func _ready() -> void:
	ui_root.add_hero(_create_hero(HeroKey.Test, Fraction.Radiant))
	ui_root.add_hero(_create_hero(HeroKey.Test, Fraction.Dire))


func _create_hero(hero_key: int, fraction: int) -> Hero:
	var hero: Hero = heroes[hero_key].instance()
	hero.fraction = fraction
	heroes_root.add_child(hero)
	return hero


func _update() -> void:
	for hero in heroes_root.get_children():
		hero.update()
	ui_root.update()


func _physics_process(delta: float) -> void:
	_update_cooldown += delta * _updates_per_second * _time_multiplier
	var ticks_amount = int(_update_cooldown)

	for _i in range(0, ticks_amount):
		_update()

	_update_cooldown -= ticks_amount

