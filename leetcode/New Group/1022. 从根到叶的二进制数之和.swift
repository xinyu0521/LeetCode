//
//  1022. 从根到叶的二进制数之和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/30.
//

import Foundation

func sumRootToLeaf(_ root: TreeNode?) -> Int {
    var ans = 0
    func dfs(_ root: TreeNode?, _ pVal: Int) {
        guard let root = root else {
            return
        }
        
        if root.right == nil, root.left == nil {
            ans += pVal
        }
        
        let val = pVal << 1 + root.val
        
        return dfs(root.right, val) + dfs(root.left, val)
    }
    
    return dfs(root, 0)
}
