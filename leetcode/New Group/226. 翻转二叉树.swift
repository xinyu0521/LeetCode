//
//  226. 翻转二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/12.
//

import Foundation

func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }

    let right = root.right
    root.right = invertTree(root.left)
    root.left = invertTree(right)
    
    return root
}
