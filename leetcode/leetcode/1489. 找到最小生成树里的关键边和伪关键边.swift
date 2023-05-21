//
//  1489. 找到最小生成树里的关键边和伪关键边.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/27.
//

import Foundation

func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
    var newEdges: [(from: Int, to: Int, weight: Int, i: Int)] = []
    for i in 0 ..< edges.count {
        let edge = edges[i]
        newEdges.append((edge[0], edge[1], edge[2], i))
    }
    
    newEdges.sort { $0.weight < $1.weight }
    
    var ans = Array(repeating: [Int](), count: 2)
    
    var uf = UnionFindWeightedQuickUnionPathCompression<Int>()
    for i in 0 ..< n {
        uf.addSetWith(i)
    }
    var base = 0
    var count = 0
    for edge in newEdges {
        if !uf.inSameSet(edge.from, and: edge.to) {
            uf.unionSetsContaining(edge.from, and: edge.to)
            base += edge.weight
            count += 1
        }
    }
    
    for i in 0 ..< newEdges.count {
        var uf1 = UnionFindWeightedQuickUnionPathCompression<Int>()
        for m in 0 ..< n {
            uf1.addSetWith(m)
        }
        var w = 0
        var c = 0
        for j in 0 ..< newEdges.count {
            let edge = newEdges[j]
            if j != i, !uf1.inSameSet(edge.from, and: edge.to) {
                uf1.unionSetsContaining(edge.from, and: edge.to)
                w += edge.weight
                c += 1
            }
        }
        
        if c != count || (c == count && w > base) {
            ans[0].append(newEdges[i].i)
            continue
        }
        
        var uf2 = UnionFindWeightedQuickUnionPathCompression<Int>()
        for m in 0 ..< n {
            uf2.addSetWith(m)
        }
        var w2 = newEdges[i].weight
        uf2.unionSetsContaining(newEdges[i].from, and: newEdges[i].to)
        
        for j in 0 ..< newEdges.count {
            let edge = newEdges[j]
            if j != i, !uf2.inSameSet(edge.from, and: edge.to) {
                uf2.unionSetsContaining(edge.from, and: edge.to)
                w2 += edge.weight
            }
        }
        
        if w2 == base {
            ans[1].append(newEdges[i].i)
        }
        
    }
    
    return ans
}
