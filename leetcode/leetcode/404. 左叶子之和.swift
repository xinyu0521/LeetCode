//
//  404. 左叶子之和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }

    var res = 0

    if let left = root.left, left.left == nil, left.right == nil {
        res += left.val
    }
    
    res += sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right)
    
    return res
}
