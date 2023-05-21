//
//  450. 删除二叉搜索树中的节点.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/3.
//

import Foundation

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }

    if key > root.val {
        root.right = deleteNode(root.right, key)
    } else if key < root.val {
        root.left = deleteNode(root.left, key)
    } else {
        if (root.left != nil), let right = root.right {
            var min = right
            while min.left != nil {
                min = min.left!
            }
            root.val = min.val
            root.right = deleteNode(right, min.val)
        } else {
            return root.left == nil ? root.right : root.left
        }
    }
    
    return root
}
