//
//  1483. 树节点的第 K 个祖先.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/24.
//

import Foundation

class TreeAncestor {
    var graph: [[Int]]
    var ancestors: [[Int]]

    init(_ n: Int, _ parent: [Int]) {
        graph = Array(repeating: [], count: n)
        ancestors = Array(repeating: [], count: n)
        for i in 0 ..< parent.count where parent[i] >= 0 {
            graph[parent[i]].append(i)
        }
        var path: [Int] = []
        func dfs(_ node: Int) {
            var i = 1
            while i <= path.count {
                ancestors[node].append(path[path.count - i])
                i *= 2
            }
            path.append(node)
            for n in graph[node] {
                dfs(n)
            }
            path.removeLast()
        }
        
        dfs(0)
    }

    func getKthAncestor(_ node: Int, _ k: Int) -> Int {
        if k == 0 { return node }
        if node == 0, k > 0 { return -1 }
        let pos = ffsl(k) - 1

        return pos < ancestors[node].count ?
            getKthAncestor(ancestors[node][Int(pos)], k - (1 << pos)) :
            -1
    }
}
