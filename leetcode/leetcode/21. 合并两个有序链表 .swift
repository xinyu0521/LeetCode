//
//  21. 合并两个有序链表 .swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/8.
//

import Foundation

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    guard let list1 = list1 else {
        return list2
    }
    
    guard let list2 = list2 else {
        return list1
    }

    if list1.val < list2.val {
        list1.next = mergeTwoLists(list1.next, list2)
        return list1
    } else {
        list2.next = mergeTwoLists(list1, list2.next)
        return list2
    }
}
