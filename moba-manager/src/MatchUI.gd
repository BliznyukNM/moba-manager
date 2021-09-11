extends Node
class_name MatchUI

onready var time: = $"/root/Time"

onready var hero_uis: = {
	Fraction.Radiant: preload("res://src/RadiantHeroUI.tscn"),
	Fraction.Dire: preload("res://src/DireHeroUI.tscn")
}

onready var ui_roots: = {
	Fraction.Radiant: $RadiantHeroes,
	Fraction.Dire: $DireHeroes
}

onready var time_label: = $Time


func add_hero(hero: Hero) -> void:
	var hero_ui: HeroUI = hero_uis[hero.fraction].instance()
	hero_ui.init(hero)
	ui_roots[hero.fraction].add_child(hero_ui)


func update() -> void:
	for fraction in ui_roots:
		for hero in ui_roots[fraction].get_children():
			hero.update()
	time_label.text = str(time.get_passed_seconds())
