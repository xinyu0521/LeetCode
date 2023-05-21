//
//  652. 寻找重复的子树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/30.
//

import Foundation

func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    var map: [String: Int] = [:]
    var ans: [TreeNode] = []
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "#"
        }
        
        let str = String(root.val) + "," + serialize(root.left) + "," + serialize(root.right)
        
        map[str] = (map[str] ?? 0) + 1
        
        if map[str] == 2 {
            ans.append(root)
        }
    
        return str
    }
        
    _ = serialize(root)
    
    return ans
}
