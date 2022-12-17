#include <iostream>
#include <utility>

class Foo {
public:

    int a = 0;

    // Constructor
    Foo(int _a) : a(_a) {
        std::cout << "Construtor called for: " << this << "\n";
    }

    // Destructor
    ~Foo() {
        std::cout << "Destructor called for: " << this << "\n";
    }

    // Copy constructor
    Foo(Foo& foo) : a(foo.a) {
        std::cout << "Copy construct of: " << this << " -> " << &foo << "\n";
    }

    // Copy assignment
    Foo& operator=(Foo& foo) {
        this->a = foo.a;
        std::cout << "Copy assign of: " << this << " -> " << &foo << "\n";
        return *this;
    }

    // Move constructor
    Foo(Foo&& foo) : a(foo.a) {
        std::cout << "Move construct of: " << this << " -> " << &foo << "\n";
    }

    // Move assignment
    Foo& operator=(Foo&& foo) {
        this->a = foo.a;
        std::cout << "Move assign of: " << this << " -> " << &foo << "\n";
        return *this;
    }
};

int main() {

    // Construct
    Foo a { 1 };

    // Copy construct
    Foo b { a };

    // Copy assign
    a = b;

    // Move construct
    Foo d { std::move(a) };

    // Move assign
    d = std::move(b);

    std::cout << "Before return\n";

    return 0;
}
