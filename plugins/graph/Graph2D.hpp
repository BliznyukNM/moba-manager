#ifndef GRAPH_2D_HPP
#define GRAPH_2D_HPP

#include <Godot.hpp>
#include <Node2D.hpp>

#include <vector>

namespace godot {

struct Edge {
    Vector2 &a, &b;
    int weight;

    Edge(Vector2 &a, Vector2&b, int weight) :a{a}, b{b}, weight{weight} { }
};

class Graph2D: public Node2D {
    GODOT_CLASS(Graph2D, Node2D)

public:
    static void _register_methods();

    void add_point(Vector2 point);
    void add_point(Vector2 point, Vector2 origin, int weight);

private:
    void add_edge(Vector2 &a, Vector2 &b, int weight);

private:
    PoolVector2Array points;
    std::vector<Edge> edges;
};

}

#endif // GRAPH_2D_HPP