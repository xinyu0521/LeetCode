//
//  113. 路径总和 II.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    var res: [[Int]] = []
    func pathSum(_ root: TreeNode?, _ sum: Int, _ list: [Int]) {
        guard let root = root else {
            return
        }
 
        var list = list
        list.append(root.val)
        
        if root.val == sum, root.left == nil, root.right == nil {
            res.append(list)
        } else {
            pathSum(root.left, sum - root.val, list)
            pathSum(root.right, sum - root.val, list)
        }
    }
    
    pathSum(root, targetSum, [])
    
    return res
}
