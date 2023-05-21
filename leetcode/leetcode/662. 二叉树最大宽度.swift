//
//  662. 二叉树最大宽度.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/27.
//

import Foundation

func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    var ids: [Int] = []

    func dfs(_ node: TreeNode?, _ d: Int, _ id: Int) -> Int {
        guard let node = node else {
            return 0
        }
        if ids.count == d {
            ids.append(id)
        }

        let newId = id - ids[d]
        return max(newId + 1,
                   max(dfs(node.left, d + 1, newId * 2),
                       dfs(node.right, d + 1, newId * 2 + 1)))
    }
    
    return dfs(root, 0, 0)
}
