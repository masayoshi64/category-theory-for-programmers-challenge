#include <bits/stdc++.h>
using namespace std;

template <class A, class B>
struct Either {
    enum { isLeft, isRight } tag;
    union {
        A left;
        B right;
    };
};

Either<int, bool> p(int n) {
    Either<int, bool> e;
    e.tag = e.isLeft;
    e.left = n;
    return e;
}

Either<int, bool> q(bool b) {
    Either<int, bool> e;
    e.tag = e.isRight;
    e.right = b;
    return e;
}

int i(int n) { return n; }
int j(bool b) { return b ? 0 : 1; }

int m(Either<int, bool> const &e) {
    if (e.tag == e.isLeft) {
        return e.left;
    } else {
        return e.right ? 0 : 1;
    }
}

int main() {
    int n = 100;
    bool b = true;
    if (i(n) == m(p(n)))
        cout << "i = m . p!" << endl;
    else
        cout << "failed" << endl;
    if (j(b) == m(q(b)))
        cout << "j = m . q!" << endl;
    else
        cout << "failed" << endl;
}