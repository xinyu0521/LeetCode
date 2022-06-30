//
//  515. 在每个树行中找最大值.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/24.
//

import Foundation

func largestValues(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    var level = 0
    
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }

        if level < res.count {
            res[level] = max(res[level], root.val)
        } else {
            res.append(root.val)
        }
        
        level += 1
        dfs(root.left)
        dfs(root.right)
        level -= 1
    }
    
    dfs(root)
    
    return res
}
