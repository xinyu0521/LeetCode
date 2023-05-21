//
//  889. 根据前序和后序遍历构造二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/13.
//

import Foundation

func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
    
    func buildTree(i: Int, j: Int, n: Int) -> TreeNode? {
        if n <= 0 { return nil }
        let root = TreeNode(preorder[i])
        if n == 1 { return root }
        var k = j
        while preorder[i + 1] != postorder[k] {
            k += 1
        }
        let l = k - j + 1
        root.left = buildTree(i: i + 1, j: j, n: l)
        root.right = buildTree(i: i + l + 1, j: k + 1, n: n - l - 1)
        return root
    }
    
    return buildTree(i: 0, j: 0, n: preorder.count)
}
