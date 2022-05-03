//
//  102. 二叉树的层序遍历.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    var res: [[Int]] = []
    
    func level(_ root: TreeNode?, depth: Int) {
        guard let root = root else {
            return
        }
        
        while res.count < depth + 1 {
            res.append([])
        }

        res[depth].append(root.val)
        level(root.left, depth: depth + 1)
        level(root.right, depth: depth + 1)
    }
    
    level(root, depth: 0)
    
    return res
}
