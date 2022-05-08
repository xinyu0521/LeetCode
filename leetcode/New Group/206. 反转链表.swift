//
//  206. 反转链表.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/8.
//

import Foundation

func reverseList(_ head: ListNode?) -> ListNode? {
    var pre: ListNode?
    var cur = head
    while cur != nil {
        let next = cur?.next
        cur?.next = pre
        pre = cur
        cur = next
    }
    
    return pre
}
