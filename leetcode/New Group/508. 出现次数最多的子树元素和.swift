//
//  508. 出现次数最多的子树元素和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/19.
//

import Foundation

func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
    var cnt: [Int: Int] = [:]
    var maxCount = Int.min
    var ans: Set<Int> = []
    
    @discardableResult
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let l = dfs(root.left)
        let r = dfs(root.right)
        let val = l + r + root.val
        let count = (cnt[val] ?? 0) + 1
        cnt[val] = count
        
        if count > maxCount {
            maxCount = count
            ans.removeAll()
            ans.insert(val)
        } else if count == maxCount {
            ans.insert(val)
        }
        
        return val
    }
    
    dfs(root)
    
    return Array(ans)
}
