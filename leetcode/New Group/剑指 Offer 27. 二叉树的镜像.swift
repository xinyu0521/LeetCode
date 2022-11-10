//
//  剑指 Offer 27. 二叉树的镜像.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/30.
//

import Foundation

func mirrorTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    (root.left, root.right) = (mirrorTree(root.right), mirrorTree(root.left))
    return root
}
