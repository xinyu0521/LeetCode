//
//  543. 二叉树的直径.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/25.
//

import Foundation

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var maxDiameter = 0
    
    func diameter(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        
        let l = diameter(root.left) + 1
        let r = diameter(root.right) + 1
        
        maxDiameter = max(maxDiameter, l + r)
        
        return max(l, r)
    }
    
    _ = diameter(root)
    
    return maxDiameter
}
