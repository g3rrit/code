object Solution {
    def plusOne(digits: Array[Int]): Array[Int] = {
        var (res, carry, _) : (Array[Int], Int, Int) = digits.foldRight(new Array[Int](digits.length), 1, digits.length) {
            (a, acc) => {
                var (res, carry, i) = acc;
                i = i - 1;
                if (carry + a >= 10) {
                    res(i) = 0;
                } else {
                    res(i) = carry + a;
                    carry = 0;
                };
                (res, carry, i)
            }
        }

        if (carry == 1) {
            res = 1 +: res;
        }

        return res;
    }
}
