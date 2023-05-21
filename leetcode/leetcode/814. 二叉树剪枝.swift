//
//  814. 二叉树剪枝.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/21.
//

import Foundation

func pruneTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    root.left = pruneTree(root.left)
    root.right = pruneTree(root.right)
    
    if root.val == 0,
       root.left == nil,
       root.right == nil {
        return nil
    }
    
    return root
}
