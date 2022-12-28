//
//  1697. 检查边长度限制的路径是否存在.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/14.
//

import Foundation

func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
    let edges = edgeList.sorted { $0[2] < $1[2] }
    
    var uf = Array(0 ..< n)
    func find(_ i: Int) -> Int {
        if uf[i] != i {
            uf[i] = find(uf[i])
        }
        return uf[i]
    }
    func union(_ i: Int, _ j: Int) {
        uf[find(i)] = find(j)
    }
    
    var ans: [Bool] = Array(repeating: false, count: queries.count)
    var k = 0

    for (i, query) in queries.enumerated().sorted(by: { $0.element[2] < $1.element[2] }) {
        let limit = query[2]
        while k < edges.count,
              edges[k][2] < limit {
            union(edges[k][0], edges[k][1])
            k += 1
        }
        ans[i] = find(query[0]) == find(query[1])
    }
    
    return ans
}
