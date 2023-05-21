//
//  64. 最小路径和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

func minPathSum(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    
    var dp = Array(
        repeating: Array(repeating: 0, count: grid[0].count),
        count: grid.count
    )
    dp[0][0] = grid[0][0]
    
    for i in 0 ..< m {
        for j in 0 ..< n {
            if i == 0, j == 0 {
                continue
            }
            
            if i == 0 {
                dp[i][j] = dp[i][j - 1] + grid[i][j]
            } else if j == 0 {
                dp[i][j] = dp[i - 1][j] + grid[i][j]
            } else {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
            }
        }
    }
    
    return dp[m - 1][n - 1]
}
