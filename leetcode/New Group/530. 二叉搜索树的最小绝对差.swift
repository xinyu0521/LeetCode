//
//  530. 二叉搜索树的最小绝对差.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/29.
//

import Foundation

func getMinimumDifference(_ root: TreeNode?) -> Int {
    var list: [Int] = []
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }

        inorder(root.left)
        list.append(root.val)
        inorder(root.right)
    }

    inorder(root)
    var ans = Int.max
    for i in 1 ..< list.count {
        ans = min(ans, list[i] - list[i - 1])
    }

    return ans
}
