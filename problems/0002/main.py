# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        u = 0
        r = None
        while l1 is not None or l2 is not None or u:
            a = sum(map(lambda x: x.val, [ i for i in [l1, l2] if i ]))
            v = (a + u) % 10
            u = (a + u) // 10
            
            if r is None:
                r = ListNode(v)
                rr = r
            else:
                rr.next = ListNode(v)
                rr = rr.next
                
            if l1:
                l1 = l1.next
            if l2:
                l2 = l2.next
                
        return r