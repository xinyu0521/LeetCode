//
//  687. 最长同值路径.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/24.
//

import Foundation

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    
    var res = 0
    
    func univaluePath(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let l = univaluePath(root.left)
        let r = univaluePath(root.right)
        
        var pl = 0
        var pr = 0
        
        if let left = root.left, left.val == root.val {
            pl = l + 1
        }
        
        if let right = root.right, right.val == root.val {
            pr = r + 1
        }
        
        res = max(res, pl + pr)
        
        return max(pl, pr)
    }
    
    _ = univaluePath(root)
    
    return res
}
