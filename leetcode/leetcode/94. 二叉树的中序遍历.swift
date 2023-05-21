//
//  94. 二叉树的中序遍历.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/11.
//

import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var ans: [Int] = []
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        inorder(root.left)
        ans.append(root.val)
        inorder(root.right)
    }
    
    inorder(root)
    return ans
}
