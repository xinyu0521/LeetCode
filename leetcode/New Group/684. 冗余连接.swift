//
//  684. 冗余连接.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/23.
//

import Foundation

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var parents = Array(repeating: 0, count: edges.count + 1)
    var sizes = Array(repeating: 1, count: edges.count + 1)
    
    func find(_ v: Int) -> Int {
        var res = v
        while parents[res] != res {
            parents[res] = parents[parents[res]]
            res = parents[res]
        }
        
        return res
    }
    
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        
        if parents[u] == 0 { parents[u] = u}
        if parents[v] == 0 { parents[v] = v}
        
        let pu = find(u)
        let pv = find(v)
        
        if pu == pv {
            return edge
        }
        
        if sizes[pu] > sizes[pv] {
            parents[pv] = pu
            sizes[pu] += sizes[pv]
        } else {
            parents[pu] = pv
            sizes[pv] += sizes[pu]
        }
    }
    
    return []
}
