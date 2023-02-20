object Solution {
    def myAtoi(s: String): Int = {

        var sign: Int = 1;

        var ss: String = s.dropWhile(_.toInt == 32);

        if (ss.length >= 1) {
          if (ss.charAt(0) == '+') {
            sign = 1;
            ss =ss.drop(1);
          } else if (ss.charAt(0) == '-') {
            sign = -1;
            ss = ss.drop(1);
          }
        }

        ss = ss.takeWhile((c) => { val n = c.toInt; c >= 48 && c <= 57 })

        ss.foldLeft(0) {
            (acc, c) => {
              val n: Int = c.toInt - 48
              if (acc.toLong * 10 + n >= Int.MaxValue) {
                Int.MaxValue
              } else if (acc.toLong * 10 - n <= Int.MinValue) {
                Int.MinValue
              } else {
                acc * 10 + (n * sign)
              }
          }
        }
    }
}
