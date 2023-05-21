//
//  1457. 二叉树中的伪回文路径.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/21.
//

import Foundation

func pseudoPalindromicPaths(_ root: TreeNode?) -> Int {
    func dfs(_ root: TreeNode?, _ n: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        let m = n ^ (1 << root.val)
        var ans = 0
        
        if root.left == nil, root.right == nil {
            if m == 0 || m & (m - 1) == 0 {
                ans += 1
            }
        }
        
        ans += dfs(root.left, m)
        ans += dfs(root.right, m)
        
        return ans
    }
      
    return dfs(root, 0)
}
