//
//  二叉树中的最大路径和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/25.
//

import Foundation

func maxPathSum(_ root: TreeNode?) -> Int {
    var ans = Int.min
    
    func maxSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let l = max(0, maxSum(root.left))
        let r = max(0, maxSum(root.right))
        
        ans = max(ans, root.val + l + l)
        
        return root.val + max(l, r)
    }
    
    _ = maxSum(root)
    
    return ans
}
