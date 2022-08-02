//
//  919. 完全二叉树插入器.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/25.
//

import Foundation

class CBTInserter {
    
    var root: TreeNode?
    var queue: ArraySlice<TreeNode> = []

    init(_ root: TreeNode?) {

        self.root = root
        
        func add(_ node: TreeNode?) {
            guard let node = node else {
                return
            }
            
            var q: ArraySlice<TreeNode> = [node]
            while !q.isEmpty {
                let node = q.removeFirst()
                if node.left == nil || node.right == nil {
                    queue.append(node)
                }
                if let left = node.left {
                    q.append(left)
                }
                if let right = node.right {
                    q.append(right)
                }
            }
        }
        
        add(root)
    }
    
    func insert(_ val: Int) -> Int {
        let node = queue.first!
        let newNode = TreeNode(val)
        
        if node.left == nil {
            node.left = newNode
            queue.append(newNode)
            return node.val
        } else {
            node.right = newNode
            queue.append(newNode)
            queue.removeFirst()
            return node.val
        }
    }
    
    func get_root() -> TreeNode? {
        root
    }
}
