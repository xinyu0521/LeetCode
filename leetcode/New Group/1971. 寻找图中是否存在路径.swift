//
//  1971. 寻找图中是否存在路径.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/19.
//

import Foundation

func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
    var uf = Array(0 ..< n)
    
    func find(_ i: Int) -> Int {
        if uf[i] != i {
            uf[i] = find(uf[i])
        }
        return uf[i]
    }
    
    func merge(_ i: Int, _ j: Int) {
        uf[find(i)] = find(j)
    }
    
    
    for edge in edges {
        merge(edge[0], edge[1])
    }
    
    return find(source) == find(destination)
}
