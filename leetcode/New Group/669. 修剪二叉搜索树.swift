//
//  669. 修剪二叉搜索树.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/10.
//

import Foundation

func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    if (low ... high).contains(root.val) {
        root.left = trimBST(root.left, low, high)
        root.right = trimBST(root.right, low, high)
        return root
    } else if root.val > high {
        return trimBST(root.left, low, high)
    } else {
        return trimBST(root.right, low, high)
    }
}
