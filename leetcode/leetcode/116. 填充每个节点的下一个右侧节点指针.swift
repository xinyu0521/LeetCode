//
//  116. 填充每个节点的下一个右侧节点指针.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/7.
//

import Foundation

fileprivate class Node {
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


fileprivate func connect(_ root: Node?) -> Node? {
    guard let root = root else {
        return nil
    }
    
    if root.left != nil {
        root.left?.next = root.right
        root.right?.next = root.next?.left
    }
    
    connect(root.left)
    connect(root.right)
    
    return root
}
