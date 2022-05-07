//
//  116. 填充每个节点的下一个右侧节点指针.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/7.
//

import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
      public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


func connect(_ root: Node?) -> Node? {
    guard let root = root else {
        return nil
    }
    
    var queue: ArraySlice<[Node]> = [[root]]
    
    while !queue.isEmpty {
        var next: [Node] = []
        let nodes = queue.removeFirst()
        for i in 0 ..< nodes.count {
            if i != nodes.count - 1 {
                nodes[i].next = nodes[i + 1]
            }
            if let left = nodes[i].left {
                next.append(left)
            }
            if let right = nodes[i].right {
                next.append(right)
            }
        }
        if !next.isEmpty {
            queue.append(next)
        }
    }
    
    return root
}
