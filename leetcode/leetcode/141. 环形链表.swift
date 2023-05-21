//
//  141. 环形链表.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/8.
//

import Foundation

func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil {
        return false
    }
    
    var slow: ListNode? = head?.next
    var fast: ListNode? = head?.next?.next
    
    while slow != nil, fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow === fast {
            return true
        }
    }
    
    return false
}
