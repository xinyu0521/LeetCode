//
//  622. 设计循环队列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/2.
//

import Foundation

class MyCircularQueue {
    
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public var pre: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    let capacity: Int
    var count = 0
    
    var head: ListNode
    var tail: ListNode
    
    init(_ k: Int) {
        capacity = k
        head = ListNode(0)
        tail = head
        
        var n = k - 1
        while n > 0 {
            let node = ListNode(0)
            tail.next = node
            node.pre = tail
            tail = node
            n -= 1
        }
        
        tail.next = head
        head.pre = tail
        tail = head
    }
    
    func enQueue(_ value: Int) -> Bool {
        if count == capacity { return false }
        if count != 0 {
            tail = tail.next!
        }
        tail.val = value
        count += 1
        return true
    }
    
    func deQueue() -> Bool {
        if count == 0 { return false }
        if count != 1 {
            head = head.next!
        }
        count -= 1
        return true
    }
    
    func Front() -> Int {
        count == 0 ? -1 : head.val
    }
    
    func Rear() -> Int {
        count == 0 ? -1 : tail.val
    }
    
    func isEmpty() -> Bool {
        count == 0
    }
    
    func isFull() -> Bool {
        count == capacity
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
