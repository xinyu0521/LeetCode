//
//  1530. 好叶子节点对的数量.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/28.
//

import Foundation

func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
    
    func dfs(_ root: TreeNode?) -> ([Int], Int) {
        var depths = Array(repeating: 0, count: distance + 1)
        guard let root = root else {
            return (depths, 0)
        }
        
        if root.left == nil, root.right == nil {
            depths[0] = 1
            return (depths, 0)
        }
        
        let l = dfs(root.left)
        let r = dfs(root.right)
        
        var pairs = 0
        for i in 0 ..< l.0.count {
            for j in 0 ..< r.0.count {
                if i + j + 2 <= distance {
                    pairs += l.0[i] * r.0[j]
                }
            }
        }
        
        for d in 0 ..< distance {
            depths[d + 1] = l.0[d] + r.0[d]
        }
        
        return (depths, pairs + l.1 + r.1)
    }
    
    return dfs(root).1
}
