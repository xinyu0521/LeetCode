//
//  1305. 两棵二叉搜索树中的所有元素.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/1.
//

import Foundation

func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
    
    func inorder(_ root: TreeNode?, _ list: inout [Int]) {
        guard let root = root else {
            return
        }
        
        inorder(root.left, &list)
        list.append(root.val)
        inorder(root.right, &list)
    }
    
    var l1: [Int] = []
    var l2: [Int] = []
    inorder(root1, &l1)
    inorder(root2, &l2)
    
    var i = 0
    var j = 0
    
    var ans: [Int] = []
    
    while i < l1.count, j < l2.count {
        if l1[i] <= l2[j] {
            ans.append(l1[i])
            i += 1
        } else {
            ans.append(l2[j])
            j += 1
        }
    }
    
    while i < l1.count {
        ans.append(l1[i])
        i += 1
    }
    
    while j < l2.count {
        ans.append(l2[j])
        j += 1
    }
    
    return ans
}
