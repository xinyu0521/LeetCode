//
//  144. 二叉树的前序遍历.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/11.
//

import Foundation

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var ans: [Int] = []
    func preorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        ans.append(root.val)
        preorder(root.left)
        preorder(root.right)
    }
    
    preorder(root)
    return ans
}
