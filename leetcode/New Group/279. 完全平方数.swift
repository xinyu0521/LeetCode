//
//  279. 完全平方数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func numSquares(_ n: Int) -> Int {
    var dp = Array(repeating: 0, count: n + 1)
    for i in 1 ... n {
        var minCount = Int.max
        var j = 1
        while j * j < i {
            minCount = min(minCount, dp[i - j * j])
            j += 1
        }
        dp[i] = minCount + 1
    }
    return dp[n]
}
