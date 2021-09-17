extends Node
class_name BotServer


var _bots: Array


func create_bot(hero: Hero) -> void:
	_bots.append(Bot.new(hero))


func update() -> void:
	for bot in _bots:
		bot.update()
