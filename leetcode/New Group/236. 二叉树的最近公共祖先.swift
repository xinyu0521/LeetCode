//
//  236. 二叉树的最近公共祖先.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/20.
//

import Foundation

func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    var ans: TreeNode?
    
    func dfs(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        let l = dfs(root.left, p, q)
        let r = dfs(root.right, p, q)
        
        if (l && r) || ((root.val == p?.val || root.val == q?.val) && (l || r)) {
            ans = root
        }
        
        if l || r || root.val == p?.val || root.val == q?.val {
            return true
        }
        
        return false
    }
    
    _ = dfs(root, p, q)
    
    return ans
}
