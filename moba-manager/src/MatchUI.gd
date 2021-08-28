extends Node
class_name MatchUI


var radiant_hero_ui = preload("res://src/RadiantHeroUI.tscn")
var dire_hero_ui = preload("res://src/DireHeroUI.tscn")


onready var radiant_root: VBoxContainer = $RadiantHeroes
onready var dire_root: VBoxContainer = $DireHeroes


var heroes: Dictionary = {}


# TODO: I can implement infinite amount of teams with dictionaries
func add_radiant_hero(hero: Hero) -> void:
	var hero_ui: HeroUI = radiant_hero_ui.instance()
	hero_ui.init(hero)
	radiant_root.add_child(hero_ui)
	heroes[hero] = hero_ui


func add_dire_hero(hero: Hero) -> void:
	var hero_ui = dire_hero_ui.instance()
	hero_ui.init(hero)
	dire_root.add_child(hero_ui)
	heroes[hero] = hero_ui
