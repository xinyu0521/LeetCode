//
//  606. 根据二叉树创建字符串.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func tree2str(_ root: TreeNode?) -> String {
    guard let root = root else {
        return ""
    }

    var res = ""
    res.append(String(root.val))
    
    if root.left == nil, root.right == nil {
        return res
    }

    if root.left == nil {
        res.append("()")
    } else {
        res.append("(")
        res.append(tree2str(root.left))
        res.append(")")
    }
    
    if root.right != nil {
        res.append(tree2str(root.right))
    }

    return res
}
