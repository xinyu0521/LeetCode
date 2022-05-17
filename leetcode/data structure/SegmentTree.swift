//
//  SegmentTree.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/17.
//

import Foundation

class SegmentTreeNode<T> {
    let start: Int
    let end: Int
    var val: T
    var left: SegmentTreeNode?
    var right: SegmentTreeNode?
    
    init(_ start: Int, _ end: Int, _ val: T, _ left: SegmentTreeNode? = nil, _ right: SegmentTreeNode? = nil) {
        self.start = start
        self.end = end
        self.val = val
        self.left = left
        self.right = right
    }
}

class SegmentTree<T> {
    let operation: (_ left: T, _ right: T) -> T
    var root: SegmentTreeNode<T>
    
    init(_ values: [T], _ operation: @escaping (_ left: T, _ right: T) -> T) {
        self.operation = operation
        func build(_ start: Int, _ end: Int) -> SegmentTreeNode<T> {
            if start == end {
                return SegmentTreeNode(start, end, values[start])
            }
            let mid = (start + end) >> 1
            let left = build(start, mid)
            let right = build(mid + 1, end)
            return SegmentTreeNode(start, end, operation(left.val, right.val), left, right)
        }
        root = build(0, values.count - 1)
    }
    
    func update(_ index: Int, _ val: T) {
        func update(_ node: SegmentTreeNode<T>) {
            if node.start == index, node.end == index {
                node.val = val
                return
            }
            
            let mid = (node.start + node.end) >> 1
            
            if index <= mid {
                update(node.left!)
            } else {
                update(node.right!)
            }
            
            node.val = operation(node.left!.val, node.right!.val)
        }
        
        update(root)
    }
    
    func query(_ start: Int, _ end: Int) -> T {
        func query(_ node: SegmentTreeNode<T>, _ start: Int, _ end: Int) -> T {
            if node.start == start, node.end == end {
                return node.val
            }
            
            let mid = (node.start + node.end) >> 1
            if end <= mid {
                return query(node.left!, start, end)
            } else if start > mid {
                return query(node.right!, start, end)
            } else {
                return operation(query(node.left!, start, mid),
                                 query(node.right!, mid + 1, end))
            }
        }
        
        return query(root, start, end)
    }
}
