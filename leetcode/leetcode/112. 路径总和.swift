//
//  112. 路径总和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/12.
//

import Foundation

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else {
        return false
    }
    
    if root.left == nil, root.right == nil { return root.val == targetSum }
    return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
}
