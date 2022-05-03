//
//  742. 二叉树最近的叶节点.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/30.
//

import Foundation

func findClosestLeaf(_ root: TreeNode?, _ k: Int) -> Int {
    var graph: [TreeNode: [TreeNode]] = [:]
    var start: TreeNode?
    
    func dfs(_ root: TreeNode?, parent: TreeNode?) {
        guard let root = root else {
            return
        }

        if graph[root] == nil {
            graph[root] = []
        }
        
        if root.val == k {
            start = root
        }
        
        if let parent = parent {
            graph[root]?.append(parent)
        }
        
        if let left = root.left {
            graph[root]?.append(left)
            dfs(root.left, parent: root)
        }
        
        if let right = root.right {
            graph[root]?.append(right)
            dfs(root.right, parent: root)
        }
    }
    
    func bfs() -> Int {
        var q: [TreeNode] = []
        var visited = Set<TreeNode>()
        q.append(start!)
        
        while !q.isEmpty {
            let node = q.removeFirst()
            
            if visited.contains(node) {
                continue
            }
                
            visited.insert(node)
                
            if node.left == nil, node.right == nil {
                return node.val
            }
            
            q.append(contentsOf: graph[node]!)
        }
        
        return k
    }
    
    dfs(root, parent: nil)
    
    return bfs()
}

extension TreeNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }

    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val
    }
}
