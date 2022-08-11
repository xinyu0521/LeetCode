//
//  623. 在二叉树中增加一行.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/6.
//

import Foundation

func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
    if depth == 1 {
        return TreeNode(val, root, nil)
    }
    
    func dfs(_ node: TreeNode?, _ d: Int) {
        guard let node = node else {
            return
        }

        if depth == d {
            node.left = TreeNode(val, node.left, nil)
            node.right = TreeNode(val, nil,  node.right)
            return
        }
        dfs(node.left, d + 1)
        dfs(node.right, d + 1)
    }
    
    dfs(root, 2)
    
    return root
}
