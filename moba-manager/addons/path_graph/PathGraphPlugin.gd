tool
extends EditorPlugin


var graph_path: GraphPath
var font: DynamicFont

const font_data: DynamicFontData = preload("res://addons/path_graph/SourceCodePro-Regular.ttf")


func init_font() -> void:
	font = DynamicFont.new()
	font.font_data = font_data
	font.size = 28


func handles(object: Object) -> bool:
	return object is GraphPath or (object is Node2D and object.get_parent() is GraphPath)


func edit(object: Object) -> void:
	graph_path = object as GraphPath
	if graph_path == null and object is Node2D: graph_path = object.get_parent() as GraphPath


func forward_canvas_draw_over_viewport(overlay: Control) -> void:
	if graph_path == null: return
	if font == null: init_font()
			
	var transform_viewport: = graph_path.get_viewport().global_canvas_transform
	
	_draw_full_graph(overlay, transform_viewport)


func _draw_full_graph(overlay: Control, transform_viewport: Transform2D) -> void:
	for node in graph_path.graph:
		var path_data: Dictionary = graph_path.graph.get(node)
		var a = graph_path.get_node_or_null(node) as Node2D
		
		if a == null: continue
		
		for target_node in path_data:
			var b = graph_path.get_node_or_null(target_node) as Node2D
			var path_weight = path_data.get(target_node)
			if b == null or not (path_weight is int): continue
			
			overlay.draw_line(transform_viewport * a.position, transform_viewport * b.position, Color.blue, 3.0)
			overlay.draw_string(font, transform_viewport * (a.position.linear_interpolate(b.position, 0.5)), String(path_weight))
		
		overlay.draw_string(font, transform_viewport * a.position, String(a.name), Color.yellow)
