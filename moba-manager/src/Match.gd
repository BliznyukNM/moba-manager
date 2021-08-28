extends Node


enum HeroKey { Test }


# TODO: move to some kind of hero database
onready var heroes: Dictionary = {
	HeroKey.Test: preload("res://src/heroes/TestHero.tscn")
}


onready var ui_root: MatchUI = $MatchUI
onready var heroes_root: Node = $Heroes


func _ready() -> void:
	ui_root.add_radiant_hero(_create_hero(HeroKey.Test))
	ui_root.add_dire_hero(_create_hero(HeroKey.Test))


func _create_hero(hero_key: int) -> Hero:
	var hero: Hero = heroes[hero_key].instance()
	heroes_root.add_child(hero)
	return hero

