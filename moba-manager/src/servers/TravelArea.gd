extends Node
class_name TravelArea


var _length: int setget , get_length
func get_length() -> int:
	return _length


func recalculate_length() -> void:
	_length = 0
	for node in get_children():
		if not node is TravelNode or node.area_offset <= _length: continue
		_length = node.area_offset
