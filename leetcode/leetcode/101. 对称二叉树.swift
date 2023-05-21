//
//  101. 对称二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/12.
//

import Foundation

func isSymmetric(_ root: TreeNode?) -> Bool {
    func check(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil, right == nil { return true }
        if left == nil || right == nil { return false }
        if left?.val != right?.val { return false }

        return check(left?.left, right?.right) && check(left?.right, right?.left)
    }
    return check(root?.left, root?.right)
}
