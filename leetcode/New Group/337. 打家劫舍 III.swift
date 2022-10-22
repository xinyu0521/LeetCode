//
//  337. 打家劫舍 III.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/22.
//

import Foundation

func rob(_ root: TreeNode?) -> Int {
    
    func dfs(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else {
            return (0, 0)
        }
        
        let l = dfs(root.left)
        let r = dfs(root.right)
        
        return (root.val + l.1 + r.1, max(l.0, l.1) + max(r.0, r.1))
    }
    
    let res = dfs(root)
    
    return max(res.0, res.1)
}
