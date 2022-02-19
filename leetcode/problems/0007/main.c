
int reverse(int x){

    // lowest 32bit int can't be reversed
    if (x == 0x80000000) { // -2147483648
        return 0;
    }

    int sign = x < 0 ? -1 : 1;
    int y = 0;
    x *= sign;

    // i won't overflow, y will first
    for(; x > 0; x /= 10) {

        int rem = x % 10;

        // handle multiplication overflow
        if (y > 0x7fffffff / 10) {
            return 0;
        }

        y *= 10;

        // handle addition overflow
        if (y > 0x7fffffff - rem) {
            return 0;
        }

        y += rem;
    }

    return y * sign;
}
