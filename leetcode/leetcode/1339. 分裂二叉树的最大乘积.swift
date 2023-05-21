//
//  1339. 分裂二叉树的最大乘积.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/20.
//

import Foundation

func maxProduct(_ root: TreeNode?) -> Int {
    var sum = 0
    
    func sumTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return root.val + sumTree(root.left) + sumTree(root.right)
    }

    sum = sumTree(root)
    
    var ans: Int64 = 0
    
    func solve(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let l = solve(root.left)
        let r = solve(root.right)
        
        ans = max(ans, max(Int64((sum - l) * l), Int64((sum - r) * r)))
        
        return root.val + l + r
    }
    
    solve(root)
    return Int(ans % 1000000007)
}
