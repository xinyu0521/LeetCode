//
//  437. 路径总和 III.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/24.
//

import Foundation

func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
    
    var map: [Int: Int] = [0: 1]
    var cur = 0
    
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        cur += root.val
        var ret = map[cur - targetSum, default: 0]
        map[cur, default: 0] += 1
        ret += dfs(root.left)
        ret += dfs(root.right)
        map[cur, default: 0] -= 1
        cur -= root.val
        return ret
    }
    
    return dfs(root)
}
