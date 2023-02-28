lass TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
    var value: Int      = _value
    var left: TreeNode  = _left
    var right: TreeNode = _right
}

object Solution {
    def hasPathSum(root: TreeNode, targetSum: Int): Boolean = {

        if (root == null) {
            return false
        }

        def fold(value: Int, left: TreeNode, right: TreeNode): Boolean = {

            if (value == 0 && left == null && right == null) {
                return true
            }

            if (left != null && fold(value - left.value, left.left, left.right)) {
                return true
            }

            if (right != null && fold(value - right.value, right.left, right.right)) {
                return true
            }

            return false

        }

        fold(targetSum - root.value, root.left, root.right)
    }
}

println(Solution.hasPathSum(null, 0))
