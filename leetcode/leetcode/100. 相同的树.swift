//
//  100. 相同的树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil {
        return true
    }
    
    if p == nil || q == nil {
        return false
    }
    
    return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
}
