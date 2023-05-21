//
//  145. 二叉树的后序遍历.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/18.
//

import Foundation

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    
    func post(_ root: TreeNode?) {
        guard let root = root else { return }
        post(root.left)
        post(root.right)
        res.append(root.val)
    }
    
    post(root)
    
    return res
}
