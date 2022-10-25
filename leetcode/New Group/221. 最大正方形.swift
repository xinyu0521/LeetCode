//
//  221. 最大正方形.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func maximalSquare(_ matrix: [[Character]]) -> Int {
    let m = matrix.count
    let n = matrix[0].count
    var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
    var maxL = 0
    
    for i in matrix.indices {
        for j in matrix[i].indices where matrix[i][j] == "1" {
            if i == 0 || j == 0 {
                dp[i][j] = 1
            } else {
                dp[i][j] = min(min(dp[i - 1][j], dp[i][j - 1]), dp[i - 1][j - 1]) + 1
            }
            maxL = max(maxL, dp[i][j])
        }
    }
    
    return maxL * maxL
}
