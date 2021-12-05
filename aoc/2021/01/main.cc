#include "std.hh"

template <uint A, uint B, uint... D>
struct inc {
    static constexpr uint value = inc<A, B>::value + inc<B, D...>::value;
};

template<uint A, uint B>
struct inc<A, B> {
    static constexpr uint value = static_cast<uint>(B > A);
};

constexpr uint res = inc<
#include "input.txt"
>::value;

print_int(res);
