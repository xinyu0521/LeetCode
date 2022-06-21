//
//  513. 找树左下角的值.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/22.
//

import Foundation

func findBottomLeftValue(_ root: TreeNode?) -> Int {
    var maxLevel = 0
    var level = 0
    var ans = 0
    
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        level += 1
        if level > maxLevel {
            ans = root.val
            maxLevel = level
        }
        dfs(root.left)
        dfs(root.right)
        level -= 1
    }
    
    dfs(root)
    
    return ans
}
