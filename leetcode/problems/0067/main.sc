object Solution {
    def addBinary(a: String, b: String): String = {

        var res : String = ""
        var len : Int =  a.length().max(b.length);
        var _a : String = "0" * (len - a.length) + a;
        var _b : String = "0" * (len - b.length) + b;
        var carry : Char = '0';

        for ((l, r) <- (_a zip _b).reverse) {
            if (l == '1' && r == '1') {
                res = carry + res;
                carry = '1';
            } else if (carry == '1' && (l == '1' || r == '1')) {
                res = '0' + res;
            } else if (carry == '0' && (l == '1' || r == '1')) {
                res = '1' + res;
            } else { // l == '0' && r == '0'
                res = carry + res;
                carry = '0';
            }
        }

        if (carry == '1') {
            res = carry + res;
        }

        res
    }
}
