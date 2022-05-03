//
//  429. N 叉树的层序遍历.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/8.
//

import Foundation

//public class Node {
//    public var val: Int
//    public var children: [Node]
//    public init(_ val: Int) {
//        self.val = val
//        self.children = []
//    }
//}
//
//func levelOrder(_ root: Node?) -> [[Int]] {
//    guard let root = root else {
//        return [[]]
//    }
//    
//    var res: [[Int]] = []
//
//    var queue = [[root]]
//    
//    while !queue.isEmpty {
//        let first = queue.removeFirst()
//        var values: [Int] = []
//        var nodes: [Node] = []
//        for node in first {
//            values.append(node.val)
//            nodes.append(contentsOf: node.children)
//        }
//        res.append(values)
//        if !nodes.isEmpty {
//            queue.append(nodes)
//        }
//    }
//    
//    return res
//}
