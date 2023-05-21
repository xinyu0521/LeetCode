//
//  700. 二叉搜索树中的搜索.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/13.
//

import Foundation

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    if root.val == val {
        return root
    }

    return val > root.val ? searchBST(root.right, val) : searchBST(root.left, val)
}
