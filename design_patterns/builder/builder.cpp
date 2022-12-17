#include <iostream>
#include <ostream>

class Thing {
private:
    int a = 0;
    int b = 0;

public:
    Thing& addA(int a) {
        this->a = a;
        return *this;
    }

    Thing& addB(int b) {
        this->b = b;
        return *this;
    }

    friend std::ostream& operator<<(std::ostream& os, Thing const& thing) {
        os << "Thing { a: " << thing.a << ", b: " << thing.b << " }";
        return os;
    }

};


int main() {

    Thing thing;
    thing.addA(10).addB(20);

    std::cout << thing << "\n";

    return 0;
}
