extends Node
class_name Map


export var _fraction_base: = {
	Fraction.Radiant: NodePath("RadiantBase"),
	Fraction.Dire: NodePath("DireBase")
}


func spawn_hero(hero: Hero, fraction: int) -> void:
	var base_node: = get_node(_fraction_base[fraction])
	base_node.add_child(hero)


func move_hero(hero: Hero, node_path: NodePath) -> void:
	assert(has_node(node_path), "No such node: %s" % node_path)
	var node: = get_node(node_path)
	hero.get_parent().remove_child(hero)
	node.add_child(hero)


func update() -> void:
	for node in get_children():
		for object in node.get_children():
			if not object.has_method("update"): continue
			object.update()


func get_available_nodes() -> Array:
	var paths: = []
	for child in get_children():
		paths.append(get_path_to(child))
	return paths
