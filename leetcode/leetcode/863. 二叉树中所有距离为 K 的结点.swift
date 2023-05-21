//
//  863. 二叉树中所有距离为 K 的结点.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/8.
//

import Foundation

func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    var graph: [Int: [Int]] = [:]
    var visited: Set<Int> = []
    var queue: ArraySlice<[Int]> = [[target!.val]]
    var k = k

    buildGraph(root, nil)
    
    while !queue.isEmpty {
        let nums = queue.removeFirst()
        if k == 0 { return nums }
        k -= 1
        var nexts: [Int] = []
        for num in nums {
            visited.insert(num)
            if let ves = graph[num] {
                for v in ves {
                    if visited.contains(v) { continue }
                    nexts.append(v)
                }
            }
        }
        if !nexts.isEmpty {
            queue.append(nexts)
        }
    }
    
    func buildGraph(_ root: TreeNode?, _ parent: TreeNode?) {
        guard let root = root else {
            return
        }
        
        if let parent = parent {
            if graph[root.val] == nil {
                graph[root.val] = []
            }
            if graph[parent.val] == nil {
                graph[parent.val] = []
            }
            
            graph[root.val]?.append(parent.val)
            graph[parent.val]?.append(root.val)
        }
        
        buildGraph(root.left, root)
        buildGraph(root.right, root)
    }
    
    return []
}
