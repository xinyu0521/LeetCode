//
//  671. 二叉树中第二小的节点.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/18.
//

import Foundation

func findSecondMinimumValue(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return -1
    }
    
    let minVal = root.val
    
    func find(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        
        if root.val > minVal {
            return root.val
        }
        
        let l = find(root.left)
        let r = find(root.right)
        
        if l == -1 { return r}
        if r == -1 { return l}
        
        return min(l, r)
    }
    
    return find(root)
}
