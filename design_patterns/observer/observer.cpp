#include <iostream>
#include <memory>
#include <vector>

class Observer {
public:
    virtual void trigger(int a) = 0;
    virtual ~Observer() = default;
};

class Observable {

private:
    std::vector<std::shared_ptr<Observer>> observers;

public:

    void addObserver(std::shared_ptr<Observer> const & observer) {
        observers.push_back(observer);
    }

    void trigger(int a) {
        for (auto const& observer : observers) {
            observer->trigger(a);
        }
    };

};

class ObserverA : public Observer {
public:
    void trigger(int a) override {
        std::cout << "Triggered observer A with: " << a << "\n";
    }
};

class ObserverB : public Observer {
public:
    void trigger(int a) override {
        std::cout << "Triggered observer B with: " << a << "\n";
    }
};


int main() {

    Observable observable;
    
    auto observerA = std::make_shared<ObserverA>();
    auto observerB = std::make_shared<ObserverB>();

    observable.addObserver(observerA);
    observable.addObserver(observerB);

    observable.trigger(10);

    return 0;
}
