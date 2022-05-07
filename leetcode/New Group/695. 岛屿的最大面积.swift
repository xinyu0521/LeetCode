//
//  695. 岛屿的最大面积.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/7.
//

import Foundation

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var ans = 0
    
    for i in 0 ..< grid.count {
        for j in 0 ..< grid[i].count {
            if grid[i][j] == 0 { continue }
            ans = max(ans, calArea(i, j))
        }
    }
    
    func calArea(_ i: Int, _ j: Int) -> Int {
        if !(0 ..< n).contains(i) || !(0 ..< m).contains(j) || visited[i][j] || grid[i][j] == 0 {
            return 0
        }
        
        visited[i][j] = true
        
        return 1 + calArea(i + 1, j) + calArea(i - 1, j) + calArea(i, j + 1) + calArea(i, j - 1)
    }
    
    return ans
}
