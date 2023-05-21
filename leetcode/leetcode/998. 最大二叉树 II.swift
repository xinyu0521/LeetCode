//
//  998. 最大二叉树 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/31.
//

import Foundation

func insertIntoMaxTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var a: [Int] = []
    
    func dfs(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        dfs(node.left)
        a.append(node.val)
        dfs(node.right)
    }
    
    dfs(root)
    a.append(val)
    
    func makeBMT(_ begin: Int, _ end: Int) -> TreeNode? {
        if begin >= end { return nil }
        
        let maxIndex = a.firstIndex(of: a[begin ..< end].max()!)!
        let root = TreeNode(a[maxIndex])
        root.left = makeBMT(begin, maxIndex)
        root.right = makeBMT(maxIndex + 1, end)
        
        return root
    }
    
    return makeBMT(0, a.count)
}
