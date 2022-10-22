//
//  1302. 层数最深叶子节点的和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/17.
//

import Foundation

func deepestLeavesSum(_ root: TreeNode?) -> Int {
    var depth = 0
    var res = 0
    func dfs(_ d: Int, _ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        if d > depth {
            depth = d
            res = root.val
        } else if d == depth {
            res += root.val
        }
        
        dfs(d + 1, root.left)
        dfs(d + 1, root.right)
    }
    
    dfs(1, root)
    
    return res
}
