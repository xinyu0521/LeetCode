//
//  653. 两数之和 IV - 输入 BST.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/14.
//

import Foundation

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    var set: Set<Int> = []
    var ans = false
    func preorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        if set.contains(k - root.val) {
            ans = true
            return
        }
        set.insert(root.val)
        preorder(root.left)
        preorder(root.right)
    }
    preorder(root)
    
    return ans
}
