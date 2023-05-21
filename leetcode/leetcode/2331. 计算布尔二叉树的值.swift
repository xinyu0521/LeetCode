//
//  2331. 计算布尔二叉树的值.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/6.
//

import Foundation

func evaluateTree(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return false
    }
    
    if root.left == nil,
       root.right == nil {
        return root.val == 1
    }
    
    if root.val == 2 {
        return evaluateTree(root.left) || evaluateTree(root.right)
    }
    
    return evaluateTree(root.left) && evaluateTree(root.right)
}
