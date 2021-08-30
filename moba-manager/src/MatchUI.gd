extends Node
class_name MatchUI


onready var hero_uis: Dictionary = {
	Fraction.Radiant: preload("res://src/RadiantHeroUI.tscn"),
	Fraction.Dire: preload("res://src/DireHeroUI.tscn")
}

onready var ui_roots: Dictionary = {
	Fraction.Radiant: $RadiantHeroes,
	Fraction.Dire: $DireHeroes
}


func add_hero(hero: Hero) -> void:
	var hero_ui: HeroUI = hero_uis[hero.fraction].instance()
	hero_ui.init(hero)
	ui_roots[hero.fraction].add_child(hero_ui)


func update() -> void:
	for fraction in ui_roots:
		for hero in ui_roots[fraction].get_children():
			hero.update()
