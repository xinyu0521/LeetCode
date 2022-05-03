//
//  110. 平衡二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    func isBalancedAndHeight(_ root: TreeNode?) -> (balanced: Bool, height: Int) {
        guard let root = root else {
            return (true, 0)
        }
        
        let left = isBalancedAndHeight(root.left)
        let right = isBalancedAndHeight(root.right)
        
        return (left.balanced && right.balanced && abs(left.height - right.height) < 2, max(left.height, right.height) + 1)
    }
    
    return isBalancedAndHeight(root).balanced
}
