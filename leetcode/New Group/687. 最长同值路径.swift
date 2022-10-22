//
//  687. 最长同值路径.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/24.
//

import Foundation

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    var ans = 0
    
    @discardableResult
    func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        let l = dfs(node.left)
        let r = dfs(node.right)
        
        var ls = 0
        var rs = 0
        
        if let left = node.left,
           left.val == node.val {
            ls = l + 1
        }
        
        if let right = node.right,
           right.val == node.val {
            rs = r + 1
        }
        
        ans = max(ans, ls + rs)
        return max(ls, rs)
    }
    
    dfs(root)
    return ans
}
