//
//  111. 二叉树的最小深度.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/31.
//

import Foundation

func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    var res = Int.max
    var depth = 0
    func dfs(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        
        depth += 1
        
        if node.left == nil,
           node.right == nil {
            res = min(res, depth)
        }
        
        dfs(node.left)
        dfs(node.right)
        
        depth -= 1
    }
    
    dfs(root)
    return res
}
