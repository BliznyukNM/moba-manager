tool
extends EditorPlugin


var graphPath: GraphPath
var font: DynamicFont

const font_data = preload("res://addons/path_graph/SourceCodePro-Regular.ttf")


func init_font() -> void:
	font = DynamicFont.new()
	font.font_data = font_data
	font.size = 28


func handles(object: Object) -> bool:
	return object is GraphPath


func edit(object: Object) -> void:
	graphPath = object as GraphPath


func forward_canvas_draw_over_viewport(overlay: Control) -> void:
	if graphPath == null: return
	if font == null: init_font()
			
	var transform_viewport = graphPath.get_viewport().global_canvas_transform
	
	for node in graphPath.graph:
		var pathData: Dictionary = graphPath.graph.get(node)
		var a = graphPath.get_node_or_null(node) as Node2D
		if a == null: continue
		
		overlay.draw_string(font, transform_viewport * a.position, String(a.name), Color.yellow)
		
		for targetNode in pathData:
			var b = graphPath.get_node_or_null(targetNode) as Node2D
			if b == null: continue
			
			overlay.draw_line(transform_viewport * a.position, transform_viewport * b.position, Color.blue, 3.0)
			overlay.draw_string(font, transform_viewport * (a.position.linear_interpolate(b.position, 0.5)), String(pathData.get(targetNode)))
