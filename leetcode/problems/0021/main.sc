/** Definition for singly-linked list. class ListNode(_x: Int = 0, _next: ListNode = null) { var next: ListNode = _next
  * var x: Int = _x }
  */
object Solution {
    def mergeTwoLists(list1: ListNode, list2: ListNode): ListNode = {

        var left: ListNode  = list1;
        var right: ListNode = list2;

        var res: ListNode = null;

        if (left != null && right != null) {
            if (left.x <= right.x) {
                res = new ListNode(left.x);
                left = left.next;
            } else {
                res = new ListNode(right.x);
                right = right.next;
            }
        } else if (left != null) {
            res = new ListNode(left.x);
            left = left.next;
        } else if (right != null) {
            res = new ListNode(right.x);
            right = right.next;
        }

        var node: ListNode = res;

        while (left != null || right != null) {
            println(node.x);
            if (left == null) {
                node.next = new ListNode(right.x);
                node = node.next;
                right = right.next;
            } else if (right == null) {
                node.next = new ListNode(left.x);
                node = node.next;
                left = left.next;
            } else if (left.x <= right.x) {
                node.next = new ListNode(left.x);
                node = node.next;
                left = left.next;
            } else {
                node.next = new ListNode(right.x);
                node = node.next;
                right = right.next;
            }
        }

        res
    }
}
