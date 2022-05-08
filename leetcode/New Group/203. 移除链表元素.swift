//
//  203. 移除链表元素.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/8.
//

import Foundation

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    guard let head = head else {
        return nil
    }

    if head.val == val {
        return removeElements(head.next, val)
    } else {
        head.next = removeElements(head.next, val)
        return head
    }
}
