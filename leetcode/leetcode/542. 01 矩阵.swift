//
//  542. 01 矩阵.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/9.
//

import Foundation

func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    let m = mat.count
    let n = mat[0].count
    
    var ans = Array(repeating: Array(repeating: 0, count: n), count: m)
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    var queue: ArraySlice<(Int, Int)> = []

    for i in 0 ..< m {
        for j in 0 ..< n where mat[i][j] == 0 {
            queue.append((i, j))
            visited[i][j] = true
        }
    }
    
    while !queue.isEmpty {
        let pos = queue.removeFirst()
        let next = [(pos.0 + 1, pos.1), (pos.0 - 1, pos.1), (pos.0, pos.1 + 1), (pos.0, pos.1 - 1)]
        
        for (i, j) in next {
            if (0 ..< m).contains(i), (0 ..< n).contains(j), !visited[i][j] {
                queue.append((i, j))
                visited[i][j] = true
                ans[i][j] = ans[pos.0][pos.1] + 1
            }
        }
    }

    return ans
}
