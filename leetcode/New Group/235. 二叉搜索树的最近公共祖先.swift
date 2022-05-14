//
//  235. 二叉搜索树的最近公共祖先.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/14.
//

import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root, let p = p, let q = q else {
        return nil
    }
    
    if root.val < p.val, root.val < q.val {
        return lowestCommonAncestor(root.right, p, q)
    }
    
    if root.val > p.val, root.val > q.val {
        return lowestCommonAncestor(root.left, p, q)
    }
    
    return root
}
