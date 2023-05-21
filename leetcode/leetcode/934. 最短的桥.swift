//
//  934. 最短的桥.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/25.
//

import Foundation

func shortestBridge(_ grid: [[Int]]) -> Int {
    let n = grid.count
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var island: [(Int, Int)] = []
    var ans = 0
    
    all: for i in 0 ..< n {
        for j in 0 ..< n {
            if grid[i][j] == 1 {
                dfs(i, j)
                break all
            }
        }
    }
    
    bfs(island)
    
    return ans
    
    func dfs(_ i: Int, _ j: Int) {
        visited[i][j] = true
        island.append((i, j))
        let nexts = [(i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)]
        for next in nexts {
            if (0 ..< n).contains(next.0),
               (0 ..< n).contains(next.1),
               grid[next.0][next.1] == 1,
               visited[next.0][next.1] == false {
                dfs(next.0, next.1)
            }
        }
    }
    
    func bfs(_ pieces: [(Int, Int)]) {
        ans += 1
        var arr: [(Int, Int)] = []
        for piece in pieces {
            let nexts = [(piece.0 - 1, piece.1),
                         (piece.0 + 1, piece.1),
                         (piece.0, piece.1 - 1),
                         (piece.0, piece.1 + 1)]
            for next in nexts {
                if (0 ..< n).contains(next.0),
                   (0 ..< n).contains(next.1),
                   visited[next.0][next.1] == false {
                    if grid[next.0][next.1] == 1 {
                        return
                    }
                    arr.append(next)
                    visited[next.0][next.1] = true
                }
            }
        }
        bfs(arr)
    }
}
