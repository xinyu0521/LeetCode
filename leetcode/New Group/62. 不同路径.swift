//
//  62. 不同路径.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0 ..< m {
        for j in 0 ..< n {
            if i == 0 || j == 0 {
                dp[i][j] = 1
            } else {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
    }
    
    return dp[m - 1][n - 1]
}
