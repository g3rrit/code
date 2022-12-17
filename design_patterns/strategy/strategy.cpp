#include <iostream>
#include <functional>

template<class R, class... Args>
using Strategy = std::function<R(Args...)>;

template<class R, class... Args>
class Context {
    Strategy<R, Args...> strategy = nullptr;

public:
    Context(Strategy<R, Args...>& strategy) : strategy(strategy) {};

    void setStrategy(Strategy<R, Args...>& strategy) {
        this->strategy = strategy;
    }

    R operator()(Args... args) {
        return this->strategy(args...);
    }
};

int main() {

    Strategy<int, int> s1 { [](int a) {
        return a * 2;
    }};

    Strategy<int, int> s2 { [](int a) {
        return a * a;
    }};

    Context<int, int> context { s1 };

    std::cout << "Context with s1: " << context(10) << "\n";


    context.setStrategy(s2);

    std::cout << "Context with s2: " << context(10) << "\n";

    return 0;
}
