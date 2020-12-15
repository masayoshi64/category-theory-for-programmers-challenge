#include <bits/stdc++.h>
using namespace std;

using C = string;

template <class A, class B>
function<A(C)> fmap(function<B(A)>& f, function<A(C)>& r) {
    function<A(C)> fr = [&](C c) { return f(r(c)); };
    return fr;
}

int length(string s) { return s.size(); }

int main() {
    function<bool(int)> is_odd = [&](int x) { return x % 2; };  // int->bool
    function<int(string)> length = [&](string x) {
        return x.size();
    };  // Reader int
    auto fr = fmap<int, bool>(is_odd, length);
    cout << fr("waiwai") << endl;
}