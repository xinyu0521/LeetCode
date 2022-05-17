//
//  1110. 删点成林.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/17.
//

import Foundation

func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    let set: Set<Int> = Set(to_delete)
    var ans: [TreeNode?] = []
    func del(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        root.left = del(root.left)
        root.right = del(root.right)
        
        if !set.contains(root.val) {
            return root
        }
        
        if let left = root.left {
            ans.append(left)
        }
        
        if let right = root.right {
            ans.append(right)
        }
        return nil
    }
    
    if let node = del(root) {
        ans.append(node)
    }
    
    return ans
}
