//
//  876. 链表的中间结点.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/4.
//

import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    if head.next == nil {
        return head
    }

    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast != nil, fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}
