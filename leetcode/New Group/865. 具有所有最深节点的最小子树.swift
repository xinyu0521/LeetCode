//
//  865. 具有所有最深节点的最小子树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/8.
//

import Foundation

func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
    func depth(_ root: TreeNode?) -> (depth: Int, res: TreeNode?) {
        guard let root = root else {
            return (-1, nil)
        }
        
        let l = depth(root.left)
        let r = depth(root.right)
        
        if l.depth == r.depth {
            return (l.depth + 1, root)
        }
        
        return l.depth > r.depth ? (l.depth + 1, l.res) : (r.depth + 1, r.res)
    }
    
    return depth(root).res
}
