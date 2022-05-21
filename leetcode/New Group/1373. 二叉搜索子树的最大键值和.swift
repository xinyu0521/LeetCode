//
//  1373. 二叉搜索子树的最大键值和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/20.
//

import Foundation

func maxSumBST(_ root: TreeNode?) -> Int {
    var ans = 0
    
    func dfs(_ root: TreeNode?) -> (min: Int, max: Int, sum: Int, isBST: Bool) {
        guard let root = root else {
            return (Int.max, Int.min, 0, true)
        }
        
        let l = dfs(root.left)
        let r = dfs(root.right)
        
        if l.isBST, r.isBST, root.val > l.max, root.val < r.min  {
            let sum = root.val + l.sum + r.sum
            ans = max(ans, sum)
            return (min(root.val, l.min), max(root.val, r.max), sum, true)
        } else {
            return (Int.min, Int.max, 0, false)
        }
    }
    
    dfs(root)
    return ans
}
