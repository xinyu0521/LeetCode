//
//  637. 二叉树的层平均值.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    
    var list = [root!]
    var res: [Double] = []
    while !list.isEmpty {
        var nextList: [TreeNode] = []
        var sum = 0
        for node in list {
            sum += node.val
            if let left = node.left {
                nextList.append(left)
            }
            
            if let right = node.right {
                nextList.append(right)
            }
        }
        res.append(Double(sum) / Double(list.count))
        list = nextList
    }
    
    return res
}
