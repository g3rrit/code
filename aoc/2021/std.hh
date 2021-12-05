#include <cstdint>

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

typedef unsigned int uint;

typedef float f32;
typedef double f64;

#define print_int(num) \
    char (*_print_int)[(num)] = 1;
