extends Node
class_name MatchUI

onready var _time: = $"/root/Time"

onready var _hero_uis: = {
	Fraction.Radiant: preload("res://src/RadiantHeroUI.tscn"),
	Fraction.Dire: preload("res://src/DireHeroUI.tscn")
}

onready var _ui_roots: = {
	Fraction.Radiant: $RadiantHeroes,
	Fraction.Dire: $DireHeroes
}

onready var _time_label: = $Time
onready var _time_scale_label: = $TimeScale


func _ready() -> void:
	$Buttons/Play.connect("button_up", _time, "toggle_play")
	
	$Buttons/Slower.connect("button_up", _time, "slow_down")
	$Buttons/Slower.connect("button_up", self, "_time_scale_changed")
	
	$Buttons/Faster.connect("button_up", _time, "speed_up")
	$Buttons/Faster.connect("button_up", self, "_time_scale_changed")
	
	_time_scale_changed()


func add_hero(hero: Hero) -> void:
	var hero_ui: HeroUI = _hero_uis[hero.fraction].instance()
	hero_ui.init(hero)
	_ui_roots[hero.fraction].add_child(hero_ui)


func update() -> void:
	for fraction in _ui_roots:
		for hero in _ui_roots[fraction].get_children():
			hero.update()
	_time_label.text = str(_time.get_passed_time())


func _time_scale_changed() -> void:
	var time_multiplicator = _time.get_current_multiplicator()
	
	if time_multiplicator > 0:
		_time_scale_label.text = "x%d" % time_multiplicator
	else:
		_time_scale_label.text = "x1/%d" % -time_multiplicator
