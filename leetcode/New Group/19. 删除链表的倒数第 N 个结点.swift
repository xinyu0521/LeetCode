//
//  19. 删除链表的倒数第 N 个结点.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/4.
//

import Foundation

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard let head = head else {
        return head
    }
    
    let p = ListNode()
    p.next = head
    
    var left: ListNode? = p
    var right: ListNode? = p
    
    var n = n
    while n > 0 {
        right = right?.next
        n -= 1
    }
    
    while right != nil {
        right = right?.next
        left = left?.next
    }
    
    left?.next = left?.next?.next

    return p.next
}
