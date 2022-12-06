//
//  808. 分汤.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/11/21.
//

import Foundation

func soupServings(_ n: Int) -> Double {
    let n = ceil(Double(n) / 25)
    if n > 179 { return 1.0 }
    
    var dp = Array(repeating: Array(repeating: Double(0), count: Int(n) + 1), count: Int(n) + 1)
    dp[0][0] = 0.5
    
    for i in 1 ..< dp.count {
        dp[0][i] = 1.0
    }
    
    for i in 1 ..< dp.count {
        for j in 1 ..< dp.count {
            dp[i][j] = (dp[max(0, i - 4)][j] + dp[max(0, i - 3)][max(0, j - 1)] + dp[max(0, i - 2)][max(0, j - 2)] + dp[max(0, i - 1)][max(0, j - 3)]) / 4.0;
        }
    }
    
    return dp[Int(n)][Int(n)]
}
