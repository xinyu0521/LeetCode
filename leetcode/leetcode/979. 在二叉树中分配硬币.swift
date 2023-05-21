//
//  979. 在二叉树中分配硬币.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/16.
//

import Foundation

func distributeCoins(_ root: TreeNode?) -> Int {
    var ans = 0
    func distribute(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        let l = distributeCoins(root.left)
        let r = distributeCoins(root.right)
        ans += abs(l) + abs(r)
        return root.val + l + r - 1
    }
    distribute(root)
    return ans
}
