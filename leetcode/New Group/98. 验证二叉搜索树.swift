//
//  98. 验证二叉搜索树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/28.
//

import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
    
    func valid(_ root: TreeNode?, left: Int, right: Int) -> Bool {
        guard let root = root else {
            return true
        }
        
        if root.val <= left || root.val >= right {
            return false
        }
        
        return valid(root.left, left: left, right: root.val) && valid(root.right, left: root.val, right: right)
    }
    
    return valid(root, left: Int.min, right: Int.max)
}
