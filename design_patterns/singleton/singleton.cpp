#include <iostream>
#include <memory>

class Singleton {
private:

    static std::unique_ptr<Singleton> instance;

    Singleton() = default;
    Singleton(const Singleton& src) = delete;
    Singleton& operator=(const Singleton& rhs) = delete;

public:
    virtual ~Singleton() = default;


    static Singleton &getInstance() {
        if (instance == nullptr) {
            instance.reset(new Singleton);
        }

        return *instance;
    }

    int value = 0;
};

std::unique_ptr<Singleton> Singleton::instance;

int main() {

    Singleton& s1 = Singleton::getInstance();
    Singleton& s2 = Singleton::getInstance();

    std::cout << "s1 value: " << s1.value << "\n";

    s1.value = 4;

    std::cout << "s2 value: " << s2.value << "\n";

    return 0;
}
