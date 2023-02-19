object Solution {
    def mySqrt(x: Int): Int = {
        if (x <= 1) { return x; }
        var y: Int = x / 2;
        while (y > x / y) {
            y = (y + x / y) / 2;
        }
        y
    }
}
