# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteNodes(self, head: Optional[ListNode], m: int, n: int) -> Optional[ListNode]:
        if head == None:
            return head
        
        dummy = ListNode(0)
        dummy.next = head
        curr = head
        while curr:
            count =1
            while curr and count<m:
                curr= curr.next
                count+=1
            count = 0
            while curr and curr.next and count<n:
                curr.next = curr.next.next
                count+=1
            if curr:
                curr= curr.next
        return dummy.next