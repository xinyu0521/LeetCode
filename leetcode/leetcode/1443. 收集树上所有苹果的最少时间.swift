//
//  1443. 收集树上所有苹果的最少时间.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/21.
//

import Foundation

func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
    
    var tree: [Int: [Int]] = [:]
    for edge in edges {
        if tree[edge[0]] == nil {
            tree[edge[0]] = []
        }
        if tree[edge[1]] == nil {
            tree[edge[1]] = []
        }
        tree[edge[0]]?.append(edge[1])
        tree[edge[1]]?.append(edge[0])
    }
    
    var visited: Set<Int> = []
    
    func dfs(_ num: Int) -> (time: Int, has: Bool) {
        visited.insert(num)
        guard let vs = tree[num] else {
            return (0, hasApple[num])
        }
        
        var sum = 0
        var has = hasApple[num]
        for v in vs where !visited.contains(v) {
            let n = dfs(v)
            if n.has {
                has = true
                sum += (n.time + 1)
            }
        }
        
        return (sum, has)
    }
    
    return dfs(0).time * 2
}
