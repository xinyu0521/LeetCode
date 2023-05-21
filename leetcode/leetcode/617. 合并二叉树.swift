//
//  617. 合并二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    guard let root1 = root1 else {
        return root2
    }
    
    guard let root2 = root2 else {
        return root1
    }
    
    root1.val += root2.val
    root1.left = mergeTrees(root1.left, root2.left)
    root1.right = mergeTrees(root1.right, root2.right)
    
    return root1
}
