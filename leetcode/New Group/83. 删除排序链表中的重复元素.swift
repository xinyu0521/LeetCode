//
//  83. 删除排序链表中的重复元素.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/8.
//

import Foundation

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    func delete(_ head: ListNode?, pVal: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        if head.val == pVal {
            return delete(head.next, pVal: pVal)
        } else {
            head.next = delete(head.next, pVal: head.val)
        }
        
        return head
    }
    
    return delete(head, pVal: 200)
}
