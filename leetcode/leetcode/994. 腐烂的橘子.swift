//
//  994. 腐烂的橘子.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/9.
//

import Foundation

func orangesRotting(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    
    var ans = 0
    var cnt = 0
    var rotCount = 0
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    var queue: Array<[(Int, Int)]> = [[]]

    for i in 0 ..< m {
        for j in 0 ..< n {
            if grid[i][j] != 0 {
                cnt += 1
            }
            if grid[i][j] == 2 {
                queue[0].append((i, j))
                visited[i][j] = true
            }
        }
    }
    
    if queue[0].isEmpty {
        return -1
    }
    
    if queue[0].count == cnt {
        return 0
    }
    
    while !queue.isEmpty {
        let arr = queue.removeFirst()
        var nexts:[(Int, Int)] = []
        for pos in arr {
            rotCount += 1
            let next = [(pos.0 + 1, pos.1), (pos.0 - 1, pos.1), (pos.0, pos.1 + 1), (pos.0, pos.1 - 1)]
            
            for (i, j) in next {
                if (0 ..< m).contains(i), (0 ..< n).contains(j), !visited[i][j], grid[i][j] == 1 {
                    nexts.append((i, j))
                    visited[i][j] = true
                }
            }
        }
        if !nexts.isEmpty {
            queue.append(nexts)
            ans += 1
        }
    }
    
    if rotCount != cnt {
        return -1
    }

    return ans
}
