#include <bits/stdc++.h>
using namespace std;

struct Shape {
    virtual float area() = 0;
};

struct Circle : Shape {
    float r;
    Circle(float r) : r(r) {}
    float area() { return 3.14 * r * r; }
};

struct Rect : Shape {
    float d, h;
    Rect(float d, float h) : d(d), h(h) {}
    float area() { return d * h; }
};

int main() {
    Circle circ(10);
    Rect rect(10, 20);
    cout << circ.area() << endl;
    cout << rect.area() << endl;
}