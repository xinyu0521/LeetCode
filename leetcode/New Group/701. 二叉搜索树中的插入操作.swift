//
//  701. 二叉搜索树中的插入操作.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/13.
//

import Foundation

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else {
        return TreeNode(val)
    }
    
    if val > root.val {
        root.right = insertIntoBST(root.right, val)
    } else {
        root.left = insertIntoBST(root.left, val)
    }
    
    return root
}
