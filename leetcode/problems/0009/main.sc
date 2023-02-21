object Solution {
    def isPalindrome(x: Int): Boolean = {

        if (x < 0) {
            return false;
        }

        var y: Int                = 0;
        var isPalindrome: Boolean = true;

        var i: Int = x;
        while (i > 0) {
            y = y * 10 + i % 10;
            i /= 10;
        }

        i = x;
        while (isPalindrome && i > 0) {
            if ((i % 10) != (y % 10)) {
                isPalindrome = false;
            }
            i /= 10;
            y /= 10;
        }

        isPalindrome
    }
}
