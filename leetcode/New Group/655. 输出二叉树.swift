//
//  655. 输出二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func printTree(_ root: TreeNode?) -> [[String]] {
    func maxHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxHeight(root.left), maxHeight(root.right)) + 1
    }

    func fill(_ root: TreeNode?, _ h: Int, _ l: Int, r: Int) {
        guard let root = root else { return }
        let mid = (l + r) >> 1
        res[h][mid] = String(root.val)
        fill(root.left, h + 1, l, r: mid)
        fill(root.right, h + 1, mid + 1, r: r)
    }

    let h = maxHeight(root)
    let w = (1 << h) - 1

    var res = Array(repeating: Array(repeating: "", count: w), count: h)
    fill(root, 0, 0, r: w - 1)

    return res
}
