object Solution {
    def climbStairs(n: Int): Int = {
        // the ways in which to climb n stairs can be derived by appending one step to the ways to climb n - 1 stairs
        // and two steps to the ways to climb n - 2 stairs
        if (n <= 2) { return n; }
        (3 to n).foldLeft((1, 2)) { (acc, _) => (acc._2, acc._1 + acc._2) }._2
    }
}
