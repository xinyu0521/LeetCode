//
//  685. 冗余连接 II.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/25.
//

import Foundation

func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
    var parents = Array(repeating: 0, count: edges.count + 1)
    var roots = Array(repeating: 0, count: edges.count + 1)
    var sizes = Array(repeating: 1, count: edges.count + 1)
    
    var ans1: [Int] = []
    var ans2: [Int] = []
    
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        
        if parents[v] > 0 {
            ans1 = [parents[v], v]
            ans2 = edge
        }
        
        parents[v] = u
    }
    
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        
        if !ans2.isEmpty, u == ans2[0], v == ans2[1] {
            continue
        }
        
        if roots[u] == 0 { roots[u] = u}
        if roots[v] == 0 { roots[v] = v}
        
        let pu = find(u)
        let pv = find(v)
        
        if pu == pv {
            return ans1.isEmpty ? edge : ans1
        }
        
        if sizes[pu] > sizes[pv] {
            roots[pv] = pu
            sizes[pu] += sizes[pv]
        } else {
            roots[pu] = pv
            sizes[pv] += sizes[pu]
        }
    }
    
    func find(_ v: Int) -> Int {
        var res = v
        while roots[res] != res {
            roots[res] = roots[roots[res]]
            res = roots[res]
        }
        
        return res
    }
    
    return ans2
}
