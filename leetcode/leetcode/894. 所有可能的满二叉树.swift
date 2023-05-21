//
//  894. 所有可能的满二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/14.
//

import Foundation

func allPossibleFBT(_ n: Int) -> [TreeNode?] {
    if n % 2 == 0 { return [] }
    if n == 1 { return [TreeNode(0)] }
    var ans: [TreeNode] = []
    for i in stride(from: 1, to: n, by: 2) {
        let lefts = allPossibleFBT(i)
        let rights = allPossibleFBT(n - i - 1)
        for left in lefts {
            for right in rights {
                let root = TreeNode(0)
                root.left = left
                root.right = right
                ans.append(root)
            }
        }
    }
    
    return ans
}
