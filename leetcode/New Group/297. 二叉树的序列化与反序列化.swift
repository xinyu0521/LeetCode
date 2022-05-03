//
//  297. 二叉树的序列化与反序列化.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/21.
//

import Foundation

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var res = ""
        func preOrder(_ root: TreeNode?) {
            guard let root = root else {
                res.append("# ")
                return
            }
            
            res.append(String(root.val) + " ")
            preOrder(root.left)
            preOrder(root.right)
        }
        
        preOrder(root)
        return res
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let list = data.split(separator: " ")
        var i = 0
        func makeTree() -> TreeNode? {
            if i >= list.count { return nil}
            let val = list[i]
            i += 1
            if val == "#" {
                return nil
            }
            
            let root = TreeNode(Int(val)!)
            root.left = makeTree()
            root.right = makeTree()
            return root
        }
        
        return makeTree()
    }
}
