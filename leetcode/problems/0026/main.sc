import scala.util.control.Breaks._

object Solution {
    def removeDuplicates(nums: Array[Int]): Int = {
        var res: Int = nums.length

        if (nums.length == 1) {
            return 1
        }

        breakable {
            for (i <- 1 until nums.length) {
                if (nums(i) <= nums(i - 1)) {
                    var n: Int = nums.slice(i + 1, nums.length).indexWhere(_ > nums(i - 1))
                    if (n == -1) {
                        res = i
                        break
                    } else {
                        nums(i) = nums(i + 1 + n)
                    }
                }
            }
        }
        res
    }
}
