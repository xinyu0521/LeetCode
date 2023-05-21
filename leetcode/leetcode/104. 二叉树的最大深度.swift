//
//  104. 二叉树的最大深度.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/12.
//

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    return max(maxDepth(root.left), maxDepth(root.right)) + 1
}
