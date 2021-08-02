#include "Graph2D.hpp"

void godot::Graph2D::_register_methods() {

}

void godot::Graph2D::add_point(Vector2 point) {
    points.append(point);
}

void godot::Graph2D::add_point(Vector2 point, Vector2 origin, int weight) {
    add_point(point);
}

void godot::Graph2D::add_edge(Vector2 &point, Vector2 &origin, int weight) {
    edges.push_back(Edge(point, origin, weight));
}