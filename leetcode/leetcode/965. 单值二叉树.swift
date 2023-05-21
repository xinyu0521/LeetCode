//
//  965. 单值二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/24.
//

import Foundation

func isUnivalTree(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
    
    if let left = root.left, left.val != root.val {
        return false
    }
    
    if let right = root.right, right.val != root.val {
        return false
    }
    
    return isUnivalTree(root.left) && isUnivalTree(root.right)
}
