#include <iostream>
#include <vector>
#include <string>

struct Vector2 {
    int x, y;

    Vector2(int x, int y) :x{x}, y{y} {}
};

struct Edge {
    int a, b, w;

    Edge(int a, int b, int weight) :a{a}, b{b}, w{weight} {}
};

class Graph {

public:
    void add_point(Vector2 point);
    void add_point(Vector2 point, int origin, int weight);
    
    void print();

private:
    void add_edge(int a, int b, int weight);

private:
    std::vector<Vector2> points;
    std::vector<Edge> edges;
};

int main() {
    Graph graph;
    Vector2 p0 {0, 0}, p1 {1, 0};
    graph.add_point(p0);
    graph.add_point(p1, 0, 2);
    graph.print();

    return 0;
}

void Graph::add_point(Vector2 point) {
    points.push_back(point);
}

void Graph::add_point(Vector2 point, int origin, int weight) {
    add_point(point);
    add_edge(points.size() - 1, origin, weight);
}

void Graph::add_edge(int a, int b, int weight) {
    edges.push_back(Edge {a, b, weight});
}

void Graph::print() {
    std::string res;
    for (Edge edge: edges) {
        Vector2 a = points[edge.a];
        Vector2 b = points[edge.b];
        std::cout << "(" << a.x << "," << a.y << ") " << edge.w << " (" << b.x << "," << b.y << ")" << std::endl;
    }
}
