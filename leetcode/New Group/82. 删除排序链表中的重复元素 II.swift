//
//  82. 删除排序链表中的重复元素 II.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/30.
//

import Foundation

func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }

    let dumb = ListNode()
    var p: ListNode? = dumb
    var m: ListNode? = head
    var n: ListNode? = head
    var step = 0

    while n != nil {
        if m?.val == n?.val {
            step += 1
            n = n?.next
            continue
        }
        
        if step == 1 {
            p?.next = m
            p = p?.next
            p?.next = nil
            m = n
            step = 0
        } else {
            m = n
            step = 0
        }
    }
    
    if step == 1 {
        p?.next = m
    }
    
    return dumb.next
}
