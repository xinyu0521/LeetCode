//
//  968. 监控二叉树.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/10.
//

import Foundation

func minCameraCover(_ root: TreeNode?) -> Int {
    
    var ans = 0
    
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 2
        }
        
        let l = dfs(root.left)
        let r = dfs(root.right)
        
        if l == 0 || r == 0 {
            ans += 1
            return 1
        } else if l == 2, r == 2 {
            return 0
        } else {
            return 2
        }
    }
    
    if dfs(root) == 0 {
        ans += 1
    }
    
    return ans
}
