//
//  剑指 Offer II 029. 排序的循环链表.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/18.
//

import Foundation

fileprivate class Node {
    public var val: Int
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

fileprivate func insert(_ head: Node?, _ insertVal: Int) -> Node? {
    guard let head = head else {
        let node = Node(insertVal)
        node.next = node
        return node
    }
    
    var m = head
    var n = head.next!
    
    while true {
        if insertVal > m.val, insertVal <= n.val {
            insert(m, n, insertVal)
            break
        }
        
        if n.val < m.val {
            if insertVal >= m.val || insertVal <= n.val {
                insert(m, n, insertVal)
                break
            }
        }
        
        if n === head {
            insert(m, n, insertVal)
            break
        }
        m = m.next!
        n = n.next!
    }
    
    func insert(_ m: Node, _ n: Node, _ value: Int) {
        let node = Node(value)
        m.next = node
        node.next = n
    }
    
    return head
}
