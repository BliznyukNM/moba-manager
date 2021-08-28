extends Node
class_name MatchUI


var radiant_hero_ui = preload("res://src/RadiantHeroUI.tscn")
var dire_hero_ui = preload("res://src/DireHeroUI.tscn")


onready var radiant_root: VBoxContainer = $RadiantHeroes
onready var dire_root: VBoxContainer = $DireHeroes


var heroes: Dictionary = {}


func add_radiant_hero(hero: Hero) -> void:
	var hero_ui = radiant_hero_ui.instance()
	radiant_root.add_child(hero_ui)
	heroes[hero] = hero_ui


func add_dire_hero(hero: Hero) -> void:
	var hero_ui = dire_hero_ui.instance()
	dire_root.add_child(hero_ui)
	heroes[hero] = hero_ui
