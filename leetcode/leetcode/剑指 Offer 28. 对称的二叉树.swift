//
//  剑指 Offer 28. 对称的二叉树.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/30.
//

import Foundation

func isSymmetric2(_ root: TreeNode?) -> Bool {
    
    func symmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil, right == nil { return true }
        guard let left = left, let right = right else { return false }
        if left.val != right.val { return false }
        return symmetric(left.left, right.right) && symmetric(left.right, right.left)
    }
        
    return symmetric(root?.left, root?.right)
}
