//
//  200. 岛屿数量.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/22.
//

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid
    
    func dfs(_ m: Int, _ n: Int) {
        grid[m][n] = "0"
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        for (i, j) in directions {
            let nm = m + i
            let nn = n + j
            if grid.indices.contains(nm),
               grid[nm].indices.contains(nn),
               grid[nm][nn] == "1" {
                dfs(nm, nn)
            }
        }
    }
    
    var ans = 0
    
    for i in grid.indices {
        for j in grid[i].indices where grid[i][j] == "1" {
            ans += 1
            dfs(i, j)
        }
    }
    
    return ans
}
