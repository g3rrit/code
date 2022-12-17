#include <iostream>
#include <memory>

class State {
public:
    virtual ~State() = default;
    virtual void doA() = 0;
    virtual void doB() = 0;
};

class StateX: public State {
public:
    void doA() override {
        std::cout << "State X doing A\n";
    }

    void doB() override {
        std::cout << "State X doing B\n";
    }
};

class StateY: public State {
public:
    void doA() override {
        std::cout << "State Y doing A\n";
    }

    void doB() override {
        std::cout << "State Y doing B\n";
    }
};


class Context {
public:
    std::unique_ptr<State> state;

    Context() : state(std::make_unique<StateX>()) {}

    void run() {
        state->doA();
        state->doB();
        state = std::make_unique<StateY>();
    }
};

int main() {

    Context ctx;

    ctx.run();
    ctx.run();

    return 0;
}

